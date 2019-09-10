Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E74FCAECD2
	for <lists+dri-devel@lfdr.de>; Tue, 10 Sep 2019 16:19:29 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1CAF66E0D7;
	Tue, 10 Sep 2019 14:19:27 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from culpepper.freedesktop.org (culpepper.freedesktop.org
 [131.252.210.165])
 by gabe.freedesktop.org (Postfix) with ESMTP id 54BDD6E0E1
 for <dri-devel@lists.freedesktop.org>; Tue, 10 Sep 2019 14:19:25 +0000 (UTC)
Received: by culpepper.freedesktop.org (Postfix, from userid 33)
 id 508F972168; Tue, 10 Sep 2019 14:19:25 +0000 (UTC)
From: bugzilla-daemon@freedesktop.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 111481] AMD Navi GPU frequent freezes on both Manjaro/Ubuntu
 with kernel 5.3 and mesa 19.2 -git/llvm9
Date: Tue, 10 Sep 2019 14:19:25 +0000
X-Bugzilla-Reason: AssignedTo
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: None
X-Bugzilla-Product: DRI
X-Bugzilla-Component: DRM/AMDgpu
X-Bugzilla-Version: unspecified
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: critical
X-Bugzilla-Who: mail@bastimeyer.de
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: not set
X-Bugzilla-Assigned-To: dri-devel@lists.freedesktop.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-111481-502-GIyTNdlseZ@http.bugs.freedesktop.org/>
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
Content-Type: multipart/mixed; boundary="===============1211428355=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--===============1211428355==
Content-Type: multipart/alternative; boundary="15681251651.5FED9bDAE.28689"
Content-Transfer-Encoding: 7bit


--15681251651.5FED9bDAE.28689
Date: Tue, 10 Sep 2019 14:19:25 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated

https://bugs.freedesktop.org/show_bug.cgi?id=3D111481

--- Comment #32 from Sebastian Meyer <mail@bastimeyer.de> ---
Having the same issues with my new Powercolor RX 5700 XT on Arch Linux.
System freezes after a couple of seconds when I try to run games like RotTR.
Other games I've tested, like Dota 2 for example, are unreliable and make t=
he
system freeze after a few of minutes or after an hour or so.

The dmesg output when SSHing into my system:
[65070.475185] [drm:amdgpu_dm_atomic_commit_tail [amdgpu]] *ERROR* Waiting =
for
fences timed out or interrupted!
[65070.475259] [drm:amdgpu_dm_atomic_commit_tail [amdgpu]] *ERROR* Waiting =
for
fences timed out or interrupted!
[65075.595093] [drm:amdgpu_dm_atomic_commit_tail [amdgpu]] *ERROR* Waiting =
for
fences timed out or interrupted!
[65075.595180] [drm:amdgpu_dm_atomic_commit_tail [amdgpu]] *ERROR* Waiting =
for
fences timed out or interrupted!
[65075.595260] [drm:amdgpu_job_timedout [amdgpu]] *ERROR* ring gfx_0.0.0
timeout, signaled seq=3D6662176, emitted seq=3D6662178
[65075.595322] [drm:amdgpu_job_timedout [amdgpu]] *ERROR* Process informati=
on:
process RiseOfTheTombRa pid 56804 thread RiseOfTheT:cs0 pid 56811
[65075.595324] [drm] GPU recovery disabled.

I've also had a couple of sdma0/sdma1 related freezes after opening
resource-heavy websites in Chromium. Unfortunately though, I'm unable to
reproduce it now. If the system freezes again, I will provide logs and umr
output, as requested. The website which caused most of the freezes was
izurvive.com (interactive DayZ map) and it froze while toggling map markers=
 on
and off.
Sep 08 17:49:52 basti-pc kernel: [drm:amdgpu_dm_atomic_commit_tail [amdgpu]]
*ERROR* Waiting for fences timed out or interrupted!
Sep 08 17:49:57 basti-pc kernel: [drm:amdgpu_dm_atomic_commit_tail [amdgpu]]
*ERROR* Waiting for fences timed out or interrupted!
Sep 08 17:49:57 basti-pc kernel: [drm:amdgpu_job_timedout [amdgpu]] *ERROR*
ring sdma1 timeout, signaled seq=3D2372, emitted seq=3D2375
Sep 08 17:49:57 basti-pc kernel: [drm:amdgpu_job_timedout [amdgpu]] *ERROR*
Process information: process chromium pid 1271 thread chromium:cs0 pid 1331

$ pacman -Q linux-mainline linux-firmware-agd5f-radeon-navi10
{,lib32-}{mesa-git,vulkan-radeon-git,llvm-git,libdrm-git}
linux-mainline 5.3rc8-1
linux-firmware-agd5f-radeon-navi10 2019.08.26.14.36-1
mesa-git 1:19.3.0_devel.115190.f83f9d7daa0-1
lib32-mesa-git 1:19.3.0_devel.115190.f83f9d7daa0-1
vulkan-radeon-git 1:19.3.0_devel.115190.f83f9d7daa0-1
lib32-vulkan-radeon-git 1:19.3.0_devel.115190.f83f9d7daa0-1
llvm-git 10.0.0_r326348.d7d8bb937ad-1
lib32-llvm-git 10.0.0_r326355.d065c811649-1
libdrm-git 2.4.99.r17.g10cd9c3d-1
lib32-libdrm-git 2.4.99.r17.g10cd9c3d-1

