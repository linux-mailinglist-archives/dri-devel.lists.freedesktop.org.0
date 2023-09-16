Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3253A7A2EC4
	for <lists+dri-devel@lfdr.de>; Sat, 16 Sep 2023 10:15:23 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1117610E0D2;
	Sat, 16 Sep 2023 08:15:18 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sin.source.kernel.org (sin.source.kernel.org [145.40.73.55])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 31EE310E0D2
 for <dri-devel@lists.freedesktop.org>; Sat, 16 Sep 2023 08:15:16 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by sin.source.kernel.org (Postfix) with ESMTPS id 34855CE1D31
 for <dri-devel@lists.freedesktop.org>; Sat, 16 Sep 2023 08:15:14 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 747F2C433C9
 for <dri-devel@lists.freedesktop.org>; Sat, 16 Sep 2023 08:15:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1694852112;
 bh=Umtj6rh3FeMB0z1VyVhxTrF4X4x/A5iGSrrmA4nEeqM=;
 h=From:To:Subject:Date:In-Reply-To:References:From;
 b=QbuoB0bbAcequxoHg8qU1YRNg62SVxAEKRUwhnVJu/Re3uGn9EfmmgEZfEg6eHvKM
 YO4jbCZAkE9mG58Yy/pjXfpsN5bj4PMg8eBjxeEIr38uJxAU8mQxDaI88ry2fNEviK
 Sm/PbncxnpKGbOV5oD1vImi05ZzK/5Cce4YaMhLX0bPCH4Rbf3mKWjpWzou1yfaqx3
 HnEI/9al6xkLXAeChvrIZtZ98BIiRDdr8FiXs8eDUdjFsRHFqV/9xL3fK+UazbfxhF
 dDvsf0qgQ2X47tN+pbAf2gO4C+N9dpiOVQuLwaNTXZy0pjli3rZUEB9qP2XGh3GzK2
 F1bK2btMtq1Ng==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix,
 from userid 48) id 516D3C53BD0; Sat, 16 Sep 2023 08:15:12 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 217916] amdgpu: ring gfx_low timeout (Google Maps zooming)
Date: Sat, 16 Sep 2023 08:15:12 +0000
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
Message-ID: <bug-217916-2300-bPWMbYEOFf@https.bugzilla.kernel.org/>
In-Reply-To: <bug-217916-2300@https.bugzilla.kernel.org/>
References: <bug-217916-2300@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D217916

Artem S. Tashkinov (aros@gmx.com) changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
             Status|NEW                         |RESOLVED
         Resolution|---                         |ANSWERED

--- Comment #1 from Artem S. Tashkinov (aros@gmx.com) ---
Please repost here:

https://gitlab.freedesktop.org/drm/amd/-/issues

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
