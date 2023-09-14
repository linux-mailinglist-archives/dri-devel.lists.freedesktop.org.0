Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C99CC7A0DE9
	for <lists+dri-devel@lfdr.de>; Thu, 14 Sep 2023 21:15:28 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 85BDC10E57F;
	Thu, 14 Sep 2023 19:15:24 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 65E3D10E57F
 for <dri-devel@lists.freedesktop.org>; Thu, 14 Sep 2023 19:15:23 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 5AEA961E6B
 for <dri-devel@lists.freedesktop.org>; Thu, 14 Sep 2023 19:15:22 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id B8C21C433CA
 for <dri-devel@lists.freedesktop.org>; Thu, 14 Sep 2023 19:15:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1694718921;
 bh=wY/wEWx6sN1zQBE0KXWOrzWuGFgs2iN2fw1x9GHVH2g=;
 h=From:To:Subject:Date:In-Reply-To:References:From;
 b=KaaGVTsw1ktmvGGz4Su7u7IZER6T+rfbt/Gx3D2nQ6eIkYg54/gUUVaIiA5i8yq3q
 Pc+/Nd3K2rDn+QENAvkH3Y59FB4QTptAEd/PifRvAK5lbDFNfm1hkZ45eECuncuYI7
 YXAUh01ocYLds5f3vHjh7M45Qu1wswq89B2JlBqg8q5zwSDW+YDlY2buHDk8cbIusu
 5ZIpNeL6ovH7Y/1ecJsO+OlZi26adQxuXNzx879bEPzCHQlNpHO9+QrYKI2//8iY0V
 yMc8NhuLdQQ89YVzG+waMrlBNACoXFmTZZjTQsOqv2LTKNmoWZTFuUNHPMCpv1gNWX
 0XNFyprIVPzdg==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix,
 from userid 48) id 9C356C53BD0; Thu, 14 Sep 2023 19:15:21 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 217910] AMD Radeon RX 6600 XT: redraw artifacts around gui
 elements on primary monitor if TearFree disabled
Date: Thu, 14 Sep 2023 19:15:21 +0000
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
Message-ID: <bug-217910-2300-YZnFZIcpjc@https.bugzilla.kernel.org/>
In-Reply-To: <bug-217910-2300@https.bugzilla.kernel.org/>
References: <bug-217910-2300@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D217910

Artem S. Tashkinov (aros@gmx.com) changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
             Status|NEW                         |RESOLVED
         Resolution|---                         |ANSWERED

--- Comment #1 from Artem S. Tashkinov (aros@gmx.com) ---
Please repost in the official amdgpu bugtracker:
https://gitlab.freedesktop.org/drm/amd/-/issues

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
