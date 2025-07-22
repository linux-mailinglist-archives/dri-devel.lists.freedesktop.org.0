Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 44A9FB0E6C6
	for <lists+dri-devel@lfdr.de>; Wed, 23 Jul 2025 00:58:23 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5492010E32E;
	Tue, 22 Jul 2025 22:58:03 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="ADrP9NBP";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C1DF110E32E
 for <dri-devel@lists.freedesktop.org>; Tue, 22 Jul 2025 22:58:02 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id 87C19668A3
 for <dri-devel@lists.freedesktop.org>; Tue, 22 Jul 2025 22:58:01 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 3F390C4CEF7
 for <dri-devel@lists.freedesktop.org>; Tue, 22 Jul 2025 22:58:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1753225081;
 bh=oyghh8mMa1fHX1cbGSvzwglXeyGRQIlQ4l7wMhIvz0g=;
 h=From:To:Subject:Date:In-Reply-To:References:From;
 b=ADrP9NBPzVmCQkhHHTCTiqMDK3B7vgvauVuQx6piJASlKpOUGslSGgLQMSI9xzw19
 cO5O9w4AKfq6tEQAaTx4Od87MuBrIVxzPchFbqfpXVnfmq/nAT/yQabxjfdlnW5Fw1
 5cc1DC1PHaW6QyVq9zPnlowzkmA/gOHbvfCWYBWc497N+mee+G5qREam2AjHfwJK6f
 hISJjs5XEO28KFCQ20BoZ6M+DEVM3dSDPC1/3/pAxjFwQs4AydCjvyOjVxEI4S8kHj
 c0z8OGWQXrJlDTgGVWwNS9pgX/QABu7mLPxe6NtR0a91N17gqdFZdce/ExCQoMdwKK
 JuoabXZJ6ae1g==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix,
 from userid 48) id 34400C41616; Tue, 22 Jul 2025 22:58:01 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 219895] amdgpu spamming log [drm] scheduler comp_1.0.1 is not
 ready, skipping and becoming slow
Date: Tue, 22 Jul 2025 22:58:00 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Video(DRI - non Intel)
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: kolAflash@kolahilft.de
X-Bugzilla-Status: RESOLVED
X-Bugzilla-Resolution: ANSWERED
X-Bugzilla-Priority: P3
X-Bugzilla-Assigned-To: drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: cc
Message-ID: <bug-219895-2300-QsCw5qdQJA@https.bugzilla.kernel.org/>
In-Reply-To: <bug-219895-2300@https.bugzilla.kernel.org/>
References: <bug-219895-2300@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D219895

kolAflash (kolAflash@kolahilft.de) changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
                 CC|                            |kolAflash@kolahilft.de

--- Comment #3 from kolAflash (kolAflash@kolahilft.de) ---
FTR, here's the follow up:

After waking from sleep, log spam of "[drm] scheduler comp_1.0.n is not rea=
dy,
skipping" after "WARNING: CPU: 12 PID: 11871 at
drivers/gpu/drm/amd/amdgpu/../display/dc/dc_helper.c:100
generic_reg_update_ex+0x1d2/0x290 [amdgpu]"
https://gitlab.freedesktop.org/drm/amd/-/issues/3911#note_2941418

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
