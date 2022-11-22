Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BC570633F60
	for <lists+dri-devel@lfdr.de>; Tue, 22 Nov 2022 15:52:46 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 084CE10E400;
	Tue, 22 Nov 2022 14:52:44 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 80F9810E400
 for <dri-devel@lists.freedesktop.org>; Tue, 22 Nov 2022 14:52:40 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 0EF8E6172C
 for <dri-devel@lists.freedesktop.org>; Tue, 22 Nov 2022 14:52:40 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 753FCC433D7
 for <dri-devel@lists.freedesktop.org>; Tue, 22 Nov 2022 14:52:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1669128759;
 bh=1BotMZJH0f35UXPxalin6juR1chqN3PORprIbDUZAEc=;
 h=From:To:Subject:Date:In-Reply-To:References:From;
 b=kb3Ho19qvpN/LND4hOUPA0Oh3/bxivbD+uhJoa3DDynrwponr5S0IXsxoycvzgP9O
 ovprBLJ2EkUpsuBeFsFGuNAWxEiN7fMO/OYX6bZjDo6Rf74TL5/E8A5X+Gz3trvppR
 bijSEgyklAfpr46XvUn+wKJrHHlypIHtWoIlkON0/EYeLsZqdoXNWeaQIrcTtFfJxg
 kYJlWNx5hkTYyRMw+Q4j4FYw7ZdywPMsQh958YkNJ1EiXJ/guWc3iMsrtr+YbglWfj
 EF7NkqNxgJhKEi0EWD2DCaclYHK+PhF4R3jykHzng4JS9CfcssiA/g3BiqsvqagR8w
 ePvbni6+sgA/Q==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix,
 from userid 48) id 5F30FC433E9; Tue, 22 Nov 2022 14:52:39 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 216727] Failure to wake up from suspend to RAM
Date: Tue, 22 Nov 2022 14:52:38 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Video(DRI - non Intel)
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: alexdeucher@gmail.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: cc
Message-ID: <bug-216727-2300-L9HDcZe6Wa@https.bugzilla.kernel.org/>
In-Reply-To: <bug-216727-2300@https.bugzilla.kernel.org/>
References: <bug-216727-2300@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D216727

Alex Deucher (alexdeucher@gmail.com) changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
                 CC|                            |alexdeucher@gmail.com

--- Comment #1 from Alex Deucher (alexdeucher@gmail.com) ---
Does this patch help?
https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?=
id=3D8d4de331f1b24a22d18e3c6116aa25228cf54854

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
