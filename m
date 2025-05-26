Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6D2B9AC401A
	for <lists+dri-devel@lfdr.de>; Mon, 26 May 2025 15:15:23 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 45A1F89518;
	Mon, 26 May 2025 13:15:17 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="ho0uo6cP";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 641B210E33E
 for <dri-devel@lists.freedesktop.org>; Mon, 26 May 2025 13:15:15 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 5D62B5C62BD
 for <dri-devel@lists.freedesktop.org>; Mon, 26 May 2025 13:12:54 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 17409C4CEF0
 for <dri-devel@lists.freedesktop.org>; Mon, 26 May 2025 13:15:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1748265311;
 bh=LJb08l2FVuyA+w0Op5gGEQRyUWWdSP9UQKAb0zixgj8=;
 h=From:To:Subject:Date:In-Reply-To:References:From;
 b=ho0uo6cPM1O1faGp0hZviAJwb/39/NTxTKFibAFlPcPbmwtDQv9I9gfESzlvyz/ED
 jfzltza0l+sVNmCj/mwhLKIm1pOUojwy4UJGSHzq+GKgcIVcbceRzW1IL1/XArwsjP
 uw+daPMFjRXmOXojjKh/dEORUivmMrh9RiUUnQacifrzVV3MqnJyj1QtqH5/q5i0+b
 YLFhqXmV9AenB5X5NgtI/N+S02v9jUVlPRjn9y5Ix3Ye8sF3Vxs9CgOYnpapXvKji8
 g0IaqOB7zzk/WCEGEpCYWTsmhLaskreqIeJxC5ahvpuN+gZeSfJ2KkV1q69vLLg6Rf
 4VQSa47CuGmXQ==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix,
 from userid 48) id 01927C433E1; Mon, 26 May 2025 13:15:10 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 200531] amdgpu: *ERROR* REG_WAIT timeout when a display is put
 to sleep
Date: Mon, 26 May 2025 13:15:07 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Video(DRI - non Intel)
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: linux.felixbecker2@gmx.de
X-Bugzilla-Status: REOPENED
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: cc
Message-ID: <bug-200531-2300-BG4EN6rtN7@https.bugzilla.kernel.org/>
In-Reply-To: <bug-200531-2300@https.bugzilla.kernel.org/>
References: <bug-200531-2300@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D200531

Drei Eck (linux.felixbecker2@gmx.de) changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
                 CC|                            |linux.felixbecker2@gmx.de

--- Comment #14 from Drei Eck (linux.felixbecker2@gmx.de) ---
Just to make you aware:

`amdgpu` related issues are tracked at
https://gitlab.freedesktop.org/drm/amd/-/issues/.

Regards!

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
