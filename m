Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 2A6C43B1FF5
	for <lists+dri-devel@lfdr.de>; Wed, 23 Jun 2021 19:59:24 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B097E6E974;
	Wed, 23 Jun 2021 17:59:20 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5AAAE6E974
 for <dri-devel@lists.freedesktop.org>; Wed, 23 Jun 2021 17:59:19 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPS id 232AE61026
 for <dri-devel@lists.freedesktop.org>; Wed, 23 Jun 2021 17:59:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1624471159;
 bh=0/TbRnSlDI1AJwxr2epF7B0ARIO+EY6HvqANDcWuhRM=;
 h=From:To:Subject:Date:In-Reply-To:References:From;
 b=h22kQ5B56pt8GUOcH79VnsbGftOpJW2k6H8fYYKQNP3/UPWuYx9YdVZ8hmyr/Ajru
 Tpy9dZWOe0QhoWWU3wpDvUxWvHI7EWoeNkCdeHpUw+EQF8cXuGjyuhpLyS1UeX4SGb
 2Jn+rKmGGi/aHrWaG7QPNXjdvCPQ2f34C6xvveNdahY+4XI4Gufu7e0dZobOKdYMPE
 NlsvQ6Z5W7htBshniGuDIr4ZjwkF/xOaugJcYc6XOX8QJO1w+a+kJsyGOv9zbDh3sn
 aTsfcF36UGIxmnZ/6av8aKqte8Et/yyUbPiBTKrK6Wu7G3Vjq2GS48pwdyH/4xVkOV
 iqauTsNA5SXKw==
Received: by pdx-korg-bugzilla-2.web.codeaurora.org (Postfix, from userid 48)
 id 12C9E612AF; Wed, 23 Jun 2021 17:59:19 +0000 (UTC)
From: bugzilla-daemon@bugzilla.kernel.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 211425] [drm:atom_op_jump] *ERROR* atombios stuck in loop for
 more than 20secs aborting
Date: Wed, 23 Jun 2021 17:59:18 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Video(DRI - non Intel)
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: high
X-Bugzilla-Who: icedragon.aw@web.de
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: cf_kernel_version bug_severity
Message-ID: <bug-211425-2300-KtPke4NZRj@https.bugzilla.kernel.org/>
In-Reply-To: <bug-211425-2300@https.bugzilla.kernel.org/>
References: <bug-211425-2300@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D211425

Andreas (icedragon.aw@web.de) changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
     Kernel Version|5.11.12                     |5.12.12
           Severity|normal                      |high

--- Comment #17 from Andreas (icedragon.aw@web.de) ---
At least since kernel 5.12.11 I have a chance (not 100% reproducible) that =
the
screen does not recover!=20

Keyboard partially not disabled, e.g. num-lock and caps-lock not working, b=
ut
magic SysRq key shortcuts still working.

Here are the last kernel messages (5.12.12) after the screens keeps black (=
did
not recover).:

Jun 23 19:31:24 localhost kernel: [255985.517110] [drm]
perform_link_training_with_retries: Link training attempt 1 of 4 failed
Jun 23 19:31:45 localhost kernel: [256006.097054] [drm:atom_op_jump] *ERROR*
atombios stuck in loop for more than 20secs aborting
Jun 23 19:31:45 localhost kernel: [256006.097061]
[drm:amdgpu_atom_execute_table_locked] *ERROR* atombios stuck executing B228
(len 3608, WS 8, PS 0) @ 0xB376
Jun 23 19:31:45 localhost kernel: [256006.097064]
[drm:amdgpu_atom_execute_table_locked] *ERROR* atombios stuck executing B11C
(len 268, WS 4, PS 0) @ 0xB16F
Jun 23 19:31:45 localhost kernel: [256006.097067]
[drm:dcn10_link_encoder_enable_dp_output] *ERROR*
dcn10_link_encoder_enable_dp_output: Failed to execute VBIOS command table!
Jun 23 19:31:45 localhost kernel: [256006.108713] [drm]
perform_link_training_with_retries: Link training attempt 2 of 4 failed

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
