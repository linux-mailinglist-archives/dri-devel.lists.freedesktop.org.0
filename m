Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A34359E668F
	for <lists+dri-devel@lfdr.de>; Fri,  6 Dec 2024 05:59:18 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 96D1610E5EA;
	Fri,  6 Dec 2024 04:59:16 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="ijYWOxRZ";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7D3C310E5E6
 for <dri-devel@lists.freedesktop.org>; Fri,  6 Dec 2024 04:59:15 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id D27F15C731F
 for <dri-devel@lists.freedesktop.org>; Fri,  6 Dec 2024 04:58:31 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 67016C4CEE4
 for <dri-devel@lists.freedesktop.org>; Fri,  6 Dec 2024 04:59:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1733461154;
 bh=oJ/6yio+lCMfGt9FwzE91q+kZV+sUCc+Qh3pDVn4X9I=;
 h=From:To:Subject:Date:In-Reply-To:References:From;
 b=ijYWOxRZ0yXlul5AwxGmdnJ2HsV1KMq29fqSF3gZVZtakEWEdFUFIBCfAySufT1S8
 8rsiwjNICMadmnFDaHxz7VpSfRSfxe6c9VrGL/h2nS+40SHOKJxePNiotf7QesNEdV
 ehUWT2/Du6iR5+vSsNu86wv9/3kDDdSDnIOdc0vHWIQEjno5ZfkqMXDIrH7sNJ8AfQ
 J74GIqHSCiDWfMTy6whdeUQHsG/ZVAK+ZyZU1dDDP7FuAVAMX4ZKbKDvZJ/hrBrazK
 F3JEFf5XhtHFGVx3jJhEF2e4igPDoxDx2RS+jw0nJeUi0eS5hFg82feqn6A/FhJLP6
 wUJ81DKRHLmbA==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix,
 from userid 48) id 5F923C41606; Fri,  6 Dec 2024 04:59:14 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 211807] [drm:drm_dp_mst_dpcd_read] *ERROR* mstb
 000000004e6288dd port 3: DPCD read on addr 0x60 for 1 bytes NAKed
Date: Fri, 06 Dec 2024 04:59:13 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Video(DRI - non Intel)
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: low
X-Bugzilla-Who: lettie.allesvmw1mkw8m@gmail.com
X-Bugzilla-Status: RESOLVED
X-Bugzilla-Resolution: ANSWERED
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: cc
Message-ID: <bug-211807-2300-RjqkMP81t8@https.bugzilla.kernel.org/>
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

Mosis1944 (lettie.allesvmw1mkw8m@gmail.com) changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
                 CC|                            |lettie.allesvmw1mkw8m@gmail
                   |                            |.com

--- Comment #30 from Mosis1944 (lettie.allesvmw1mkw8m@gmail.com) ---
(In reply to Artem S. Tashkinov from comment #25)
> Most Linux developers are not aware of this issue.
>=20
> If you're still affected using either 6.9.5 or 6.6.34, please file a new =
bug
> report here:
>=20
> For Intel:
>=20
> https://gitlab.freedesktop.org/drm/intel/-/issues
> https://blockblastonline.com
>=20=20
> For AMD:
>=20
> https://gitlab.freedesktop.org/drm/amd/-/issues
>=20
> To me it looks like a HW issue of some sort but I'm not an expert. Would =
be
> nice if affected people tried a different HDMI/DP cable.

I have the same opinion with you.

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
