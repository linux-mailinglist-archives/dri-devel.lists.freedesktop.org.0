Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AC9EF633F92
	for <lists+dri-devel@lfdr.de>; Tue, 22 Nov 2022 15:57:41 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A583210E40D;
	Tue, 22 Nov 2022 14:57:32 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 87C2D10E0CC
 for <dri-devel@lists.freedesktop.org>; Tue, 22 Nov 2022 14:57:29 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id B16B5B81BAB
 for <dri-devel@lists.freedesktop.org>; Tue, 22 Nov 2022 14:57:27 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 5BA01C433C1
 for <dri-devel@lists.freedesktop.org>; Tue, 22 Nov 2022 14:57:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1669129046;
 bh=oa7MyL7kMCpY9S2Z+Y6ZXEV0pwTTtQlG9+diiwnHobA=;
 h=From:To:Subject:Date:In-Reply-To:References:From;
 b=lzgYycZ7Mj/0vU/3+X6mTGoRYojX+JuxkFzKNTYEjhL8AEQBJDJntPjKZqzSbm508
 ZP/XLmaxfissHHizUQFFkBXWZzxRmE2dcn27yjvW0G0g7Pj5JSKDPhhC3UNCSwNI08
 sYGXOLVZEPkruM5E0DeTMNtroo6UKouciFiXJlXpD0XbbN+kUKPsdQS1lgm+J3pjdJ
 vh76d0rd7iwElBx3AUuTOZ6mM4oMxaPn7NEyEcuXfU6fuD4efuC4OjQuRb5yReMb7p
 TnBxslpOtcu22hkG+WorydCVoy9Av1VnhSjm702fkGQ9lLfZju5nQQkh6Z0XH5wBrA
 WctSxWB+JL9Ew==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix,
 from userid 48) id 453E7C433E9; Tue, 22 Nov 2022 14:57:26 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 216727] Failure to wake up from suspend to RAM
Date: Tue, 22 Nov 2022 14:57:26 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Video(DRI - non Intel)
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: martin.tk@gmx.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-216727-2300-XsUcWxkVty@https.bugzilla.kernel.org/>
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

--- Comment #2 from Martin (martin.tk@gmx.com) ---
(In reply to Alex Deucher from comment #1)
> Does this patch help?
> https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/
> ?id=3D8d4de331f1b24a22d18e3c6116aa25228cf54854

Thanks, I'll try and let you know tomorrow.

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
