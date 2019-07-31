Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1B8067CDFE
	for <lists+dri-devel@lfdr.de>; Wed, 31 Jul 2019 22:16:23 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 921A46E2EC;
	Wed, 31 Jul 2019 20:16:20 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from culpepper.freedesktop.org (culpepper.freedesktop.org
 [131.252.210.165])
 by gabe.freedesktop.org (Postfix) with ESMTP id C6F6C6E2EC
 for <dri-devel@lists.freedesktop.org>; Wed, 31 Jul 2019 20:16:18 +0000 (UTC)
Received: by culpepper.freedesktop.org (Postfix, from userid 33)
 id BC74E72167; Wed, 31 Jul 2019 20:16:18 +0000 (UTC)
From: bugzilla-daemon@freedesktop.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 109022] ring gfx timeout during particular shader generation on
 yuzu emulator
Date: Wed, 31 Jul 2019 20:16:19 +0000
X-Bugzilla-Reason: AssignedTo
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: None
X-Bugzilla-Product: Mesa
X-Bugzilla-Component: Drivers/Gallium/radeonsi
X-Bugzilla-Version: git
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: major
X-Bugzilla-Who: felix.adrianto@gmail.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: medium
X-Bugzilla-Assigned-To: dri-devel@lists.freedesktop.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-109022-502-3rinM3HPMF@http.bugs.freedesktop.org/>
In-Reply-To: <bug-109022-502@http.bugs.freedesktop.org/>
References: <bug-109022-502@http.bugs.freedesktop.org/>
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
Content-Type: multipart/mixed; boundary="===============0863257018=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--===============0863257018==
Content-Type: multipart/alternative; boundary="15646041780.d9B62.3382"
Content-Transfer-Encoding: 7bit


--15646041780.d9B62.3382
Date: Wed, 31 Jul 2019 20:16:18 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated

https://bugs.freedesktop.org/show_bug.cgi?id=3D109022

--- Comment #23 from e88z4 <felix.adrianto@gmail.com> ---
Hi,=20

Is there an update for this ticket? The issue is still easily be replicated=
 in
the latest mesa on RadeonSI driver.

System information
Linux 5.2.2
Mesa-master=20
Radeon RX 580 Series (POLARIS10, DRM 3.32.0, 5.2.2-htpc, LLVM 10.0.0)


I have tried different combination of llvm backend such as llvm-8, llvm-9, =
and
llvm-10. They produced the same error. Could this be a bug in amd llvm back=
end?

Previously, I have provided the api trace, I hope the trace can be used to
debug this issue.


I provided the latest error from today. They are the same error like before.

