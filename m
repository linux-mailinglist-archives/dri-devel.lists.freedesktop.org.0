Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 46208FE62D
	for <lists+dri-devel@lfdr.de>; Fri, 15 Nov 2019 21:11:04 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3F48A6E7EA;
	Fri, 15 Nov 2019 20:11:01 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from culpepper.freedesktop.org (culpepper.freedesktop.org
 [IPv6:2610:10:20:722:a800:ff:fe98:4b55])
 by gabe.freedesktop.org (Postfix) with ESMTP id AA0566EAE8
 for <dri-devel@lists.freedesktop.org>; Fri, 15 Nov 2019 20:10:59 +0000 (UTC)
Received: by culpepper.freedesktop.org (Postfix, from userid 33)
 id A648C720E2; Fri, 15 Nov 2019 20:10:59 +0000 (UTC)
From: bugzilla-daemon@freedesktop.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 111481] AMD Navi GPU frequent freezes on both Manjaro/Ubuntu
 with kernel 5.3 and mesa 19.2 -git/llvm9
Date: Fri, 15 Nov 2019 20:10:58 +0000
X-Bugzilla-Reason: AssignedTo
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: None
X-Bugzilla-Product: DRI
X-Bugzilla-Component: DRM/AMDgpu
X-Bugzilla-Version: unspecified
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: critical
X-Bugzilla-Who: sander@lienaerts.nl
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: highest
X-Bugzilla-Assigned-To: dri-devel@lists.freedesktop.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-111481-502-reFlGePkav@http.bugs.freedesktop.org/>
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
Content-Type: multipart/mixed; boundary="===============0832472219=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--===============0832472219==
Content-Type: multipart/alternative; boundary="15738486598.f0AFB.3069"
Content-Transfer-Encoding: 7bit


--15738486598.f0AFB.3069
Date: Fri, 15 Nov 2019 20:10:59 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated

https://bugs.freedesktop.org/show_bug.cgi?id=3D111481

--- Comment #231 from Sander Lienaerts <sander@lienaerts.nl> ---
Been following this thread for a while now. Can't believe this has been kno=
wn
for 3 months, without a fix released.

Just a moment ago a random freeze occurred running Firefox and other
applications, no games. Spotify kept playing in the background. Cursor not
moving and unable to open another shell.

This happened with AMD_DEBUG=3D"nongg,nodma" enabled. Running kernel 5.4rc7=
 and
Mesa 19.2.4.

Here is an output of the log before reboot:

