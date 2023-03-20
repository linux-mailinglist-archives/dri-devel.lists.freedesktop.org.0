Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 779A76C222F
	for <lists+dri-devel@lfdr.de>; Mon, 20 Mar 2023 21:05:48 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8FF1310E319;
	Mon, 20 Mar 2023 20:05:46 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C626510E319
 for <dri-devel@lists.freedesktop.org>; Mon, 20 Mar 2023 20:05:43 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 1DCC4B810BF
 for <dri-devel@lists.freedesktop.org>; Mon, 20 Mar 2023 20:05:42 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id BFF62C433A0
 for <dri-devel@lists.freedesktop.org>; Mon, 20 Mar 2023 20:05:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1679342740;
 bh=TbD3+t0fR46uhh966nAVX1o5uoQYHoT8rgYBRcsNnUc=;
 h=From:To:Subject:Date:In-Reply-To:References:From;
 b=dWcn11WYfKXHbs5sKJdPDgoRbg4ngxH5Q7MrOCCLSTVxtAklXZISkQg47Z4z6ImZ+
 rDHkP/XRFcd8AEZy537PvqofxUH/v3XXCfL2HTVWddTHe/EMR2iOWUUtjWOgHSEzIc
 pb3l7Sx/CpcDqAo0lDOvWvxu+lM2kpjX2ndm2SDykavpC/q/v0CZvAxamnD3oUuHNp
 S0l+zsd5jReeK4mCKrLvuOhKNT3eyBkmg/KxS0JiJfZWzI4PbWGEOU2IO3As4LKRn5
 xkirrZz8g3rSYyI0jGM7iP2cYzQxpKimSzOyFicLu0SvvDfhlT0mpLe8EWK60tp+NW
 JhYyswn0GhuOg==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix,
 from userid 48) id 9A8F2C43144; Mon, 20 Mar 2023 20:05:40 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 214847] [radeon] UBSAN shows several null-ptr-deref in
 drm/radeon/atom.c, radeon_atombios.c, atombios_encoders.c, atombios_crtc.c
Date: Mon, 20 Mar 2023 20:05:40 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Video(DRI - non Intel)
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: erhard_f@mailbox.org
X-Bugzilla-Status: RESOLVED
X-Bugzilla-Resolution: OBSOLETE
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: bug_status resolution
Message-ID: <bug-214847-2300-o6c1CJXXxy@https.bugzilla.kernel.org/>
In-Reply-To: <bug-214847-2300@https.bugzilla.kernel.org/>
References: <bug-214847-2300@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D214847

Erhard F. (erhard_f@mailbox.org) changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
             Status|NEW                         |RESOLVED
         Resolution|---                         |OBSOLETE

--- Comment #3 from Erhard F. (erhard_f@mailbox.org) ---
Have not seen this on recent kernels with USBAN, neither on current v6.3-rc=
3.

Closing here.

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
