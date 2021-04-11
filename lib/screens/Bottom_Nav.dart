import 'package:animate_icons/animate_icons.dart';
import 'package:flutter/material.dart';
import 'package:flutter_speed_dial/flutter_speed_dial.dart';
import 'package:test_login/screens/Add_Screen.dart';
import 'package:test_login/screens/Home_screen.dart';
import 'package:test_login/screens/Profile_Screen.dart';
import 'package:test_login/widgets/widget.dart';

import 'Item_List.dart';

class BottomNav extends StatefulWidget {
  @override
  _BottomNavState createState() => _BottomNavState();
}

class _BottomNavState extends State<BottomNav> {
  void onTabTapped(int index) {
    setState(() {
      _currentIndex = index;
    });
  }

  int _currentIndex = 0;
  final List<Widget> _children = [
    Homescreen(),
    PlaceHolder(),
    Add_Screen(),
    Profile_Screen(),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      extendBody: true,
      appBar: AppBar(
        title: Center(child: Text('My App')),
      ),
      body: _children[_currentIndex],
      bottomNavigationBar: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.only(
              topRight: Radius.circular(30), topLeft: Radius.circular(30)),
          boxShadow: [
            BoxShadow(color: Colors.black38, spreadRadius: 0, blurRadius: 10),
          ],
        ),
        child: ClipRRect(
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(50.0),
            topRight: Radius.circular(50.0),
          ),
          child: BottomNavigationBar(
            onTap: onTabTapped,
            unselectedItemColor: Colors.grey,
            selectedItemColor: Colors.teal,
            selectedLabelStyle: TextStyle(fontSize: 10),
            type: BottomNavigationBarType.fixed,
            currentIndex: _currentIndex,
            items: [
              BottomNavigationBarItem(
                icon: Icon(Icons.home, size: 30),
                label: "Home",
                activeIcon: Icon(
                  Icons.home_outlined,
                  size: 30,
                ),
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.book, size: 30),
                label: "Logs",
                activeIcon: Icon(
                  Icons.menu_book,
                  size: 30,
                ),
              ),
              BottomNavigationBarItem(
                  icon: Icon(
                    Icons.calculate_rounded,
                    size: 30,
                  ),
                  activeIcon: Icon(
                    Icons.calculate_outlined,
                    size: 30,
                  ),
                  label: "Add"),
              BottomNavigationBarItem(
                icon: Icon(Icons.person, size: 30),
                label: 'Profile',
                activeIcon: Icon(
                  Icons.person_outline_outlined,
                  size: 30,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
