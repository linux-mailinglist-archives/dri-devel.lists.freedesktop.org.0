Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 98B6721B431
	for <lists+dri-devel@lfdr.de>; Fri, 10 Jul 2020 13:42:32 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 14A896EBE0;
	Fri, 10 Jul 2020 11:42:29 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D66766EBD8
 for <dri-devel@lists.freedesktop.org>; Fri, 10 Jul 2020 11:42:27 +0000 (UTC)
From: bugzilla-daemon@bugzilla.kernel.org
Authentication-Results: mail.kernel.org;
 dkim=permerror (bad message/signature format)
To: dri-devel@lists.freedesktop.org
Subject: [Bug 208513] New: Radeon RX480 graphics freeze with RIP:
 0010:amdgpu_dm_atomic_commit_tail+0x273/0x1100 [amdgpu]
Date: Fri, 10 Jul 2020 11:42:27 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: new
X-Bugzilla-Watch-Reason: AssignedTo drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Video(DRI - non Intel)
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: blocking
X-Bugzilla-Who: jlp.bugs@gmail.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: bug_id short_desc product version
 cf_kernel_version rep_platform op_sys cf_tree bug_status bug_severity
 priority component assigned_to reporter cf_regression
Message-ID: <bug-208513-2300@https.bugzilla.kernel.org/>
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

https://bugzilla.kernel.org/show_bug.cgi?id=208513

            Bug ID: 208513
           Summary: Radeon RX480 graphics freeze with RIP:
                    0010:amdgpu_dm_atomic_commit_tail+0x273/0x1100
                    [amdgpu]
           Product: Drivers
           Version: 2.5
    Kernel Version: 5.7.7
          Hardware: x86-64
                OS: Linux
              Tree: Mainline
            Status: NEW
          Severity: blocking
          Priority: P1
         Component: Video(DRI - non Intel)
          Assignee: drivers_video-dri@kernel-bugs.osdl.org
          Reporter: jlp.bugs@gmail.com
        Regression: No

I get frequent freezes with kernel 5.7, especially when having Firefox 77 open
and watching videos. It looks like only graphics freezes as I can still hear
stuff going on in the background. This is what I can see using "journalctl
--boot=-1 -k" after reboot

