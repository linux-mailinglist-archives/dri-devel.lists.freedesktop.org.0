Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A3464AD42C9
	for <lists+dri-devel@lfdr.de>; Tue, 10 Jun 2025 21:20:21 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 146C510E2BB;
	Tue, 10 Jun 2025 19:20:19 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="uudJOgQz";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from nyc.source.kernel.org (nyc.source.kernel.org [147.75.193.91])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1BDB910E2BB
 for <dri-devel@lists.freedesktop.org>; Tue, 10 Jun 2025 19:20:05 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by nyc.source.kernel.org (Postfix) with ESMTP id 9AA32A4EEB4
 for <dri-devel@lists.freedesktop.org>; Tue, 10 Jun 2025 19:20:04 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 46545C4CEF3
 for <dri-devel@lists.freedesktop.org>; Tue, 10 Jun 2025 19:20:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1749583204;
 bh=QQRaXCPPcffx+jJyAvuXsHVRtCMnjxx7C4rfUOvf8Lc=;
 h=From:To:Subject:Date:In-Reply-To:References:From;
 b=uudJOgQzGvh25qFIKSHsQPY465UY9Sspc6jPDtwyL/eIMSastA9BJPf/dZvyEDV2W
 V38s51+/tixLcOTfyAEE6TxAtEOik2/Q5LfJ17xBurtioZbylhz7dG1c+rZzjyuHdW
 zPby+qfeYV344TVM/lasWfrUbe4EwoZH2S7rGBDDPmtfk+z/rhtVmGpFEGMbM8TslQ
 Vn/YS8ViIDi8IjIDO5yFJxaCEdwtEhN2044kidw9gxxxBose0h+/KPkl5lDluAty5L
 Z1tRiHBq/kuPFuHxWnjV3vs8wivnGG3jxu0M182YGe28s6mMFBLoNGuWEhL+1LgjsP
 hJc99p461QXpw==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix,
 from userid 48) id 3B030C41614; Tue, 10 Jun 2025 19:20:04 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 220218] amdgpu: crash in
 dc_dmub_srv_apply_idle_power_optimizations
Date: Tue, 10 Jun 2025 19:20:03 +0000
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
Message-ID: <bug-220218-2300-M4hWwjfIiC@https.bugzilla.kernel.org/>
In-Reply-To: <bug-220218-2300@https.bugzilla.kernel.org/>
References: <bug-220218-2300@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D220218

Artem S. Tashkinov (aros@gmx.com) changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
             Status|NEW                         |RESOLVED
         Resolution|---                         |ANSWERED

--- Comment #1 from Artem S. Tashkinov (aros@gmx.com) ---
report here: https://gitlab.freedesktop.org/drm/amd/-/issues

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
