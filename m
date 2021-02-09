Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 903873150C0
	for <lists+dri-devel@lfdr.de>; Tue,  9 Feb 2021 14:49:22 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B24A66EB36;
	Tue,  9 Feb 2021 13:49:20 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 377DA6EB36
 for <dri-devel@lists.freedesktop.org>; Tue,  9 Feb 2021 13:49:20 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPS id DED2164EEA
 for <dri-devel@lists.freedesktop.org>; Tue,  9 Feb 2021 13:49:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1612878559;
 bh=xGnJrJw3cctKNAJ44CNBGBGIm2neOzNGnfZiSxKPesk=;
 h=From:To:Subject:Date:In-Reply-To:References:From;
 b=Dbuu81bkVvf+CmtsxsVdqspvQCf/rS4fkWA5LgCZ5kk0zjRMrMfN2YSj6eUjQV3aJ
 K2zo0G5zz5CC7RIrpdJDeLCttVYeV2eYDhTukcF6401Gm4fWjPA3clSluorOhRh05k
 q6AtVQuIxRsqepZS7GVZswZEv7xwAZhm5fQimGp/QIR/qQCwsl148PL9i2USE6SUq8
 bzftDFhfkqA8Zg9DsoXHds3O4Ss6F9BDpKOhL33ohyZxNWjwuEbcxqgk0mC6nMJsRP
 +kYSjTXt8PeYySL8zDqDv6I4jnHnyCg9dYgiiBgTsExypH4Qv2aTQnFHlfyylToFGI
 G6vZkmh++hYIg==
Received: by pdx-korg-bugzilla-2.web.codeaurora.org (Postfix, from userid 48)
 id CA5E66535B; Tue,  9 Feb 2021 13:49:19 +0000 (UTC)
From: bugzilla-daemon@bugzilla.kernel.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 211425] [drm:atom_op_jump] *ERROR* atombios stuck in loop for
 more than 20secs aborting
Date: Tue, 09 Feb 2021 13:49:19 +0000
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
Message-ID: <bug-211425-2300-feD9Bq1qkF@https.bugzilla.kernel.org/>
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
     Kernel Version|5.10.13                     |5.10.14

--- Comment #4 from Andreas (icedragon.aw@web.de) ---
Hi, it is still reproducibility with mainline kernel 5.10.14:

[Di Feb  9 12:51:04 2021] [drm:atom_op_jump] *ERROR* atombios stuck in loop for
more than 20secs aborting
[Di Feb  9 12:51:04 2021] [drm:amdgpu_atom_execute_table_locked] *ERROR*
atombios stuck executing B200 (len 3615, WS 8, PS 0) @ 0xB34E
[Di Feb  9 12:51:04 2021] [drm:amdgpu_atom_execute_table_locked] *ERROR*
atombios stuck executing B0F4 (len 268, WS 4, PS 0) @ 0xB147
[Di Feb  9 12:51:04 2021] [drm:dcn10_link_encoder_enable_dp_output] *ERROR*
dcn10_link_encoder_enable_dp_output: Failed to execute VBIOS command table!
[Di Feb  9 12:51:06 2021] [drm] amdgpu_dm_irq_schedule_work FAILED src 2
...
[Di Feb  9 12:51:26 2021] [drm:atom_op_jump] *ERROR* atombios stuck in loop for
more than 20secs aborting
[Di Feb  9 12:51:26 2021] [drm:amdgpu_atom_execute_table_locked] *ERROR*
atombios stuck executing B200 (len 3615, WS 8, PS 0) @ 0xB6EA
[Di Feb  9 12:51:26 2021] [drm:amdgpu_atom_execute_table_locked] *ERROR*
atombios stuck executing B0F4 (len 268, WS 4, PS 0) @ 0xB147
[Di Feb  9 12:51:26 2021] [drm:dcn10_link_encoder_enable_dp_output] *ERROR*
dcn10_link_encoder_enable_dp_output: Failed to execute VBIOS command table!

-- 
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
