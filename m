Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CCFEC718A61
	for <lists+dri-devel@lfdr.de>; Wed, 31 May 2023 21:44:41 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C1C3210E023;
	Wed, 31 May 2023 19:44:37 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1F63110E023
 for <dri-devel@lists.freedesktop.org>; Wed, 31 May 2023 19:44:35 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 2262A615CB
 for <dri-devel@lists.freedesktop.org>; Wed, 31 May 2023 19:44:34 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 85DA8C4339C
 for <dri-devel@lists.freedesktop.org>; Wed, 31 May 2023 19:44:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1685562273;
 bh=nnonijAszuueZj6+W7X8qNzWOGyPJMHQMg07ZlO2AdY=;
 h=From:To:Subject:Date:In-Reply-To:References:From;
 b=ln2W2N1jvkCfGwky+68DRFa3Q0PJQy8StNz0PwtceTgdEcbYcwt+baz7Pmea+2erO
 kWq67kkPWNmkv0qxRKPWrYpfcNUIEjqpLu7NruaodEhmzj4DTtTYGBqkYR/AEGgCKa
 LNk14AJ848MuIYK90UA5GAbF1LqnBMRvCbjDhGhK0ClVzdGnzhQTZUqvVZDS2Y5IkL
 DLMUftM0CyorPMGwE5hn0O+pIhNw1tSlHRilnZadUmXyMgFENNLfvRXlOxrB8j3tRj
 QxxaiieZiMqN3CWtjWQ7ECl5E7zO+za0vvJkLEyyNpzN6uwm8KYwNApdQVcddkcpUz
 C/PYA6Z2B3cHw==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix,
 from userid 48) id 6FEF1C43144; Wed, 31 May 2023 19:44:33 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 217514] [amdgpu] system doesn't boot after linux-firmware
 2023-05-23 ffe1a41e
Date: Wed, 31 May 2023 19:44:33 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Video(DRI - non Intel)
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: rly@hotmail.hu
X-Bugzilla-Status: RESOLVED
X-Bugzilla-Resolution: PATCH_ALREADY_AVAILABLE
X-Bugzilla-Priority: P3
X-Bugzilla-Assigned-To: drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: bug_status resolution
Message-ID: <bug-217514-2300-ikwJHjFROp@https.bugzilla.kernel.org/>
In-Reply-To: <bug-217514-2300@https.bugzilla.kernel.org/>
References: <bug-217514-2300@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D217514

rLy (rly@hotmail.hu) changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
             Status|NEW                         |RESOLVED
         Resolution|---                         |PATCH_ALREADY_AVAILABLE

--- Comment #3 from rLy (rly@hotmail.hu) ---
(In reply to Alex Deucher from comment #2)
> Does this kernel change fix the issues?
> https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/
> ?id=3D5ee33d905f89c18d4b33da6e5eefdae6060502df

Well, it turns out arch updated the kernel to 6.3.5 yesterday evening, xanm=
od
this morning which I didn't noticed earlier (I first encountered the issue =
like
2 days ago) and that already includes this patch and it's indeed working no=
w. I
guess this can be closed.
Thank you!

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
