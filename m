Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EF308AF5CD2
	for <lists+dri-devel@lfdr.de>; Wed,  2 Jul 2025 17:25:49 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E4B9410E740;
	Wed,  2 Jul 2025 15:25:47 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="A17Z6anT";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2DAE410E739
 for <dri-devel@lists.freedesktop.org>; Wed,  2 Jul 2025 15:25:47 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id D05C2435AA
 for <dri-devel@lists.freedesktop.org>; Wed,  2 Jul 2025 15:25:46 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id AEE27C4CEF3
 for <dri-devel@lists.freedesktop.org>; Wed,  2 Jul 2025 15:25:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1751469946;
 bh=8WPNThpIK79toirFpbW+HtfwBNLFKK0evUqmBfMJH6I=;
 h=From:To:Subject:Date:In-Reply-To:References:From;
 b=A17Z6anTKSDSpOQpLDnp1AROdJwzMzwVU2o3S3omurCU1ottt3rKx3hIGzppCNgBZ
 89DEeiCgnZwgSWcCwq89lluF/iQjrar2qvVJGQ8LsVvRzMa+DmL7BH4T4NTd8ZSRP7
 tAg814nK0T5l8XHMDARmFbXVs01q92gxlGH64qCVI4NoInqYr9tT4BaUC5IMcaCYHX
 lS/fjobJh1OIQ13Y0RfUa3dIOCmQT9QIztuEL8R+mEeVafKCag90MB51MDuKtR1c0+
 WldsE3zulFs3vY8LrLSAE0Kp02qsHL+TKbMyej7BgIA/F6V1z8DAoWEZdZ2BPbbKBX
 8+9fQMxLbcEOQ==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix,
 from userid 48) id A3A0BC41616; Wed,  2 Jul 2025 15:25:46 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 220304] [amdgpu] DisplayPort resource allocation issue (one
 blank screen)
Date: Wed, 02 Jul 2025 15:25:46 +0000
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
Message-ID: <bug-220304-2300-nOVoPF5YDD@https.bugzilla.kernel.org/>
In-Reply-To: <bug-220304-2300@https.bugzilla.kernel.org/>
References: <bug-220304-2300@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D220304

Artem S. Tashkinov (aros@gmx.com) changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
             Status|NEW                         |RESOLVED
         Resolution|---                         |ANSWERED

--- Comment #2 from Artem S. Tashkinov (aros@gmx.com) ---
Please report here instead:

https://gitlab.freedesktop.org/drm/amd/-/issues

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
