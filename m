Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 44A48A7420E
	for <lists+dri-devel@lfdr.de>; Fri, 28 Mar 2025 02:29:05 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A21F710E95E;
	Fri, 28 Mar 2025 01:29:02 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="EFK72UZc";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6F11410E95E
 for <dri-devel@lists.freedesktop.org>; Fri, 28 Mar 2025 01:29:01 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id D43FE44733
 for <dri-devel@lists.freedesktop.org>; Fri, 28 Mar 2025 01:29:00 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 1C6B4C4CEE4
 for <dri-devel@lists.freedesktop.org>; Fri, 28 Mar 2025 01:29:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1743125341;
 bh=IrDn5zFVqL9BODYURHA6I9lHu06vuTHJHm425zrYWJE=;
 h=From:To:Subject:Date:In-Reply-To:References:From;
 b=EFK72UZcsYVZ1dttW1FoWkdiz5x2w95migeXKyhyL2EcptOPO7Pc5fUagwr1kicWA
 Gw/Dgd3KvrHUnRWHShaqtRd3FFhmq0JWDZF5wDSioa0G1GeHdGEyWphN/qCtsE8DVO
 Kj/Wp2uCQr2lxgDQLhSPBMw2AH1SLO8foTpcPxMm9mGOHWb7tsyhsW+WBhq2pS6hzb
 cdqZbfpvi8/Q+dbp1zR2NbSFZtoy2brP8uSS8vFzWm/X5V3tG18PPEcND6+dJvROwj
 T5OE0PBs58JlU9aWSi7375kGuWcn9e/T1F86AvZzzTmFJMOSr85Y3Aw/OnnSLVJ/Rv
 wn5YfjFDV/l/w==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix,
 from userid 48) id 08B43C53BC5; Fri, 28 Mar 2025 01:29:01 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 219929] Direct firmware load for amdgpu/isp_4_1_0.bin failed
 with error -2
Date: Fri, 28 Mar 2025 01:29:00 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Video(DRI - non Intel)
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: mario.limonciello@amd.com
X-Bugzilla-Status: RESOLVED
X-Bugzilla-Resolution: PATCH_ALREADY_AVAILABLE
X-Bugzilla-Priority: P3
X-Bugzilla-Assigned-To: drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: bug_status resolution
Message-ID: <bug-219929-2300-Q4MJX4xdxZ@https.bugzilla.kernel.org/>
In-Reply-To: <bug-219929-2300@https.bugzilla.kernel.org/>
References: <bug-219929-2300@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D219929

Mario Limonciello (AMD) (mario.limonciello@amd.com) changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
             Status|NEW                         |RESOLVED
         Resolution|---                         |PATCH_ALREADY_AVAILABLE

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
