Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5D0EF713A24
	for <lists+dri-devel@lfdr.de>; Sun, 28 May 2023 16:37:37 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7174410E0A1;
	Sun, 28 May 2023 14:37:35 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 09A6410E0A1
 for <dri-devel@lists.freedesktop.org>; Sun, 28 May 2023 14:37:34 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 7C7D160B73
 for <dri-devel@lists.freedesktop.org>; Sun, 28 May 2023 14:37:33 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id E3777C4339C
 for <dri-devel@lists.freedesktop.org>; Sun, 28 May 2023 14:37:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1685284652;
 bh=SK4QcZF+lq1J0sAUui4iK/UePUG7My5JPmgWLUNj38g=;
 h=From:To:Subject:Date:In-Reply-To:References:From;
 b=AWoIsUnDncSp5q+FiXFQKYMghNcbfZae8kizZvQvkDeENZgqH9L0AwU9ECt+IDYUJ
 dyN+4xMIkIHZ1gEXEVfBRzUO8iVg9W7qjRacG78JWCW9w/PXGue3JOmuLum8C0dIQe
 EPFngfFeZEy6YYE2ngO7Co31B1g8SVQ7NTXdKraadRCUK+1a1UyMAR86o2bKvikS6A
 2/ki58hPQwd9B/G0+IFBUXZw5C/kfeNWTk9ROapnTPtWPLZ2kru82Z5ld6pNRsyA+I
 aIYNJCfLuwzMTucLoi0FHOKsaC+Shpw7BYRcueCVo0wxTj5anoG3FEE3YtEfT3J0mJ
 mCHw3NDkst1sQ==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix,
 from userid 48) id D37CAC43143; Sun, 28 May 2023 14:37:32 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 217499] NVIDIA drivers fail to install on 6.4.0-rc3-1-mainline
 kernel
Date: Sun, 28 May 2023 14:37:32 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Video(DRI - non Intel)
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: wessel.working+kernel@gmail.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P3
X-Bugzilla-Assigned-To: drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: bug_file_loc
Message-ID: <bug-217499-2300-gV2GGVX5JA@https.bugzilla.kernel.org/>
In-Reply-To: <bug-217499-2300@https.bugzilla.kernel.org/>
References: <bug-217499-2300@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D217499

Wessel (wessel.working+kernel@gmail.com) changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
                URL|                            |https://forum.garudalinux.o
                   |                            |rg/t/nvidia-drivers-fail-to
                   |                            |-install-on-6-4-0-rc3-1-mai
                   |                            |nline-kernel/28769

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