--=20
You are receiving this mail because:
You are the assignee for the bug.=

--15681251651.5FED9bDAE.28689
Date: Tue, 10 Sep 2019 14:19:25 +0000
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
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D111481#c32">Comme=
nt # 32</a>
              on <a class=3D"bz_bug_link=20
          bz_status_NEW "
   title=3D"NEW - AMD Navi GPU frequent freezes on both Manjaro/Ubuntu with=
 kernel 5.3 and mesa 19.2 -git/llvm9"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D111481">bug 11148=
1</a>
              from <span class=3D"vcard"><a class=3D"email" href=3D"mailto:=
mail&#64;bastimeyer.de" title=3D"Sebastian Meyer &lt;mail&#64;bastimeyer.de=
&gt;"> <span class=3D"fn">Sebastian Meyer</span></a>
</span></b>
        <pre>Having the same issues with my new Powercolor RX 5700 XT on Ar=
ch Linux.
System freezes after a couple of seconds when I try to run games like RotTR.
Other games I've tested, like Dota 2 for example, are unreliable and make t=
he
system freeze after a few of minutes or after an hour or so.

The dmesg output when SSHing into my system:
[65070.475185] [drm:amdgpu_dm_atomic_commit_tail [amdgpu]] *ERROR* Waiting =
for
fences timed out or interrupted!
[65070.475259] [drm:amdgpu_dm_atomic_commit_tail [amdgpu]] *ERROR* Waiting =
for
fences timed out or interrupted!
[65075.595093] [drm:amdgpu_dm_atomic_commit_tail [amdgpu]] *ERROR* Waiting =
for
fences timed out or interrupted!
[65075.595180] [drm:amdgpu_dm_atomic_commit_tail [amdgpu]] *ERROR* Waiting =
for
fences timed out or interrupted!
[65075.595260] [drm:amdgpu_job_timedout [amdgpu]] *ERROR* ring gfx_0.0.0
timeout, signaled seq=3D6662176, emitted seq=3D6662178
[65075.595322] [drm:amdgpu_job_timedout [amdgpu]] *ERROR* Process informati=
on:
process RiseOfTheTombRa pid 56804 thread RiseOfTheT:cs0 pid 56811
[65075.595324] [drm] GPU recovery disabled.

I've also had a couple of sdma0/sdma1 related freezes after opening
resource-heavy websites in Chromium. Unfortunately though, I'm unable to
reproduce it now. If the system freezes again, I will provide logs and umr
output, as requested. The website which caused most of the freezes was
izurvive.com (interactive DayZ map) and it froze while toggling map markers=
 on
and off.
Sep 08 17:49:52 basti-pc kernel: [drm:amdgpu_dm_atomic_commit_tail [amdgpu]]
*ERROR* Waiting for fences timed out or interrupted!
Sep 08 17:49:57 basti-pc kernel: [drm:amdgpu_dm_atomic_commit_tail [amdgpu]]
*ERROR* Waiting for fences timed out or interrupted!
Sep 08 17:49:57 basti-pc kernel: [drm:amdgpu_job_timedout [amdgpu]] *ERROR*
ring sdma1 timeout, signaled seq=3D2372, emitted seq=3D2375
Sep 08 17:49:57 basti-pc kernel: [drm:amdgpu_job_timedout [amdgpu]] *ERROR*
Process information: process chromium pid 1271 thread chromium:cs0 pid 1331

$ pacman -Q linux-mainline linux-firmware-agd5f-radeon-navi10
{,lib32-}{mesa-git,vulkan-radeon-git,llvm-git,libdrm-git}
linux-mainline 5.3rc8-1
linux-firmware-agd5f-radeon-navi10 2019.08.26.14.36-1
mesa-git 1:19.3.0_devel.115190.f83f9d7daa0-1
lib32-mesa-git 1:19.3.0_devel.115190.f83f9d7daa0-1
vulkan-radeon-git 1:19.3.0_devel.115190.f83f9d7daa0-1
lib32-vulkan-radeon-git 1:19.3.0_devel.115190.f83f9d7daa0-1
llvm-git 10.0.0_r326348.d7d8bb937ad-1
lib32-llvm-git 10.0.0_r326355.d065c811649-1
libdrm-git 2.4.99.r17.g10cd9c3d-1
lib32-libdrm-git 2.4.99.r17.g10cd9c3d-1</pre>
        </div>
      </p>


      <hr>
      <span>You are receiving this mail because:</span>

      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>=

--15681251651.5FED9bDAE.28689--

--===============1211428355==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs

--===============1211428355==--
