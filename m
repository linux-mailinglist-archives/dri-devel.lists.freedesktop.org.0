Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A711793E795
	for <lists+dri-devel@lfdr.de>; Sun, 28 Jul 2024 18:12:01 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 35D0210E013;
	Sun, 28 Jul 2024 16:11:59 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="fhYXV6mq";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2E44010E013
 for <dri-devel@lists.freedesktop.org>; Sun, 28 Jul 2024 16:11:58 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 9B17C611F1
 for <dri-devel@lists.freedesktop.org>; Sun, 28 Jul 2024 16:11:57 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 4D713C4AF0B
 for <dri-devel@lists.freedesktop.org>; Sun, 28 Jul 2024 16:11:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1722183117;
 bh=MZ5LP3pQA++FV10vq+WVrKcuv5vW74xiNC1M2S5DugM=;
 h=From:To:Subject:Date:In-Reply-To:References:From;
 b=fhYXV6mq35aBwlo4mVYsk27/swulvG/97hBuPrlNJhHgsTBeY+DDk6dRzoyUpSAO8
 OBYZ3wpp7t16mcqzK9Qlt0MP1THOC12XdWJQAyBH/wGAGYa7FvnfPBE3fdUmqqBBiW
 u74TaoD2pUdA91KIoJVLZ/mmn0t/mB/Y8xdV2erPM4PtHiGRuOCQoVuUbT2+/LsO48
 wPXm39Tugq6gAUEpRrNqfQqMut64XxKqVt63wuM+/qXr/lw1VniPbHOJQVxHq7WVcV
 u4araNqjFczYE5smHXbc9p22jGryPajKy4UqmBkAsoCQQgeaEQOzHM8JqmAVTQB2lx
 ZrFlMzwJrVJJA==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix,
 from userid 48) id 36F22C53BB8; Sun, 28 Jul 2024 16:11:57 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 219091] amdgpu: after updating to linux 6.10, screen flickering
 occurs
Date: Sun, 28 Jul 2024 16:11:56 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Video(DRI - non Intel)
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: high
X-Bugzilla-Who: christian@heusel.eu
X-Bugzilla-Status: RESOLVED
X-Bugzilla-Resolution: ANSWERED
X-Bugzilla-Priority: P3
X-Bugzilla-Assigned-To: drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-219091-2300-JUz5ensodo@https.bugzilla.kernel.org/>
In-Reply-To: <bug-219091-2300@https.bugzilla.kernel.org/>
References: <bug-219091-2300@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D219091

--- Comment #4 from Christian Heusel (christian@heusel.eu) ---
Yes the mentioned patch fixes the issue for the reporter I have been in con=
tact
with!

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
