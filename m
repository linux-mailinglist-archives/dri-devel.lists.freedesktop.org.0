Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9F78CBA7687
	for <lists+dri-devel@lfdr.de>; Sun, 28 Sep 2025 21:03:31 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 38B2410E164;
	Sun, 28 Sep 2025 19:03:28 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="vNHrPDun";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 287E210E164
 for <dri-devel@lists.freedesktop.org>; Sun, 28 Sep 2025 19:03:27 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id 1CB8D621B6
 for <dri-devel@lists.freedesktop.org>; Sun, 28 Sep 2025 19:03:26 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id B814DC4CEF0
 for <dri-devel@lists.freedesktop.org>; Sun, 28 Sep 2025 19:03:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1759086205;
 bh=SgS7O1uCFkfFyyL0CsG1SZWJThI2JHfHrK2DBdl2w7U=;
 h=From:To:Subject:Date:In-Reply-To:References:From;
 b=vNHrPDun5SFpA6AudcLpraCvcVGSOJuS0ODD94gYkloF+gZ+UvO2od0ZaYLlabMOU
 Ya3Ppo46fbEy2+HATXVC29m4y809t/rVwxlMCLQFFX23yO/36smJlpgJCNf0pgxQF6
 9WG20b2IRYg5zfvF7qKRT7aUhxm6wIHq53KGXjYDV7X/KMHpkQ2jxGoZOlO/PpgpyF
 RNPWXAIGCHTjpk4Bq76aN5aXBH8Tu6RBpy4TeIiDHqjbrhZNSHhKLpt3ji4zo9D1iv
 sCthEX1CgIc8+BrMBcOCNDBkui6c8b9iErC3lbD9RpQY3C4grTQCgApjluLVNj9y4k
 g15ZAMMfWMtXw==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix,
 from userid 48) id AB292C41616; Sun, 28 Sep 2025 19:03:25 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 220608] Tegra-X1 (t210) error on nouveau_drm initialization
Date: Sun, 28 Sep 2025 19:03:25 +0000
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
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-220608-2300-rPG2gDia2A@https.bugzilla.kernel.org/>
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

--- Comment #3 from dofficialgman@gmail.com ---
It has come to my attention this is probably filed in the wrong place and I
should instead refer to https://nouveau.freedesktop.org/Bugs.html . I will =
do
that and link back here.

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
