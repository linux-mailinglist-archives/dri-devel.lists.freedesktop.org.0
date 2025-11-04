Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 84D77C32AFD
	for <lists+dri-devel@lfdr.de>; Tue, 04 Nov 2025 19:39:05 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4F09F10E2A6;
	Tue,  4 Nov 2025 18:39:02 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="evW30o9K";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6011D10E2A6
 for <dri-devel@lists.freedesktop.org>; Tue,  4 Nov 2025 18:39:00 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id 8279B601ED
 for <dri-devel@lists.freedesktop.org>; Tue,  4 Nov 2025 18:38:59 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 3193CC116B1
 for <dri-devel@lists.freedesktop.org>; Tue,  4 Nov 2025 18:38:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1762281539;
 bh=D8CfGGYNxGgGkMu+9q96F0ESYUvdAid07j/qI6hxtj4=;
 h=From:To:Subject:Date:In-Reply-To:References:From;
 b=evW30o9KC41SZFEZkWMjDuIJ/Ai0VyHeCpPgt50pxFbXm2BFae2NRz5+Rp/U/2DEO
 cpdJWcUFI7p1dYOqdte4Gqr+kxPrPAtXgngsgoMRvBHaEvjgxGd/pOA/PXStu2xWFa
 89idxVkhAcbubehL8rAukgJkkfSe2NKD7n00nIsiI9RoaHZjDuTnQFfYUt4rxJO+k2
 HyiEXtSLa6lEFW9E4OnKbdrdbCiA0ijYIDCdi21x5q3w5VwhcBf08700ujYdd6CVoD
 lXevCM5fjcRKkBbP+yFHh/bneCwizwGQbGKN1WSLyyo9JgEXafCYVUiqyfpt3Ganyi
 cqi8at387alSw==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix,
 from userid 48) id 29380C53BBF; Tue,  4 Nov 2025 18:38:59 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 220742] UBSAN: array-index-out-of-bounds in
 drivers/gpu/drm/radeon/radeon_atombios.c:2720:34 with AMD G-T56N
Date: Tue, 04 Nov 2025 18:38:58 +0000
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
Message-ID: <bug-220742-2300-GRojxn8mm4@https.bugzilla.kernel.org/>
In-Reply-To: <bug-220742-2300@https.bugzilla.kernel.org/>
References: <bug-220742-2300@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D220742

Artem S. Tashkinov (aros@gmx.com) changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
             Status|NEW                         |RESOLVED
         Resolution|---                         |ANSWERED

--- Comment #1 from Artem S. Tashkinov (aros@gmx.com) ---
Please report here

https://gitlab.freedesktop.org/drm/amd/-/issues

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
