Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E7D2DCDD135
	for <lists+dri-devel@lfdr.de>; Wed, 24 Dec 2025 22:43:13 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 52A4F10F0BE;
	Wed, 24 Dec 2025 21:43:12 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="JzfoIoiY";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id ACD3410F0BE
 for <dri-devel@lists.freedesktop.org>; Wed, 24 Dec 2025 21:43:11 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id 5AE5D41E4A
 for <dri-devel@lists.freedesktop.org>; Wed, 24 Dec 2025 21:43:11 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 2F3DBC116D0
 for <dri-devel@lists.freedesktop.org>; Wed, 24 Dec 2025 21:43:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1766612591;
 bh=75zPXjlQO20+ULCwOhxvmVYo4FvS/W41NWkgPg2BCUM=;
 h=From:To:Subject:Date:In-Reply-To:References:From;
 b=JzfoIoiY/qfLD+8hjP8OEFsXR4VN6oSEFtDhyMXwLB6CrlgPipmlgmew8HefbPUUD
 p6rtrLb0Dqt32LuhFti9cv32/ztL252xWvKzG6bflsQQsMd/6C0H057oz23T9rfmjt
 rzeeXpFyVIWrkI2lEQQ7F3gPk16Jzcb9Qx67DwagxrP1EFULBrRSiJub/fVnbe22xK
 qb0mskSKE/VafW4iatl/INVNXdqqzUfPPgN6ZCX0mddC7NHhs2LQUefAEj4ULBC97A
 Xtl7naiux/nMdjdaY0eaZYefvJb7bYX4Gupaccp3o7HJepIWE75HEX7Md5tR2cfrfk
 zFq2NK2HHlbxQ==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix,
 from userid 48) id 23157C53BBF; Wed, 24 Dec 2025 21:43:11 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 220906] Regression: 4K display output fails on ThinkPad
 Thunderbolt 4 Dock with AMD GPU (Worked in 6.17.1, broken in 6.17.11)
Date: Wed, 24 Dec 2025 21:43:10 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Video(DRI - non Intel)
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: danandrei@gmail.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P3
X-Bugzilla-Assigned-To: drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: cf_regression
Message-ID: <bug-220906-2300-ZvGPWijHll@https.bugzilla.kernel.org/>
In-Reply-To: <bug-220906-2300@https.bugzilla.kernel.org/>
References: <bug-220906-2300@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D220906

Andrei (danandrei@gmail.com) changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
         Regression|No                          |Yes

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
