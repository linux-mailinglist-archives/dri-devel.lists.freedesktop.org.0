Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 30D4CB50513
	for <lists+dri-devel@lfdr.de>; Tue,  9 Sep 2025 20:16:23 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 992EE10E266;
	Tue,  9 Sep 2025 18:16:21 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="htQBrnRf";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9A87B10E266
 for <dri-devel@lists.freedesktop.org>; Tue,  9 Sep 2025 18:16:20 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id 3C53443E8B
 for <dri-devel@lists.freedesktop.org>; Tue,  9 Sep 2025 18:16:20 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 1B7ECC4CEF4
 for <dri-devel@lists.freedesktop.org>; Tue,  9 Sep 2025 18:16:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1757441780;
 bh=/ZeckGDVvLH+5/ndDqkGkdgoG/FEBL9AJ3wTTKSV/xI=;
 h=From:To:Subject:Date:In-Reply-To:References:From;
 b=htQBrnRfFCJxAKLrEkNOucoQ+KGCmv4h7D1x6ZjFpU/2kNeP5wyc8nl7XkkZ9l2Nl
 JqsysawO47bfh39+r0ZqJ+MMo8+jTAuSU75N3DAByFcz7ooX/7pYRZMz9Fcb4L1tM8
 M/frRCxxifWkolN5ahStzKPQRTDiGKR7kgzj9+iBW6wV08qOqxDWafpoVYJe2iHsVB
 Xx5eE/9xf2Sk/1O6kDSKEbE197WrUOc0UcvauScN2uhL8dqcx0ggg2mmGpgDxxXOKI
 9IQMnzf4njmgQ8lH+qn085hE55XXX15C67XuNitCFAkuC0o6lnjeBsWDTOIo36G+oP
 ggNU7TRx6EKbQ==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix,
 from userid 48) id 14991C41612; Tue,  9 Sep 2025 18:16:20 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 220553] Suspend to mem fails on rx5600xt (regression in 6.16.2)
Date: Tue, 09 Sep 2025 18:16:19 +0000
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
Message-ID: <bug-220553-2300-7PYWIsIbLp@https.bugzilla.kernel.org/>
In-Reply-To: <bug-220553-2300@https.bugzilla.kernel.org/>
References: <bug-220553-2300@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D220553

Artem S. Tashkinov (aros@gmx.com) changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
             Status|NEW                         |RESOLVED
         Resolution|---                         |ANSWERED

--- Comment #1 from Artem S. Tashkinov (aros@gmx.com) ---
Please refile here:

https://gitlab.freedesktop.org/drm/amd/-/issues

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
