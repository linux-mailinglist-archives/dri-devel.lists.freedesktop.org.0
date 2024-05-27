Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 819EE8D04A8
	for <lists+dri-devel@lfdr.de>; Mon, 27 May 2024 16:52:07 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4346010F5E7;
	Mon, 27 May 2024 14:52:04 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="jcYU2fpc";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C26D310F57E
 for <dri-devel@lists.freedesktop.org>; Mon, 27 May 2024 14:52:01 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 2460B617D8
 for <dri-devel@lists.freedesktop.org>; Mon, 27 May 2024 14:52:01 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id CBD0DC4AF07
 for <dri-devel@lists.freedesktop.org>; Mon, 27 May 2024 14:52:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1716821520;
 bh=sI3ypjpb+howJlnUnSeiOI1E1OJ035GoZw4w1MQZ6Ys=;
 h=From:To:Subject:Date:From;
 b=jcYU2fpcIigUHu7ROwRDhwig9S2jtJ1FGarjhYU1mVZf01UZ1dgLQZiOhrCpr9ZXT
 qhN9cNwhmBGNYhN/PtPLPS/4YZxJVY2RlKXs8yXYLHPgv3bhBZrFJPTvbFhywsfN34
 g2Y9PzHlEExlj6b4D+eqNgBRVhjHYkTUpdlRFQpU5/ymsXW6X24V6y7e5E6iKId20f
 hDhOiP155pTIl26RbTVvjzmIQjZEbrbSDAEy47y2OAiRupzbPqCzV/M/2smS08iRix
 wFNDdIiAuZsqH01BoPFPaDGjFSy5ssv8rLhzqA2Qu6aVY13ClTJrsWpnr+bYocrvYm
 NTofPfCP/PHPQ==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix,
 from userid 48) id BB4E3C53BB7; Mon, 27 May 2024 14:52:00 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 218900] New: amdgpu: Fatal error during GPU init
Date: Mon, 27 May 2024 14:52:00 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: new
X-Bugzilla-Watch-Reason: AssignedTo drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Video(DRI - non Intel)
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: blocking
X-Bugzilla-Who: jean-christophe@guillain.net
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P3
X-Bugzilla-Assigned-To: drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: bug_id short_desc product version rep_platform
 op_sys bug_status bug_severity priority component assigned_to reporter
 cf_regression
Message-ID: <bug-218900-2300@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D218900

            Bug ID: 218900
           Summary: amdgpu: Fatal error during GPU init
           Product: Drivers
           Version: 2.5
          Hardware: AMD
                OS: Linux
            Status: NEW
          Severity: blocking
          Priority: P3
         Component: Video(DRI - non Intel)
          Assignee: drivers_video-dri@kernel-bugs.osdl.org
          Reporter: jean-christophe@guillain.net
        Regression: No

Hello !

Trying the new kernel RC today (6.10.0-rc1), I no longer have video.
With 6.9.1 works.

Lenovo ThinkCentre M715q

00:01.0 VGA compatible controller: Advanced Micro Devices, Inc. [AMD/ATI] W=
ani
[Radeon R5/R6/R7 Graphics] (rev e4)


In the journal, I have multiple entries like this one :
May 27 14:24:22 youpi kernel: iommu ivhd0: AMD-Vi: Event logged
[ILLEGAL_DEV_TABLE_ENTRY device=3D0000:00:01.0 pasid=3D0x00000 address=3D0x=
102e89980
flags=3D0x0080]
May 27 14:24:22 youpi kernel: AMD-Vi: DTE[0]: 7190000000000003
May 27 14:24:22 youpi kernel: AMD-Vi: DTE[1]: 00001001034f0002
May 27 14:24:22 youpi kernel: AMD-Vi: DTE[2]: 200000010022a013
May 27 14:24:22 youpi kernel: AMD-Vi: DTE[3]: 0000000000000000



