Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0975A3065DB
	for <lists+dri-devel@lfdr.de>; Wed, 27 Jan 2021 22:19:59 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7364D89E3F;
	Wed, 27 Jan 2021 21:19:55 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A790E89E3F
 for <dri-devel@lists.freedesktop.org>; Wed, 27 Jan 2021 21:19:54 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPS id 55BE060C3E
 for <dri-devel@lists.freedesktop.org>; Wed, 27 Jan 2021 21:19:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1611782394;
 bh=0ErlSkc2SWMG0RWHeqBZaRNPvBEDRdcKW5XUHieW6mo=;
 h=From:To:Subject:Date:In-Reply-To:References:From;
 b=ZPCxF4shg/7EieAEkhzjZR546Ge9JA4py+fEMANKnJ7sPtwhenx/P+e4uWz37U7mg
 iHu8jARS/3gOUDSrro57QR35fd8xCHB4P8FXS7TEjrMmYckdCOsEItb7uI09VJkfbE
 B+7MdJRHu+6XsbQawPJR4V4znwxaVaQZBBeDWn1g0nb6nD9IkOIhhntgxGEOY75AYC
 dXG6leXMIgfS0+WqAzp5Vv+Enr++1K86HHosh2T1kPk4N1U37BYJMAEtFQ4Wz/02ct
 gyE8olBJxoVRxsKjdJK77ymo1ec3v7V1VKHSMh2bniSZ/OwCIMjZbqystVFabS4GPz
 5HllhoSDRBoeA==
Received: by pdx-korg-bugzilla-2.web.codeaurora.org (Postfix, from userid 48)
 id 51837652E8; Wed, 27 Jan 2021 21:19:54 +0000 (UTC)
From: bugzilla-daemon@bugzilla.kernel.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 211425] [drm:atom_op_jump] *ERROR* atombios stuck in loop for
 more than 20secs aborting
Date: Wed, 27 Jan 2021 21:19:54 +0000
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
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-211425-2300-TJ79nXjh5E@https.bugzilla.kernel.org/>
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

--- Comment #1 from Andreas (icedragon.aw@web.de) ---
Kernel 5.10.11 (mainline) issues still persist:

[  181.977478] [drm:atom_op_jump] *ERROR* atombios stuck in loop for more than
20secs aborting
[  181.977546] [drm:amdgpu_atom_execute_table_locked] *ERROR* atombios stuck
executing B200 (len 3615, WS 8, PS 0) @ 0xB34E
[  181.977617] [drm:amdgpu_atom_execute_table_locked] *ERROR* atombios stuck
executing B0F4 (len 268, WS 4, PS 0) @ 0xB147
[  181.977689] [drm:dcn10_link_encoder_enable_dp_output] *ERROR*
dcn10_link_encoder_enable_dp_output: Failed to execute VBIOS command table!
[  183.536107] [drm] amdgpu_dm_irq_schedule_work FAILED src 2
[  203.878870] [drm:atom_op_jump] *ERROR* atombios stuck in loop for more than
20secs aborting
[  203.878937] [drm:amdgpu_atom_execute_table_locked] *ERROR* atombios stuck
executing B200 (len 3615, WS 8, PS 0) @ 0xB6EA
[  203.879009] [drm:amdgpu_atom_execute_table_locked] *ERROR* atombios stuck
executing B0F4 (len 268, WS 4, PS 0) @ 0xB147
[  203.879080] [drm:dcn10_link_encoder_enable_dp_output] *ERROR*
dcn10_link_encoder_enable_dp_output: Failed to execute VBIOS command table!
[  206.105584] [drm] perform_link_training_with_retries: Link training attempt
1 of 4 failed
[  206.509404] [drm] perform_link_training_with_retries: Link training attempt
2 of 4 failed

-- 
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
