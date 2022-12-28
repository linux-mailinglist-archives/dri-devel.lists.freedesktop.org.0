Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id F101D6572FC
	for <lists+dri-devel@lfdr.de>; Wed, 28 Dec 2022 06:39:11 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 92BBA10E19B;
	Wed, 28 Dec 2022 05:39:05 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7174610E19B
 for <dri-devel@lists.freedesktop.org>; Wed, 28 Dec 2022 05:39:03 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 7C044612EA
 for <dri-devel@lists.freedesktop.org>; Wed, 28 Dec 2022 05:38:28 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id CEE97C433EF
 for <dri-devel@lists.freedesktop.org>; Wed, 28 Dec 2022 05:38:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1672205907;
 bh=W638NtSDKaT/SkAlrsiqCt+TP6M4vJjDv+m3SfqzbyQ=;
 h=From:To:Subject:Date:In-Reply-To:References:From;
 b=IH1zN9oARTbckWtxhWPf8cT1PL7HtvbvkMto9Ts9nKhON+VWqTBhQR1zLkGC/FIJZ
 P/gbsHvZfBohJgBvZ4qcw2Xn8UQEmRFY/PINZqAAxtovI/UU06q6x+o2N3pP9q8R6I
 j+4rmWPc+TpLOHxpQu9Ejd3X9HFB9gaCu7o+TOLOFkGu9qZybRa7Yw8qJPC5FOVsls
 hqMp/YrfIAWuUzmFa55A5RJ31X0pCfGdtJaSDz9ea7tFGtXqfYjB9i+OyvY1DIQhXH
 z07ScWxjROtltMh3zjlvXwYn6V5ZabvPk3e/whgEhzM+h1EIQPqYaMIhsAEDr7zJDE
 AxspQxKlMysHg==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix,
 from userid 48) id B29E5C43144; Wed, 28 Dec 2022 05:38:27 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 216855] drivers/gpu/drm/nouveau/dispnv50/wndw.c:696:1: warning:
 conflicting types
Date: Wed, 28 Dec 2022 05:38:27 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Video(DRI - non Intel)
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: aros@gmx.com
X-Bugzilla-Status: RESOLVED
X-Bugzilla-Resolution: ANSWERED
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: bug_status resolution
Message-ID: <bug-216855-2300-OcQU9t4nLw@https.bugzilla.kernel.org/>
In-Reply-To: <bug-216855-2300@https.bugzilla.kernel.org/>
References: <bug-216855-2300@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D216855

Artem S. Tashkinov (aros@gmx.com) changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
             Status|NEW                         |RESOLVED
         Resolution|---                         |ANSWERED

--- Comment #1 from Artem S. Tashkinov (aros@gmx.com) ---
Please repost here https://gitlab.freedesktop.org/drm/nouveau/-/issues/

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
