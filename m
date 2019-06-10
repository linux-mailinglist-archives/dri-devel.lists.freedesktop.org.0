Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 37CA43B3E4
	for <lists+dri-devel@lfdr.de>; Mon, 10 Jun 2019 13:19:21 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CFAD989125;
	Mon, 10 Jun 2019 11:19:18 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from culpepper.freedesktop.org (culpepper.freedesktop.org
 [131.252.210.165])
 by gabe.freedesktop.org (Postfix) with ESMTP id 22D5489125
 for <dri-devel@lists.freedesktop.org>; Mon, 10 Jun 2019 11:19:18 +0000 (UTC)
Received: by culpepper.freedesktop.org (Postfix, from userid 33)
 id 1FA9472167; Mon, 10 Jun 2019 11:19:18 +0000 (UTC)
From: bugzilla-daemon@freedesktop.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 110822] [Bisected]Booting with kernel version 5.1.0 or higher
 on RX 580 hangs
Date: Mon, 10 Jun 2019 11:19:18 +0000
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
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-110822-502-exVXWsPRcU@http.bugs.freedesktop.org/>
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
Content-Type: multipart/mixed; boundary="===============1881647628=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--===============1881647628==
Content-Type: multipart/alternative; boundary="15601655581.cB3f11.11020"
Content-Transfer-Encoding: 7bit


--15601655581.cB3f11.11020
Date: Mon, 10 Jun 2019 11:19:18 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated

https://bugs.freedesktop.org/show_bug.cgi?id=3D110822

--- Comment #14 from b6khqjqov4@ugsbm.anonbox.net ---
(In reply to b6khqjqov4 from comment #13)
> Your bug sounds like mine which came after I bought and added a used RX580
> to my system. Since then had random full system freezes (I think only whe=
n I
> was using Firefox or the internal Steam Chromium browser) and desktop han=
gs
> where Cinnamon would crash and nothing except the mouse pointer would be
> movable. No error in logs at first, but then I found this after the system
> hanged instead of a hard freeze:
>=20
> $ journalctl -p3:
>=20
> <pre>
> ...
> Jun 09 06:45:34 test systemd-coredump[1383]: Process 1328 (Web Content) of
> user 1000 dumped core.
>=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=
=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20
>                                              Stack trace of thread 1332:
>                                              #0  0x00007f04ecd3ed36 n/a
> (/home/test/tor-browser_en-US/Browser/libxul.so)
>                                              #1  0x0000000000000000 n/a (=
n/a)
> Jun 09 06:45:35 test systemd-coredump[1374]: Process 1106 (firefox.real) =
of
> user 1000 dumped core.
>=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=
=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20
>                                              Stack trace of thread 1124:
>                                              #0  0x00007fd89155036f raise
> (libpthread.so.0)
>                                              #1  0x00007fd88b6b3a5f n/a
> (/home/test/tor-browser_en-US/Browser/libxul.so)
> Jun 09 06:45:35 test systemd-coredump[1384]: Process 1162 (Web Content) of
> user 1000 dumped core.
>=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=
=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20
>                                              Stack trace of thread 1164:
>                                              #0  0x00007ffb32c6ad36 n/a
> (/home/test/tor-browser_en-US/Browser/libxul.so)
>                                              #1  0x0000000000000000 n/a (=
n/a)
> Jun 09 06:45:38 test systemd-coredump[1385]: Process 1237 (Web Content) of
> user 1000 dumped core.
>=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=
=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20
>                                              Stack trace of thread 1241:
>                                              #0  0x00007f9aa7f3ed36 n/a
> (/home/test/tor-browser_en-US/Browser/libxul.so)
>                                              #1  0x0000000000000000 n/a (=
n/a)
> Jun 09 06:47:31 test systemd-coredump[1640]: Process 1536 (Web Content) of
> user 1000 dumped core.
>=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=
=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20
>                                              Stack trace of thread 1536:
>                                              #0  0x00007f830d3ee3e7 n/a
> (/home/test/tor-browser_en-US/Browser/libxul.so)
> Jun 09 06:47:32 test systemd-coredump[1650]: Process 1603 (Web Content) of
> user 1000 dumped core.
>=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=
=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20
>                                              Stack trace of thread 1606:
>                                              #0  0x00007f8f129ebd36 n/a
> (/home/test/tor-browser_en-US/Browser/libxul.so)
>                                              #1  0x0000000000000000 n/a (=
n/a)
> Jun 09 06:47:32 test systemd-coredump[1639]: Process 1410 (firefox.real) =
of
> user 1000 dumped core.
>=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=
=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20
>                                              Stack trace of thread 1410:
>                                              #0  0x00007fe94ed5f36f raise
> (libpthread.so.0)
>                                              #1  0x00007fe948ec2a5f n/a
> (/home/test/tor-browser_en-US/Browser/libxul.so)
> Jun 09 06:47:32 test systemd-coredump[1649]: Process 1467 (Web Content) of
> user 1000 dumped core.
>=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=
=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20
>                                              Stack trace of thread 1469:
>                                              #0  0x00007fb2790c2d36 n/a
> (/home/test/tor-browser_en-US/Browser/libxul.so)
>                                              #1  0x0000000000000000 n/a (=
n/a)
> ...
> </pre>
>=20
> My system:
> - MSI B450 Tomahawk
> - Athlon 200GE (yes, this CPU will be upgraded to a Ryzen 3000 one of cou=
rse
> ;))
> - RX 580 4G Nitro+
> - G.Skill Aegis DIMM Kit 16GB, DDR4-3000, CL16-18-18-38 (F4-3000C16D-16GI=
SB)
>=20
> My fix: 2 things I can remember I did which are maybe the fix:
> 1.) I disabled integrated graphics in the BIOS.
> 2.) I installed amd-ucode.
>=20
> No hangs/freezes or anything since my fix. I'll report back here should I
> encounter a crash/freeze/hang again.

