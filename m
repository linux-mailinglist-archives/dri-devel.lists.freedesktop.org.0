Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A44BB94506F
	for <lists+dri-devel@lfdr.de>; Thu,  1 Aug 2024 18:23:39 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 65F9010E02A;
	Thu,  1 Aug 2024 16:23:36 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="PtWjaN7d";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CCA5610E02A
 for <dri-devel@lists.freedesktop.org>; Thu,  1 Aug 2024 16:23:34 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id EF532628D9
 for <dri-devel@lists.freedesktop.org>; Thu,  1 Aug 2024 16:23:33 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id A3E23C4AF0B
 for <dri-devel@lists.freedesktop.org>; Thu,  1 Aug 2024 16:23:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1722529413;
 bh=kkVrhVHdZnApvwx/N7tSTx5c/3sII1kkJa3a69Lwmiw=;
 h=From:To:Subject:Date:From;
 b=PtWjaN7dnrMorh3JCCS1+bPJWflXeH5J6DhM4zOQ+BCH7N3LsND8bThQJzJaQc5BT
 Nc4z7gr4QurbvIebQ2MzJMwIfPV2ljGMpR1L57R+SX+hX/zaWP4MSrKHycTQGvQdS3
 NiFIWm7svG8nHfJTgrtYMc0cGq1uX8+VNFbi5DfuoN7c/L72JllSRNCAozHJAsNgru
 PdoZ6DRNa5yCpmPd5JXMp0nnmbIcvgIGxFbcb4up1CeBUyUcPSNaaBjBAeNOUhJ0ek
 y2bzrMSI6Nr0WFLUyoegjX6ctBPUeW/WVfW7mAIaH3uBYNMhXP01zo4IZZCNWGxyYZ
 pG23HsycY/OSQ==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix,
 from userid 48) id 966B5C53B7F; Thu,  1 Aug 2024 16:23:33 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 219118] New: Linux 6.10.x [drm:amdgpu_job_timedout [amdgpu]]
 *ERROR* ring gfx timeout VM fault / GPU fault detected
Date: Thu, 01 Aug 2024 16:23:33 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: new
X-Bugzilla-Watch-Reason: AssignedTo drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Video(DRI - non Intel)
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: high
X-Bugzilla-Who: mjevans1983@gmail.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P3
X-Bugzilla-Assigned-To: drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: bug_id short_desc product version rep_platform
 op_sys bug_status bug_severity priority component assigned_to reporter
 cf_regression
Message-ID: <bug-219118-2300@https.bugzilla.kernel.org/>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: https://bugzilla.kernel.org/
Auto-Submitted: auto-generated
MIME-Version: 1.0
X-BeenThere: dri-devel@lists.freedesktop.org
X-Mailman-Version: 2.1.29
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

https://bugzilla.kernel.org/show_bug.cgi?id=3D219118

            Bug ID: 219118
           Summary: Linux 6.10.x [drm:amdgpu_job_timedout [amdgpu]]
                    *ERROR* ring gfx timeout VM fault / GPU fault detected
           Product: Drivers
           Version: 2.5
          Hardware: All
                OS: Linux
            Status: NEW
          Severity: high
          Priority: P3
         Component: Video(DRI - non Intel)
          Assignee: drivers_video-dri@kernel-bugs.osdl.org
          Reporter: mjevans1983@gmail.com
        Regression: No

I'm not sure if this should be filed under Console/Framebuffers, Video(DRI -
non Intel), or Video(Other).

I thought I'd created the bug in the correct location,
https://gitlab.freedesktop.org/drm/amd/-/issues/3510 but no maintainer has
commented or otherwise notably interacted with the report.  Initially I tho=
ught
it was just an MPV bug since VLC didn't trigger the issue
https://github.com/mpv-player/mpv/issues/14600 .

It looks like a developer's personal(?) drm-fixes-6.11 branch cherry picked=
 the
commit that appeared to fix the issue completely for my test cases:
https://gitlab.freedesktop.org/agd5f/linux/-/commit/f3572db3c049b4d32bb5ba7=
7ad5305616c44c7c1

However that isn't for the earlier 6.10.x series which also needs the fix,
unless it's dead.

This appears to be a Swiss cheese sort of bug situation.  If software
requests/provides contiguous buffers then the error results are more subtle,
such as momentary video corruption if the kernel's access isn't out of boun=
ds
but rather rarely scrambled.  It's only when both the userspace and driver
don't enforce contiguous buffer segments that out of bounds accesses result=
 in
