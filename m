Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 22AFBAC7E34
	for <lists+dri-devel@lfdr.de>; Thu, 29 May 2025 14:57:28 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C260310E124;
	Thu, 29 May 2025 12:57:24 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="QU4YeoC3";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8D94E10E02D
 for <dri-devel@lists.freedesktop.org>; Thu, 29 May 2025 12:57:22 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id 4BB574AD05
 for <dri-devel@lists.freedesktop.org>; Thu, 29 May 2025 12:57:18 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 2BFD1C4CEE7
 for <dri-devel@lists.freedesktop.org>; Thu, 29 May 2025 12:57:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1748523438;
 bh=eocBGqg5ivwD20dDU/gttjm+LEFDlsKNYUdwyTFxRHc=;
 h=From:To:Subject:Date:In-Reply-To:References:From;
 b=QU4YeoC3+dWRjFuet9hd2w2qMS+Z2MebEpB0JbiHrtw8wWLAbkhX7R0k7Sv37eIKm
 Hr5CraIiVAkSSx5d4lQHRD/pSw8AsOwH4gqfrklcwRKdFLr6VsJqSfVg6YHv5Z8BDW
 WNCgxnHlF3eC3nFZaTzCnohTq0PH7+aBic2XNZJYstewicCZ6JMpxf1m6f3xSzO2+m
 exrtKogvNCZXJh93XbedpgwNWoySbGObvRvzvFaAUJv0C2JKIW2jsHUzYfpPyfQdPR
 Mqizz+PkLfhhcGzyVqVm8WhalYmrRlpIsX+i3/k7EjSRrVfiPrLl1O901HoUXfzCVC
 ExTa5Qnyf4o1g==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix,
 from userid 48) id 212C2C4160E; Thu, 29 May 2025 12:57:18 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 176301] Fiji DisplayPort drm_crtc_helper_set_config *ERROR*
 failed to set mode on
Date: Thu, 29 May 2025 12:57:17 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Video(DRI - non Intel)
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: vedran@miletic.net
X-Bugzilla-Status: RESOLVED
X-Bugzilla-Resolution: OBSOLETE
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: bug_status resolution
Message-ID: <bug-176301-2300-3pxLbWQy0A@https.bugzilla.kernel.org/>
In-Reply-To: <bug-176301-2300@https.bugzilla.kernel.org/>
References: <bug-176301-2300@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D176301

Vedran Mileti=C4=87 (vedran@miletic.net) changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
             Status|NEW                         |RESOLVED
         Resolution|---                         |OBSOLETE

--- Comment #4 from Vedran Mileti=C4=87 (vedran@miletic.net) ---
I no longer have the access to the GPU.

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
