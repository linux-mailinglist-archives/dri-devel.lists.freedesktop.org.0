Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id F2F5C3B3126
	for <lists+dri-devel@lfdr.de>; Thu, 24 Jun 2021 16:18:33 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1AB5F6EB20;
	Thu, 24 Jun 2021 14:18:30 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7C4C66EB20
 for <dri-devel@lists.freedesktop.org>; Thu, 24 Jun 2021 14:18:28 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPS id 43640613EC
 for <dri-devel@lists.freedesktop.org>; Thu, 24 Jun 2021 14:18:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1624544308;
 bh=LkqdAbXrthT2N2Cl7+IulyGpqdF/+y3O5JnBVWUjCmY=;
 h=From:To:Subject:Date:In-Reply-To:References:From;
 b=Qx5UFVLgEPtA+UmU/wQz3dBD+jFQ34nBJQzakB/fy9/jMD5Bsal/9F6qQqPgVJgzf
 5COcjWcr9AgbtmHxDx4fsMw0ISS88rCs+z96NeFXUPWaSULErqJgzYJwXABYpzSCDq
 rjM2VKDpZmYuxxfSXD4Hk0dmmvRns5tNA17wB1Zd1rBi3VI8CjP6fcHT0SV9yxNjMb
 ogvytRtHQRu29kJ/C1l4EuY3MJ+oKV76pDUUpy9gH6kO49IC5735LfEVUUD9nMkS/+
 t4Is5Jc8+0s35u8aR4hLRqhbQB8QpTvp/LYRA9WGZelf6UMO16O4zypheEKwBHP3wM
 uAZpDLYTCs9iw==
Received: by pdx-korg-bugzilla-2.web.codeaurora.org (Postfix, from userid 48)
 id 3771E6113E; Thu, 24 Jun 2021 14:18:28 +0000 (UTC)
From: bugzilla-daemon@bugzilla.kernel.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 213561] [bisected][regression] GFX10 AMDGPUs can no longer
 enter idle state after commit. Commit has been pushed to stable branches too.
Date: Thu, 24 Jun 2021 14:18:27 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Video(DRI - non Intel)
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: untaintableangel@hotmail.co.uk
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-213561-2300-1w8qwZJ5Q3@https.bugzilla.kernel.org/>
In-Reply-To: <bug-213561-2300@https.bugzilla.kernel.org/>
References: <bug-213561-2300@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D213561

--- Comment #7 from Linux_Chemist (untaintableangel@hotmail.co.uk) ---
(In reply to hagar-dunor from comment #3)
> Same on vega 64

I think I'm right in saying Vega is gfx9 rather than gfx10 (navi etc), so y=
ou
may be affected by a similar commit (4cbbe34807938e6e494e535a68d5ff64edac3f=
20
upstream) and not the specific one I'm filing for.=20

Are you able to build a linux kernel and check if you are being affected by
this particular commit instead?=20
At any rate, could you file a similar new bug report ("for gfx9 devices") a=
nd
link it to this one since the specific commit I've confirmed that causes the
problem is not applicable to your particular device.

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
