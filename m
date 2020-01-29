Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 501E514D2AC
	for <lists+dri-devel@lfdr.de>; Wed, 29 Jan 2020 22:44:16 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 854816E44E;
	Wed, 29 Jan 2020 21:44:14 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 843DE6E44E
 for <dri-devel@lists.freedesktop.org>; Wed, 29 Jan 2020 21:44:13 +0000 (UTC)
From: bugzilla-daemon@bugzilla.kernel.org
Authentication-Results: mail.kernel.org;
 dkim=permerror (bad message/signature format)
To: dri-devel@lists.freedesktop.org
Subject: [Bug 206349] New: WARNING: dcn20_validate_bandwidth+0x87/0x9e [
 amdgpu on 5700 XT ]
Date: Wed, 29 Jan 2020 21:44:12 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: new
X-Bugzilla-Watch-Reason: AssignedTo drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Video(DRI - non Intel)
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: low
X-Bugzilla-Who: doublej472@gmail.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: bug_id short_desc product version
 cf_kernel_version rep_platform op_sys cf_tree bug_status bug_severity
 priority component assigned_to reporter cf_regression attachments.created
Message-ID: <bug-206349-2300@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=206349

            Bug ID: 206349
           Summary: WARNING: dcn20_validate_bandwidth+0x87/0x9e [ amdgpu
                    on 5700 XT ]
           Product: Drivers
           Version: 2.5
    Kernel Version: 5.5.0
          Hardware: x86-64
                OS: Linux
              Tree: Mainline
            Status: NEW
          Severity: low
          Priority: P1
         Component: Video(DRI - non Intel)
          Assignee: drivers_video-dri@kernel-bugs.osdl.org
          Reporter: doublej472@gmail.com
        Regression: No

Created attachment 287027
  --> https://bugzilla.kernel.org/attachment.cgi?id=287027&action=edit
dmesg warnings from amdgpu

I've been seeing this warning pop up in my dmesg for a while from amdgpu, all
relating to dcn20_validate_bandwidth. I'm not sure if it's affecting my machine
in a significant manner, but it keeps showing up.

