Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 66553F68ED
	for <lists+dri-devel@lfdr.de>; Sun, 10 Nov 2019 13:27:10 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 504406E612;
	Sun, 10 Nov 2019 12:27:07 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from culpepper.freedesktop.org (culpepper.freedesktop.org
 [IPv6:2610:10:20:722:a800:ff:fe98:4b55])
 by gabe.freedesktop.org (Postfix) with ESMTP id 3ACEE6E612
 for <dri-devel@lists.freedesktop.org>; Sun, 10 Nov 2019 12:27:06 +0000 (UTC)
Received: by culpepper.freedesktop.org (Postfix, from userid 33)
 id EDD9D720E2; Sun, 10 Nov 2019 12:27:05 +0000 (UTC)
From: bugzilla-daemon@freedesktop.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 111481] AMD Navi GPU frequent freezes on both Manjaro/Ubuntu
 with kernel 5.3 and mesa 19.2 -git/llvm9
Date: Sun, 10 Nov 2019 12:26:53 +0000
X-Bugzilla-Reason: AssignedTo
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: None
X-Bugzilla-Product: DRI
X-Bugzilla-Component: DRM/AMDgpu
X-Bugzilla-Version: unspecified
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: critical
X-Bugzilla-Who: popovic.marko@protonmail.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: highest
X-Bugzilla-Assigned-To: dri-devel@lists.freedesktop.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-111481-502-g6FqQ0nmm3@http.bugs.freedesktop.org/>
In-Reply-To: <bug-111481-502@http.bugs.freedesktop.org/>
References: <bug-111481-502@http.bugs.freedesktop.org/>
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
Content-Type: multipart/mixed; boundary="===============0590466287=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--===============0590466287==
Content-Type: multipart/alternative; boundary="15733888250.9B3cA.2731"
Content-Transfer-Encoding: 7bit


--15733888250.9B3cA.2731
Date: Sun, 10 Nov 2019 12:27:05 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated

https://bugs.freedesktop.org/show_bug.cgi?id=3D111481

