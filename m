Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id ACD11A4CFCF
	for <lists+dri-devel@lfdr.de>; Tue,  4 Mar 2025 01:17:09 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2382F10E4EC;
	Tue,  4 Mar 2025 00:17:08 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="qL4IrRf6";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from nyc.source.kernel.org (nyc.source.kernel.org [147.75.193.91])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 48BF810E4EC
 for <dri-devel@lists.freedesktop.org>; Tue,  4 Mar 2025 00:17:06 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by nyc.source.kernel.org (Postfix) with ESMTP id 90007A45187
 for <dri-devel@lists.freedesktop.org>; Tue,  4 Mar 2025 00:11:34 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 50D3FC4CEEB
 for <dri-devel@lists.freedesktop.org>; Tue,  4 Mar 2025 00:17:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1741047425;
 bh=1f2BrYBmGHkp14arsGwQ6G723A9NPwPY2OuGAugyWwI=;
 h=From:To:Subject:Date:In-Reply-To:References:From;
 b=qL4IrRf6EAzIGal84f5IXtIeVfL8SLbxNaLubO/3cC/xgpEBJzRtiNV5dc+8ndk6o
 hZby4xWAe+QbkggFFsvAa9io1rbtSYU8CbiGrcgGxegwxuu4m5weRLAwqHGlnRUAH4
 VuWFwJLBf5JG+stmRlOn5x1EYL85pDH7iS3Md9e+UzqtmtLu3JFK4+FSKhdRHgmD6F
 aEOOHKyXogcY03nrHm2yABPReFkL3r80y+KyvPZRrEehQF2HNtM8NiWRTTu1cCc8pZ
 wylbl64+nvvDlob+Ulwfx8o6hmfjXPtQccv6QLsse2UWJLVG8G5WHoM3Qn/HMczGOj
 qBa+RHet9A3hA==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix,
 from userid 48) id 47BEBC4160E; Tue,  4 Mar 2025 00:17:05 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 219834] amdgpu: kernel oops dce_aux_transfer_raw
Date: Tue, 04 Mar 2025 00:17:04 +0000
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
Message-ID: <bug-219834-2300-cHdLE6tz7Q@https.bugzilla.kernel.org/>
In-Reply-To: <bug-219834-2300@https.bugzilla.kernel.org/>
References: <bug-219834-2300@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D219834

Artem S. Tashkinov (aros@gmx.com) changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
             Status|NEW                         |RESOLVED
         Resolution|---                         |ANSWERED

--- Comment #2 from Artem S. Tashkinov (aros@gmx.com) ---
Please repost here:

https://gitlab.freedesktop.org/drm/amd/-/issues

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
