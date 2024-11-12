Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9051F9C5565
	for <lists+dri-devel@lfdr.de>; Tue, 12 Nov 2024 12:06:10 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C1E9610E5BF;
	Tue, 12 Nov 2024 11:06:08 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="LT1CSLXf";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from nyc.source.kernel.org (nyc.source.kernel.org [147.75.193.91])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 99FA610E5BC
 for <dri-devel@lists.freedesktop.org>; Tue, 12 Nov 2024 11:06:07 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by nyc.source.kernel.org (Postfix) with ESMTP id 56D82A41995
 for <dri-devel@lists.freedesktop.org>; Tue, 12 Nov 2024 11:04:10 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 403BCC4CECD
 for <dri-devel@lists.freedesktop.org>; Tue, 12 Nov 2024 11:06:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1731409564;
 bh=MZWik20Ovz1zIVZASROQBr4u3ZO9alDYd5kzVyFJ4Hc=;
 h=From:To:Subject:Date:In-Reply-To:References:From;
 b=LT1CSLXfCEAsjF+SDxcC0IjiY0KYT7eY7g1a+uePB7oMcPXfg1MQjLPDSdUG1mVX+
 gwEtfU8pMTU6/hV9bhDqCxrepDdL9kb0rFs3is6No4UE+htWNvriPaaRC8C87znn3y
 7EtVNFH+mh7OnegENkW8vfoynxlx1/W0zIP/jrHpJubLPB9pI15/PUVmyre+TOvXcd
 WyyFlD/CwETBnv8OgfPyNafO/m5oAFK8MrDiZ0hEcMu9Zk5OQEUbRoFqCRePo26+E/
 kokdqDYBRFWD9QUsKkUOOjkUxmSKXUT04FnpH6gMC5du7ULCoHlcwCFzEaLNRBBVC2
 WlX/ShaoOZNfA==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix,
 from userid 48) id 26275C53BBF; Tue, 12 Nov 2024 11:06:04 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 219492] amdgpu: failed to write reg 28b4 wait reg 28c6 and
 amdgpu: failed to write reg 1a6f4 wait reg 1a706
Date: Tue, 12 Nov 2024 11:06:03 +0000
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
X-Bugzilla-Priority: P3
X-Bugzilla-Assigned-To: drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: bug_status resolution
Message-ID: <bug-219492-2300-IuBikVN0ys@https.bugzilla.kernel.org/>
In-Reply-To: <bug-219492-2300@https.bugzilla.kernel.org/>
References: <bug-219492-2300@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D219492

Artem S. Tashkinov (aros@gmx.com) changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
             Status|NEW                         |RESOLVED
         Resolution|---                         |ANSWERED

--- Comment #1 from Artem S. Tashkinov (aros@gmx.com) ---
Please first test 6.11.7 and if it's still reproducible, report here:
https://gitlab.freedesktop.org/drm/amd/-/issues

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
