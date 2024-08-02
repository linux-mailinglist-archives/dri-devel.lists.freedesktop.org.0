Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A9FC194563D
	for <lists+dri-devel@lfdr.de>; Fri,  2 Aug 2024 04:14:11 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 204DE10E975;
	Fri,  2 Aug 2024 02:14:08 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="MSSxWgvf";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 31DB510E975
 for <dri-devel@lists.freedesktop.org>; Fri,  2 Aug 2024 02:14:06 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 6BA81629AB
 for <dri-devel@lists.freedesktop.org>; Fri,  2 Aug 2024 02:14:05 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id F29E5C4AF0C
 for <dri-devel@lists.freedesktop.org>; Fri,  2 Aug 2024 02:14:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1722564845;
 bh=RFD6yLFsOt5Cf4tCAOe3uNEki1MB9uWIQFxYdCF6ob0=;
 h=From:To:Subject:Date:In-Reply-To:References:From;
 b=MSSxWgvfEPiNxP3WtTqlXUEdIreh22dxl6+jE7I4PnqqLLLcMtJsm7ZqqLBRFSoxW
 wOqlOIeTZ5b7jsXITK6JEINt+hBQ7Uomu1euLGh9QIiEapndP0Sxd8mQrWjjy+EPxK
 UAJpoJWE2Z7J929+YXC2Pyj3XV7icKLaWY9CDZJtoKT79jR8YB2b6KPkHR9BUCmeSk
 CHiK0mo/K01LM4s/RqqWkYP02TGPMCPEl3Xrr1jxQNLqMioNDCt6Rb8/YjQYIe4dJc
 iS/1dLaL/qtLttli+nPqoJVhGqQO0C8S5GhBDB8nCxV7J5L+TfLsJO6WynnsT2z4jI
 IylcrlMWo4kBQ==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix,
 from userid 48) id E2E81C53BB9; Fri,  2 Aug 2024 02:14:04 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 219117] amdgpu: amdgpu_device_ip_init failed
Date: Fri, 02 Aug 2024 02:14:04 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Video(DRI - non Intel)
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: blocking
X-Bugzilla-Who: tim.huang@amd.com
X-Bugzilla-Status: RESOLVED
X-Bugzilla-Resolution: ANSWERED
X-Bugzilla-Priority: P3
X-Bugzilla-Assigned-To: drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: cc
Message-ID: <bug-219117-2300-W0m5D9OWzR@https.bugzilla.kernel.org/>
In-Reply-To: <bug-219117-2300@https.bugzilla.kernel.org/>
References: <bug-219117-2300@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D219117

Tim Huang (tim.huang@amd.com) changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
                 CC|                            |tim.huang@amd.com

--- Comment #2 from Tim Huang (tim.huang@amd.com) ---
Hello,=20

Thanks Jean for reporting this issue.=20=20

It should be the same issue with this one
https://gitlab.freedesktop.org/drm/amd/-/issues/3502.=20=20=20

Here is the fix patch
https://gitlab.freedesktop.org/agd5f/linux/-/commit/f1127b0b6ef8d451eddfecb=
67e4289ce763b2f9e.=20

Thanks.
Tim Huang

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
