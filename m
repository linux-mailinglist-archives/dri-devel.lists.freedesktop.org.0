Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 70BDE3B3C6
	for <lists+dri-devel@lfdr.de>; Mon, 10 Jun 2019 13:09:21 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5350189127;
	Mon, 10 Jun 2019 11:09:19 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from culpepper.freedesktop.org (culpepper.freedesktop.org
 [131.252.210.165])
 by gabe.freedesktop.org (Postfix) with ESMTP id 24C6A89128
 for <dri-devel@lists.freedesktop.org>; Mon, 10 Jun 2019 11:09:18 +0000 (UTC)
Received: by culpepper.freedesktop.org (Postfix, from userid 33)
 id 20EDA72167; Mon, 10 Jun 2019 11:09:18 +0000 (UTC)
From: bugzilla-daemon@freedesktop.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 110822] [Bisected]Booting with kernel version 5.1.0 or higher
 on RX 580 hangs
Date: Mon, 10 Jun 2019 11:09:18 +0000
X-Bugzilla-Reason: AssignedTo
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: None
X-Bugzilla-Product: DRI
X-Bugzilla-Component: DRM/AMDgpu
X-Bugzilla-Version: unspecified
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: blocker
X-Bugzilla-Who: b6khqjqov4@ugsbm.anonbox.net
X-Bugzilla-Status: RESOLVED
X-Bugzilla-Resolution: WORKSFORME
X-Bugzilla-Priority: medium
X-Bugzilla-Assigned-To: dri-devel@lists.freedesktop.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: bug_status resolution
Message-ID: <bug-110822-502-jmNtFWxJID@http.bugs.freedesktop.org/>
In-Reply-To: <bug-110822-502@http.bugs.freedesktop.org/>
References: <bug-110822-502@http.bugs.freedesktop.org/>
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated
MIME-Version: 1.0
X-BeenThere: dri-devel@lists.freedesktop.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: Direct Rendering Infrastructure - Development
 <dri-devel.lists.freedesktop.org>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/dri-devel>
List-Post: <mailto:dri-devel@lists.freedesktop.org>
List-Help: <mailto:dri-devel-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=subscribe>
Content-Type: multipart/mixed; boundary="===============0512131797=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--===============0512131797==
Content-Type: multipart/alternative; boundary="15601649581.F0F2BD.8303"
Content-Transfer-Encoding: 7bit


--15601649581.F0F2BD.8303
Date: Mon, 10 Jun 2019 11:09:18 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated

https://bugs.freedesktop.org/show_bug.cgi?id=3D110822

b6khqjqov4@ugsbm.anonbox.net changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
             Status|NEW                         |RESOLVED
         Resolution|---                         |WORKSFORME

--- Comment #13 from b6khqjqov4@ugsbm.anonbox.net ---
Your bug sounds like mine which came after I bought and added a used RX580 =
to
my system. Since then had random full system freezes (I think only when I w=
as
using Firefox or the internal Steam Chromium browser) and desktop hangs whe=
re
Cinnamon would crash and nothing except the mouse pointer would be movable.=
 No
error in logs at first, but then I found this after the system hanged inste=
ad
of a hard freeze:

$ journalctl -p3:

<pre>
...
Jun 09 06:45:34 test systemd-coredump[1383]: Process 1328 (Web Content) of =
user
1000 dumped core.

                                             Stack trace of thread 1332:
                                             #0  0x00007f04ecd3ed36 n/a
(/home/test/tor-browser_en-US/Browser/libxul.so)
                                             #1  0x0000000000000000 n/a (n/=
a)
Jun 09 06:45:35 test systemd-coredump[1374]: Process 1106 (firefox.real) of
user 1000 dumped core.

                                             Stack trace of thread 1124:
                                             #0  0x00007fd89155036f raise
(libpthread.so.0)
                                             #1  0x00007fd88b6b3a5f n/a
(/home/test/tor-browser_en-US/Browser/libxul.so)
Jun 09 06:45:35 test systemd-coredump[1384]: Process 1162 (Web Content) of =
user
1000 dumped core.

                                             Stack trace of thread 1164:
                                             #0  0x00007ffb32c6ad36 n/a
(/home/test/tor-browser_en-US/Browser/libxul.so)
                                             #1  0x0000000000000000 n/a (n/=