a GPU reset and consequently terminated userspace.


ArchLinux (rolling release)
Linux 6.10.1-arch1-1 #1 (closed) SMP PREEMPT_DYNAMIC Wed, 24 Jul 2024 22:25=
:43
+0000 x86_64 GNU/Linux
amdgpu + OpenGL version string: 4.6 (Compatibility Profile) Mesa 24.1.4-arc=
h1.2
ArchLinux current stable builds


[ 1766.321165] amdgpu 0000:01:00.0: amdgpu: GPU fault detected: 147 0x0a22c=
802
[ 1766.321171] amdgpu 0000:01:00.0: amdgpu:  for process plasmashell pid 29=
61
thread plasmashel:cs0 pid 3007
[ 1766.321172] amdgpu 0000:01:00.0: amdgpu:   VM_CONTEXT1_PROTECTION_FAULT_=
ADDR
  0x00101F44
[ 1766.321174] amdgpu 0000:01:00.0: amdgpu:=20=20
VM_CONTEXT1_PROTECTION_FAULT_STATUS 0x0B0C8002
[ 1766.321175] amdgpu 0000:01:00.0: amdgpu: VM fault (0x02, vmid 5, pasid
32772) at page 1056580, write from 'TC3' (0x54433300) (200)
[ 1766.321237] amdgpu 0000:01:00.0: amdgpu: GPU fault detected: 147 0x07f2a=
002
[ 1766.321238] amdgpu 0000:01:00.0: amdgpu:  for process plasmashell pid 29=
61
thread plasmashel:cs0 pid 3007
[ 1766.321239] amdgpu 0000:01:00.0: amdgpu:   VM_CONTEXT1_PROTECTION_FAULT_=
ADDR
  0x0010120C
[ 1766.321240] amdgpu 0000:01:00.0: amdgpu:=20=20
VM_CONTEXT1_PROTECTION_FAULT_STATUS 0x0B020002
[ 1766.321241] amdgpu 0000:01:00.0: amdgpu: VM fault (0x02, vmid 5, pasid
32772) at page 1053196, write from 'CB2' (0x43423200) (32)
[ 1766.321244] amdgpu 0000:01:00.0: amdgpu: GPU fault detected: 147 0x07b29=
002
[ 1766.321245] amdgpu 0000:01:00.0: amdgpu:  for process plasmashell pid 29=
61
thread plasmashel:cs0 pid 3007
[ 1766.321247] amdgpu 0000:01:00.0: amdgpu:   VM_CONTEXT1_PROTECTION_FAULT_=
ADDR
  0x00101237
[ 1766.321247] amdgpu 0000:01:00.0: amdgpu:=20=20
VM_CONTEXT1_PROTECTION_FAULT_STATUS 0x0B010002
[ 1766.321248] amdgpu 0000:01:00.0: amdgpu: VM fault (0x02, vmid 5, pasid
32772) at page 1053239, write from 'CB3' (0x43423300) (16)
[ 1766.321255] amdgpu 0000:01:00.0: amdgpu: GPU fault detected: 147 0x0772e=
002
[ 1766.321256] amdgpu 0000:01:00.0: amdgpu:  for process plasmashell pid 29=
61
thread plasmashel:cs0 pid 3007
[ 1766.321257] amdgpu 0000:01:00.0: amdgpu:   VM_CONTEXT1_PROTECTION_FAULT_=
ADDR
  0x00101200
[ 1766.321258] amdgpu 0000:01:00.0: amdgpu:=20=20
VM_CONTEXT1_PROTECTION_FAULT_STATUS 0x0B0A0002
[ 1766.321258] amdgpu 0000:01:00.0: amdgpu: VM fault (0x02, vmid 5, pasid
32772) at page 1053184, write from 'CB4' (0x43423400) (160)
[ 1766.321262] amdgpu 0000:01:00.0: amdgpu: GPU fault detected: 147 0x0772d=
002
[ 1766.321263] amdgpu 0000:01:00.0: amdgpu:  for process plasmashell pid 29=
61
thread plasmashel:cs0 pid 3007
[ 1766.321264] amdgpu 0000:01:00.0: amdgpu:   VM_CONTEXT1_PROTECTION_FAULT_=
ADDR
  0x00101232
