Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 518D7BA768D
	for <lists+dri-devel@lfdr.de>; Sun, 28 Sep 2025 21:06:39 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 284FD10E210;
	Sun, 28 Sep 2025 19:06:36 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="JzS+oyRh";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 63B4C10E1FE
 for <dri-devel@lists.freedesktop.org>; Sun, 28 Sep 2025 19:06:35 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id 0923045111
 for <dri-devel@lists.freedesktop.org>; Sun, 28 Sep 2025 19:06:35 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id DCB9BC4CEF0
 for <dri-devel@lists.freedesktop.org>; Sun, 28 Sep 2025 19:06:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1759086394;
 bh=SLGQ+TEUoitwnNDsUkLzdgxo+2KFvOQHZv4cwBYQM4Q=;
 h=From:To:Subject:Date:In-Reply-To:References:From;
 b=JzS+oyRhNac4TPEoEhMMIw7b8v55M2/xrssIB5sJ3Fp/xLMJYGgg7k9tyfREYfP5n
 5SCoQQVGEWoigdNN0drEae7mw5CPoyxqy3tg/RCfxjU3Qb1AVZdb1UfEb++hHZ5rj6
 o32HrlPuG+oxLH+pjYVj/eiUo+RBDPMBtXvvJUhgPEILqFoSN68ooyH2ToTlbwAbv4
 rb7cgm5vjDb0rG2RGWN7yS7w25gzS4PCAgX8MSbnCEwi7k/fKXZzPafW5r31gxI/aA
 dsH48sYZ8c2fOcIYfWW2mvIM3Mysgnk1rCA32sQauxNeuxFt+6QyFCH5wwisj2/AhH
 siYnZWTSBWC+Q==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix,
 from userid 48) id D1437C41616; Sun, 28 Sep 2025 19:06:34 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 220608] Tegra-X1 (t210) error on nouveau_drm initialization
Date: Sun, 28 Sep 2025 19:06:34 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Video(DRI - non Intel)
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: high
X-Bugzilla-Who: dofficialgman@gmail.com
X-Bugzilla-Status: RESOLVED
X-Bugzilla-Resolution: MOVED
X-Bugzilla-Priority: P3
X-Bugzilla-Assigned-To: drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: bug_status resolution
Message-ID: <bug-220608-2300-WPTdyVWzb3@https.bugzilla.kernel.org/>
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

dofficialgman@gmail.com changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
             Status|NEW                         |RESOLVED
         Resolution|---                         |MOVED

--- Comment #4 from dofficialgman@gmail.com ---
marking as moved to https://gitlab.freedesktop.org/drm/nouveau/-/issues/445

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
