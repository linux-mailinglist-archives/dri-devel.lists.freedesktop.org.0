Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C6C244C8DAD
	for <lists+dri-devel@lfdr.de>; Tue,  1 Mar 2022 15:27:36 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B646F10E2C7;
	Tue,  1 Mar 2022 14:27:34 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D5CBE10E363
 for <dri-devel@lists.freedesktop.org>; Tue,  1 Mar 2022 14:27:32 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 1D6B861555
 for <dri-devel@lists.freedesktop.org>; Tue,  1 Mar 2022 14:27:32 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 79A34C340F3
 for <dri-devel@lists.freedesktop.org>; Tue,  1 Mar 2022 14:27:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1646144851;
 bh=JE6WTpt4JEQvmy63hwDHeLvBii5g9ihLmjTrgiILbUE=;
 h=From:To:Subject:Date:In-Reply-To:References:From;
 b=nZ3wUodzuov9UppdXgrIGHj9VrMuh8M5D5phu4e/TeL56+os6VRCnc+wDp83Nk2J2
 QvxdEeoapAiig1GhRpZU2wqYU70lOyhDQ+5a6EGS/PK6JQOPmpen35v9OBszYxA4oE
 Clq+Clr5ogdZFm+2aoT2CI+Wb32cSyjaSh032rg3Hwn/GXyVwbLyiwbS6KUpJBqujH
 BZrFEAeKOxywSuCaO3/vDHRVbAE3RsaCAcFjkQipZ7mrfrfgObTmrGauOdF7buSNqY
 6aybiUM2ZiUi67ujMZzU4XA1SwIih2Enj5EP04rUICROeZNwJKWA409vM10wPcipma
 16kLkKuihj4vQ==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix,
 from userid 48) id 53C41C05FCE; Tue,  1 Mar 2022 14:27:31 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 215511] Dual monitor with amd 5700 causes system to hang at
 startup.
Date: Tue, 01 Mar 2022 14:27:31 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Video(DRI - non Intel)
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: pr_kernel@tum.fail
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-215511-2300-iOoPiUHnUq@https.bugzilla.kernel.org/>
In-Reply-To: <bug-215511-2300@https.bugzilla.kernel.org/>
References: <bug-215511-2300@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D215511

--- Comment #9 from Philipp Riederer (pr_kernel@tum.fail) ---
Certainly. Thank you!

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