^[      [Jul31 16:10] amdgpu 0000:23:00.0: GPU fault detected: 147 0x0d6044=
01
for process yuzu pid 15061 thread yuzu:cs0 pid 15068
[  +0.000004] amdgpu 0000:23:00.0:   VM_CONTEXT1_PROTECTION_FAULT_ADDR=20=20
0x0C03F7AC
[  +0.000001] amdgpu 0000:23:00.0:   VM_CONTEXT1_PROTECTION_FAULT_STATUS
0x0E044001
[  +0.000002] amdgpu 0000:23:00.0: VM fault (0x01, vmid 7, pasid 32770) at =
page
201586604, read from 'TC5' (0x54433500) (68)
[  +5.312442] [drm:amdgpu_dm_atomic_commit_tail [amdgpu]] *ERROR* Waiting f=
or
fences timed out or interrupted!
[  +4.874028] [drm:amdgpu_job_timedout [amdgpu]] *ERROR* ring gfx timeout,
signaled seq=3D24383, emitted seq=3D24385
[  +0.000066] [drm:amdgpu_job_timedout [amdgpu]] *ERROR* Process informatio=
n:
process yuzu pid 15061 thread yuzu:cs0 pid 15068
[  +0.000006] amdgpu 0000:23:00.0: GPU reset begin!
[  +0.584424] cp is busy, skip halt cp
[  +0.328786] rlc is busy, skip halt rlc
[  +0.001031] amdgpu 0000:23:00.0: GPU pci config reset
[  +0.463461] amdgpu 0000:23:00.0: GPU reset succeeded, trying to resume
[  +0.002152] [drm] PCIE GART of 256M enabled (table at 0x000000F400900000).
[  +0.000016] [drm] VRAM is lost due to GPU reset!
[  +0.087583] [drm] UVD and UVD ENC initialized successfully.
[  +0.099970] [drm] VCE initialized successfully.
[  +0.018504] amdgpu 0000:23:00.0: [drm:amdgpu_ib_ring_tests [amdgpu]] *ERR=
OR*
IB test failed on uvd (-110).
[  +0.003336] amdgpu 0000:23:00.0: ib ring test failed (-110).

--=20
You are receiving this mail because:
You are the assignee for the bug.=

--15646041780.d9B62.3382
Date: Wed, 31 Jul 2019 20:16:18 +0000
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
   title=3D"NEW - ring gfx timeout during particular shader generation on y=
uzu emulator"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D109022#c23">Comme=
nt # 23</a>
              on <a class=3D"bz_bug_link=20
          bz_status_NEW "
   title=3D"NEW - ring gfx timeout during particular shader generation on y=
uzu emulator"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D109022">bug 10902=
2</a>
              from <span class=3D"vcard"><a class=3D"email" href=3D"mailto:=
felix.adrianto&#64;gmail.com" title=3D"e88z4 &lt;felix.adrianto&#64;gmail.c=
om&gt;"> <span class=3D"fn">e88z4</span></a>
</span></b>
        <pre>Hi,=20

Is there an update for this ticket? The issue is still easily be replicated=
 in
the latest mesa on RadeonSI driver.

System information
Linux 5.2.2
Mesa-master=20
Radeon RX 580 Series (POLARIS10, DRM 3.32.0, 5.2.2-htpc, LLVM 10.0.0)


I have tried different combination of llvm backend such as llvm-8, llvm-9, =
and
llvm-10. They produced the same error. Could this be a bug in amd llvm back=
end?

Previously, I have provided the api trace, I hope the trace can be used to
debug this issue.


I provided the latest error from today. They are the same error like before.

^[      [Jul31 16:10] amdgpu 0000:23:00.0: GPU fault detected: 147 0x0d6044=
01
for process yuzu pid 15061 thread yuzu:cs0 pid 15068
[  +0.000004] amdgpu 0000:23:00.0:   VM_CONTEXT1_PROTECTION_FAULT_ADDR=20=20
0x0C03F7AC
[  +0.000001] amdgpu 0000:23:00.0:   VM_CONTEXT1_PROTECTION_FAULT_STATUS
0x0E044001
[  +0.000002] amdgpu 0000:23:00.0: VM fault (0x01, vmid 7, pasid 32770) at =
page
201586604, read from 'TC5' (0x54433500) (68)
[  +5.312442] [drm:amdgpu_dm_atomic_commit_tail [amdgpu]] *ERROR* Waiting f=
or
fences timed out or interrupted!
[  +4.874028] [drm:amdgpu_job_timedout [amdgpu]] *ERROR* ring gfx timeout,
signaled seq=3D24383, emitted seq=3D24385
[  +0.000066] [drm:amdgpu_job_timedout [amdgpu]] *ERROR* Process informatio=
n:
process yuzu pid 15061 thread yuzu:cs0 pid 15068
[  +0.000006] amdgpu 0000:23:00.0: GPU reset begin!
[  +0.584424] cp is busy, skip halt cp
[  +0.328786] rlc is busy, skip halt rlc
[  +0.001031] amdgpu 0000:23:00.0: GPU pci config reset
[  +0.463461] amdgpu 0000:23:00.0: GPU reset succeeded, trying to resume
[  +0.002152] [drm] PCIE GART of 256M enabled (table at 0x000000F400900000).
[  +0.000016] [drm] VRAM is lost due to GPU reset!
[  +0.087583] [drm] UVD and UVD ENC initialized successfully.
[  +0.099970] [drm] VCE initialized successfully.
[  +0.018504] amdgpu 0000:23:00.0: [drm:amdgpu_ib_ring_tests [amdgpu]] *ERR=
OR*
IB test failed on uvd (-110).
[  +0.003336] amdgpu 0000:23:00.0: ib ring test failed (-110).</pre>
        </div>
      </p>


      <hr>
      <span>You are receiving this mail because:</span>

      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>=

--15646041780.d9B62.3382--

--===============0863257018==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs

--===============0863257018==--
