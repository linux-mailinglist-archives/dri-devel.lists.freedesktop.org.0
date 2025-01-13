Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B4E18A0B05E
	for <lists+dri-devel@lfdr.de>; Mon, 13 Jan 2025 08:53:38 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2B96E10E05E;
	Mon, 13 Jan 2025 07:53:37 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="HDKEeUzM";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from nyc.source.kernel.org (nyc.source.kernel.org
 [IPv6:2604:1380:45d1:ec00::3])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8B54D10E05E
 for <dri-devel@lists.freedesktop.org>; Mon, 13 Jan 2025 07:53:36 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by nyc.source.kernel.org (Postfix) with ESMTP id 55095A40C3C
 for <dri-devel@lists.freedesktop.org>; Mon, 13 Jan 2025 07:51:47 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 3D860C4CEE5
 for <dri-devel@lists.freedesktop.org>; Mon, 13 Jan 2025 07:53:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1736754815;
 bh=KIzMAtZ+kJFMkujHo647O4YFaWvD3J1LbPBQo5/oZbQ=;
 h=From:To:Subject:Date:In-Reply-To:References:From;
 b=HDKEeUzMgUshFGQ/e1UGjnkNqEkaSlP6vk0KGxul0rX+dV8eoZrnBqOA94Myu3Urn
 ORwX3WCsMe1WUQyQ7MFaaBbD7NTUwSigw0u7ZjfpTl66OgyKKf9CbPJZvteOD5rpFX
 RAG5jGyyAHx9RXXMhfYnQM6aEsWCfQK3JOL8x3cBcIJF+QTFgqasETUuFeSCB1KtjX
 vHG0yaTRjJprZYyl+p+8NOhiJ5RNoRUfHOwkb4CRhbjzS9xFABI54YIY33ktRCDR0f
 vpfQUEK3qOlt92kLAo1+8vLxlUis8LUe/4+3dfGXQKIHBIkhjqDkyTRHDgZJFj10Cu
 ffCuVrwpFL64g==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix,
 from userid 48) id 25FBDC41612; Mon, 13 Jan 2025 07:53:35 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 219689] Kernel Logs Reveal Multiple AMD Driver Issues
Date: Mon, 13 Jan 2025 07:53:34 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo CC drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Video(DRI - non Intel)
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: blocking
X-Bugzilla-Who: aros@gmx.com
X-Bugzilla-Status: RESOLVED
X-Bugzilla-Resolution: ANSWERED
X-Bugzilla-Priority: P3
X-Bugzilla-Assigned-To: drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: bug_status resolution
Message-ID: <bug-219689-2300-NdwsOJvDpH@https.bugzilla.kernel.org/>
In-Reply-To: <bug-219689-2300@https.bugzilla.kernel.org/>
References: <bug-219689-2300@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D219689

Artem S. Tashkinov (aros@gmx.com) changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
             Status|NEW                         |RESOLVED
         Resolution|---                         |ANSWERED

--- Comment #1 from Artem S. Tashkinov (aros@gmx.com) ---
Informational messages can generally be disregarded.

As for functional bugs you can file them here:

https://gitlab.freedesktop.org/drm/amd/-/issues

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.
You are watching someone on the CC list of the bug.=
