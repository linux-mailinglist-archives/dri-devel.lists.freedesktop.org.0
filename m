Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 0DE59364FE9
	for <lists+dri-devel@lfdr.de>; Tue, 20 Apr 2021 03:37:17 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B19436E499;
	Tue, 20 Apr 2021 01:37:10 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B21ED6E484
 for <dri-devel@lists.freedesktop.org>; Tue, 20 Apr 2021 01:37:09 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPS id 89CDC61221
 for <dri-devel@lists.freedesktop.org>; Tue, 20 Apr 2021 01:37:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1618882628;
 bh=lAfCgUto8FtPdPSts38HKNhQ5ugEBIyMEZZNFdcDFAY=;
 h=From:To:Subject:Date:From;
 b=d+P4gnb/SeJOj4pP7jcmi34OHCIXyiQsQYl2Owgz29AJA4E/UcvZB1WP+3ylZZHqh
 KMb05eAe3f7xrBXvOIG3YqibKRgYEAMTcozd0IhYxMpgMjYueC57/EYI6EAOASboeK
 GMItnyObyEMWg137sO8gCpEG+Ogont/q4GiKoJlSzhUysPOJ5Q5KWRuIPV+fn1L3la
 SyzN373S3M9voqGnKOgLMu4p1Ts1Tequz+ZJjkKytxbLWNiXccHkKdBawo/5hCrda7
 vaQu/r/7XqrqJmre2zVZrIbnH3QSuaJUc3uDPNHjRY6hBx/wRTYy5ncdxAOe7m/Tvo
 Sx4Zs5llb87IQ==
Received: by pdx-korg-bugzilla-2.web.codeaurora.org (Postfix, from userid 48)
 id 79B9F610E5; Tue, 20 Apr 2021 01:37:08 +0000 (UTC)
From: bugzilla-daemon@bugzilla.kernel.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 212729] New: amdgpu: WARN_ON
 drivers/gpu/drm/amd/amdgpu/../display/dc/dc_helper.c:119
 set_reg_field_values.constprop.0+0xbe/0xe0
Date: Tue, 20 Apr 2021 01:37:08 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: new
X-Bugzilla-Watch-Reason: AssignedTo drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Video(DRI - non Intel)
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: benh@kernel.crashing.org
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: bug_id short_desc product version
 cf_kernel_version rep_platform op_sys cf_tree bug_status bug_severity
 priority component assigned_to reporter cf_regression attachments.created
Message-ID: <bug-212729-2300@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=212729

            Bug ID: 212729
           Summary: amdgpu: WARN_ON
                    drivers/gpu/drm/amd/amdgpu/../display/dc/dc_helper.c:1
                    19 set_reg_field_values.constprop.0+0xbe/0xe0
           Product: Drivers
           Version: 2.5
    Kernel Version: 5.11.14-200.fc33.x86_64
          Hardware: All
                OS: Linux
              Tree: Mainline
            Status: NEW
          Severity: normal
          Priority: P1
         Component: Video(DRI - non Intel)
          Assignee: drivers_video-dri@kernel-bugs.osdl.org
          Reporter: benh@kernel.crashing.org
        Regression: No

Created attachment 296437
  --> https://bugzilla.kernel.org/attachment.cgi?id=296437&action=edit
Full kernel log

On Fedora 33, I recently started getting these (I haven't had a chance to
bisect). Note the error that happens shortly before the WARN_ON as it might be
relevant.

This seem to go along with the screen occasionally not coming back from
blanking when the machine is left idle. Sometimes unplugging/replugging the DP
connector works, sometimes it doesn't. I *think* it's related but I'm not 100%
certain.

The GPU is a 6800XT.

