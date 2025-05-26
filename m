Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BA5B0AC3BEA
	for <lists+dri-devel@lfdr.de>; Mon, 26 May 2025 10:44:47 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0F2CB10E2EC;
	Mon, 26 May 2025 08:44:45 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="GeiDH0R1";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 52C2010E2DE
 for <dri-devel@lists.freedesktop.org>; Mon, 26 May 2025 08:44:43 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id E38A75C5AC5
 for <dri-devel@lists.freedesktop.org>; Mon, 26 May 2025 08:42:25 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 9560FC4CEF9
 for <dri-devel@lists.freedesktop.org>; Mon, 26 May 2025 08:44:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1748249082;
 bh=NOpD64SQ7S2sw9dDHernOboHg0h2oURs/+pMiwjTk8Q=;
 h=From:To:Subject:Date:In-Reply-To:References:From;
 b=GeiDH0R13zFHW/4wrxkdGxszEOdfk2rFY5YWQWAom9VMqcfZEJUlqmnQG82jQ4Ph4
 gnIWTCCd9MDUwILozY7cHcEYMfQ84I2LlvS3stUHg6vlk4MeVKq55/FH5Cj0/iWxPe
 IJ+QuzaQK/2oqQd6eH93gzs4DztzWx3IExBpW28zquRZeocr8yM1SQ89dTZB3YUQaK
 WyEKUbWmo6HDEpihYjXtJg4Hc6M23WkrCZuVQZiKu4n+4sA+EIO2XrU9c0Vd7E6tQx
 xyPNSGV2il1pNDtl+pBb1P47vrTsRQzITzpbVy8tL/3s2SssKtpmWNSJQpc62th+nq
 Bu6wr4pDisJIA==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix,
 from userid 48) id 8FF6FC41612; Mon, 26 May 2025 08:44:42 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 211807] [drm:drm_dp_mst_dpcd_read] *ERROR* mstb
 000000004e6288dd port 3: DPCD read on addr 0x60 for 1 bytes NAKed
Date: Mon, 26 May 2025 08:44:41 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Video(DRI - non Intel)
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: low
X-Bugzilla-Who: VetaEVega@hotmail.com
X-Bugzilla-Status: RESOLVED
X-Bugzilla-Resolution: ANSWERED
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: cc
Message-ID: <bug-211807-2300-ZVmSPni8e6@https.bugzilla.kernel.org/>
In-Reply-To: <bug-211807-2300@https.bugzilla.kernel.org/>
References: <bug-211807-2300@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D211807

Joel W. Charles (VetaEVega@hotmail.com) changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
                 CC|                            |VetaEVega@hotmail.com

--- Comment #32 from Joel W. Charles (VetaEVega@hotmail.com) ---
Thanks everyone for sharing and analyzing in great detail =E2=80=93 very he=
lpful for
those who are having similar problems. Hope to have a stable fix soon!
https://101games.io/gunspin

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
