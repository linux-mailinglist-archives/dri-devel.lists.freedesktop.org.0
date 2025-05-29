Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4CAAFAC7E3B
	for <lists+dri-devel@lfdr.de>; Thu, 29 May 2025 14:58:21 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id ADC6510E02D;
	Thu, 29 May 2025 12:58:19 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="uWeYSelj";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1536F10E103
 for <dri-devel@lists.freedesktop.org>; Thu, 29 May 2025 12:58:18 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 09D2D5C5CDA
 for <dri-devel@lists.freedesktop.org>; Thu, 29 May 2025 12:55:57 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id AA4C1C4CEED
 for <dri-devel@lists.freedesktop.org>; Thu, 29 May 2025 12:58:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1748523493;
 bh=fb0Skd3D2/QKrj8I+ZnRbE/VFevxb+fwI2iWgkrTHNM=;
 h=From:To:Subject:Date:In-Reply-To:References:From;
 b=uWeYSeljINkrql6nVAhEou8ETeTlBnS+xg2WQ1n/VLDu80+DJS+VyEjOLbZPcoDOJ
 FGIuWYjhCLGO+0tNNCN0nDjYmrRY2Vo8BO7xgMG1hLzO68ULJ6zeALpFRgzZYQq76e
 Q8jCMsmosbAJWgGoEOpYnnWRdgUOLiQJoc9DvtC6DOBpDRL3pCBnOOAdoE5jc9M6fd
 VHq6uFUJPYBUFgnCWVR8h2BiHyb2Xr/fOIHWT2qhfw3c0Yg79wFUnixuBZzFipYSko
 C0Ab3rkqE58WNLVET3BFqI85BjU6iVNi7OhaSVu6Fu2H1j2WuB/QYPXwNQEpBehKot
 mGrzegG7TmdvA==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix,
 from userid 48) id A3CEDC4160E; Thu, 29 May 2025 12:58:13 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 176311] Fiji DisplayPort amdgpu_crtc_page_flip *ERROR* failed
 to get vblank before flip
Date: Thu, 29 May 2025 12:58:13 +0000
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
Message-ID: <bug-176311-2300-y4xSGmZpv8@https.bugzilla.kernel.org/>
In-Reply-To: <bug-176311-2300@https.bugzilla.kernel.org/>
References: <bug-176311-2300@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D176311

Vedran Mileti=C4=87 (vedran@miletic.net) changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
             Status|NEW                         |RESOLVED
         Resolution|---                         |OBSOLETE

--- Comment #8 from Vedran Mileti=C4=87 (vedran@miletic.net) ---
Hi Michel, apologies for the very late reply. Anyhow, at that point I alrea=
dy
no longer had the access to the GPU.

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
