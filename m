Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 249DD486D09
	for <lists+dri-devel@lfdr.de>; Thu,  6 Jan 2022 23:06:02 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EF27210E40C;
	Thu,  6 Jan 2022 22:05:59 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from ams.source.kernel.org (ams.source.kernel.org
 [IPv6:2604:1380:4601:e00::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F1E8910E3C0
 for <dri-devel@lists.freedesktop.org>; Thu,  6 Jan 2022 22:05:58 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id C3517B8244D
 for <dri-devel@lists.freedesktop.org>; Thu,  6 Jan 2022 22:05:57 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 90350C36AEF
 for <dri-devel@lists.freedesktop.org>; Thu,  6 Jan 2022 22:05:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1641506756;
 bh=mSI+6QASWpwR0OPnEakAf0S0aTiI3/4dru0ZatPLTTs=;
 h=From:To:Subject:Date:In-Reply-To:References:From;
 b=ABuokNO3Td6YikhYj6/vLTuLHNLc1h8FLq/xQpInU9t5nXEXbAFcJLD9+SFH4H2xD
 WWCd6LcgG8AuDqm6Yi2rkiFqgZnicuW9DeWD7hADiYsk1PKmTGoASaOD4Pj5eicfVT
 uIgYjkw707aH0G4pRo5CpM4/R3vCaRhNDUp5iVRPHwvnzXCN3j4B8njB5gi9evfYVK
 qM234Es6KUmfzLr/EgzOhXsU9ngyo5AoOo1mAtva4K78uXxzbz0vGdGM8D79U8tofK
 /j05ROFxfDeP4NguzNLjoMMijgWA9KxwrQfZ073em45H+OWrPgxxGQC6Ph42bxIBxi
 j2fUorrr/KTVg==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix,
 from userid 48) id 77621C05FF4; Thu,  6 Jan 2022 22:05:56 +0000 (UTC)
From: bugzilla-daemon@bugzilla.kernel.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 215445] AMDGPU -- UBSAN: invalid-load in amdgpu_dm.c:5882:84 -
 load of value 32 is not a valid value for type '_Bool'
Date: Thu, 06 Jan 2022 22:05:56 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Video(DRI - non Intel)
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: satadru@umich.edu
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: cc
Message-ID: <bug-215445-2300-TY79Ni9XTi@https.bugzilla.kernel.org/>
In-Reply-To: <bug-215445-2300@https.bugzilla.kernel.org/>
References: <bug-215445-2300@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D215445

Satadru Pramanik (satadru@umich.edu) changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
                 CC|                            |satadru@umich.edu

--- Comment #4 from Satadru Pramanik (satadru@umich.edu) ---
Also seeing this on an ubuntu 5.15.13 mainline kernel on ubuntu/22.04 with
xorg.


[   63.026997]
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D
[   63.027004] fbcon: Taking over console
[   63.027008] UBSAN: invalid-load in
/home/kernel/COD/linux/drivers/gpu/drm/amd/amdgpu/../display/amdgpu_dm/amdg=
pu_dm.c:5882:84
[   63.027013] load of value 4 is not a valid value for type '_Bool'
[   63.027017] CPU: 0 PID: 508 Comm: plymouthd Tainted: P           OE=20=
=20=20=20
5.15.13-051513-generic #202201050731
[   63.027020] Hardware name: MSI MS-7998/C236A WORKSTATION (MS-7998), BIOS
2.A0 06/15/2018
[   63.027021] Call Trace:
[   63.027023]  <TASK>
[   63.027025]  show_stack+0x52/0x58
[   63.027030]  dump_stack_lvl+0x4a/0x5f
[   63.027036]  dump_stack+0x10/0x12
[   63.027039]  ubsan_epilogue+0x9/0x45
[   63.027042]  __ubsan_handle_load_invalid_value.cold+0x44/0x49
[   63.027046]  create_stream_for_sink.cold+0x5d/0xbb [amdgpu]
[   63.027337]  create_validate_stream_for_sink+0x59/0x150 [amdgpu]
[   63.027572]  dm_update_crtc_state+0x235/0x7b0 [amdgpu]
[   63.027808]  amdgpu_dm_atomic_check+0x596/0xcd0 [amdgpu]
[   63.028080]  ? __cond_resched+0x1a/0x50
[   63.028085]  ? ww_mutex_lock+0x83/0x90
[   63.028088]  ? dm_plane_format_mod_supported+0x1f/0x100 [amdgpu]
[   63.028324]  ? drm_plane_check_pixel_format+0x45/0x90 [drm]
[   63.028367]  ? drm_atomic_plane_check+0x12f/0x360 [drm]
[   63.028396]  drm_atomic_check_only+0x250/0x4b0 [drm]
[   63.028423]  drm_atomic_commit+0x18/0x50 [drm]
[   63.028450]  drm_client_modeset_commit_atomic+0x1df/0x220 [drm]
[   63.028476]  drm_client_modeset_commit_locked+0x5b/0x160 [drm]
[   63.028501]  ? mutex_lock+0x13/0x40
[   63.028504]  drm_client_modeset_commit+0x27/0x50 [drm]
[   63.028531]  __drm_fb_helper_restore_fbdev_mode_unlocked+0xc2/0xf0
[drm_kms_helper]
[   63.028556]  drm_fb_helper_lastclose+0x17/0x20 [drm_kms_helper]
[   63.028571]  amdgpu_driver_lastclose_kms+0xe/0x20 [amdgpu]
[   63.028749]  drm_release+0xe0/0x110 [drm]
[   63.028773]  __fput+0x9c/0x260
[   63.028777]  ____fput+0xe/0x10
[   63.028779]  task_work_run+0x6d/0xa0
[   63.028783]  do_exit+0x21b/0x3c0
[   63.028786]  do_group_exit+0x3b/0xb0
[   63.028789]  __x64_sys_exit_group+0x18/0x20
[   63.028791]  do_syscall_64+0x59/0xc0
[   63.028794]  ? asm_exc_page_fault+0x8/0x30
[   63.028798]  entry_SYSCALL_64_after_hwframe+0x44/0xae
[   63.028802] RIP: 0033:0x7f3126a99ed1
[   63.028805] Code: Unable to access opcode bytes at RIP 0x7f3126a99ea7.
[   63.028806] RSP: 002b:00007ffdc2f08a48 EFLAGS: 00000246 ORIG_RAX:
00000000000000e7
[   63.028809] RAX: ffffffffffffffda RBX: 00007f3126bc66d0 RCX:
00007f3126a99ed1
[   63.028811] RDX: 000000000000003c RSI: 00000000000000e7 RDI:
0000000000000000
[   63.028813] RBP: 0000000000000000 R08: ffffffffffffff80 R09:
0000000000000001
[   63.028815] R10: 000000000000001f R11: 0000000000000246 R12:
00007f3126bc66d0
[   63.028816] R13: 0000000000000000 R14: 00007f3126bc6ba8 R15:
00007f3126bc6bc0
[   63.028820]  </TASK>
[   63.028822]
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
