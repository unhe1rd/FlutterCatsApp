import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';

void main() {
  runApp(const CatsApp());
}

class CatsApp extends StatelessWidget {
  const CatsApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Color.fromARGB(255, 78, 13, 135)),
        useMaterial3: true,
        textTheme: const TextTheme(bodyMedium: TextStyle(fontSize: 20)),
      ),
      home: const MyHomePage(title: 'Cats'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});
  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  void _incrementCounter(int index, CarouselPageChangedReason reason) {
    setState(() {
      _counter++;
    });
  }
  
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final borderRadius = BorderRadius.circular(16.0);
    return Scaffold(
      backgroundColor: theme.colorScheme.primary,
      body: Center(
        child: CarouselSlider(
          options: CarouselOptions(
            height: 400,
            aspectRatio: 16/9,
            viewportFraction: 0.8,
            initialPage: 0,
            enableInfiniteScroll: true,
            reverse: false,
            autoPlay: true,
            autoPlayInterval: Duration(seconds: 3),
            autoPlayAnimationDuration: Duration(milliseconds: 800),
            autoPlayCurve: Curves.fastOutSlowIn,
            enlargeCenterPage: true,
            enlargeFactor: 0.3,
            onPageChanged: _incrementCounter,
            scrollDirection: Axis.horizontal,),
          items: [2,3,4,5].map((i) {
            return Builder(
              builder: (BuildContext context) {
                return Center(
                    child: ClipRRect(
                      borderRadius: borderRadius,
                      child: Image.asset(
                          "assets/cats/cats$i.png",
                          fit: BoxFit.contain,
                          alignment: Alignment.center,
                          ),
                    ),
                  );
              },
            );
          }).toList(),
        ),
      ),
    );
  }
}
