Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 988E113542
	for <lists+dri-devel@lfdr.de>; Sat,  4 May 2019 00:10:52 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B80B789852;
	Fri,  3 May 2019 22:10:49 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from culpepper.freedesktop.org (culpepper.freedesktop.org
 [131.252.210.165])
 by gabe.freedesktop.org (Postfix) with ESMTP id 7311489852
 for <dri-devel@lists.freedesktop.org>; Fri,  3 May 2019 22:10:48 +0000 (UTC)
Received: by culpepper.freedesktop.org (Postfix, from userid 33)
 id 6FF847215A; Fri,  3 May 2019 22:10:48 +0000 (UTC)
From: bugzilla-daemon@freedesktop.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 108893] Slow redrawing of menu in Gothic 2 under wine
Date: Fri, 03 May 2019 22:10:48 +0000
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
Message-ID: <bug-108893-502-AeTnOgvCyn@http.bugs.freedesktop.org/>
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
Content-Type: multipart/mixed; boundary="===============0666428846=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--===============0666428846==
Content-Type: multipart/alternative; boundary="15569214482.be4a7.28022"
Content-Transfer-Encoding: 7bit


--15569214482.be4a7.28022
Date: Fri, 3 May 2019 22:10:48 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated

https://bugs.freedesktop.org/show_bug.cgi?id=3D108893

--- Comment #12 from andrew.m.mcmahon@gmail.com ---
(In reply to Michel D=C3=A4nzer from comment #8)
> The video shows very low frame-rate and GPU load in the menu, but high CPU
> load. Maybe there's a CPU bottleneck which affects the reporter even more
> badly. A CPU profile from sysprof or perf might give a clue.
The heavy CPU usage in that particular video is entirely down to
SimpleScreenRecorder. When I'm running the game and NOT recording the scree=
n at
the same time, CPU usage is around 30-50%:
https://imgur.com/a/AlhVLZp

That doesn't seem abnormal; the Phenom II is ancient plus it's going through
Wine. I also assume that the main menu ~10 fps cap is a quirk of the game b=
ut
perhaps I'm wrong?
https://pcgamingwiki.com/wiki/Gothic_II#Low_frame_rate_in_fullscreen_mode

I've compiled Mesa (git-8987152ac1) inside an amd64 & i386 chroot (debootst=
rap)=20
Adding --buildtype=3Ddebug into my usual script:
https://pastebin.com/6uP6d7kL

I've done two recordings with sysprof:
- A 1 minute recording starting once the game reaches the main menu
- A 5 minute recording starting the game, running around in the starting ar=
ea
and then exiting the game

Hopefully those files are of use:
https://drive.google.com/file/d/16s2OfDKIAhbnqrs8gwWicmP7RaJw28L-/view?usp=
=3Dsharing

Just out of interest there's an unofficial D3D11 renderer plus an unfinished
open source remake - love to see the latter finished:
https://github.com/ataulien/GD3D11
https://github.com/REGoth-project/REGoth

--=20
You are receiving this mail because:
You are the assignee for the bug.=

--15569214482.be4a7.28022
Date: Fri, 3 May 2019 22:10:48 +0000
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
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D108893#c12">Comme=
nt # 12</a>
              on <a class=3D"bz_bug_link=20
          bz_status_REOPENED "
   title=3D"REOPENED - Slow redrawing of menu in Gothic 2 under wine"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D108893">bug 10889=
3</a>
              from <span class=3D"vcard"><a class=3D"email" href=3D"mailto:=
andrew.m.mcmahon&#64;gmail.com" title=3D"andrew.m.mcmahon&#64;gmail.com">an=
drew.m.mcmahon&#64;gmail.com</a>
</span></b>
        <pre>(In reply to Michel D=C3=A4nzer from <a href=3D"show_bug.cgi?i=
d=3D108893#c8">comment #8</a>)
<span class=3D"quote">&gt; The video shows very low frame-rate and GPU load=
 in the menu, but high CPU
&gt; load. Maybe there's a CPU bottleneck which affects the reporter even m=
ore
&gt; badly. A CPU profile from sysprof or perf might give a clue.</span >
The heavy CPU usage in that particular video is entirely down to
SimpleScreenRecorder. When I'm running the game and NOT recording the scree=
n at
the same time, CPU usage is around 30-50%:
<a href=3D"https://imgur.com/a/AlhVLZp">https://imgur.com/a/AlhVLZp</a>

That doesn't seem abnormal; the Phenom II is ancient plus it's going through
Wine. I also assume that the main menu ~10 fps cap is a quirk of the game b=
ut
perhaps I'm wrong?
<a href=3D"https://pcgamingwiki.com/wiki/Gothic_II#Low_frame_rate_in_fullsc=
reen_mode">https://pcgamingwiki.com/wiki/Gothic_II#Low_frame_rate_in_fullsc=
reen_mode</a>

I've compiled Mesa (git-8987152ac1) inside an amd64 &amp; i386 chroot (debo=
otstrap)=20
Adding --buildtype=3Ddebug into my usual script:
<a href=3D"https://pastebin.com/6uP6d7kL">https://pastebin.com/6uP6d7kL</a>

I've done two recordings with sysprof:
- A 1 minute recording starting once the game reaches the main menu
- A 5 minute recording starting the game, running around in the starting ar=
ea
and then exiting the game

Hopefully those files are of use:
<a href=3D"https://drive.google.com/file/d/16s2OfDKIAhbnqrs8gwWicmP7RaJw28L=
-/view?usp=3Dsharing">https://drive.google.com/file/d/16s2OfDKIAhbnqrs8gwWi=
cmP7RaJw28L-/view?usp=3Dsharing</a>

Just out of interest there's an unofficial D3D11 renderer plus an unfinished
open source remake - love to see the latter finished:
<a href=3D"https://github.com/ataulien/GD3D11">https://github.com/ataulien/=
GD3D11</a>
<a href=3D"https://github.com/REGoth-project/REGoth">https://github.com/REG=
oth-project/REGoth</a></pre>
        </div>
      </p>


      <hr>
      <span>You are receiving this mail because:</span>

      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>=

--15569214482.be4a7.28022--

--===============0666428846==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs

--===============0666428846==--
