Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3E1F3A6A16E
	for <lists+dri-devel@lfdr.de>; Thu, 20 Mar 2025 09:34:15 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6F4F710E1AF;
	Thu, 20 Mar 2025 08:34:12 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="eP7Hun1k";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9790410E1AF
 for <dri-devel@lists.freedesktop.org>; Thu, 20 Mar 2025 08:34:05 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 679335C632D
 for <dri-devel@lists.freedesktop.org>; Thu, 20 Mar 2025 08:31:44 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 0D1B0C4CEDD
 for <dri-devel@lists.freedesktop.org>; Thu, 20 Mar 2025 08:34:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1742459641;
 bh=hhBuJ/TcGNwll3I6LqOKqu2F/BaFRFXZrExi0UHOeDs=;
 h=From:To:Subject:Date:In-Reply-To:References:From;
 b=eP7Hun1kW53GL7cj9gHIUG7tQn4Ew133Fzzcsw/saV6RXQCHik9yLat/EDgQ6S5wu
 mL5THtiQ3ojMTOgNcQQz7noTyrKTuqT6c056g/R/eeA1LsZjTgDwQ6yLbwQJZBqVGO
 DAyJz8aJrFK3kFLRa9b/m67lBZbxeJgz7DW9LqgQJ3NyI7MYhjTsKAzCaYdpHRpTcb
 4Q1AGX5K93wDS4Ek/C5/7ajo+86X613jB5LYUMiRK+snJE/j2KdOmv10s3f6jUKU9K
 UL73lTN0TmF9rJZ+7Xl8n4QpjoTU7MENxxl/cEDmI7UFBlf5CtlesiCiXGfj1rXRUX
 UIDdNAYMkQQgQ==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix,
 from userid 48) id F3AA2C3279F; Thu, 20 Mar 2025 08:34:00 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 219895] amdgpu spamming log [drm] scheduler comp_1.0.1 is not
 ready, skipping and becoming slow
Date: Thu, 20 Mar 2025 08:34:00 +0000
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
Message-ID: <bug-219895-2300-3q9b5u8vHB@https.bugzilla.kernel.org/>
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
