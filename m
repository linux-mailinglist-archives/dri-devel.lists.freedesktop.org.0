Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 12F55357F18
	for <lists+dri-devel@lfdr.de>; Thu,  8 Apr 2021 11:27:11 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4A6A76EA32;
	Thu,  8 Apr 2021 09:27:07 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1C7216EA32
 for <dri-devel@lists.freedesktop.org>; Thu,  8 Apr 2021 09:27:06 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPS id C3D1B6113C
 for <dri-devel@lists.freedesktop.org>; Thu,  8 Apr 2021 09:27:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1617874025;
 bh=D07u/MwdkxeXk5GXahtUKsBRofYiUwcFsT83S48J0Ag=;
 h=From:To:Subject:Date:In-Reply-To:References:From;
 b=Vb+Jf/qDhNBL+Ysko5uQmb0Xq87JaB85miDFWN6090xxX9VjHwZGf6MaRZHwTG9qc
 dPpnpDAIm3k5Xrc0lmy2HoVY6fTci+uIDk9qcGsE4jnj9JPJrlDP1Bn9gLjESvUnll
 6CqICBMCVyB3NDDohwhPuhzsLtOrRCTgqLrNAnKLNb/WFgDgcHymC7bb6/ilLE3LO0
 wohh5kvvwNNSISmfbiyzguP71DeaOzROqCrEeb96baQQmWpf4GiM6IuYIzSlvbbw+x
 1PR/YTlwUZikCT1MqAy0gaYhcn7ZNviYayMqvvAHGoRZMBrHZWdruNo0+qYUWT10v/
 O/4Vk/6DyrStA==
Received: by pdx-korg-bugzilla-2.web.codeaurora.org (Postfix, from userid 48)
 id BABD561131; Thu,  8 Apr 2021 09:27:05 +0000 (UTC)
From: bugzilla-daemon@bugzilla.kernel.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 211425] [drm:atom_op_jump] *ERROR* atombios stuck in loop for
 more than 20secs aborting
Date: Thu, 08 Apr 2021 09:27:05 +0000
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
Message-ID: <bug-211425-2300-FehObzQkKk@https.bugzilla.kernel.org/>
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
     Kernel Version|5.11.11                     |5.11.12

--- Comment #16 from Andreas (icedragon.aw@web.de) ---
With 5.11.12 kernel (still affected) there is a small new message line at the
end of the other error messages:

...
[Do Apr  8 11:13:05 2021] [drm:dcn10_link_encoder_enable_dp_output] *ERROR*
dcn10_link_encoder_enable_dp_output: Failed to execute VBIOS command table!
[Do Apr  8 11:13:07 2021] [drm] amdgpu_dm_irq_schedule_work FAILED src 2
[Do Apr  8 11:13:27 2021] [drm:atom_op_jump] *ERROR* atombios stuck in loop for
more than 20secs aborting
[Do Apr  8 11:13:27 2021] [drm:amdgpu_atom_execute_table_locked] *ERROR*
atombios stuck executing B228 (len 3608, WS 8, PS 0) @ 0xB712
[Do Apr  8 11:13:27 2021] [drm:amdgpu_atom_execute_table_locked] *ERROR*
atombios stuck executing B11C (len 268, WS 4, PS 0) @ 0xB16F
[Do Apr  8 11:13:27 2021] [drm:dcn10_link_encoder_enable_dp_output] *ERROR* 
dcn10_link_encoder_enable_dp_output: Failed to execute VBIOS command table!

[Do Apr  8 11:13:29 2021] [drm:dc_link_detect_helper] *ERROR* No EDID read.

-- 
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