a)
Jun 09 06:45:38 test systemd-coredump[1385]: Process 1237 (Web Content) of =
user
1000 dumped core.

                                             Stack trace of thread 1241:
                                             #0  0x00007f9aa7f3ed36 n/a
(/home/test/tor-browser_en-US/Browser/libxul.so)
                                             #1  0x0000000000000000 n/a (n/=
a)
Jun 09 06:47:31 test systemd-coredump[1640]: Process 1536 (Web Content) of =
user
1000 dumped core.

                                             Stack trace of thread 1536:
                                             #0  0x00007f830d3ee3e7 n/a
(/home/test/tor-browser_en-US/Browser/libxul.so)
Jun 09 06:47:32 test systemd-coredump[1650]: Process 1603 (Web Content) of =
user
1000 dumped core.

                                             Stack trace of thread 1606:
                                             #0  0x00007f8f129ebd36 n/a
(/home/test/tor-browser_en-US/Browser/libxul.so)
                                             #1  0x0000000000000000 n/a (n/=
a)
Jun 09 06:47:32 test systemd-coredump[1639]: Process 1410 (firefox.real) of
user 1000 dumped core.

                                             Stack trace of thread 1410:
                                             #0  0x00007fe94ed5f36f raise
(libpthread.so.0)
                                             #1  0x00007fe948ec2a5f n/a
(/home/test/tor-browser_en-US/Browser/libxul.so)
Jun 09 06:47:32 test systemd-coredump[1649]: Process 1467 (Web Content) of =
user
1000 dumped core.

                                             Stack trace of thread 1469:
                                             #0  0x00007fb2790c2d36 n/a
(/home/test/tor-browser_en-US/Browser/libxul.so)
                                             #1  0x0000000000000000 n/a (n/=
a)
...
</pre>

My system:
- MSI B450 Tomahawk
- Athlon 200GE (yes, this CPU will be upgraded to a Ryzen 3000 one of course
;))
- RX 580 4G Nitro+
- G.Skill Aegis DIMM Kit 16GB, DDR4-3000, CL16-18-18-38 (F4-3000C16D-16GISB)

My fix: 2 things I can remember I did which are maybe the fix:
1.) I disabled integrated graphics in the BIOS.
2.) I installed amd-ucode.

No hangs/freezes or anything since my fix. I'll report back here should I
encounter a crash/freeze/hang again.

--=20
You are receiving this mail because:
You are the assignee for the bug.=

--15601649581.F0F2BD.8303
Date: Mon, 10 Jun 2019 11:09:18 +0000
MIME-Version: 1.0
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated

<html>
    <head>
      <base href=3D"https://bugs.freedesktop.org/">
    </head>
    <body><span class=3D"vcard"><a class=3D"email" href=3D"mailto:b6khqjqov=
4&#64;ugsbm.anonbox.net" title=3D"b6khqjqov4&#64;ugsbm.anonbox.net">b6khqjq=
ov4&#64;ugsbm.anonbox.net</a>
</span> changed
          <a class=3D"bz_bug_link=20
          bz_status_RESOLVED  bz_closed"
   title=3D"RESOLVED WORKSFORME - [Bisected]Booting with kernel version 5.1=
.0 or higher on RX 580 hangs"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D110822">bug 11082=
2</a>
          <br>
             <table border=3D"1" cellspacing=3D"0" cellpadding=3D"8">
          <tr>
            <th>What</th>
            <th>Removed</th>
            <th>Added</th>
          </tr>

         <tr>
           <td style=3D"text-align:right;">Status</td>
           <td>NEW
           </td>
           <td>RESOLVED
           </td>
         </tr>

         <tr>
           <td style=3D"text-align:right;">Resolution</td>
           <td>---
           </td>
           <td>WORKSFORME
           </td>
         </tr></table>
      <p>
        <div>
            <b><a class=3D"bz_bug_link=20
          bz_status_RESOLVED  bz_closed"
   title=3D"RESOLVED WORKSFORME - [Bisected]Booting with kernel version 5.1=
.0 or higher on RX 580 hangs"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D110822#c13">Comme=
nt # 13</a>
              on <a class=3D"bz_bug_link=20
          bz_status_RESOLVED  bz_closed"
   title=3D"RESOLVED WORKSFORME - [Bisected]Booting with kernel version 5.1=
.0 or higher on RX 580 hangs"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D110822">bug 11082=
2</a>
              from <span class=3D"vcard"><a class=3D"email" href=3D"mailto:=