[ 1766.321264] amdgpu 0000:01:00.0: amdgpu:=20=20
VM_CONTEXT1_PROTECTION_FAULT_STATUS 0x0B0A0002
[ 1766.321265] amdgpu 0000:01:00.0: amdgpu: VM fault (0x02, vmid 5, pasid
32772) at page 1053234, write from 'CB4' (0x43423400) (160)
[ 1766.321268] amdgpu 0000:01:00.0: amdgpu: GPU fault detected: 147 0x07729=
002
[ 1766.321269] amdgpu 0000:01:00.0: amdgpu:  for process plasmashell pid 29=
61
thread plasmashel:cs0 pid 3007
[ 1766.321271] amdgpu 0000:01:00.0: amdgpu:   VM_CONTEXT1_PROTECTION_FAULT_=
ADDR
  0x0010123A
[ 1766.321271] amdgpu 0000:01:00.0: amdgpu:=20=20
VM_CONTEXT1_PROTECTION_FAULT_STATUS 0x0B050002
[ 1766.321272] amdgpu 0000:01:00.0: amdgpu: VM fault (0x02, vmid 5, pasid
32772) at page 1053242, write from 'CB1' (0x43423100) (80)
[ 1766.321275] amdgpu 0000:01:00.0: amdgpu: GPU fault detected: 147 0x0732d=
002
[ 1766.321276] amdgpu 0000:01:00.0: amdgpu:  for process plasmashell pid 29=
61
thread plasmashel:cs0 pid 3007
[ 1766.321277] amdgpu 0000:01:00.0: amdgpu:   VM_CONTEXT1_PROTECTION_FAULT_=
ADDR
  0x001012AB
[ 1766.321278] amdgpu 0000:01:00.0: amdgpu:=20=20
VM_CONTEXT1_PROTECTION_FAULT_STATUS 0x0B020002
[ 1766.321279] amdgpu 0000:01:00.0: amdgpu: VM fault (0x02, vmid 5, pasid
32772) at page 1053355, write from 'CB2' (0x43423200) (32)
[ 1766.321282] amdgpu 0000:01:00.0: amdgpu: GPU fault detected: 147 0x07126=
002
[ 1766.321283] amdgpu 0000:01:00.0: amdgpu:  for process plasmashell pid 29=
61
thread plasmashel:cs0 pid 3007
[ 1766.321284] amdgpu 0000:01:00.0: amdgpu:   VM_CONTEXT1_PROTECTION_FAULT_=
ADDR
  0x0010124C
[ 1766.321285] amdgpu 0000:01:00.0: amdgpu:=20=20
VM_CONTEXT1_PROTECTION_FAULT_STATUS 0x0B0E0002
[ 1766.321286] amdgpu 0000:01:00.0: amdgpu: VM fault (0x02, vmid 5, pasid
32772) at page 1053260, write from 'CB6' (0x43423600) (224)
[ 1766.321289] amdgpu 0000:01:00.0: amdgpu: GPU fault detected: 147 0x07b21=
002
[ 1766.321290] amdgpu 0000:01:00.0: amdgpu:  for process plasmashell pid 29=
61
thread plasmashel:cs0 pid 3007
[ 1766.321291] amdgpu 0000:01:00.0: amdgpu:   VM_CONTEXT1_PROTECTION_FAULT_=
ADDR
  0x00101223
[ 1766.321292] amdgpu 0000:01:00.0: amdgpu:=20=20
VM_CONTEXT1_PROTECTION_FAULT_STATUS 0x0B050002
[ 1766.321293] amdgpu 0000:01:00.0: amdgpu: VM fault (0x02, vmid 5, pasid
32772) at page 1053219, write from 'CB1' (0x43423100) (80)
[ 1766.321296] amdgpu 0000:01:00.0: amdgpu: GPU fault detected: 147 0x0732a=
002
[ 1766.321297] amdgpu 0000:01:00.0: amdgpu:  for process plasmashell pid 29=
61
thread plasmashel:cs0 pid 3007
[ 1766.321298] amdgpu 0000:01:00.0: amdgpu:   VM_CONTEXT1_PROTECTION_FAULT_=
ADDR
  0x00101277
