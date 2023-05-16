Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 433D57054A1
	for <lists+dri-devel@lfdr.de>; Tue, 16 May 2023 19:02:11 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D863710E073;
	Tue, 16 May 2023 17:02:06 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D595B10E073
 for <dri-devel@lists.freedesktop.org>; Tue, 16 May 2023 17:02:05 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 362B463CEB
 for <dri-devel@lists.freedesktop.org>; Tue, 16 May 2023 17:02:05 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 9D498C433A0
 for <dri-devel@lists.freedesktop.org>; Tue, 16 May 2023 17:02:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1684256524;
 bh=X5yL89O0OKrDX5KCOBGQ7mqQ5//AD4tRybOT1pY78dg=;
 h=From:To:Subject:Date:In-Reply-To:References:From;
 b=IdZO629zgbK5RZ/Ke1Qrxe2aim9ELpis1FXTXMyJRwoprEdSJJxx2wWCYQAIHJcTn
 85UaFv3cSfmDHBUnuvDh9JHIxquIZmh94w8MbNVTdKdFuyWBRYRJiVqR8UjVbHJBTs
 5TAF6mJbY3DYwD92rLTV4neOK+p1u6wDfEUBY218yca1wGtwMPWhGffoauJaG+5o3M
 YIKvH1ZiQs72RFI5oiTR5w+Huqt05b+6I0XhYiUA3wDZNfhszXIr/AtOkRk5Is6BJ6
 h4Y3eQPiGC6KzT9vhr3Q2Hjdwirl0kKtN6f4ql3XtYAqgl3SuRsBff3kmv6iluAKZ0
 1LM0Hv8xmfnAw==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix,
 from userid 48) id 8EFAEC43141; Tue, 16 May 2023 17:02:04 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 216119] 087451f372bf76d breaks hibernation on amdgpu Radeon R9
 390
Date: Tue, 16 May 2023 17:02:04 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Video(DRI - non Intel)
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: mario.limonciello@amd.com
X-Bugzilla-Status: RESOLVED
X-Bugzilla-Resolution: PATCH_ALREADY_AVAILABLE
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: bug_status resolution
Message-ID: <bug-216119-2300-hMXtrLp2G9@https.bugzilla.kernel.org/>
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

Mario Limonciello (AMD) (mario.limonciello@amd.com) changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
             Status|REOPENED                    |RESOLVED
         Resolution|---                         |PATCH_ALREADY_AVAILABLE

--- Comment #53 from Mario Limonciello (AMD) (mario.limonciello@amd.com) ---
> I believe my last issue regarding hibernation after this rewrite has been
> fixed somewhere in linux-stable 6.2.13: The desktop no longer freezes when
> VT-switching after resuming from hibernation. Seems to work fine for some
> days now.

That's great thanks!

> It could have been this commit as there has not been much else, but I have
> not investigated nor verified it:
https://git.kernel.org/pub/scm/linux/kernel/git/stable/linux.git/commit/?h=
=3Dlinux-6.2.y&id=3D56a03f64fedf49a4f81c5605167b6e7bb0300a59

This seems plausible to me because the GPU does reset on the way down for
hibernate and if it's poorly timed it could manifest similarly.

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