b6khqjqov4&#64;ugsbm.anonbox.net" title=3D"b6khqjqov4&#64;ugsbm.anonbox.net=
">b6khqjqov4&#64;ugsbm.anonbox.net</a>
</span></b>
        <pre>Your bug sounds like mine which came after I bought and added =
a used RX580 to
my system. Since then had random full system freezes (I think only when I w=
as
using Firefox or the internal Steam Chromium browser) and desktop hangs whe=
re
Cinnamon would crash and nothing except the mouse pointer would be movable.=
 No
error in logs at first, but then I found this after the system hanged inste=
ad
of a hard freeze:

$ journalctl -p3:

&lt;pre&gt;
...
Jun 09 06:45:34 test systemd-coredump[1383]: Process 1328 (Web Content) of =
user
1000 dumped core.

                                             Stack trace of thread 1332:
                                             #0  0x00007f04ecd3ed36 n/a
(/home/test/tor-browser_en-US/Browser/libxul.so)
                                             #1  0x0000000000000000 n/a (n/=
a)
Jun 09 06:45:35 test systemd-coredump[1374]: Process 1106 (firefox.real) of
user 1000 dumped core.

                                             Stack trace of thread 1124:
                                             #0  0x00007fd89155036f raise
(libpthread.so.0)
                                             #1  0x00007fd88b6b3a5f n/a
(/home/test/tor-browser_en-US/Browser/libxul.so)
Jun 09 06:45:35 test systemd-coredump[1384]: Process 1162 (Web Content) of =
user
1000 dumped core.

                                             Stack trace of thread 1164:
                                             #0  0x00007ffb32c6ad36 n/a
(/home/test/tor-browser_en-US/Browser/libxul.so)
                                             #1  0x0000000000000000 n/a (n/=
a)
Jun 09 06:45:38 test systemd-coredump[1385]: Process 1237 (Web Content) of =
user
1000 dumped core.

                                             Stack trace of thread 1241:
                                             #0  0x00007f9aa7f3ed36 n/a
(/home/test/tor-browser_en-US/Browser/libxul.so)
                                             #1  0x0000000000000000 n/a (n/=
a)
Jun 09 06:47:31 test systemd-coredump[1640]: Process 1536 (Web Content) of =
user
1000 dumped core.

                                             Stack trace of thread 1536:
                                             #0  0x00007f830d3ee3e7 n/a
(/home/test/tor-browser_en-US/Browser/libxul.so)
Jun 09 06:47:32 test systemd-coredump[1650]: Process 1603 (Web Content) of =
user
1000 dumped core.

                                             Stack trace of thread 1606:
                                             #0  0x00007f8f129ebd36 n/a
(/home/test/tor-browser_en-US/Browser/libxul.so)
                                             #1  0x0000000000000000 n/a (n/=
a)
Jun 09 06:47:32 test systemd-coredump[1639]: Process 1410 (firefox.real) of
user 1000 dumped core.

                                             Stack trace of thread 1410:
                                             #0  0x00007fe94ed5f36f raise
(libpthread.so.0)
                                             #1  0x00007fe948ec2a5f n/a
(/home/test/tor-browser_en-US/Browser/libxul.so)
Jun 09 06:47:32 test systemd-coredump[1649]: Process 1467 (Web Content) of =
user
1000 dumped core.

                                             Stack trace of thread 1469:
                                             #0  0x00007fb2790c2d36 n/a
(/home/test/tor-browser_en-US/Browser/libxul.so)
                                             #1  0x0000000000000000 n/a (n/=
a)
...
&lt;/pre&gt;

My system:
- MSI B450 Tomahawk
- Athlon 200GE (yes, this CPU will be upgraded to a Ryzen 3000 one of course
;))
- RX 580 4G Nitro+
- G.Skill Aegis DIMM Kit 16GB, DDR4-3000, CL16-18-18-38 (F4-3000C16D-16GISB)

My fix: 2 things I can remember I did which are maybe the fix:
1.) I disabled integrated graphics in the BIOS.
2.) I installed amd-ucode.

No hangs/freezes or anything since my fix. I'll report back here should I
encounter a crash/freeze/hang again.</pre>
        </div>
      </p>


      <hr>
      <span>You are receiving this mail because:</span>

      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>=

--15601649581.F0F2BD.8303--

--===============0512131797==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs

--===============0512131797==--