[ 1766.321298] amdgpu 0000:01:00.0: amdgpu:=20=20
VM_CONTEXT1_PROTECTION_FAULT_STATUS 0x0B0D0002
[ 1766.321299] amdgpu 0000:01:00.0: amdgpu: VM fault (0x02, vmid 5, pasid
32772) at page 1053303, write from 'CB7' (0x43423700) (208)
[ 1777.234990] [drm:amdgpu_job_timedout [amdgpu]] *ERROR* ring gfx timeout,
signaled seq=3D168813, emitted seq=3D168816
[ 1777.236251] [drm:amdgpu_job_timedout [amdgpu]] *ERROR* Process informati=
on:
process plasmashell pid 2961 thread plasmashel:cs0 pid 3007

Jul 25 22:09:10 HOSTNAME kernel: amdgpu 0000:01:00.0: amdgpu: VM fault (0x0=
2,
vmid 5, pasid 32772) at page 1053219, write from 'CB1' (0x43423100) (80)
Jul 25 22:09:10 HOSTNAME kernel: amdgpu 0000:01:00.0: amdgpu: GPU fault
detected: 147 0x0732a002
Jul 25 22:09:10 HOSTNAME kernel: amdgpu 0000:01:00.0: amdgpu:  for process
plasmashell pid 2961 thread plasmashel:cs0 pid 3007
Jul 25 22:09:10 HOSTNAME kernel: amdgpu 0000:01:00.0: amdgpu:=20=20
VM_CONTEXT1_PROTECTION_FAULT_ADDR   0x00101277
Jul 25 22:09:10 HOSTNAME kernel: amdgpu 0000:01:00.0: amdgpu:=20=20
VM_CONTEXT1_PROTECTION_FAULT_STATUS 0x0B0D0002
Jul 25 22:09:10 HOSTNAME kernel: amdgpu 0000:01:00.0: amdgpu: VM fault (0x0=
2,
vmid 5, pasid 32772) at page 1053303, write from 'CB7' (0x43423700) (208)
Jul 25 22:09:21 HOSTNAME kernel: [drm:amdgpu_job_timedout [amdgpu]] *ERROR*
ring gfx timeout, signaled seq=3D168813, emitted seq=3D168816
Jul 25 22:09:21 HOSTNAME kernel: [drm:amdgpu_job_timedout [amdgpu]] *ERROR*
Process information: process plasmashell pid 2961 thread plasmashel:cs0 pid
3007
Jul 25 22:09:21 HOSTNAME kernel: amdgpu 0000:01:00.0: amdgpu: GPU reset beg=
in!
Jul 25 22:09:21 HOSTNAME kernel: amdgpu: cp is busy, skip halt cp
Jul 25 22:09:22 HOSTNAME kernel: amdgpu: rlc is busy, skip halt rlc
Jul 25 22:09:22 HOSTNAME kernel: amdgpu 0000:01:00.0: amdgpu: BACO reset
Jul 25 22:09:22 HOSTNAME kernel: amdgpu 0000:01:00.0: amdgpu: GPU reset
succeeded, trying to resume
Jul 25 22:09:22 HOSTNAME kernel: [drm] PCIE GART of 1024M enabled (table at
0x000000F400800000).
Jul 25 22:09:22 HOSTNAME kernel: [drm] VRAM is lost due to GPU reset!
Jul 25 22:09:22 HOSTNAME kernel: amdgpu 0000:01:00.0:
[drm:amdgpu_ring_test_helper [amdgpu]] *ERROR* ring comp_1.2.0 test failed
(-110)
Jul 25 22:09:22 HOSTNAME kernel: [drm] UVD initialized successfully.
Jul 25 22:09:22 HOSTNAME kernel: [drm] VCE initialized successfully.
Jul 25 22:09:22 HOSTNAME kernel: amdgpu 0000:01:00.0: amdgpu: recover vram =
bo
from shadow start
Jul 25 22:09:22 HOSTNAME mpv[5307]: amdgpu: The CS has cancelled because the
context is lost. This context is innocent.
Jul 25 22:09:22 HOSTNAME kernel: amdgpu 0000:01:00.0: amdgpu: recover vram =
bo
from shadow done
Jul 25 22:09:22 HOSTNAME kernel: amdgpu 0000:01:00.0: amdgpu: GPU reset(2)
succeeded!
Jul 25 22:09:22 HOSTNAME systemd-coredump[5681]: Process 5307 (mpv) of user
1000 terminated abnormally with signal 6/ABRT, processing...
Jul 25 22:09:22 HOSTNAME systemd[1]: Created slice Slice
/system/drkonqi-coredump-processor.
-- Subject: A start job for unit system-drkonqi\x2dcoredump\x2dprocessor.sl=
ice
has finished successfully

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
