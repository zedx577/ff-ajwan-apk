// ===== FF AJWAN - FINAL & COMPLETE CODE =====
// This file contains the full, ready-to-build application code.

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'dart:async';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'FF Ajwan',
      theme: ThemeData(
        brightness: Brightness.dark,
        scaffoldBackgroundColor: Colors.black,
        fontFamily: 'Cairo',
        primaryColor: Colors.red,
        colorScheme: const ColorScheme.dark(
          primary: Colors.red,
          secondary: Colors.redAccent,
        ),
        appBarTheme: AppBarTheme(
          backgroundColor: Colors.grey[900],
          elevation: 0,
          iconTheme: const IconThemeData(color: Colors.white),
          titleTextStyle: const TextStyle(
              color: Colors.white,
              fontSize: 20,
              fontWeight: FontWeight.bold,
              fontFamily: 'Cairo'),
        ),
        cardTheme: CardTheme(
          color: Colors.grey[900],
          margin: const EdgeInsets.symmetric(vertical: 8.0),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
            side: BorderSide(color: Colors.red.withOpacity(0.5)),
          ),
        ),
      ),
      home: const SplashScreen(),
    );
  }
}

// -------------------- SPLASH SCREEN --------------------
class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Timer(
      const Duration(seconds: 3),
      () => Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => const HomeScreen()),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: Colors.black,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(Icons.shield, color: Colors.red, size: 100),
            SizedBox(height: 20),
            Text(
              'FF Ajwan',
              style: TextStyle(
                  fontSize: 32, fontWeight: FontWeight.bold, color: Colors.white),
            ),
          ],
        ),
      ),
    );
  }
}

// -------------------- HOME SCREEN --------------------
class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  void _navigateTo(BuildContext context, Widget screen) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => screen),
    );
  }

  @override
  Widget build(BuildContext context) {
    final List<Map<String, dynamic>> menuItems = [
      {'icon': Icons.headset_mic, 'title': 'دليل الهيدشوت', 'screen': const HeadshotGuideScreen()},
      {'icon': Icons.settings, 'title': 'إعداداتك الخاصة', 'screen': const SettingsGuideScreen()},
      {'icon': Icons.shield, 'title': '👑 قاهر الرومات', 'screen': const RoomConquerorScreen()},
      {'icon': Icons.auto_awesome_motion, 'title': '🔫 موسوعة الأسلحة', 'screen': const WeaponEncyclopediaScreen()},
      {'icon': Icons.people, 'title': '🦸‍♂️ دليل الشخصيات', 'screen': const CharacterGuideScreen()},
      {'icon': Icons.newspaper, 'title': '📰 الأخبار والأكواد', 'screen': const NewsAndCodesScreen()},
      {'icon': Icons.map, 'title': '🗺️ خرائط الباتل رويال', 'screen': const BattleRoyaleMapsScreen()},
      {'icon': Icons.diamond, 'title': '💎 اقتصاد الجواهر', 'screen': const DiamondEconomyScreen()},
      {'icon': Icons.pets, 'title': '🐾 دليل الحيوانات', 'screen': const PetGuideScreen()},
      {'icon': Icons.emoji_events, 'title': '🏆 الإنجازات', 'screen': const AchievementsScreen()},
      {'icon': Icons.videocam, 'title': '🎥 صانع المحتوى', 'screen': const ContentCreatorScreen()},
      {'icon': Icons.construction, 'title': '🛠️ أسرار وخفايا', 'screen': const SecretsScreen()},
    ];

    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.black,
        title: const Text('FF Ajwan'),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: GridView.builder(
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            crossAxisSpacing: 10,
            mainAxisSpacing: 10,
            childAspectRatio: 1.2,
          ),
          itemCount: menuItems.length,
          itemBuilder: (context, index) {
            final item = menuItems[index];
            return GestureDetector(
              onTap: () => _navigateTo(context, item['screen']),
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.grey[900],
                  borderRadius: BorderRadius.circular(15),
                  border: Border.all(color: Colors.red.withOpacity(0.7), width: 1.5),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(item['icon'], size: 40, color: Colors.white),
                    const SizedBox(height: 10),
                    Text(
                      item['title'],
                      textAlign: TextAlign.center,
                      style: const TextStyle(color: Colors.white, fontSize: 14),
                    ),
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}

// -------------------- HELPER WIDGETS --------------------
class GuideSection extends StatelessWidget {
  final String title;
  final String content;
  final IconData icon;
  const GuideSection({super.key, required this.title, required this.content, required this.icon});
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 20.0),
      padding: const EdgeInsets.all(15.0),
      decoration: BoxDecoration(
        color: Colors.grey[900],
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: Colors.red.withOpacity(0.5)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Icon(icon, color: Colors.red, size: 24),
              const SizedBox(width: 10),
              Expanded(child: Text(title, style: const TextStyle(color: Colors.white, fontSize: 20, fontWeight: FontWeight.bold))),
            ],
          ),
          const SizedBox(height: 15),
          Text(content, style: TextStyle(color: Colors.grey[300], fontSize: 16, height: 1.5)),
        ],
      ),
    );
  }
}

Widget _buildDetailCard(String title, String content, IconData icon) {
  return Padding(
    padding: const EdgeInsets.symmetric(vertical: 8.0),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Icon(icon, color: Colors.red, size: 24),
            const SizedBox(width: 10),
            Text(title, style: const TextStyle(color: Colors.red, fontSize: 20, fontWeight: FontWeight.bold)),
          ],
        ),
        const Divider(height: 20, color: Colors.grey),
        Text(content, style: const TextStyle(color: Colors.white, fontSize: 16, height: 1.5)),
      ],
    ),
  );
}

Widget _buildInfoCard({required String title, required String content, required IconData icon, required Color color}) {
  return Card(
    shape: RoundedRectangleBorder(
      side: BorderSide(color: color, width: 2),
      borderRadius: BorderRadius.circular(12),
    ),
    margin: const EdgeInsets.only(bottom: 15),
    child: Padding(
      padding: const EdgeInsets.all(16.0),
      child: Row(
        children: [
          Icon(icon, size: 40, color: color),
          const SizedBox(width: 15),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(title, style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                const SizedBox(height: 5),
                Text(content, style: TextStyle(color: Colors.grey[400], fontSize: 14, height: 1.4)),
              ],
            ),
          ),
        ],
      ),
    ),
  );
}

Widget _buildStepCard({
  required String stepNumber,
  required String title,
  required String content,
  required IconData icon,
}) {
  return Card(
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(12),
      side: BorderSide(color: Colors.red.withOpacity(0.7), width: 1.5),
    ),
    margin: const EdgeInsets.only(bottom: 15),
    child: Padding(
      padding: const EdgeInsets.all(16.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CircleAvatar(
            radius: 20,
            backgroundColor: Colors.red,
            child: Text(stepNumber, style: const TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
          ),
          const SizedBox(width: 15),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Icon(icon, color: Colors.red, size: 24),
                    const SizedBox(width: 8),
                    Expanded(child: Text(title, style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold))),
                  ],
                ),
                const SizedBox(height: 10),
                Text(content, style: TextStyle(color: Colors.grey[300], fontSize: 14, height: 1.4)),
              ],
            ),
          ),
        ],
      ),
    ),
  );
}
