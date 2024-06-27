Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 64E4B91AC1B
	for <lists+dri-devel@lfdr.de>; Thu, 27 Jun 2024 18:00:23 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C2D2410EB0B;
	Thu, 27 Jun 2024 16:00:17 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="IEskZODN";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sin.source.kernel.org (sin.source.kernel.org [145.40.73.55])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CA6AD10E0ED
 for <dri-devel@lists.freedesktop.org>; Thu, 27 Jun 2024 16:00:15 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sin.source.kernel.org (Postfix) with ESMTP id 652C1CE2F46
 for <dri-devel@lists.freedesktop.org>; Thu, 27 Jun 2024 16:00:13 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 79423C4AF0C
 for <dri-devel@lists.freedesktop.org>; Thu, 27 Jun 2024 16:00:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1719504012;
 bh=k94Wji3zKkhdAYPbwXrOl8nMt07ZmUBMYxdxTKZ8/dY=;
 h=From:To:Subject:Date:In-Reply-To:References:From;
 b=IEskZODNlK4RaQHTA9SU1OJUe/A3qGk4mK7XZPhxlQA2qTbDHMLaaDuRP/YuZbad4
 3dW8OYna4wY+rTDHySLGr3clpTQjsIk0OT2bPT6C8cvOAXMRUMJY5zy2vVxJ3OfDMJ
 Rs4nkI6OkcEUew5yL1G8bby3Rt7w6XNkWN2IszpwYm4jKOKigpkZZ0H5RF1/wdvwLm
 hs6TbSbP5OZoU8W+nkEYBvHP5e/KvBf63aVJQD9jLVDbk88tVQ62O9vKFd76QltJRC
 yPYdVnhWKmk2aciqYFN7/TzZY4vV9adyzQPHik1QkpsZMSL4lioU2WvLQj+7jR4v1W
 k5bgfmUDE5Gag==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix,
 from userid 48) id 702E1C53B50; Thu, 27 Jun 2024 16:00:12 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 218900] amdgpu: Fatal error during GPU init
Date: Thu, 27 Jun 2024 16:00:11 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Video(DRI - non Intel)
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: blocking
X-Bugzilla-Who: dreamlike_clinking040@simplelogin.com
X-Bugzilla-Status: RESOLVED
X-Bugzilla-Resolution: CODE_FIX
X-Bugzilla-Priority: P3
X-Bugzilla-Assigned-To: drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: cc
Message-ID: <bug-218900-2300-mSKg53YAhu@https.bugzilla.kernel.org/>
In-Reply-To: <bug-218900-2300@https.bugzilla.kernel.org/>
References: <bug-218900-2300@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D218900

dreamlike_clinking040@simplelogin.com changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
                 CC|                            |dreamlike_clinking040@simpl
                   |                            |elogin.com

--- Comment #21 from dreamlike_clinking040@simplelogin.com ---
(In reply to Vasant Hegde from comment #19)
> Unfortunately there was another big in suspend/resume path. Can you please
> test with below patch?
>=20
> https://lore.kernel.org/linux-iommu/ZnqzXyCU8bn32j4-@8bytes.org/T/
> #m1cd1520facb8b758efdf7a8c0261f9ee2ec217d7
>=20
>=20
>=20
> -Vasant

Can confirm this patch also fixes my suspend/resume issue, thanks!

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
