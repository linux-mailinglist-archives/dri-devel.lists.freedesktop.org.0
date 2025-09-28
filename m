Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9B6E6BA766C
	for <lists+dri-devel@lfdr.de>; Sun, 28 Sep 2025 20:53:28 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 394D888CE4;
	Sun, 28 Sep 2025 18:53:25 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="MpEqvYrj";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6308B88CE4
 for <dri-devel@lists.freedesktop.org>; Sun, 28 Sep 2025 18:53:24 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id 7F7AB621AE
 for <dri-devel@lists.freedesktop.org>; Sun, 28 Sep 2025 18:53:23 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 29EB7C4CEF0
 for <dri-devel@lists.freedesktop.org>; Sun, 28 Sep 2025 18:53:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1759085603;
 bh=CbLu8aHgkZqtZTA8lYhZ7ZS5FMUAjGN4S4VT8tPOWbc=;
 h=From:To:Subject:Date:In-Reply-To:References:From;
 b=MpEqvYrjhrqnbOy+oRj28QKCuDFxklRE69s+dpUxkuQr+JuD1L7kUjuzRaiGB/2YF
 cY6DaZtoJWVyLvTs6stotKnS+rRSHmRXqGs1H8YnoRaliz0o9Obx+ESwECn6qmgqWq
 rkoXA9M7O4kqyrbCMGsez7EDtEt+AaJw9FZ0JyEGFKJ6oTtBI5DuG/I5bpqXE80VZS
 WHDYFiOgCOxOtb+ZloftJj89CpjKvevId11axgYg8iwrd3qmYrY85aJayIbxgeAxFt
 HwYUhOyenlHd93QfrFFpWiE30nkK+xIhmsePGSMdU834ADc/UJ1jtUB3+dnDQAsGFx
 mdQFajC5+aZZw==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix,
 from userid 48) id 1D0C4C41616; Sun, 28 Sep 2025 18:53:23 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 220608] Tegra-X1 (t210) error on nouveau_drm initialization
Date: Sun, 28 Sep 2025 18:53:22 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Video(DRI - non Intel)
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: high
X-Bugzilla-Who: dofficialgman@gmail.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P3
X-Bugzilla-Assigned-To: drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: attachments.created
Message-ID: <bug-220608-2300-zuzrDUzn05@https.bugzilla.kernel.org/>
In-Reply-To: <bug-220608-2300@https.bugzilla.kernel.org/>
References: <bug-220608-2300@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D220608

--- Comment #1 from dofficialgman@gmail.com ---
Created attachment 308727
  --> https://bugzilla.kernel.org/attachment.cgi?id=3D308727&action=3Dedit
typical dmesg logs

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
