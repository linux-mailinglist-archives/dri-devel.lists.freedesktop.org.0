Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EE323B89D1
	for <lists+dri-devel@lfdr.de>; Fri, 20 Sep 2019 05:54:26 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D0A0E6E8AA;
	Fri, 20 Sep 2019 03:54:23 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from culpepper.freedesktop.org (culpepper.freedesktop.org
 [131.252.210.165])
 by gabe.freedesktop.org (Postfix) with ESMTP id BC1E56EA5C
 for <dri-devel@lists.freedesktop.org>; Fri, 20 Sep 2019 03:54:22 +0000 (UTC)
Received: by culpepper.freedesktop.org (Postfix, from userid 33)
 id B931772167; Fri, 20 Sep 2019 03:54:22 +0000 (UTC)
From: bugzilla-daemon@freedesktop.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 111481] AMD Navi GPU frequent freezes on both Manjaro/Ubuntu
 with kernel 5.3 and mesa 19.2 -git/llvm9
Date: Fri, 20 Sep 2019 03:54:22 +0000
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
Message-ID: <bug-111481-502-u1o86eR6js@http.bugs.freedesktop.org/>
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
Content-Type: multipart/mixed; boundary="===============2041381340=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--===============2041381340==
Content-Type: multipart/alternative; boundary="15689516622.Dfc56e.9635"
Content-Transfer-Encoding: 7bit


--15689516622.Dfc56e.9635
Date: Fri, 20 Sep 2019 03:54:22 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated

https://bugs.freedesktop.org/show_bug.cgi?id=3D111481

--- Comment #53 from Sebastian Meyer <mail@bastimeyer.de> ---
Just compiled the latest mainline kernel from a few hours ago with the merg=
e of
drm-next-2019-09-18 and tried again.
https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?=
id=3D574cc4539762561d96b456dbc0544d8898bd4c6e

RotTR is still making the system freeze. I haven't tested other Vulkan
applications yet.

[  330.849703] amdgpu 0000:04:00.0: [gfxhub] page fault (src_id:0 ring:24
vmid:3 pasid:32777, for process RiseOfTheTombRa pid 2371 thread RiseOfTheT:=
cs0
pid 2377)
[  330.849706] amdgpu 0000:04:00.0:   in page starting at address
0x00008000bf066000 from client 27
[  330.849708] amdgpu 0000:04:00.0: GCVM_L2_PROTECTION_FAULT_STATUS:0x00301=
430
[  330.849709] amdgpu 0000:04:00.0:      MORE_FAULTS: 0x0
[  330.849711] amdgpu 0000:04:00.0:      WALKER_ERROR: 0x0
[  330.849712] amdgpu 0000:04:00.0:      PERMISSION_FAULTS: 0x3
[  330.849713] amdgpu 0000:04:00.0:      MAPPING_ERROR: 0x0
[  330.849715] amdgpu 0000:04:00.0:      RW: 0x0
[  335.967209] [drm:amdgpu_dm_atomic_commit_tail [amdgpu]] *ERROR* Waiting =
for
fences timed out!
[  335.967290] [drm:amdgpu_dm_atomic_commit_tail [amdgpu]] *ERROR* Waiting =
for
fences timed out!
[  340.873553] [drm:amdgpu_job_timedout [amdgpu]] *ERROR* ring gfx_0.0.0
timeout, signaled seq=3D73308, emitted seq=3D73310
[  340.873616] [drm:amdgpu_job_timedout [amdgpu]] *ERROR* Process informati=
on:
process RiseOfTheTombRa pid 2371 thread RiseOfTheT:cs0 pid 2377
[  340.873618] [drm] GPU recovery disabled.
[  341.086869] [drm:amdgpu_dm_atomic_commit_tail [amdgpu]] *ERROR* Waiting =
for
fences timed out!