nov 15 20:47:58 sander-pc kernel: amdgpu 0000:0a:00.0: [gfxhub] page fault
(src_id:0 ring:40 vmid:5 pasid:32769, for process Xorg pid 811 thread Xorg:=
cs0
pid 974)
nov 15 20:47:58 sander-pc kernel: amdgpu 0000:0a:00.0:   in page starting at
address 0x00000318c00e7000 from client 27
nov 15 20:47:58 sander-pc kernel: amdgpu 0000:0a:00.0:
GCVM_L2_PROTECTION_FAULT_STATUS:0x00541C51
nov 15 20:47:58 sander-pc kernel: amdgpu 0000:0a:00.0:          MORE_FAULTS:
0x1
nov 15 20:47:58 sander-pc kernel: amdgpu 0000:0a:00.0:          WALKER_ERRO=
R:
0x0
nov 15 20:47:58 sander-pc kernel: amdgpu 0000:0a:00.0:=20=20=20=20=20=20=20=
=20=20
PERMISSION_FAULTS: 0x5
nov 15 20:47:58 sander-pc kernel: amdgpu 0000:0a:00.0:          MAPPING_ERR=
OR:
0x0
nov 15 20:47:58 sander-pc kernel: amdgpu 0000:0a:00.0:          RW: 0x1
nov 15 20:47:58 sander-pc kernel: amdgpu 0000:0a:00.0: [gfxhub] page fault
(src_id:0 ring:40 vmid:5 pasid:32769, for process Xorg pid 811 thread Xorg:=
cs0
pid 974)
nov 15 20:47:58 sander-pc kernel: amdgpu 0000:0a:00.0:   in page starting at
address 0x00000318c00e6000 from client 27
nov 15 20:47:58 sander-pc kernel: amdgpu 0000:0a:00.0:
GCVM_L2_PROTECTION_FAULT_STATUS:0x00000000
nov 15 20:47:58 sander-pc kernel: amdgpu 0000:0a:00.0:          MORE_FAULTS:
0x0
nov 15 20:47:58 sander-pc kernel: amdgpu 0000:0a:00.0:          WALKER_ERRO=
R:
0x0
nov 15 20:47:58 sander-pc kernel: amdgpu 0000:0a:00.0:=20=20=20=20=20=20=20=
=20=20
PERMISSION_FAULTS: 0x0
nov 15 20:47:58 sander-pc kernel: amdgpu 0000:0a:00.0:          MAPPING_ERR=
OR:
0x0
nov 15 20:47:58 sander-pc kernel: amdgpu 0000:0a:00.0:          RW: 0x0
nov 15 20:47:58 sander-pc kernel: amdgpu 0000:0a:00.0: [gfxhub] page fault
(src_id:0 ring:40 vmid:5 pasid:32769, for process Xorg pid 811 thread Xorg:=
cs0
pid 974)
nov 15 20:47:58 sander-pc kernel: amdgpu 0000:0a:00.0:   in page starting at
address 0x00000318c00e9000 from client 27
nov 15 20:47:58 sander-pc kernel: amdgpu 0000:0a:00.0:
GCVM_L2_PROTECTION_FAULT_STATUS:0x00000000
nov 15 20:47:58 sander-pc kernel: amdgpu 0000:0a:00.0:          MORE_FAULTS:
0x0
nov 15 20:47:58 sander-pc kernel: amdgpu 0000:0a:00.0:          WALKER_ERRO=
R:
0x0
nov 15 20:47:58 sander-pc kernel: amdgpu 0000:0a:00.0:=20=20=20=20=20=20=20=
=20=20
PERMISSION_FAULTS: 0x0
nov 15 20:47:58 sander-pc kernel: amdgpu 0000:0a:00.0:          MAPPING_ERR=
OR:
0x0
nov 15 20:47:58 sander-pc kernel: amdgpu 0000:0a:00.0:          RW: 0x0
nov 15 20:47:58 sander-pc kernel: amdgpu 0000:0a:00.0: [gfxhub] page fault
(src_id:0 ring:40 vmid:5 pasid:32769, for process Xorg pid 811 thread Xorg:=
cs0
pid 974)
nov 15 20:47:58 sander-pc kernel: amdgpu 0000:0a:00.0:   in page starting at
address 0x00000318c00e8000 from client 27
nov 15 20:47:58 sander-pc kernel: amdgpu 0000:0a:00.0:
GCVM_L2_PROTECTION_FAULT_STATUS:0x00000000
nov 15 20:47:58 sander-pc kernel: amdgpu 0000:0a:00.0:          MORE_FAULTS:
0x0
nov 15 20:47:58 sander-pc kernel: amdgpu 0000:0a:00.0:          WALKER_ERRO=
R:
0x0
nov 15 20:47:58 sander-pc kernel: amdgpu 0000:0a:00.0:=20=20=20=20=20=20=20=
=20=20
PERMISSION_FAULTS: 0x0
nov 15 20:47:58 sander-pc kernel: amdgpu 0000:0a:00.0:          MAPPING_ERR=
OR:
0x0
nov 15 20:47:58 sander-pc kernel: amdgpu 0000:0a:00.0:          RW: 0x0
nov 15 20:47:58 sander-pc kernel: amdgpu 0000:0a:00.0: [gfxhub] page fault
(src_id:0 ring:40 vmid:5 pasid:32769, for process Xorg pid 811 thread Xorg:=
cs0
pid 974)
nov 15 20:47:58 sander-pc kernel: amdgpu 0000:0a:00.0:   in page starting at
address 0x00000318c00ea000 from client 27
nov 15 20:47:58 sander-pc kernel: amdgpu 0000:0a:00.0:
GCVM_L2_PROTECTION_FAULT_STATUS:0x00000000
nov 15 20:47:58 sander-pc kernel: amdgpu 0000:0a:00.0:          MORE_FAULTS:
0x0
nov 15 20:47:58 sander-pc kernel: amdgpu 0000:0a:00.0:          WALKER_ERRO=
R:
0x0
nov 15 20:47:58 sander-pc kernel: amdgpu 0000:0a:00.0:=20=20=20=20=20=20=20=
=20=20
PERMISSION_FAULTS: 0x0
nov 15 20:47:58 sander-pc kernel: amdgpu 0000:0a:00.0:          MAPPING_ERR=
OR:
0x0
nov 15 20:47:58 sander-pc kernel: amdgpu 0000:0a:00.0:          RW: 0x0
nov 15 20:48:09 sander-pc kernel: [drm:amdgpu_dm_atomic_commit_tail [amdgpu=
]]
*ERROR* Waiting for fences timed out!
nov 15 20:48:09 sander-pc kernel: [drm:amdgpu_job_timedout [amdgpu]] *ERROR*
ring sdma1 timeout, signaled seq=3D6760, emitted seq=3D6763
nov 15 20:48:09 sander-pc kernel: [drm:amdgpu_job_timedout [amdgpu]] *ERROR*
Process information: process Xorg pid 811 thread Xorg:cs0 pid 974
nov 15 20:48:09 sander-pc kernel: [drm] GPU recovery disabled.

