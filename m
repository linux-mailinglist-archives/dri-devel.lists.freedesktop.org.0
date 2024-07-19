Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D72C9937408
	for <lists+dri-devel@lfdr.de>; Fri, 19 Jul 2024 08:32:05 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AFA5610E6F0;
	Fri, 19 Jul 2024 06:32:03 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="pm/RBaM2";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1B2F310E6F0
 for <dri-devel@lists.freedesktop.org>; Fri, 19 Jul 2024 06:32:03 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 69D7E61C28
 for <dri-devel@lists.freedesktop.org>; Fri, 19 Jul 2024 06:32:02 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 600C0C4AF17
 for <dri-devel@lists.freedesktop.org>; Fri, 19 Jul 2024 06:32:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1721370721;
 bh=Q6lWwTPEA6EW+WRWrZGi5S7ISm1fzOesZvc4sGBZ8KQ=;
 h=From:To:Subject:Date:In-Reply-To:References:From;
 b=pm/RBaM2pnWaYLXt7K1WRh3Pk0ouHT94IzqoNrmV/FNYfLPgBF2LQO9ydJl8lxK8J
 Kt/wkq5pqYEPD3KX4WILWmpOuipN/2DTvn+k0amACcl54VIMWnHXu6oLM6EnTtuPt0
 gE16zirSabmldCblbVDnlDtWOKd3PExTWooPWg8mC0MU2J1clDp6smvm7RSRT+zUiP
 Xp4TejG+AwdnVUXHTknHsYRCFzg0HTXAYr/MowNtwDJlZvRuct4EGm9S9Udh7+fUlU
 1lJwiop0E6R4Y3eoYA3P9LIiP6i+Nz+tjjCXV9smHQGjPxKOWwGsPSRJ+7MOX8undn
 tcGdhiVhTFAtw==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix,
 from userid 48) id 5BFC8C53BBF; Fri, 19 Jul 2024 06:32:01 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 201497] [amdgpu]: '*ERROR* No EDID read' is back in 4.19
Date: Fri, 19 Jul 2024 06:32:00 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Video(DRI - non Intel)
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: erenoglu@gmail.com
X-Bugzilla-Status: RESOLVED
X-Bugzilla-Resolution: ANSWERED
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-201497-2300-y8av2G6wwj@https.bugzilla.kernel.org/>
In-Reply-To: <bug-201497-2300@https.bugzilla.kernel.org/>
References: <bug-201497-2300@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D201497

--- Comment #35 from Emre (erenoglu@gmail.com) ---
Hi Artem, I did not see my issue (stated above) since the last few kernel
releases. I'm now at 6.9.9-arch1-1. These days it seemed reliable to me.
Sometimes I'm losing "4k resolution" but that may be due to the Monitor not=
 the
driver (power cycling monitor fixes it).

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
