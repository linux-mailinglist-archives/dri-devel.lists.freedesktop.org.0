Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D1BA8A232B4
	for <lists+dri-devel@lfdr.de>; Thu, 30 Jan 2025 18:19:57 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 67F1710E045;
	Thu, 30 Jan 2025 17:19:55 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="CKCBfca5";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from nyc.source.kernel.org (nyc.source.kernel.org [147.75.193.91])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 321FE10E045
 for <dri-devel@lists.freedesktop.org>; Thu, 30 Jan 2025 17:19:54 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by nyc.source.kernel.org (Postfix) with ESMTP id 75D2DA41FE0
 for <dri-devel@lists.freedesktop.org>; Thu, 30 Jan 2025 17:18:06 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id B589AC4CEE7
 for <dri-devel@lists.freedesktop.org>; Thu, 30 Jan 2025 17:19:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1738257592;
 bh=LDphMttqNUqFn9KZ1qFkWPvHWf0vb0GocPSoUrrogFU=;
 h=From:To:Subject:Date:In-Reply-To:References:From;
 b=CKCBfca5fxswqQpBtETRrJiOYiaTyB7+us7ueBtzf3PsiNsUGv+sh+R0jB1iVNbz/
 ki2dmbbgOmskVawoj8g0m0TOZHYg2/RvkQLD6MhmdW3sKkPUZOkxxMUooe2D0CHDQ1
 JrsFDvybA5yFSTaKSLWU5kqlGKC7v6EBWgbbbDtq26XWwatnRv7DGbC0dHvdPgo01K
 S5MgkUEoX1eEG6r0bIjoM3adjkZGlHUymYKFjRYI/BgPXHUyRpA3hQZp0xD0x2bbp2
 J2mI74911wXlqRKhmzWCJtjt+uQ07o15g1t8v4istxmg81cyJyo0oybicVCMsROPfY
 Tg4LOAuJg2A7A==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix,
 from userid 48) id B033EC41615; Thu, 30 Jan 2025 17:19:52 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 211807] [drm:drm_dp_mst_dpcd_read] *ERROR* mstb
 000000004e6288dd port 3: DPCD read on addr 0x60 for 1 bytes NAKed
Date: Thu, 30 Jan 2025 17:19:52 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Video(DRI - non Intel)
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: low
X-Bugzilla-Who: sidrabushra0@gmail.com
X-Bugzilla-Status: RESOLVED
X-Bugzilla-Resolution: ANSWERED
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: cc
Message-ID: <bug-211807-2300-Bxduxp6sHV@https.bugzilla.kernel.org/>
In-Reply-To: <bug-211807-2300@https.bugzilla.kernel.org/>
References: <bug-211807-2300@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D211807

Myasiantv (sidrabushra0@gmail.com) changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
                 CC|                            |sidrabushra0@gmail.com

--- Comment #31 from Myasiantv (sidrabushra0@gmail.com) ---
Official MyAsianTV free watch, download and get update about latest drama
releases in Korean, Taiwanese, Hong Kong, and Chinese with English subtitle=
s.
<a href=3D"https://myassiantv.de/">myasiantv</a>

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