general protection fault, probably for non-canonical address
0x9ca86a805968f7f1: 0000 [#1] SMP NOPTI
CPU: 1 PID: 117 Comm: kworker/u8:3 Not tainted 5.7.7-1-debug #1 openSUSE
Tumbleweed (unreleased)
Hardware name: System manufacturer System Product Name/H170 PRO GAMING, BIOS
3805 05/16/2018
Workqueue: events_unbound commit_work [drm_kms_helper]
RIP: 0010:amdgpu_dm_atomic_commit_tail+0x273/0x1100 [amdgpu]
Code: 43 08 8b 90 80 04 00 00 41 83 c6 01 44 39 f2 0f 87 3a ff ff ff 48 83 bd
a0 fd ff ff 00 0f 84 03 01 00 00 48 8b bd a0 fd ff ff <80> bf b0 01 00 00 01 0f
86 ac 00 00 00 48 b9 00 00 00>
RSP: 0018:ffffb8c40026bbe0 EFLAGS: 00010282
RAX: ffff99c28f74b000 RBX: ffff99c059f6c880 RCX: ffff99c1c32f7c00
RDX: 0000000000000006 RSI: ffffffffc0b6d540 RDI: 9ca86a805968f7f1
RBP: ffffb8c40026be68 R08: 0000000000000001 R09: 0000000000000001
R10: 00000000000003fb R11: 00000000000898df R12: ffff99c037db8400
R13: 0000000000000000 R14: 0000000000000006 R15: ffff99c037db8000
FS:  0000000000000000(0000) GS:ffff99c296c80000(0000) knlGS:0000000000000000
CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
CR2: 00007fb44bc04300 CR3: 000000066a2e4006 CR4: 00000000003606e0
DR0: 0000000000000000 DR1: 0000000000000000 DR2: 0000000000000000
DR3: 0000000000000000 DR6: 00000000fffe0ff0 DR7: 0000000000000400
Call Trace:
 ? ieee80211_sta_rx_queued_mgmt+0x89/0x2f0 [mac80211]
 ? update_load_avg+0x7e/0x630
 ? set_next_entity+0xab/0x200
 ? _raw_spin_unlock_irq+0xa/0x20
 ? finish_task_switch+0x77/0x280
 ? __schedule+0x205/0x560
 ? _raw_spin_unlock_irq+0xa/0x20
 ? wait_for_completion_timeout+0xcc/0x100
 commit_tail+0x94/0x130 [drm_kms_helper]
 process_one_work+0x1da/0x3a0
 worker_thread+0x46/0x320
 ? rescuer_thread+0x400/0x400
 kthread+0x115/0x140
 ? __kthread_bind_mask+0x60/0x60
 ret_from_fork+0x1f/0x40
Modules linked in: fuse ccm af_packet dmi_sysfs msr hid_logitech_hidpp joydev
intel_rapl_msr intel_rapl_common x86_pkg_temp_thermal hid_logitech_dj
intel_powerclamp coretemp crct10dif_pcl>
 dm_mod scsi_dh_rdac scsi_dh_emc scsi_dh_alua efivarfs
---[ end trace de4993090519763f ]---
RIP: 0010:amdgpu_dm_atomic_commit_tail+0x273/0x1100 [amdgpu]
Code: 43 08 8b 90 80 04 00 00 41 83 c6 01 44 39 f2 0f 87 3a ff ff ff 48 83 bd
a0 fd ff ff 00 0f 84 03 01 00 00 48 8b bd a0 fd ff ff <80> bf b0 01 00 00 01 0f
86 ac 00 00 00 48 b9 00 00 00>
RSP: 0018:ffffb8c40026bbe0 EFLAGS: 00010282
RAX: ffff99c28f74b000 RBX: ffff99c059f6c880 RCX: ffff99c1c32f7c00
RDX: 0000000000000006 RSI: ffffffffc0b6d540 RDI: 9ca86a805968f7f1
RBP: ffffb8c40026be68 R08: 0000000000000001 R09: 0000000000000001
R10: 00000000000003fb R11: 00000000000898df R12: ffff99c037db8400
R13: 0000000000000000 R14: 0000000000000006 R15: ffff99c037db8000
FS:  0000000000000000(0000) GS:ffff99c296c80000(0000) knlGS:0000000000000000
CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
CR2: 00007fb44bc04300 CR3: 000000066a2e4006 CR4: 00000000003606e0
DR0: 0000000000000000 DR1: 0000000000000000 DR2: 0000000000000000
DR3: 0000000000000000 DR6: 00000000fffe0ff0 DR7: 0000000000000400

Mesa is 20.1.2
name of display: :0
display: :0  screen: 0
direct rendering: Yes
Extended renderer info (GLX_MESA_query_renderer):
    Vendor: X.Org (0x1002)
    Device: AMD Radeon (TM) RX 480 Graphics (POLARIS10, DRM 3.37.0,
5.7.7-1-debug, LLVM 10.0.0) (0x67df)
    Version: 20.1.2
    Accelerated: yes
    Video memory: 8192MB
    Unified memory: no
    Preferred profile: core (0x1)
    Max core profile version: 4.6
    Max compat profile version: 4.6
    Max GLES1 profile version: 1.1
    Max GLES[23] profile version: 3.2
Memory info (GL_ATI_meminfo):
    VBO free memory - total: 7001 MB, largest block: 7001 MB
    VBO free aux. memory - total: 7976 MB, largest block: 7976 MB
    Texture free memory - total: 7001 MB, largest block: 7001 MB
    Texture free aux. memory - total: 7976 MB, largest block: 7976 MB
    Renderbuffer free memory - total: 7001 MB, largest block: 7001 MB
    Renderbuffer free aux. memory - total: 7976 MB, largest block: 7976 MB
Memory info (GL_NVX_gpu_memory_info):
    Dedicated video memory: 8192 MB
    Total available memory: 16384 MB
    Currently available dedicated video memory: 7001 MB
OpenGL vendor string: X.Org
OpenGL renderer string: AMD Radeon (TM) RX 480 Graphics (POLARIS10, DRM 3.37.0,
5.7.7-1-debug, LLVM 10.0.0)
OpenGL core profile version string: 4.6 (Core Profile) Mesa 20.1.2
OpenGL core profile shading language version string: 4.60
OpenGL core profile context flags: (none)
OpenGL core profile profile mask: core profile

OpenGL version string: 4.6 (Compatibility Profile) Mesa 20.1.2
OpenGL shading language version string: 4.60
OpenGL context flags: (none)
OpenGL profile mask: compatibility profile

OpenGL ES profile version string: OpenGL ES 3.2 Mesa 20.1.2
OpenGL ES profile shading language version string: OpenGL ES GLSL ES 3.20

libdrm 2.4.102, xf86-video-amdgpu 19.1.0

-- 
You are receiving this mail because:
You are watching the assignee of the bug.
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