[ 8236.203353] arch-desktop kernel: ------------[ cut here ]------------
[ 8236.203403] arch-desktop kernel: WARNING: CPU: 9 PID: 555 at
drivers/gpu/drm/amd/amdgpu/../display/dc/dcn20/dcn20_resource.c:2959
dcn20_validate_bandwidth+0x87/0x9e [amdgpu]
[ 8236.203405] arch-desktop kernel: Modules linked in: bridge stp llc bcache
crc64 raid1 snd_usb_audio snd_usbmidi_lib kvm_amd snd_rawmidi kvm amdgpu
gpu_sched k10temp ttm sch_fq_codel efivarfs
[ 8236.203414] arch-desktop kernel: CPU: 9 PID: 555 Comm: Xorg Not tainted
5.5.0-gentoo #1
[ 8236.203415] arch-desktop kernel: Hardware name: System manufacturer System
Product Name/PRIME X370-PRO, BIOS 5220 09/12/2019
[ 8236.203451] arch-desktop kernel: RIP:
0010:dcn20_validate_bandwidth+0x87/0x9e [amdgpu]
[ 8236.203453] arch-desktop kernel: Code: 00 00 01 eb 29 31 d2 f2 0f 11 85 70
21 00 00 48 89 ee e8 e9 f7 ff ff 89 c2 22 85 b8 1d 00 00 74 09 c6 85 b8 1d 00
00 00 eb 04 <0f> 0b 89 d0 f2 0f 10 1c 24 f2 0f 11 9d 70 21 00 00 48 83 c4 10 5d
[ 8236.203455] arch-desktop kernel: RSP: 0018:ffff8e9800c9fa80 EFLAGS: 00010246
[ 8236.203457] arch-desktop kernel: RAX: 0000000000000000 RBX: ffff8b19d3f6b900
RCX: 0000000000215f49
[ 8236.203458] arch-desktop kernel: RDX: 0000000000000001 RSI: 0000000000215f09
RDI: 000000000002e300
[ 8236.203460] arch-desktop kernel: RBP: ffff8b17ee190000 R08: ffff8b1b7b406840
R09: ffffffffc0345b6b
[ 8236.203461] arch-desktop kernel: R10: ffff8b1b66e6a000 R11: ffff8b1b66e6a000
R12: 0000000000000000
[ 8236.203462] arch-desktop kernel: R13: 0000000000000000 R14: ffff8b17ee190000
R15: 0000000000000002
[ 8236.203464] arch-desktop kernel: FS:  00007ff890a4e980(0000)
GS:ffff8b1b7ea40000(0000) knlGS:0000000000000000
[ 8236.203465] arch-desktop kernel: CS:  0010 DS: 0000 ES: 0000 CR0:
0000000080050033
[ 8236.203467] arch-desktop kernel: CR2: 00005620d7c8eef0 CR3: 00000007e2886000
CR4: 0000000000340ee0
[ 8236.203468] arch-desktop kernel: Call Trace:
[ 8236.203504] arch-desktop kernel:  dc_validate_global_state+0x1b6/0x1d7
[amdgpu]
[ 8236.203549] arch-desktop kernel:  amdgpu_dm_atomic_check+0x52a/0x666
[amdgpu]
[ 8236.203556] arch-desktop kernel:  drm_atomic_check_only+0x586/0x62e
[ 8236.203559] arch-desktop kernel:  ?
drm_atomic_set_crtc_for_connector+0xd9/0xe1
[ 8236.203562] arch-desktop kernel:  drm_atomic_commit+0xe/0x44
[ 8236.203565] arch-desktop kernel:  drm_atomic_helper_set_config+0x50/0x66
[ 8236.203569] arch-desktop kernel:  drm_mode_setcrtc+0x221/0x5dc
[ 8236.203574] arch-desktop kernel:  ? drm_mode_getcrtc+0x145/0x145
[ 8236.203576] arch-desktop kernel:  drm_ioctl_kernel+0x8d/0xe1
[ 8236.203579] arch-desktop kernel:  drm_ioctl+0x1f9/0x2d3
[ 8236.203582] arch-desktop kernel:  ? drm_mode_getcrtc+0x145/0x145
[ 8236.203613] arch-desktop kernel:  amdgpu_drm_ioctl+0x45/0x71 [amdgpu]
[ 8236.203617] arch-desktop kernel:  vfs_ioctl+0x19/0x26
[ 8236.203620] arch-desktop kernel:  do_vfs_ioctl+0x574/0x59e
[ 8236.203623] arch-desktop kernel:  ksys_ioctl+0x49/0x68
[ 8236.203626] arch-desktop kernel:  __x64_sys_ioctl+0x11/0x14
[ 8236.203629] arch-desktop kernel:  do_syscall_64+0x48/0x55
[ 8236.203632] arch-desktop kernel:  entry_SYSCALL_64_after_hwframe+0x44/0xa9
[ 8236.203634] arch-desktop kernel: RIP: 0033:0x7ff890d0b5c7
[ 8236.203636] arch-desktop kernel: Code: 00 00 00 75 0c 48 c7 c0 ff ff ff ff
48 83 c4 18 c3 e8 0d c8 01 00 66 2e 0f 1f 84 00 00 00 00 00 0f 1f 00 b8 10 00
00 00 0f 05 <48> 3d 01 f0 ff ff 73 01 c3 48 8b 0d 99 e8 0c 00 f7 d8 64 89 01 48
[ 8236.203638] arch-desktop kernel: RSP: 002b:00007ffea4921a48 EFLAGS: 00000246
ORIG_RAX: 0000000000000010
[ 8236.203639] arch-desktop kernel: RAX: ffffffffffffffda RBX: 00007ffea4921a80
RCX: 00007ff890d0b5c7
[ 8236.203641] arch-desktop kernel: RDX: 00007ffea4921a80 RSI: 00000000c06864a2
RDI: 000000000000000c
[ 8236.203642] arch-desktop kernel: RBP: 00000000c06864a2 R08: 0000000000000000
R09: 0000000000000000
[ 8236.203643] arch-desktop kernel: R10: 0000000000000000 R11: 0000000000000246
R12: 00005620d7fe1e70
[ 8236.203644] arch-desktop kernel: R13: 000000000000000c R14: 00005620d8e342f0
R15: 00005620d6dc2040
[ 8236.203649] arch-desktop kernel: ---[ end trace 82184d8b2d613936 ]---

I've attached a few more warnings to this bug report.

I'm not sure what causes this warning. It *might* happen whenever the GPU is
being used, if I leave the machine alone it tends to not show. It could be
related to waking up my monitor? (Attached to a DisplayPort cable, running at
1920x1080 @ 144 Hz, if that matters)

My system is running on an ASUS PRIME X370-PRO motherboard with a ryzen 3900x,
32GB of ram, and a 5700 XT GPU (on a PCIe 3.0 x16 link).

Please let me know if you need more info!

-- 
You are receiving this mail because:
You are watching the assignee of the bug.
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