[    4.361992] [drm] Initialized amdgpu 3.40.0 20150101 for 0000:0d:00.0 on
minor 0
[    4.668196] [drm] REG_WAIT timeout 1us * 100000 tries -
mpc2_assert_idle_mpcc line:480
[    4.800700] EXT4-fs (dm-0): mounted filesystem with ordered data mode. Opts:
(null). Quota mode: none.
[    4.844273] ------------[ cut here ]------------
[    4.844274] WARNING: CPU: 7 PID: 504 at
drivers/gpu/drm/amd/amdgpu/../display/dc/dc_helper.c:119
set_reg_field_values.constprop.0+0xbe/0xe0 [amdgpu]
[    4.844400] Modules linked in: amdgpu drm_ttm_helper ttm iommu_v2 gpu_sched
drm_kms_helper cec crct10dif_pclmul crc32_pclmul crc32c_intel drm
ghash_clmulni_intel igb ccp nvme r8169 nvme_core dca i2c_algo_bit wmi
pinctrl_amd fuse
[    4.844410] CPU: 7 PID: 504 Comm: plymouthd Not tainted
5.11.14-200.fc33.x86_64 #1
[    4.844412] Hardware name: System manufacturer System Product Name/ROG STRIX
X570-E GAMING, BIOS 3603 03/19/2021
[    4.844413] RIP: 0010:set_reg_field_values.constprop.0+0xbe/0xe0 [amdgpu]
[    4.844525] Code: 50 08 49 89 51 08 8b 08 48 8d 42 08 49 89 41 08 44 8b 02
48 8d 50 08 0f b6 c9 49 89 51 08 8b 00 45 85 c0 75 b5 0f 0b eb b1 c3 <0f> 0b e9
4d ff ff ff 49 8b 51 08 eb d1 49 8b 41 08 eb d6 66 66 2e
[    4.844526] RSP: 0018:ffffc0af00d377a0 EFLAGS: 00010246
[    4.844528] RAX: 0000000000000000 RBX: ffffa078d4de0000 RCX:
0000000000000000
[    4.844528] RDX: 0000000000000000 RSI: 0000000000000001 RDI:
ffffc0af00d377a8
[    4.844529] RBP: ffffc0af00d37820 R08: 0000000000000001 R09:
ffffc0af00d377b0
[    4.844530] R10: 0000000000000000 R11: 00000000000039e8 R12:
0000000000000005
[    4.844531] R13: ffffa078d80e1740 R14: 0000000000003ae0 R15:
ffffa078d9bc01e8
[    4.844532] FS:  00007fbf4f575f40(0000) GS:ffffa07fcebc0000(0000)
knlGS:0000000000000000
[    4.844533] CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
[    4.844534] CR2: 00007fd50a00d000 CR3: 0000000110d6c000 CR4:
0000000000350ee0
[    4.844535] Call Trace:
[    4.844537]  generic_reg_update_ex+0x5a/0x1c0 [amdgpu]
[    4.844646]  ? dcn20_enable_plane+0x77/0x1e0 [amdgpu]
[    4.844769]  dcn20_program_front_end_for_ctx+0x997/0xb20 [amdgpu]
[    4.844888]  ? optc3_lock+0x9d/0xb0 [amdgpu]
[    4.845004]  dc_commit_state+0x49a/0xa30 [amdgpu]
[    4.845117]  ? drm_calc_timestamping_constants+0x195/0x1f0 [drm]
[    4.845135]  amdgpu_dm_atomic_commit_tail+0x585/0x2600 [amdgpu]
[    4.845253]  ? amdgpu_vm_bo_invalidate+0x83/0x1a0 [amdgpu]
[    4.845345]  ? amdgpu_bo_move_notify+0x41/0xe0 [amdgpu]
[    4.845434]  ? amdgpu_bo_move+0x2d1/0x6d0 [amdgpu]
[    4.845522]  ? ttm_bo_handle_move_mem+0x90/0x180 [ttm]
[    4.845526]  ? ttm_bo_validate+0x11b/0x150 [ttm]
[    4.845529]  ? dm_plane_helper_prepare_fb+0x18c/0x220 [amdgpu]
[    4.845644]  ? _cond_resched+0x16/0x40
[    4.845647]  ? _cond_resched+0x16/0x40
[    4.845648]  ? __wait_for_common+0x2b/0x140
[    4.845650]  commit_tail+0x94/0x130 [drm_kms_helper]
[    4.845661]  drm_atomic_helper_commit+0x113/0x140 [drm_kms_helper]
[    4.845669]  drm_atomic_helper_set_config+0x70/0xb0 [drm_kms_helper]
[    4.845678]  drm_mode_setcrtc+0x1d3/0x6f0 [drm]
[    4.845695]  ? avc_has_extended_perms+0x18d/0x3e0
[    4.845698]  ? drm_mode_getcrtc+0x180/0x180 [drm]
[    4.845712]  drm_ioctl_kernel+0x86/0xd0 [drm]
[    4.845730]  drm_ioctl+0x20f/0x3a0 [drm]
[    4.845745]  ? drm_mode_getcrtc+0x180/0x180 [drm]
[    4.845760]  amdgpu_drm_ioctl+0x49/0x80 [amdgpu]
[    4.845848]  __x64_sys_ioctl+0x83/0xb0
[    4.845850]  do_syscall_64+0x33/0x40
[    4.845853]  entry_SYSCALL_64_after_hwframe+0x44/0xa9
[    4.845855] RIP: 0033:0x7fbf4f8315db
[    4.845856] Code: 89 d8 49 8d 3c 1c 48 f7 d8 49 39 c4 72 b5 e8 1c ff ff ff
85 c0 78 ba 4c 89 e0 5b 5d 41 5c c3 f3 0f 1e fa b8 10 00 00 00 0f 05 <48> 3d 01
f0 ff ff 73 01 c3 48 8b 0d 6d b8 0c 00 f7 d8 64 89 01 48
[    4.845857] RSP: 002b:00007ffd798377a8 EFLAGS: 00000246 ORIG_RAX:
0000000000000010
[    4.845859] RAX: ffffffffffffffda RBX: 00007ffd798377e0 RCX:
00007fbf4f8315db
[    4.845859] RDX: 00007ffd798377e0 RSI: 00000000c06864a2 RDI:
0000000000000009
[    4.845860] RBP: 00000000c06864a2 R08: 0000000000000000 R09:
000055ca4a0613a0
[    4.845861] R10: 0000000000000000 R11: 0000000000000246 R12:
0000000000000078
[    4.845862] R13: 0000000000000009 R14: 000055ca4a060ba0 R15:
000055ca4a060be0
[    4.845863] ---[ end trace 4f5aa763b893d28a ]---

-- 
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
