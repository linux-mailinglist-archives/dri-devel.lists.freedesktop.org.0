Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 736119FD411
	for <lists+dri-devel@lfdr.de>; Fri, 27 Dec 2024 13:05:53 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CD99210E3B9;
	Fri, 27 Dec 2024 12:05:50 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="VPlDojgl";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from nyc.source.kernel.org (nyc.source.kernel.org [147.75.193.91])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AED2E10E3B9
 for <dri-devel@lists.freedesktop.org>; Fri, 27 Dec 2024 12:05:49 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by nyc.source.kernel.org (Postfix) with ESMTP id CB397A40BE4
 for <dri-devel@lists.freedesktop.org>; Fri, 27 Dec 2024 12:03:58 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 49C2CC4AF09
 for <dri-devel@lists.freedesktop.org>; Fri, 27 Dec 2024 12:05:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1735301148;
 bh=5ZgadB6wem1c5Tj7tuzdX+c7Cg/Z87VNlWWkdNk2s5U=;
 h=From:To:Subject:Date:In-Reply-To:References:From;
 b=VPlDojgllb2dvUwgpkY3vPntGNJevyMAM393CnP19lBKXj9Q7TFi9YDhxdZgwJGDh
 2RUBTTbQRs53GqkPS53VNDf1FCK8tobr1NTQ+fEixgdUjj98dIHk63+2UXRJMf4f72
 s24iiTnWaVcIlBkPLao/MuhoMVdHL+YVdfEFYZLqqhkaruzi9Gg1ulDUxMNO0D0TGC
 lvUjui+q1OSHFKUxdVz1sukj+EPeuDF0rQkA8eyUm1cePSHwkYYlJhrTnLbJ2GhCBd
 JrNL09OuFNSe0PZvNk/sEkHfsTkvRhj9qpxLPjoFpw1Cy8ddREKBta0xaycD/Gxq3c
 G+mTc9a0QcDWw==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix,
 from userid 48) id 3A4D4C41614; Fri, 27 Dec 2024 12:05:48 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 219635] dc_resource.c:3395 calculate_phy_pix_clks+0xd3/0xe0
Date: Fri, 27 Dec 2024 12:05:48 +0000
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
Message-ID: <bug-219635-2300-3OMuWyECm7@https.bugzilla.kernel.org/>
In-Reply-To: <bug-219635-2300@https.bugzilla.kernel.org/>
References: <bug-219635-2300@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D219635

Artem S. Tashkinov (aros@gmx.com) changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
             Status|NEW                         |RESOLVED
         Resolution|---                         |ANSWERED

--- Comment #1 from Artem S. Tashkinov (aros@gmx.com) ---
Please properly repost here: https://gitlab.freedesktop.org/drm/amd/-/issues

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
