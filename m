Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6B620945165
	for <lists+dri-devel@lfdr.de>; Thu,  1 Aug 2024 19:22:58 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 280F910E0DF;
	Thu,  1 Aug 2024 17:22:55 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="s0sQ4PJm";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sin.source.kernel.org (sin.source.kernel.org [145.40.73.55])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B731D10E0DF
 for <dri-devel@lists.freedesktop.org>; Thu,  1 Aug 2024 17:22:53 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sin.source.kernel.org (Postfix) with ESMTP id EC4C4CE1A6B
 for <dri-devel@lists.freedesktop.org>; Thu,  1 Aug 2024 17:22:50 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 228C0C32786
 for <dri-devel@lists.freedesktop.org>; Thu,  1 Aug 2024 17:22:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1722532970;
 bh=JuDL4/y7+22neHUz/89hTKGKovP8pc8CO+5xUvnObYU=;
 h=From:To:Subject:Date:In-Reply-To:References:From;
 b=s0sQ4PJmIXUaBNhKy23C8+i8eWSprwCRuu4U7Er3YiFVmkD1m0t4HLXL4TJ9m60u6
 mc4y3thiT21xxaWPev7J041YbDdmTNOLSe/hTryqyt8GJrPw7K8MZVcSnyS4oiUctc
 zZpPZa/Yo2gMLG2odNRxsH/+ziE4nIC/vkJd62mb9IfMlJ3hkFIaOPg7IiRDuZg9GV
 7JFDjLAWr9xw3RpX0T+WgO7w4LipeSJtvUGicoAGaCiLtZuaKw4G6MubjHAOyLcnI8
 R1gmxtzE+ZyN2n4MxM10kfOw8jBTa3XVo/cK3c50SoNnbIMfGQJr4L4OXsdxUMoiCr
 6AbpSJn8ROH+w==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix,
 from userid 48) id 16456C53B7F; Thu,  1 Aug 2024 17:22:50 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 219118] Linux 6.10.x [drm:amdgpu_job_timedout [amdgpu]] *ERROR*
 ring gfx timeout VM fault / GPU fault detected
Date: Thu, 01 Aug 2024 17:22:49 +0000
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
Message-ID: <bug-219118-2300-pPFdabnsGO@https.bugzilla.kernel.org/>
In-Reply-To: <bug-219118-2300@https.bugzilla.kernel.org/>
References: <bug-219118-2300@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D219118

Artem S. Tashkinov (aros@gmx.com) changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
             Status|NEW                         |RESOLVED
         Resolution|---                         |ANSWERED

--- Comment #1 from Artem S. Tashkinov (aros@gmx.com) ---
Please report here instead: https://gitlab.freedesktop.org/drm/amd/-/issues

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
