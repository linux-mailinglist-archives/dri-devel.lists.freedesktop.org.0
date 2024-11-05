Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A754A9BCF12
	for <lists+dri-devel@lfdr.de>; Tue,  5 Nov 2024 15:22:13 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7041C10E5BC;
	Tue,  5 Nov 2024 14:22:10 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="YzSz58i9";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from nyc.source.kernel.org (nyc.source.kernel.org [147.75.193.91])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 09E5010E5BC
 for <dri-devel@lists.freedesktop.org>; Tue,  5 Nov 2024 14:22:09 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by nyc.source.kernel.org (Postfix) with ESMTP id 193EEA43336
 for <dri-devel@lists.freedesktop.org>; Tue,  5 Nov 2024 14:20:13 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id BE1E6C4CECF
 for <dri-devel@lists.freedesktop.org>; Tue,  5 Nov 2024 14:22:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1730816527;
 bh=l/tm562a98wLcDZL9LXzwjsk86Ti52f7GGN8ytfWifc=;
 h=From:To:Subject:Date:In-Reply-To:References:From;
 b=YzSz58i9q7BfELZbJiq2KEBMkJXE8yP5WyXlfdubVeyWb/Q20i9/v96msJRwJWa+N
 OSk/ZfWemGNmIXdz9MzV/syKplQDc93mFz1ORTtuXKz0Ar7oaWWA9gG4wmTVlHkRai
 YsspmjxfS0lRcZPJDI3ypXhcWiBB73XJr4ZVjF0vdBU1ln0Y6FFUkbMDYCCPGnyXVq
 YUplvxMlVLL2sLsjHh48LKS4xad1ND5MWt16wpU1WAyzUEpEslqajKHFvTwbf1pRKT
 ziHQPSphPmQCxq+dpsI7ML0wELNmKPNS8dTcT4KT+9JzLrMoLZtUvPNsjfuahK0jSV
 P6d5SWdOuTuLQ==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix,
 from userid 48) id B5C4AC53BBF; Tue,  5 Nov 2024 14:22:07 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 219468] Screen flickering on Radeon 680M - 6.12
Date: Tue, 05 Nov 2024 14:22:07 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Video(DRI - non Intel)
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: low
X-Bugzilla-Who: aros@gmx.com
X-Bugzilla-Status: RESOLVED
X-Bugzilla-Resolution: ANSWERED
X-Bugzilla-Priority: P3
X-Bugzilla-Assigned-To: drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: bug_status resolution
Message-ID: <bug-219468-2300-t9DMXPhLSW@https.bugzilla.kernel.org/>
In-Reply-To: <bug-219468-2300@https.bugzilla.kernel.org/>
References: <bug-219468-2300@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D219468

Artem S. Tashkinov (aros@gmx.com) changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
             Status|NEW                         |RESOLVED
         Resolution|---                         |ANSWERED

--- Comment #4 from Artem S. Tashkinov (aros@gmx.com) ---
Please refile here: https://gitlab.freedesktop.org/drm/amd/-/issues

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