Then, multiple entries like that one :
May 27 14:24:22 youpi kernel: amdgpu 0000:00:01.0: [drm:amdgpu_ring_test_he=
lper
[amdgpu]] *ERROR* ring gfx test failed (-110)
May 27 14:24:22 youpi kernel: [drm:amdgpu_device_init [amdgpu]] *ERROR* hw_=
init
of IP block <gfx_v8_0> failed -110
May 27 14:24:22 youpi kernel: amdgpu 0000:00:01.0: amdgpu:
amdgpu_device_ip_init failed
May 27 14:24:22 youpi kernel: amdgpu 0000:00:01.0: amdgpu: Fatal error duri=
ng
GPU init
May 27 14:24:22 youpi kernel: amdgpu 0000:00:01.0: amdgpu: amdgpu: finishing
device.
May 27 14:24:22 youpi kernel: ------------[ cut here ]------------
May 27 14:24:22 youpi kernel: WARNING: CPU: 0 PID: 179 at
drivers/gpu/drm/amd/amdgpu/amdgpu_irq.c:630 amdgpu_irq_put+0x45/0x70 [amdgp=
u]
May 27 14:24:22 youpi kernel: Modules linked in: sd_mod usbhid uas hid
usb_storage amdgpu(+) amdxcp drm_exec gpu_sched drm_buddy i2c_algo_bit
drm_suballoc_helper drm>
May 27 14:24:22 youpi kernel: CPU: 0 PID: 179 Comm: (udev-worker) Not taint=
ed
6.10.0-rc1-jcg #1
May 27 14:24:22 youpi kernel: Hardware name: LENOVO 10VGS02P00/3130, BIOS
M1XKT57A 02/10/2022
May 27 14:24:22 youpi kernel: RIP: 0010:amdgpu_irq_put+0x45/0x70 [amdgpu]
May 27 14:24:22 youpi kernel: Code: 48 8b 4e 10 48 83 39 00 74 2c 89 d1 48 =
8d
04 88 8b 08 85 c9 74 14 f0 ff 08 b8 00 00 00 00 74 05 e9 80 d8 a3 fc e9 6b =
fd
ff ff <0f>
May 27 14:24:22 youpi kernel: RSP: 0018:ffffbc9c80813a48 EFLAGS: 00010246
May 27 14:24:22 youpi kernel: RAX: ffff985ad74e3780 RBX: ffff985a82f18878 R=
CX:
0000000000000000
May 27 14:24:22 youpi kernel: RDX: 0000000000000000 RSI: ffff985a82f254b8 R=
DI:
ffff985a82f00000
May 27 14:24:22 youpi kernel: RBP: ffff985a82f10208 R08: 0000000000000000 R=
09:
0000000000000003
May 27 14:24:22 youpi kernel: R10: ffffbc9c80813880 R11: ffffffffbdec7828 R=
12:
ffff985a82f105e8
May 27 14:24:22 youpi kernel: R13: ffff985a82f00010 R14: ffff985a82f00000 R=
15:
ffff985a82f254b8
May 27 14:24:22 youpi kernel: FS:  00007f18ca0058c0(0000)
GS:ffff985b57600000(0000) knlGS:0000000000000000
May 27 14:24:22 youpi kernel: CS:  0010 DS: 0000 ES: 0000 CR0: 000000008005=
0033
May 27 14:24:22 youpi kernel: CR2: 00005563a55b3a68 CR3: 000000010f8bc000 C=
R4:
00000000001506f0
May 27 14:24:22 youpi kernel: Call Trace:
May 27 14:24:22 youpi kernel:  <TASK>
May 27 14:24:22 youpi kernel:  ? __warn+0x7c/0x120
May 27 14:24:22 youpi kernel:  ? amdgpu_irq_put+0x45/0x70 [amdgpu]
May 27 14:24:22 youpi kernel:  ? report_bug+0x155/0x170
May 27 14:24:22 youpi kernel:  ? handle_bug+0x3f/0x80
May 27 14:24:22 youpi kernel:  ? exc_invalid_op+0x13/0x60
May 27 14:24:22 youpi kernel:  ? asm_exc_invalid_op+0x16/0x20
May 27 14:24:22 youpi kernel:  ? amdgpu_irq_put+0x45/0x70 [amdgpu]
May 27 14:24:22 youpi kernel:  amdgpu_fence_driver_hw_fini+0xfa/0x130 [amdg=
pu]
May 27 14:24:22 youpi kernel:  amdgpu_device_fini_hw+0xa2/0x3f0 [amdgpu]
May 27 14:24:22 youpi kernel:  amdgpu_driver_load_kms+0x79/0xb0 [amdgpu]
May 27 14:24:22 youpi kernel:  amdgpu_pci_probe+0x182/0x4f0 [amdgpu]
May 27 14:24:22 youpi kernel:  local_pci_probe+0x41/0x90
May 27 14:24:22 youpi kernel:  pci_device_probe+0xbb/0x1e0
May 27 14:24:22 youpi kernel:  really_probe+0xd6/0x390
May 27 14:24:22 youpi kernel:  ? __pfx___driver_attach+0x10/0x10
May 27 14:24:22 youpi kernel:  __driver_probe_device+0x78/0x150
May 27 14:24:22 youpi kernel:  driver_probe_device+0x1f/0x90
May 27 14:24:22 youpi kernel:  __driver_attach+0xce/0x1c0
May 27 14:24:22 youpi kernel:  bus_for_each_dev+0x84/0xd0
May 27 14:24:22 youpi kernel:  bus_add_driver+0x10e/0x240
May 27 14:24:22 youpi kernel:  driver_register+0x55/0x100
May 27 14:24:22 youpi kernel:  ? __pfx_amdgpu_init+0x10/0x10 [amdgpu]
May 27 14:24:22 youpi kernel:  do_one_initcall+0x57/0x320
May 27 14:24:22 youpi kernel:  do_init_module+0x60/0x230
May 27 14:24:22 youpi kernel:  init_module_from_file+0x86/0xc0
May 27 14:24:22 youpi kernel:  idempotent_init_module+0x11b/0x2b0
May 27 14:24:22 youpi kernel:  __x64_sys_finit_module+0x5a/0xb0
May 27 14:24:22 youpi kernel:  do_syscall_64+0x7e/0x190
May 27 14:24:22 youpi kernel:  ? ksys_mmap_pgoff+0x14e/0x1f0
May 27 14:24:22 youpi kernel:  ? syscall_exit_to_user_mode+0x71/0x1e0
May 27 14:24:22 youpi kernel:  ? do_syscall_64+0x8a/0x190
May 27 14:24:22 youpi kernel:  ? do_syscall_64+0x8a/0x190
May 27 14:24:22 youpi kernel:  ? do_syscall_64+0x8a/0x190
May 27 14:24:22 youpi kernel:  ? __irq_exit_rcu+0x38/0xb0
May 27 14:24:22 youpi kernel:  entry_SYSCALL_64_after_hwframe+0x76/0x7e
May 27 14:24:22 youpi kernel: RIP: 0033:0x7f18c9e79719
May 27 14:24:22 youpi kernel: Code: 08 89 e8 5b 5d c3 66 2e 0f 1f 84 00 00 =
00
00 00 90 48 89 f8 48 89 f7 48 89 d6 48 89 ca 4d 89 c2 4d 89 c8 4c 8b 4c 24 =
08
0f 05 <48>
May 27 14:24:22 youpi kernel: RSP: 002b:00007ffd56f52208 EFLAGS: 00000246
ORIG_RAX: 0000000000000139
May 27 14:24:22 youpi kernel: RAX: ffffffffffffffda RBX: 00005563a558e400 R=
CX:
00007f18c9e79719
May 27 14:24:22 youpi kernel: RDX: 0000000000000000 RSI: 00007f18ca01defd R=
DI:
0000000000000015
May 27 14:24:22 youpi kernel: RBP: 00007f18ca01defd R08: 0000000000000000 R=
09:
00005563a55902b0
May 27 14:24:22 youpi kernel: R10: 0000000000000015 R11: 0000000000000246 R=
12:
0000000000020000
May 27 14:24:22 youpi kernel: R13: 0000000000000000 R14: 00005563a5591f30 R=
15:
000055638158bec1
May 27 14:24:22 youpi kernel:  </TASK>
May 27 14:24:22 youpi kernel: ---[ end trace 0000000000000000 ]---

I suspect this commit :
https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/d=
rivers/gpu/drm/amd/amdgpu/amdgpu_object.c?id=3Ddb5d28c0bfe566908719bec8e254=
43aabecbb802

Let me now if you need more information.

Cheers,
jC

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