--=20
You are receiving this mail because:
You are the assignee for the bug.=

--15738486598.f0AFB.3069
Date: Fri, 15 Nov 2019 20:10:59 +0000
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
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D111481#c231">Comm=
ent # 231</a>
              on <a class=3D"bz_bug_link=20
          bz_status_NEW "
   title=3D"NEW - AMD Navi GPU frequent freezes on both Manjaro/Ubuntu with=
 kernel 5.3 and mesa 19.2 -git/llvm9"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D111481">bug 11148=
1</a>
              from <span class=3D"vcard"><a class=3D"email" href=3D"mailto:=
sander&#64;lienaerts.nl" title=3D"Sander Lienaerts &lt;sander&#64;lienaerts=
.nl&gt;"> <span class=3D"fn">Sander Lienaerts</span></a>
</span></b>
        <pre>Been following this thread for a while now. Can't believe this=
 has been known
for 3 months, without a fix released.

Just a moment ago a random freeze occurred running Firefox and other
applications, no games. Spotify kept playing in the background. Cursor not
moving and unable to open another shell.

This happened with AMD_DEBUG=3D&quot;nongg,nodma&quot; enabled. Running ker=
nel 5.4rc7 and
Mesa 19.2.4.

Here is an output of the log before reboot:

nov 15 20:47:58 sander-pc kernel: amdgpu 0000:0a:00.0: [gfxhub] page fault
(src_id:0 ring:40 vmid:5 pasid:32769, for process Xorg pid 811 thread Xorg:=
cs0
pid 974)
nov 15 20:47:58 sander-pc kernel: amdgpu 0000:0a:00.0:   in page starting at
address 0x00000318c00e7000 from client 27
nov 15 20:47:58 sander-pc kernel: amdgpu 0000:0a:00.0:
GCVM_L2_PROTECTION_FAULT_STATUS:0x00541C51
nov 15 20:47:58 sander-pc kernel: amdgpu 0000:0a:00.0:          MORE_FAULTS:
0x1
nov 15 20:47:58 sander-pc kernel: amdgpu 0000:0a:00.0:          WALKER_ERRO=
R:
0x0
nov 15 20:47:58 sander-pc kernel: amdgpu 0000:0a:00.0:=20=20=20=20=20=20=20=
=20=20
PERMISSION_FAULTS: 0x5
nov 15 20:47:58 sander-pc kernel: amdgpu 0000:0a:00.0:          MAPPING_ERR=
OR:
0x0
nov 15 20:47:58 sander-pc kernel: amdgpu 0000:0a:00.0:          RW: 0x1
nov 15 20:47:58 sander-pc kernel: amdgpu 0000:0a:00.0: [gfxhub] page fault
(src_id:0 ring:40 vmid:5 pasid:32769, for process Xorg pid 811 thread Xorg:=
cs0
pid 974)
nov 15 20:47:58 sander-pc kernel: amdgpu 0000:0a:00.0:   in page starting at
address 0x00000318c00e6000 from client 27
nov 15 20:47:58 sander-pc kernel: amdgpu 0000:0a:00.0:
GCVM_L2_PROTECTION_FAULT_STATUS:0x00000000
nov 15 20:47:58 sander-pc kernel: amdgpu 0000:0a:00.0:          MORE_FAULTS:
0x0
nov 15 20:47:58 sander-pc kernel: amdgpu 0000:0a:00.0:          WALKER_ERRO=
R:
0x0
nov 15 20:47:58 sander-pc kernel: amdgpu 0000:0a:00.0:=20=20=20=20=20=20=20=
=20=20
PERMISSION_FAULTS: 0x0
nov 15 20:47:58 sander-pc kernel: amdgpu 0000:0a:00.0:          MAPPING_ERR=
OR:
0x0
nov 15 20:47:58 sander-pc kernel: amdgpu 0000:0a:00.0:          RW: 0x0
nov 15 20:47:58 sander-pc kernel: amdgpu 0000:0a:00.0: [gfxhub] page fault
(src_id:0 ring:40 vmid:5 pasid:32769, for process Xorg pid 811 thread Xorg:=
cs0
pid 974)
nov 15 20:47:58 sander-pc kernel: amdgpu 0000:0a:00.0:   in page starting at
address 0x00000318c00e9000 from client 27
nov 15 20:47:58 sander-pc kernel: amdgpu 0000:0a:00.0:
GCVM_L2_PROTECTION_FAULT_STATUS:0x00000000
nov 15 20:47:58 sander-pc kernel: amdgpu 0000:0a:00.0:          MORE_FAULTS:
0x0
nov 15 20:47:58 sander-pc kernel: amdgpu 0000:0a:00.0:          WALKER_ERRO=
R:
0x0
nov 15 20:47:58 sander-pc kernel: amdgpu 0000:0a:00.0:=20=20=20=20=20=20=20=
=20=20
PERMISSION_FAULTS: 0x0
nov 15 20:47:58 sander-pc kernel: amdgpu 0000:0a:00.0:          MAPPING_ERR=
OR:
0x0
nov 15 20:47:58 sander-pc kernel: amdgpu 0000:0a:00.0:          RW: 0x0
nov 15 20:47:58 sander-pc kernel: amdgpu 0000:0a:00.0: [gfxhub] page fault
(src_id:0 ring:40 vmid:5 pasid:32769, for process Xorg pid 811 thread Xorg:=
cs0
pid 974)
nov 15 20:47:58 sander-pc kernel: amdgpu 0000:0a:00.0:   in page starting at
address 0x00000318c00e8000 from client 27
nov 15 20:47:58 sander-pc kernel: amdgpu 0000:0a:00.0:
GCVM_L2_PROTECTION_FAULT_STATUS:0x00000000
nov 15 20:47:58 sander-pc kernel: amdgpu 0000:0a:00.0:          MORE_FAULTS:
0x0
nov 15 20:47:58 sander-pc kernel: amdgpu 0000:0a:00.0:          WALKER_ERRO=
R:
0x0
nov 15 20:47:58 sander-pc kernel: amdgpu 0000:0a:00.0:=20=20=20=20=20=20=20=
=20=20
PERMISSION_FAULTS: 0x0
nov 15 20:47:58 sander-pc kernel: amdgpu 0000:0a:00.0:          MAPPING_ERR=
OR:
0x0
nov 15 20:47:58 sander-pc kernel: amdgpu 0000:0a:00.0:          RW: 0x0
nov 15 20:47:58 sander-pc kernel: amdgpu 0000:0a:00.0: [gfxhub] page fault
(src_id:0 ring:40 vmid:5 pasid:32769, for process Xorg pid 811 thread Xorg:=
cs0
pid 974)
nov 15 20:47:58 sander-pc kernel: amdgpu 0000:0a:00.0:   in page starting at
address 0x00000318c00ea000 from client 27
nov 15 20:47:58 sander-pc kernel: amdgpu 0000:0a:00.0:
GCVM_L2_PROTECTION_FAULT_STATUS:0x00000000
nov 15 20:47:58 sander-pc kernel: amdgpu 0000:0a:00.0:          MORE_FAULTS:
0x0
nov 15 20:47:58 sander-pc kernel: amdgpu 0000:0a:00.0:          WALKER_ERRO=
R:
0x0
nov 15 20:47:58 sander-pc kernel: amdgpu 0000:0a:00.0:=20=20=20=20=20=20=20=
=20=20
PERMISSION_FAULTS: 0x0
nov 15 20:47:58 sander-pc kernel: amdgpu 0000:0a:00.0:          MAPPING_ERR=
OR:
0x0
nov 15 20:47:58 sander-pc kernel: amdgpu 0000:0a:00.0:          RW: 0x0
nov 15 20:48:09 sander-pc kernel: [drm:amdgpu_dm_atomic_commit_tail [amdgpu=
]]
*ERROR* Waiting for fences timed out!
nov 15 20:48:09 sander-pc kernel: [drm:amdgpu_job_timedout [amdgpu]] *ERROR*
ring sdma1 timeout, signaled seq=3D6760, emitted seq=3D6763
nov 15 20:48:09 sander-pc kernel: [drm:amdgpu_job_timedout [amdgpu]] *ERROR*
Process information: process Xorg pid 811 thread Xorg:cs0 pid 974
nov 15 20:48:09 sander-pc kernel: [drm] GPU recovery disabled.</pre>
        </div>
      </p>


      <hr>
      <span>You are receiving this mail because:</span>

      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>=

--15738486598.f0AFB.3069--

--===============0832472219==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs

--===============0832472219==--
