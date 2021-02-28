Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 9AFD8327182
	for <lists+dri-devel@lfdr.de>; Sun, 28 Feb 2021 09:07:11 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 97E9D6E133;
	Sun, 28 Feb 2021 08:07:06 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DC1CB6E133
 for <dri-devel@lists.freedesktop.org>; Sun, 28 Feb 2021 08:07:05 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPS id C950564E69
 for <dri-devel@lists.freedesktop.org>; Sun, 28 Feb 2021 08:07:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1614499624;
 bh=K9dBYirDVAc8TYJn+j3qYIK2BKz/zvvV7V7iiXmT3e4=;
 h=From:To:Subject:Date:In-Reply-To:References:From;
 b=lOgNfCZuXzWw3Z8Qtg2A3YV7V7GC81mKAO+h5AZVFw/WPSwyrlXAwulprmsjhp452
 XiHByQwA9z7IRrOX+EhmaOLwAS3aRmIlYC2Lh9czY3n/pjXcHv1r8Rfde+MIUvAn/+
 yD6qfTyHHmPVgp45t9qKSU7pYdTfxgo14ANiKqqvkWSET8teqEqoHdgG+3i9hYST6g
 VmMCT+/EPcJhoYy4tVyDzdzDEYTzuFsBA1lWVrvYrylYHd6ajp6sHYLSE6yCJ9ymYT
 b7R1ZbF4EVTZMkIdDqIQBGJeW+s17g5tCDBPIdr93GFsetnn/sQHNAn9oQEjSwBbfN
 dE4eboqEIW3lQ==
Received: by pdx-korg-bugzilla-2.web.codeaurora.org (Postfix, from userid 48)
 id C64DD65359; Sun, 28 Feb 2021 08:07:04 +0000 (UTC)
From: bugzilla-daemon@bugzilla.kernel.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 51381] [drm:atom_op_jump] *ERROR* atombios stuck in loop for
 more than 5secs aborting, when disabled via vgaswitcheroo
Date: Sun, 28 Feb 2021 08:07:04 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Video(DRI - non Intel)
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: luca.trombin@gmail.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: cc
Message-ID: <bug-51381-2300-RSGKYUUHl6@https.bugzilla.kernel.org/>
In-Reply-To: <bug-51381-2300@https.bugzilla.kernel.org/>
References: <bug-51381-2300@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=51381

Luca T. (luca.trombin@gmail.com) changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
                 CC|                            |luca.trombin@gmail.com

--- Comment #53 from Luca T. (luca.trombin@gmail.com) ---
Dear all,
I'm using Linux Mint, before I used Arch Linux and also Red Hat, but my laptop
suffer of the same problem because of this kernel bug where Radeon gets stuck
in a loop:

Feb 06 17:57:17 oldlaptop kernel: [drm:atom_op_jump [radeon]] ERROR atombios
stuck in loop for more than 5secs aborting
Feb 06 17:57:17 oldlaptop kernel: [drm:atom_execute_table_locked [radeon]]
ERROR atombios stuck executing CB56 (len 62, WS 0, PS 0) @ 0xCB72
Feb 06 17:57:17 oldlaptop kernel: [drm:atom_execute_table_locked [radeon]]
ERROR atombios stuck executing B716 (len 236, WS 4, PS 0) @ 0xB7E3
Feb 06 17:57:17 oldlaptop kernel: [drm:atom_execute_table_locked [radeon]]
ERROR atombios stuck executing B674 (len 74, WS 0, PS 8) @ 0xB67C
Feb 06 17:57:17 oldlaptop kernel: [drm:si_dpm_enable [radeon]] ERROR
si_init_smc_table failed
Feb 06 17:57:17 oldlaptop kernel: [drm:radeon_pm_resume [radeon]] ERROR radeon:
dpm resume failed

This is happening every time I'm switching from a VT to another or any time I
need to login.

Is there any progress or resolution of this issue?

Thanks,

Luca

-- 
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