$ pacman -Q linux-git linux-firmware-agd5f-radeon-navi10
{,lib32-}{mesa-git,vulkan-radeon-git,llvm-git,libdrm-git}
linux-git 5.3.r10169.g574cc4539762-1
linux-firmware-agd5f-radeon-navi10 2019.09.13.18.36-1
mesa-git 1:19.3.0_devel.115529.8b78cce433b-1
lib32-mesa-git 1:19.3.0_devel.115529.8b78cce433b-1
vulkan-radeon-git 1:19.3.0_devel.115529.8b78cce433b-1
lib32-vulkan-radeon-git 1:19.3.0_devel.115529.8b78cce433b-1
llvm-git 10.0.0_r327281.ec841cf36ca-1
lib32-llvm-git 10.0.0_r327289.ed69faa01bf-1
libdrm-git 2.4.99.r23.g0c427545-1
lib32-libdrm-git 2.4.99.r23.g0c427545-1

--=20
You are receiving this mail because:
You are the assignee for the bug.=

--15689516622.Dfc56e.9635
Date: Fri, 20 Sep 2019 03:54:22 +0000
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
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D111481#c53">Comme=
nt # 53</a>
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
        <pre>Just compiled the latest mainline kernel from a few hours ago =
with the merge of
drm-next-2019-09-18 and tried again.
<a href=3D"https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.g=
it/commit/?id=3D574cc4539762561d96b456dbc0544d8898bd4c6e">https://git.kerne=
l.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?id=3D574cc4539762=
561d96b456dbc0544d8898bd4c6e</a>

RotTR is still making the system freeze. I haven't tested other Vulkan
applications yet.

[  330.849703] amdgpu 0000:04:00.0: [gfxhub] page fault (src_id:0 ring:24
vmid:3 pasid:32777, for process RiseOfTheTombRa pid 2371 thread RiseOfTheT:=
cs0
pid 2377)
[  330.849706] amdgpu 0000:04:00.0:   in page starting at address
0x00008000bf066000 from client 27
[  330.849708] amdgpu 0000:04:00.0: GCVM_L2_PROTECTION_FAULT_STATUS:0x00301=
430
[  330.849709] amdgpu 0000:04:00.0:      MORE_FAULTS: 0x0
[  330.849711] amdgpu 0000:04:00.0:      WALKER_ERROR: 0x0
[  330.849712] amdgpu 0000:04:00.0:      PERMISSION_FAULTS: 0x3
[  330.849713] amdgpu 0000:04:00.0:      MAPPING_ERROR: 0x0
[  330.849715] amdgpu 0000:04:00.0:      RW: 0x0
[  335.967209] [drm:amdgpu_dm_atomic_commit_tail [amdgpu]] *ERROR* Waiting =
for
fences timed out!
[  335.967290] [drm:amdgpu_dm_atomic_commit_tail [amdgpu]] *ERROR* Waiting =
for
fences timed out!
[  340.873553] [drm:amdgpu_job_timedout [amdgpu]] *ERROR* ring gfx_0.0.0
timeout, signaled seq=3D73308, emitted seq=3D73310
[  340.873616] [drm:amdgpu_job_timedout [amdgpu]] *ERROR* Process informati=
on:
process RiseOfTheTombRa pid 2371 thread RiseOfTheT:cs0 pid 2377
[  340.873618] [drm] GPU recovery disabled.
[  341.086869] [drm:amdgpu_dm_atomic_commit_tail [amdgpu]] *ERROR* Waiting =
for
fences timed out!

$ pacman -Q linux-git linux-firmware-agd5f-radeon-navi10
{,lib32-}{mesa-git,vulkan-radeon-git,llvm-git,libdrm-git}
linux-git 5.3.r10169.g574cc4539762-1
linux-firmware-agd5f-radeon-navi10 2019.09.13.18.36-1
mesa-git 1:19.3.0_devel.115529.8b78cce433b-1
lib32-mesa-git 1:19.3.0_devel.115529.8b78cce433b-1
vulkan-radeon-git 1:19.3.0_devel.115529.8b78cce433b-1
lib32-vulkan-radeon-git 1:19.3.0_devel.115529.8b78cce433b-1
llvm-git 10.0.0_r327281.ec841cf36ca-1
lib32-llvm-git 10.0.0_r327289.ed69faa01bf-1
libdrm-git 2.4.99.r23.g0c427545-1
lib32-libdrm-git 2.4.99.r23.g0c427545-1</pre>
        </div>
      </p>


      <hr>
      <span>You are receiving this mail because:</span>

      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>=

--15689516622.Dfc56e.9635--

--===============2041381340==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs

--===============2041381340==--
