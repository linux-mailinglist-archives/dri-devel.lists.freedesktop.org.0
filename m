Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 8AE4F54E9E2
	for <lists+dri-devel@lfdr.de>; Thu, 16 Jun 2022 21:16:15 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9372F10FC1D;
	Thu, 16 Jun 2022 19:16:13 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5BDE510FC1D
 for <dri-devel@lists.freedesktop.org>; Thu, 16 Jun 2022 19:16:12 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 028F0B825AE
 for <dri-devel@lists.freedesktop.org>; Thu, 16 Jun 2022 19:16:11 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id BFF51C3411C
 for <dri-devel@lists.freedesktop.org>; Thu, 16 Jun 2022 19:16:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1655406969;
 bh=cJ1Q4COpyJpul3DB0rVfK77C0lAL/aDLWirg6curdbQ=;
 h=From:To:Subject:Date:In-Reply-To:References:From;
 b=lwFd02Uppqvurn5EvTOycZYKb/+yfAwan6UKJ+S3V/XtnQSGP9DRdr7zcAEKqeynD
 rUaURvEUrxgmlRJzrSyg0ZzL35x8SGSBVW2/cc2J9GtyPFw14eFDdBDbMEwzknKR2T
 5cG3xK3kHJShf8yheJW5Zcz2WMOY2nTOIgD4vlbxX9vDeWryOuRRyofXbYA4AWLplw
 Bk3cK69g5HxH2VjkqCRcBClkP87A/e+6ETBx7dJBL14yNXPruQ3/DZ9NxuplwCiapX
 sIp7cBulMllyZ4+9BH5dkbsAwgLEMGr0dMQYn4D8jrW0tgxSgy9Y1YbQXvhJK5+iQ0
 GKWn2U5u+UooQ==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix,
 from userid 48) id AC416CC13B3; Thu, 16 Jun 2022 19:16:09 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 216119] 087451f372bf76d breaks hibernation on amdgpu Radeon R9
 390
Date: Thu, 16 Jun 2022 19:16:09 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Video(DRI - non Intel)
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: alexdeucher@gmail.com
X-Bugzilla-Status: REOPENED
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-216119-2300-boNgmqEYd3@https.bugzilla.kernel.org/>
In-Reply-To: <bug-216119-2300@https.bugzilla.kernel.org/>
References: <bug-216119-2300@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D216119

--- Comment #6 from Alex Deucher (alexdeucher@gmail.com) ---
On the kernel command line in grub.

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
