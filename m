Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id BCE3EE436
	for <lists+dri-devel@lfdr.de>; Mon, 29 Apr 2019 16:04:58 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 632CC89208;
	Mon, 29 Apr 2019 14:04:56 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from culpepper.freedesktop.org (culpepper.freedesktop.org
 [IPv6:2610:10:20:722:a800:ff:fe98:4b55])
 by gabe.freedesktop.org (Postfix) with ESMTP id 7E74189209
 for <dri-devel@lists.freedesktop.org>; Mon, 29 Apr 2019 14:04:50 +0000 (UTC)
Received: by culpepper.freedesktop.org (Postfix, from userid 33)
 id 7BC6D72155; Mon, 29 Apr 2019 14:04:50 +0000 (UTC)
From: bugzilla-daemon@freedesktop.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 108893] Slow redrawing of menu in Gothic 2 under wine
Date: Mon, 29 Apr 2019 14:04:50 +0000
X-Bugzilla-Reason: AssignedTo
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: None
X-Bugzilla-Product: Mesa
X-Bugzilla-Component: Drivers/Gallium/radeonsi
X-Bugzilla-Version: 19.0
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: andrew.m.mcmahon@gmail.com
X-Bugzilla-Status: REOPENED
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: medium
X-Bugzilla-Assigned-To: dri-devel@lists.freedesktop.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-108893-502-DV3UVzaYrZ@http.bugs.freedesktop.org/>
In-Reply-To: <bug-108893-502@http.bugs.freedesktop.org/>
References: <bug-108893-502@http.bugs.freedesktop.org/>
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
Content-Type: multipart/mixed; boundary="===============0543553892=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--===============0543553892==
Content-Type: multipart/alternative; boundary="15565466902.0B91dBEeE.13757"
Content-Transfer-Encoding: 7bit


--15565466902.0B91dBEeE.13757
Date: Mon, 29 Apr 2019 14:04:50 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated

https://bugs.freedesktop.org/show_bug.cgi?id=3D108893

--- Comment #6 from andrew.m.mcmahon@gmail.com ---
I can't replicate any performance issues with Gothic 2 Gold on my setup.

I'm using the latest installer provided by GOG:
> setup_gothic_2_gold_2.7_(14553).exe
I'm installing the game into a clean wine 4.7-devel prefix by using:
> WINEPREFIX=3D~/.wineprefix/gothic2 wine setup_gothic_2_gold_2.7_(14553).e=
xe
The game will crash at the main menu without directmusic.=20
Latest winetricks (github) can handle that:
> WINEPREFIX=3D~/.wineprefix/gothic2 winetricks directmusic
Then I'm just running the game normally via the desktop shortcut that's
automatically created.

I've recorded a video with SimpleScreenRecorder of the game running @ 1440x=
900
in wine's virtual desktop. I've got MESA_HUD enabled so you can see my
framerate and other info:
https://drive.google.com/file/d/11t2akNusJh0hvaNEftV_oLbLd9lnozYX/view?usp=
=3Dsharing

Phenom II x4 955
Debian Testing
OpenGL renderer string: AMD Radeon R9 200 Series (TONGA, DRM 3.30.0,
5.1.0-rc7-mainline-amd64, LLVM 8.0.0)
OpenGL core profile version string: 4.5 (Core Profile) Mesa 19.1.0-devel
(git-812288bf0f)
Wine-devel 4.7

--=20
You are receiving this mail because:
You are the assignee for the bug.=

--15565466902.0B91dBEeE.13757
Date: Mon, 29 Apr 2019 14:04:50 +0000
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
          bz_status_REOPENED "
   title=3D"REOPENED - Slow redrawing of menu in Gothic 2 under wine"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D108893#c6">Commen=
t # 6</a>
              on <a class=3D"bz_bug_link=20
          bz_status_REOPENED "
   title=3D"REOPENED - Slow redrawing of menu in Gothic 2 under wine"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D108893">bug 10889=
3</a>
              from <span class=3D"vcard"><a class=3D"email" href=3D"mailto:=
andrew.m.mcmahon&#64;gmail.com" title=3D"andrew.m.mcmahon&#64;gmail.com">an=
drew.m.mcmahon&#64;gmail.com</a>
</span></b>
        <pre>I can't replicate any performance issues with Gothic 2 Gold on=
 my setup.

I'm using the latest installer provided by GOG:
<span class=3D"quote">&gt; setup_gothic_2_gold_2.7_(14553).exe</span >
I'm installing the game into a clean wine 4.7-devel prefix by using:
<span class=3D"quote">&gt; WINEPREFIX=3D~/.wineprefix/gothic2 wine setup_go=
thic_2_gold_2.7_(14553).exe</span >
The game will crash at the main menu without directmusic.=20
Latest winetricks (github) can handle that:
<span class=3D"quote">&gt; WINEPREFIX=3D~/.wineprefix/gothic2 winetricks di=
rectmusic</span >
Then I'm just running the game normally via the desktop shortcut that's
automatically created.

I've recorded a video with SimpleScreenRecorder of the game running &#64; 1=
440x900
in wine's virtual desktop. I've got MESA_HUD enabled so you can see my
framerate and other info:
<a href=3D"https://drive.google.com/file/d/11t2akNusJh0hvaNEftV_oLbLd9lnozY=
X/view?usp=3Dsharing">https://drive.google.com/file/d/11t2akNusJh0hvaNEftV_=
oLbLd9lnozYX/view?usp=3Dsharing</a>

Phenom II x4 955
Debian Testing
OpenGL renderer string: AMD Radeon R9 200 Series (TONGA, DRM 3.30.0,
5.1.0-rc7-mainline-amd64, LLVM 8.0.0)
OpenGL core profile version string: 4.5 (Core Profile) Mesa 19.1.0-devel
(git-812288bf0f)
Wine-devel 4.7</pre>
        </div>
      </p>


      <hr>
      <span>You are receiving this mail because:</span>

      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>=

--15565466902.0B91dBEeE.13757--

--===============0543553892==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs

--===============0543553892==--
