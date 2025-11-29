Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 15A85C946D4
	for <lists+dri-devel@lfdr.de>; Sat, 29 Nov 2025 19:57:26 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6DCA710E036;
	Sat, 29 Nov 2025 18:57:22 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="gGv6KhGM";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5732A10E036
 for <dri-devel@lists.freedesktop.org>; Sat, 29 Nov 2025 18:57:21 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id 36A5A60018
 for <dri-devel@lists.freedesktop.org>; Sat, 29 Nov 2025 18:57:20 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 9A093C116D0
 for <dri-devel@lists.freedesktop.org>; Sat, 29 Nov 2025 18:57:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1764442639;
 bh=SOqsU5eD7hHHWFns697afNen9Xa/Ds3hfZzWy7he/2U=;
 h=From:To:Subject:Date:In-Reply-To:References:From;
 b=gGv6KhGM6UgD80C4QuV2YVVZg9t+WE3ol9y15JTlIJ+EwAZwwkZQHAASXOFBjVZsy
 DytXQbzpz+S+xl/1WHEfkUWEOvw4uSrIQNwV3JVounekteCLVykz8BVl5qjwxvN7CC
 bH1/UcHspGVX6FgeSqDppSGBrap5mhsd3bxIzJ4Tu0Pmf2kbICpa3YXPsNgQuYIFBz
 EdZpH6WhLgEwikKThwkYVpu4Au2XS8kpQ7G+C0vSlsmnng6rpRu1kwB77lZe+eRrCH
 OEut/71f5TlXvjREbUTs7khQJwX0mG8d4Ruodu9wNEuXX1LW/Vsb+yBhjTyfHMvdjs
 P4xtpo2p/Jbxg==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix,
 from userid 48) id 8C185C53BBF; Sat, 29 Nov 2025 18:57:19 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 220813] 3x Radeon RX 7900 XTX Cards Exhibiting Identical PCIe
 Bus Dropouts, SMU/GFXOFF Failures, and Full GPU Loss Under Gaming and Compute
 Loads
Date: Sat, 29 Nov 2025 18:57:19 +0000
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
Message-ID: <bug-220813-2300-0Bn5e4MmIP@https.bugzilla.kernel.org/>
In-Reply-To: <bug-220813-2300@https.bugzilla.kernel.org/>
References: <bug-220813-2300@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D220813

Artem S. Tashkinov (aros@gmx.com) changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
             Status|NEW                         |RESOLVED
         Resolution|---                         |ANSWERED

--- Comment #1 from Artem S. Tashkinov (aros@gmx.com) ---
Report here:

https://gitlab.freedesktop.org/drm/amd/-/issues

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
