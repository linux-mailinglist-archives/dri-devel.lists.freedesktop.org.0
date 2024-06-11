Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 631D6902FA5
	for <lists+dri-devel@lfdr.de>; Tue, 11 Jun 2024 06:51:32 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BE26A10E223;
	Tue, 11 Jun 2024 04:51:27 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="TjpKiMju";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sin.source.kernel.org (sin.source.kernel.org [145.40.73.55])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 476E210E223
 for <dri-devel@lists.freedesktop.org>; Tue, 11 Jun 2024 04:51:25 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sin.source.kernel.org (Postfix) with ESMTP id B48C4CE194E
 for <dri-devel@lists.freedesktop.org>; Tue, 11 Jun 2024 04:51:22 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 4AE6EC4AF51
 for <dri-devel@lists.freedesktop.org>; Tue, 11 Jun 2024 04:51:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1718081481;
 bh=YZJkj22O9GJtGOf2nRx1iyT7UecWfCAHwF5vPG/YbwI=;
 h=From:To:Subject:Date:In-Reply-To:References:From;
 b=TjpKiMjugNm1ERzPnjOAbY3GBSg35iWsligFvXF/V/wokuyaWpXWMsQARzuVu7Wb7
 y0ziNi822QEu/02d9vVULQWrOsViIly0tMNCx/Tc9/gZkurSHoF+h0RGuyiwt8/0UX
 emRPcJ35z7CQonYtEOrWyeEZNASXbkNQs98xg+4pGMZO7Zdjk6kvliixKdfKiWbN7F
 L3RX4YJykJxFdXEnlVaDE0hZ4Rdf8SMbgLZGUEEO1kT44F0rv3k9jQeSLggnLR2XvG
 6W/stdb6+da1OVgODlr5fHAo6JgB3IAfraFmeNHvdSXacFU+HGJp6leTnjkneNkp1m
 L36zw79XoTQZA==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix,
 from userid 48) id 42D10C53BB8; Tue, 11 Jun 2024 04:51:21 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 211807] [drm:drm_dp_mst_dpcd_read] *ERROR* mstb
 000000004e6288dd port 3: DPCD read on addr 0x60 for 1 bytes NAKed
Date: Tue, 11 Jun 2024 04:51:20 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Video(DRI - non Intel)
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: low
X-Bugzilla-Who: felixandreaim@gmail.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: cc
Message-ID: <bug-211807-2300-fJQ4Sm8V4Y@https.bugzilla.kernel.org/>
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

Felix Andrea (felixandreaim@gmail.com) changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
                 CC|                            |felixandreaim@gmail.com

--- Comment #24 from Felix Andrea (felixandreaim@gmail.com) ---
I have tried updating the driver and related firmware but it still doesn't =
seem
to solve the problem. Does disabling fwupd checking DP aux ports help? I fo=
und
this thread:
https://lists.freedesktop.org/archives/dri-devel/2022-February/342776.html
https://ricepurity-test.io/ but not really know how to fix it.

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
