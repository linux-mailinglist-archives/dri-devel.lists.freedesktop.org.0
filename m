Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 45F29970525
	for <lists+dri-devel@lfdr.de>; Sun,  8 Sep 2024 07:40:16 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CD13F10E160;
	Sun,  8 Sep 2024 05:40:12 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="ohc6zm8+";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from nyc.source.kernel.org (nyc.source.kernel.org [147.75.193.91])
 by gabe.freedesktop.org (Postfix) with ESMTPS id ACDF010E160
 for <dri-devel@lists.freedesktop.org>; Sun,  8 Sep 2024 05:40:10 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by nyc.source.kernel.org (Postfix) with ESMTP id 3BCFDA411AC
 for <dri-devel@lists.freedesktop.org>; Sun,  8 Sep 2024 05:40:02 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 4E97CC4CECA
 for <dri-devel@lists.freedesktop.org>; Sun,  8 Sep 2024 05:40:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1725774009;
 bh=eU8y7njNZTU4S5PfdrQQwBvv2TUhYeCI8xRCVEYk/00=;
 h=From:To:Subject:Date:In-Reply-To:References:From;
 b=ohc6zm8+H5E63sD6lPeE39PE8YP+wcYqHnF3JUBFjgNhsjiZ7+KC+a99tPBlqdXZy
 KFWJeO4UTRE2zNMHzjMgXltZwdMS3xZomOhJmw12Ni/QN8DyH5eP1AIRDyvw5XOY71
 y+lD8iPQWA/UkzWs8t92RXLCtNcx9TUdWcVmkZoE/5kbHsjC5mG63raVS55PQ1iUm4
 I4izQjlGbg4yXY4cG76j29IBeNBhdP1PUbaK/MJ7UzDOi99+g92mw5olHb2UaM76lN
 ZJnX/AwFOD/9Yn34Imz7LGmoU9bHcHWj1DVkLYtcOjtcv6WKaonKKy86co23FWVy9I
 Ord6IXKrASufw==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix,
 from userid 48) id 41A84C53BC2; Sun,  8 Sep 2024 05:40:09 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 206309] Experimental amdgpu w/ Dell E6540 with HD 8790M (MARS
 XTX), massive performance improvement after ACPI suspend
Date: Sun, 08 Sep 2024 05:40:09 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Video(DRI - non Intel)
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: low
X-Bugzilla-Who: changhaitravis@gmail.com
X-Bugzilla-Status: RESOLVED
X-Bugzilla-Resolution: WILL_NOT_FIX
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-206309-2300-ZSSkRhvKVS@https.bugzilla.kernel.org/>
In-Reply-To: <bug-206309-2300@https.bugzilla.kernel.org/>
References: <bug-206309-2300@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D206309

--- Comment #6 from Travis Juntara (changhaitravis@gmail.com) ---
I ended up upgrading to a slightly newer dell business laptop with an AMD G=
PU
(with none of these issues) and getting rid of my Latitude E6540.

As such, I can't really help test anymore. I also can't remember who set th=
is
ticket status to be "Resolved - WILL_NOT_FIX", but hesitate to re-open in c=
ase
it wasn't me. If you want to pursue this further, you'll want to open up a =
new
ticket.

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
