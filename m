Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 021C031067D
	for <lists+dri-devel@lfdr.de>; Fri,  5 Feb 2021 09:19:26 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6ACD76E255;
	Fri,  5 Feb 2021 08:19:22 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DC36D6E255
 for <dri-devel@lists.freedesktop.org>; Fri,  5 Feb 2021 08:19:20 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPS id 639A464F9D
 for <dri-devel@lists.freedesktop.org>; Fri,  5 Feb 2021 08:19:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1612513160;
 bh=oWqpwZJWdRGYkMPZNTWHKm/T6557e0Qw7d1hwfP7VuY=;
 h=From:To:Subject:Date:In-Reply-To:References:From;
 b=fXABodriQMx+7tbyVDSO3zNKRi1pcCNsXKDMo7lk5PTIVNmiMZHVGGZrro7quL8w/
 SoDzb4KhQa4vxNbUBliSHYTpAq4zt3I/9Dj7A3mXu72jljp3/qDqKNYmIoeDCghZcE
 4/Xawy6pKyg1s9Oh7V0YqgSxc1XhoQ1l6TS1smNOTfy9zaY3EKNmiz/H0p99uGmDjf
 3Uf62ykw2GS8XP1a3LtvhKMisk3xUlFwtJ31hiVuhol+qPLvL8q8+6MJtCQjp5+L7R
 rlmwTXJL8aUgcOi4B4XMalrtJXI2ePf24tcwPlHhwQ0+UBAGfMxrpNLnnqU2TWQVBD
 ZV2hSmhod1qkw==
Received: by pdx-korg-bugzilla-2.web.codeaurora.org (Postfix, from userid 48)
 id 50B5465338; Fri,  5 Feb 2021 08:19:20 +0000 (UTC)
From: bugzilla-daemon@bugzilla.kernel.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 211425] [drm:atom_op_jump] *ERROR* atombios stuck in loop for
 more than 20secs aborting
Date: Fri, 05 Feb 2021 08:19:20 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Video(DRI - non Intel)
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: icedragon.aw@web.de
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: cf_kernel_version
Message-ID: <bug-211425-2300-oXUQWPWm7u@https.bugzilla.kernel.org/>
In-Reply-To: <bug-211425-2300@https.bugzilla.kernel.org/>
References: <bug-211425-2300@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=211425

Andreas (icedragon.aw@web.de) changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
     Kernel Version|5.10.12                     |5.10.13

--- Comment #3 from Andreas (icedragon.aw@web.de) ---
Hi, it is still reproducibility with mainline kernel 5.10.13 - at least it
takes the 20sec time to re-enable the screen - as mentioned in the error
message below.:

[Fr Feb  5 09:00:00 2021] [drm] perform_link_training_with_retries: Link
training attempt 1 of 4 failed
[Fr Feb  5 09:00:21 2021] [drm:atom_op_jump] *ERROR* atombios stuck in loop for
more than 20secs aborting
[Fr Feb  5 09:00:21 2021] [drm:amdgpu_atom_execute_table_locked] *ERROR*
atombios stuck executing B200 (len 3615, WS 8, PS 0) @ 0xB34E
[Fr Feb  5 09:00:21 2021] [drm:amdgpu_atom_execute_table_locked] *ERROR*
atombios stuck executing B0F4 (len 268, WS 4, PS 0) @ 0xB147
[Fr Feb  5 09:00:21 2021] [drm:dcn10_link_encoder_enable_dp_output] *ERROR*
dcn10_link_encoder_enable_dp_output: Failed to execute VBIOS command table!

-- 
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
