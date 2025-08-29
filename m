Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1D286B3BA03
	for <lists+dri-devel@lfdr.de>; Fri, 29 Aug 2025 13:36:14 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4E4FD10E084;
	Fri, 29 Aug 2025 11:36:12 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="uyOMHT5t";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B3FB810E084
 for <dri-devel@lists.freedesktop.org>; Fri, 29 Aug 2025 11:36:11 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id B2CE260054
 for <dri-devel@lists.freedesktop.org>; Fri, 29 Aug 2025 11:36:10 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 65CD1C4CEF1
 for <dri-devel@lists.freedesktop.org>; Fri, 29 Aug 2025 11:36:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1756467370;
 bh=tq8a9KfyL3GW3F7V3EtQfZFNt1HqyUzGM6KwzHOzuRk=;
 h=From:To:Subject:Date:In-Reply-To:References:From;
 b=uyOMHT5tXD5YkAQ2uLY+5o0PX8YDJIfpcCOP0yXEXP/K1BvEtHC9HMD4dNDVPJ3+8
 UFb/7iZHQ8pOJUVShPW+4y3O5BBWGaE8AyQTwmis+M704Vfft2oMc8qQ/OlRZBM1gb
 IFNBWfs0JlEtLtTzN2J5KKe0gQNeJUrRC2Y3ucQso6Ch6gBRIB5WkqvBXYDHU2F0N0
 9rjEnbDdtAMSiWtQQQJRVmX+bomAssTaci4zdIsOzOdbQ79GHlCk6i+FLUa64q+ePh
 a+PJ0q4KHT6+imXFnVTANP/xFd8SnIDiHDoIXVYsIpd/aPlTztr1e7LZGbaVXzBz1O
 9T/lgU8JLc8Bw==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix,
 from userid 48) id 52B9DC41613; Fri, 29 Aug 2025 11:36:10 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 220512] The amdgpu driver fails to initialize my dedicated
 Navi33 GPU at boot, logging a "Fatal error during GPU init" and "gmc_v11_0
 failed" despite using the most recent kernels.
Date: Fri, 29 Aug 2025 11:36:10 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Video(DRI - non Intel)
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: high
X-Bugzilla-Who: aros@gmx.com
X-Bugzilla-Status: RESOLVED
X-Bugzilla-Resolution: ANSWERED
X-Bugzilla-Priority: P3
X-Bugzilla-Assigned-To: drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: bug_status resolution
Message-ID: <bug-220512-2300-gCxyRJbsgg@https.bugzilla.kernel.org/>
In-Reply-To: <bug-220512-2300@https.bugzilla.kernel.org/>
References: <bug-220512-2300@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D220512

Artem S. Tashkinov (aros@gmx.com) changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
             Status|NEW                         |RESOLVED
         Resolution|---                         |ANSWERED

--- Comment #1 from Artem S. Tashkinov (aros@gmx.com) ---
repost here:

https://gitlab.freedesktop.org/drm/amd/-/issues

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
