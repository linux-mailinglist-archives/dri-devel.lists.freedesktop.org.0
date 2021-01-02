Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 7AA6B2E8639
	for <lists+dri-devel@lfdr.de>; Sat,  2 Jan 2021 04:22:30 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B66BA898AA;
	Sat,  2 Jan 2021 03:22:25 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4BA09898AA
 for <dri-devel@lists.freedesktop.org>; Sat,  2 Jan 2021 03:22:25 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPS id C891522255
 for <dri-devel@lists.freedesktop.org>; Sat,  2 Jan 2021 03:22:24 +0000 (UTC)
Received: by pdx-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
 id BAF6C86730; Sat,  2 Jan 2021 03:22:24 +0000 (UTC)
From: bugzilla-daemon@bugzilla.kernel.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 208947] amdgpu DisplayPort won't recognize all display modes
 after 5.9 merges
Date: Sat, 02 Jan 2021 03:22:24 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Video(DRI - non Intel)
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: jvdelisle@charter.net
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: cc
Message-ID: <bug-208947-2300-7oCmXEcroT@https.bugzilla.kernel.org/>
In-Reply-To: <bug-208947-2300@https.bugzilla.kernel.org/>
References: <bug-208947-2300@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=208947

JerryD (jvdelisle@charter.net) changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
                 CC|                            |jvdelisle@charter.net

--- Comment #18 from JerryD (jvdelisle@charter.net) ---
From comment 8 of  bug #210849

[  224.767359] Call Trace:
[  224.767529]  amdgpu_dm_backlight_update_status+0xb4/0xc0 [amdgpu]
[  224.767535]  backlight_suspend+0x6a/0x80
[  224.767538]  ? brightness_store+0x50/0x50
[  224.767541]  dpm_run_callback+0x4f/0x140
[  224.767544]  __device_suspend+0x11c/0x4a0
[  224.767547]  dpm_suspend+0x117/0x250
[  224.767549]  dpm_suspend_start+0x77/0x80
[  224.767554]  suspend_devices_and_enter+0xe6/0x7f0
[  224.767557]  pm_suspend.cold+0x333/0x38c
[  224.767560]  state_store+0x71/0xd0
[  224.767565]  kernfs_fop_write+0xce/0x1b0
[  224.767569]  vfs_write+0xc7/0x1f0
[  224.767572]  ksys_write+0x4f/0xc0
[  224.767576]  do_syscall_64+0x4d/0x90
[  224.767580]  entry_SYSCALL_64_after_hwframe+0x44/0xa9

Does this look like the same bug?

-- 
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