--- Comment #224 from Marko Popovic <popovic.marko@protonmail.com> ---
(In reply to lptech1024 from comment #223)
> Followup to #216:
>=20
> Fedora 31: Kernel 5.3.9, GNOME 3.34, Mesa 19.2.2, linux-firmware 20190923,
> LLVM 9.0.0
>=20
> The hang is 100% reproducible.
>=20
> It occurs running the Linux-native (Vulkan) version of Shadow of the Tomb
> Raider (SotTR). I have never run SotTR under Proton/Wine, so that isn't a
> confounding variable.
>=20
> The (unskippable) cutscene is for the Amazon River in Peru and occurs
> anywhere between 15 seconds before the pilot is struck and the pilot is
> struck. Even when the video hangs, you can usually hear fragments (sound
> effects) of the game for a few seconds afterwords.
>=20
> I ran SotTR with vktrace and activated the Gnome (Wayland) overview to see
> if there I could catch any relevant terminal output (none that I saw). The
> game still had focus, so it continued playing. After the hang (when I
> rebooted), there wasn't a vktrace file. I would assume this would be eith=
er
> it didn't write it out due to the hang or it didn't have content to write.
>=20
> However, with it running visible in the overview (and a manual kernel
> update), I got both ring gfx and sdma errors:
>=20
> Nov 07 [SNIP]:24 [SNIP] kernel: [drm] GPU recovery disabled.
> Nov 07 [SNIP]:24 [SNIP] kernel: [drm] GPU recovery disabled.
> Nov 07 [SNIP]:24 [SNIP] kernel: [drm:amdgpu_job_timedout [amdgpu]] *ERROR*
> Process information: process  pid 0 thread  pid 0
> Nov 07 [SNIP]:24 [SNIP] kernel: [drm:amdgpu_job_timedout [amdgpu]] *ERROR*
> Process information: process gnome-shell pid 1722 thread gnome-shel:cs0 p=
id
> 1768
> Nov 07 [SNIP]:24 [SNIP] kernel: [drm:amdgpu_job_timedout [amdgpu]] *ERROR*
> ring sdma1 timeout, signaled seq=3D1049, emitted seq=3D1053
> Nov 07 [SNIP]:24 [SNIP] kernel: [drm:amdgpu_job_timedout [amdgpu]] *ERROR*
> ring sdma0 timeout, signaled seq=3D30017, emitted seq=3D30020
> Nov 07 [SNIP]:19 [SNIP] kernel: [drm] GPU recovery disabled.
> Nov 07 [SNIP]:19 [SNIP] kernel: [drm:amdgpu_job_timedout [amdgpu]] *ERROR*
> Process information: process ShadowOfTheTomb pid 3890 thread WebViewRende=
rer
> pid 4981
> Nov 07 [SNIP]:19 [SNIP] kernel: [drm:amdgpu_job_timedout [amdgpu]] *ERROR*
> ring gfx_0.0.0 timeout, signaled seq=3D75610, emitted seq=3D75612
> Nov 07 [SNIP]:19 [SNIP] kernel: [drm:amdgpu_dm_atomic_commit_tail [amdgpu=
]]
> *ERROR* Waiting for fences timed out or interrupted!
>=20
> As a workaround to proceed in the game, I downloaded the AMDVLD 2019.Q4.2
> .deb, extracted the contents, modified the JSON file (to point to the loc=
al
> amdvlk64.so), and ran SotTR with the VK_ICD_FILENAMES variable set to the
> AMDVLK JSON file.
>=20
> The AMDVLK graphics were terrible (significant percentage of random pixels
> turning random colors, bad rendering of elements, etc), but I did not
> experience any hangs during the cutscene. After reaching a known save poi=
nt,
> I switched back to mesa/RADV-llvm and haven't experienced a hang since
> (haven't progressed that much further yet, but that's the only hang so fa=
r -
> about 13% of the game has been completed).
>=20
> This would seem to point to a bug at least partially due to mesa/RADV-llv=
m.

radv related hangs got fixed in Mesa 20 git series, this thread is more
concerned with SDMA kernel-driver hangs.

--=20
You are receiving this mail because:
You are the assignee for the bug.=

--15733888250.9B3cA.2731
Date: Sun, 10 Nov 2019 12:27:05 +0000
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
          bz_status_NEW "
   title=3D"NEW - AMD Navi GPU frequent freezes on both Manjaro/Ubuntu with=
 kernel 5.3 and mesa 19.2 -git/llvm9"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D111481#c224">Comm=
ent # 224</a>
              on <a class=3D"bz_bug_link=20
          bz_status_NEW "
   title=3D"NEW - AMD Navi GPU frequent freezes on both Manjaro/Ubuntu with=
 kernel 5.3 and mesa 19.2 -git/llvm9"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D111481">bug 11148=
1</a>
              from <span class=3D"vcard"><a class=3D"email" href=3D"mailto:=
popovic.marko&#64;protonmail.com" title=3D"Marko Popovic &lt;popovic.marko&=
#64;protonmail.com&gt;"> <span class=3D"fn">Marko Popovic</span></a>
</span></b>
        <pre>(In reply to lptech1024 from <a href=3D"show_bug.cgi?id=3D1114=
81#c223">comment #223</a>)
<span class=3D"quote">&gt; Followup to #216:
&gt;=20
&gt; Fedora 31: Kernel 5.3.9, GNOME 3.34, Mesa 19.2.2, linux-firmware 20190=
923,
&gt; LLVM 9.0.0
&gt;=20
&gt; The hang is 100% reproducible.
&gt;=20
&gt; It occurs running the Linux-native (Vulkan) version of Shadow of the T=
omb
&gt; Raider (SotTR). I have never run SotTR under Proton/Wine, so that isn'=
t a
&gt; confounding variable.
&gt;=20
&gt; The (unskippable) cutscene is for the Amazon River in Peru and occurs
&gt; anywhere between 15 seconds before the pilot is struck and the pilot is
&gt; struck. Even when the video hangs, you can usually hear fragments (sou=
nd
&gt; effects) of the game for a few seconds afterwords.
&gt;=20
&gt; I ran SotTR with vktrace and activated the Gnome (Wayland) overview to=
 see
&gt; if there I could catch any relevant terminal output (none that I saw).=
 The
&gt; game still had focus, so it continued playing. After the hang (when I
&gt; rebooted), there wasn't a vktrace file. I would assume this would be e=
ither
&gt; it didn't write it out due to the hang or it didn't have content to wr=
ite.
&gt;=20
&gt; However, with it running visible in the overview (and a manual kernel
&gt; update), I got both ring gfx and sdma errors:
&gt;=20
&gt; Nov 07 [SNIP]:24 [SNIP] kernel: [drm] GPU recovery disabled.
&gt; Nov 07 [SNIP]:24 [SNIP] kernel: [drm] GPU recovery disabled.
&gt; Nov 07 [SNIP]:24 [SNIP] kernel: [drm:amdgpu_job_timedout [amdgpu]] *ER=
ROR*
&gt; Process information: process  pid 0 thread  pid 0
&gt; Nov 07 [SNIP]:24 [SNIP] kernel: [drm:amdgpu_job_timedout [amdgpu]] *ER=
ROR*
&gt; Process information: process gnome-shell pid 1722 thread gnome-shel:cs=
0 pid
&gt; 1768
&gt; Nov 07 [SNIP]:24 [SNIP] kernel: [drm:amdgpu_job_timedout [amdgpu]] *ER=
ROR*
&gt; ring sdma1 timeout, signaled seq=3D1049, emitted seq=3D1053
&gt; Nov 07 [SNIP]:24 [SNIP] kernel: [drm:amdgpu_job_timedout [amdgpu]] *ER=
ROR*
&gt; ring sdma0 timeout, signaled seq=3D30017, emitted seq=3D30020
&gt; Nov 07 [SNIP]:19 [SNIP] kernel: [drm] GPU recovery disabled.
&gt; Nov 07 [SNIP]:19 [SNIP] kernel: [drm:amdgpu_job_timedout [amdgpu]] *ER=
ROR*
&gt; Process information: process ShadowOfTheTomb pid 3890 thread WebViewRe=
nderer
&gt; pid 4981
&gt; Nov 07 [SNIP]:19 [SNIP] kernel: [drm:amdgpu_job_timedout [amdgpu]] *ER=
ROR*
&gt; ring gfx_0.0.0 timeout, signaled seq=3D75610, emitted seq=3D75612
&gt; Nov 07 [SNIP]:19 [SNIP] kernel: [drm:amdgpu_dm_atomic_commit_tail [amd=
gpu]]
&gt; *ERROR* Waiting for fences timed out or interrupted!
&gt;=20
&gt; As a workaround to proceed in the game, I downloaded the AMDVLD 2019.Q=
4.2
&gt; .deb, extracted the contents, modified the JSON file (to point to the =
local
&gt; amdvlk64.so), and ran SotTR with the VK_ICD_FILENAMES variable set to =
the
&gt; AMDVLK JSON file.
&gt;=20
&gt; The AMDVLK graphics were terrible (significant percentage of random pi=
xels
&gt; turning random colors, bad rendering of elements, etc), but I did not
&gt; experience any hangs during the cutscene. After reaching a known save =
point,
&gt; I switched back to mesa/RADV-llvm and haven't experienced a hang since
&gt; (haven't progressed that much further yet, but that's the only hang so=
 far -
&gt; about 13% of the game has been completed).
&gt;=20
&gt; This would seem to point to a bug at least partially due to mesa/RADV-=
llvm.</span >

radv related hangs got fixed in Mesa 20 git series, this thread is more
concerned with SDMA kernel-driver hangs.</pre>
        </div>
      </p>


      <hr>
      <span>You are receiving this mail because:</span>

      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>=

--15733888250.9B3cA.2731--

--===============0590466287==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs

--===============0590466287==--
