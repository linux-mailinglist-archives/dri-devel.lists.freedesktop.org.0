Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 6489130C62A
	for <lists+dri-devel@lfdr.de>; Tue,  2 Feb 2021 17:41:38 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 988456E95E;
	Tue,  2 Feb 2021 16:41:34 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 82C856E95E
 for <dri-devel@lists.freedesktop.org>; Tue,  2 Feb 2021 16:41:33 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPS id 3E19064F78
 for <dri-devel@lists.freedesktop.org>; Tue,  2 Feb 2021 16:41:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1612284093;
 bh=md3Ecp17LSVCb7p5TssFUDvVcS3XecY0urdJw2+SFuQ=;
 h=From:To:Subject:Date:In-Reply-To:References:From;
 b=asg4V7JKSGJa7K/ypTu/cORzLNbr0Qm/0cENRVr6hwr70APXY0/53sb2u+0f7IaNp
 pUc5JU3Pj+BbI1a1NOFlydoyKduBhsBZ48Jwb6taCicepl4RhyJBCOLzZN2cdPZX+2
 8igyS3QqKYzXGlm1rKZz6l0IaDgajsdxoNGAuNky+TGIMlEmud2pGUd0EuMTUrqMXY
 HmJ3fxWoJR6HnYGZQcKnV5R4xtWqZlDkaBPRe37Zy7yc9PKOH0vR1mcAnQ2GA3ay/R
 4pvmdfd5g25pEQUzlNc5gATPKIySNIezLSAmY6QMhfRVaV0MYZnKSTNQos/j/xCAob
 5Lo3xGXK4bP0A==
Received: by pdx-korg-bugzilla-2.web.codeaurora.org (Postfix, from userid 48)
 id 2B30C65308; Tue,  2 Feb 2021 16:41:33 +0000 (UTC)
From: bugzilla-daemon@bugzilla.kernel.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 211425] [drm:atom_op_jump] *ERROR* atombios stuck in loop for
 more than 20secs aborting
Date: Tue, 02 Feb 2021 16:41:32 +0000
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
Message-ID: <bug-211425-2300-SdWJ4j86HR@https.bugzilla.kernel.org/>
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
     Kernel Version|5.10.11                     |5.10.12

--- Comment #2 from Andreas (icedragon.aw@web.de) ---
Kernel 5.10.12 (original mainline) issues still persist:

[Di Feb  2 17:36:09 2021] [drm:atom_op_jump] *ERROR* atombios stuck in loop for
more than 20secs aborting
[Di Feb  2 17:36:09 2021] [drm:amdgpu_atom_execute_table_locked] *ERROR*
atombios stuck executing B200 (len 3615, WS 8, PS 0) @ 0xB34E
[Di Feb  2 17:36:09 2021] [drm:amdgpu_atom_execute_table_locked] *ERROR*
atombios stuck executing B0F4 (len 268, WS 4, PS 0) @ 0xB147
[Di Feb  2 17:36:09 2021] [drm:dcn10_link_encoder_enable_dp_output] *ERROR*
dcn10_link_encoder_enable_dp_output: Failed to execute VBIOS command table!
[Di Feb  2 17:36:10 2021] [drm] amdgpu_dm_irq_schedule_work FAILED src 2
[Di Feb  2 17:36:30 2021] [drm:atom_op_jump] *ERROR* atombios stuck in loop for
more than 20secs aborting
[Di Feb  2 17:36:30 2021] [drm:amdgpu_atom_execute_table_locked] *ERROR*
atombios stuck executing B200 (len 3615, WS 8, PS 0) @ 0xB6EA
[Di Feb  2 17:36:30 2021] [drm:amdgpu_atom_execute_table_locked] *ERROR*
atombios stuck executing B0F4 (len 268, WS 4, PS 0) @ 0xB147
[Di Feb  2 17:36:30 2021] [drm:dcn10_link_encoder_enable_dp_output] *ERROR*
dcn10_link_encoder_enable_dp_output: Failed to execute VBIOS command table!
[Di Feb  2 17:36:33 2021] [drm] perform_link_training_with_retries: Link
training attempt 1 of 4 failed
[Di Feb  2 17:36:33 2021] [drm] perform_link_training_with_retries: Link
training attempt 2 of 4 failed

-- 
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