Addition:
Arch (through Antergos) with all latest updates:
- $ uname: 5.1.7-arch1-1-ARCH
- $ glxinfo | grep version:
server glx version string: 1.4
client glx version string: 1.4
GLX version: 1.4
    Max core profile version: 4.5
    Max compat profile version: 4.5
    Max GLES1 profile version: 1.1
    Max GLES[23] profile version: 3.2
OpenGL core profile version string: 4.5 (Core Profile) Mesa 19.0.6
OpenGL core profile shading language version string: 4.50
OpenGL version string: 4.5 (Compatibility Profile) Mesa 19.0.6
OpenGL shading language version string: 4.50
OpenGL ES profile version string: OpenGL ES 3.2 Mesa 19.0.6
OpenGL ES profile shading language version string: OpenGL ES GLSL ES 3.20
    GL_EXT_shader_implicit_conversions, GL_EXT_shader_integer_mix,

--=20
You are receiving this mail because:
You are the assignee for the bug.=

--15601655581.cB3f11.11020
Date: Mon, 10 Jun 2019 11:19:18 +0000
MIME-Version: 1.0
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated

<html>
    <head>
      <base href=3D"https://bugs.freedesktop.org/">
    </head>
    <body>
      <p>
        <div>
            <b><a class=3D"bz_bug_link=20
          bz_status_RESOLVED  bz_closed"
   title=3D"RESOLVED WORKSFORME - [Bisected]Booting with kernel version 5.1=
.0 or higher on RX 580 hangs"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D110822#c14">Comme=
nt # 14</a>
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
        <pre>(In reply to b6khqjqov4 from <a href=3D"show_bug.cgi?id=3D1108=
22#c13">comment #13</a>)
<span class=3D"quote">&gt; Your bug sounds like mine which came after I bou=
ght and added a used RX580
&gt; to my system. Since then had random full system freezes (I think only =
when I
&gt; was using Firefox or the internal Steam Chromium browser) and desktop =
hangs
&gt; where Cinnamon would crash and nothing except the mouse pointer would =
be
&gt; movable. No error in logs at first, but then I found this after the sy=
stem
&gt; hanged instead of a hard freeze:
&gt;=20
&gt; $ journalctl -p3:
&gt;=20
&gt; &lt;pre&gt;
&gt; ...
&gt; Jun 09 06:45:34 test systemd-coredump[1383]: Process 1328 (Web Content=
) of
&gt; user 1000 dumped core.
&gt;=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=
=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20
&gt;                                              Stack trace of thread 133=
2:
&gt;                                              #0  0x00007f04ecd3ed36 n/a
&gt; (/home/test/tor-browser_en-US/Browser/libxul.so)
&gt;                                              #1  0x0000000000000000 n/=
a (n/a)
&gt; Jun 09 06:45:35 test systemd-coredump[1374]: Process 1106 (firefox.rea=
l) of
&gt; user 1000 dumped core.
&gt;=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=
=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20
&gt;                                              Stack trace of thread 112=
4:
&gt;                                              #0  0x00007fd89155036f ra=
ise
&gt; (libpthread.so.0)
&gt;                                              #1  0x00007fd88b6b3a5f n/a
&gt; (/home/test/tor-browser_en-US/Browser/libxul.so)
&gt; Jun 09 06:45:35 test systemd-coredump[1384]: Process 1162 (Web Content=
) of
&gt; user 1000 dumped core.
&gt;=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=
=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20
&gt;                                              Stack trace of thread 116=
4:
&gt;                                              #0  0x00007ffb32c6ad36 n/a
&gt; (/home/test/tor-browser_en-US/Browser/libxul.so)
&gt;                                              #1  0x0000000000000000 n/=
a (n/a)
&gt; Jun 09 06:45:38 test systemd-coredump[1385]: Process 1237 (Web Content=
) of
&gt; user 1000 dumped core.
&gt;=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=
=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20
&gt;                                              Stack trace of thread 124=
1:
&gt;                                              #0  0x00007f9aa7f3ed36 n/a
&gt; (/home/test/tor-browser_en-US/Browser/libxul.so)
&gt;                                              #1  0x0000000000000000 n/=
a (n/a)
&gt; Jun 09 06:47:31 test systemd-coredump[1640]: Process 1536 (Web Content=
) of
&gt; user 1000 dumped core.
&gt;=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=
=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20
&gt;                                              Stack trace of thread 153=
6:
&gt;                                              #0  0x00007f830d3ee3e7 n/a
&gt; (/home/test/tor-browser_en-US/Browser/libxul.so)
&gt; Jun 09 06:47:32 test systemd-coredump[1650]: Process 1603 (Web Content=
) of
&gt; user 1000 dumped core.
&gt;=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=
=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20
&gt;                                              Stack trace of thread 160=
6:
&gt;                                              #0  0x00007f8f129ebd36 n/a
&gt; (/home/test/tor-browser_en-US/Browser/libxul.so)
&gt;                                              #1  0x0000000000000000 n/=
a (n/a)
&gt; Jun 09 06:47:32 test systemd-coredump[1639]: Process 1410 (firefox.rea=
l) of
&gt; user 1000 dumped core.
&gt;=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=
=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20
&gt;                                              Stack trace of thread 141=
0:
&gt;                                              #0  0x00007fe94ed5f36f ra=
ise
&gt; (libpthread.so.0)
&gt;                                              #1  0x00007fe948ec2a5f n/a
&gt; (/home/test/tor-browser_en-US/Browser/libxul.so)
&gt; Jun 09 06:47:32 test systemd-coredump[1649]: Process 1467 (Web Content=
) of
&gt; user 1000 dumped core.
&gt;=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=
=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20
&gt;                                              Stack trace of thread 146=
9:
&gt;                                              #0  0x00007fb2790c2d36 n/a
&gt; (/home/test/tor-browser_en-US/Browser/libxul.so)
&gt;                                              #1  0x0000000000000000 n/=
a (n/a)
&gt; ...
&gt; &lt;/pre&gt;
&gt;=20
&gt; My system:
&gt; - MSI B450 Tomahawk
&gt; - Athlon 200GE (yes, this CPU will be upgraded to a Ryzen 3000 one of =
course
&gt; ;))
&gt; - RX 580 4G Nitro+
&gt; - G.Skill Aegis DIMM Kit 16GB, DDR4-3000, CL16-18-18-38 (F4-3000C16D-1=
6GISB)
&gt;=20
&gt; My fix: 2 things I can remember I did which are maybe the fix:
&gt; 1.) I disabled integrated graphics in the BIOS.
&gt; 2.) I installed amd-ucode.
&gt;=20
&gt; No hangs/freezes or anything since my fix. I'll report back here shoul=
d I
&gt; encounter a crash/freeze/hang again.</span >

Addition:
Arch (through Antergos) with all latest updates:
- $ uname: 5.1.7-arch1-1-ARCH
- $ glxinfo | grep version:
server glx version string: 1.4
client glx version string: 1.4
GLX version: 1.4
    Max core profile version: 4.5
    Max compat profile version: 4.5
    Max GLES1 profile version: 1.1
    Max GLES[23] profile version: 3.2
OpenGL core profile version string: 4.5 (Core Profile) Mesa 19.0.6
OpenGL core profile shading language version string: 4.50
OpenGL version string: 4.5 (Compatibility Profile) Mesa 19.0.6
OpenGL shading language version string: 4.50
OpenGL ES profile version string: OpenGL ES 3.2 Mesa 19.0.6
OpenGL ES profile shading language version string: OpenGL ES GLSL ES 3.20
    GL_EXT_shader_implicit_conversions, GL_EXT_shader_integer_mix,</pre>
        </div>
      </p>


      <hr>
      <span>You are receiving this mail because:</span>

      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>=

--15601655581.cB3f11.11020--

--===============1881647628==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs

--===============1881647628==--
