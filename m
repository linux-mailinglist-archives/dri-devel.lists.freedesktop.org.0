Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AB7BB3B5255
	for <lists+dri-devel@lfdr.de>; Sun, 27 Jun 2021 08:32:51 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 36D196E06B;
	Sun, 27 Jun 2021 06:32:47 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2187F6E06B
 for <dri-devel@lists.freedesktop.org>; Sun, 27 Jun 2021 06:32:46 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPS id D273861C47
 for <dri-devel@lists.freedesktop.org>; Sun, 27 Jun 2021 06:32:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1624775565;
 bh=j5l0CdL/xkDIOaTbwgQUWRTYTjdvTUoF9Dwp3AusQOM=;
 h=From:To:Subject:Date:In-Reply-To:References:From;
 b=SxRUsOX3tS5zUb8RKOjNfeT+HiHqh9wD0jFDOE+QzfMH/1xc4g5Il3efA3BGmKRvj
 79KRcRdwd4m20fSl+C5MxaBPhzc1VMXcV64ynL0nUKhwOVzJ/fvhEBDlD9V3AB7BZV
 sVeG3uZpvG4tR2wsK3NyUFv82uKMD7NFnTNQzGXwnBQ3UKjKn0N6Qr/7Aa8oNTSblf
 qFggq8lzq8KBYLOhj7z4LY6jgx9D31lM+hSr+c62WUWMrMyFFRSOPZC79qbp1sSecV
 AyVnnfGXgN7/aTsqhtl1kWVgj7MYrqyCBPQkxhYQq90B5OesAY7dUh2AK7Y4ABq9RY
 F3ojZe/Twd3kQ==
Received: by pdx-korg-bugzilla-2.web.codeaurora.org (Postfix, from userid 48)
 id C712A61182; Sun, 27 Jun 2021 06:32:45 +0000 (UTC)
From: bugzilla-daemon@bugzilla.kernel.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 213599] amdgpu: navi RX 5500XT Very high idle power consumption
 (22 Watts)
Date: Sun, 27 Jun 2021 06:32:45 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Video(DRI - non Intel)
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: trivial
X-Bugzilla-Severity: high
X-Bugzilla-Who: fkrueger@mailbox.org
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: cc
Message-ID: <bug-213599-2300-8nRJr3gGtK@https.bugzilla.kernel.org/>
In-Reply-To: <bug-213599-2300@https.bugzilla.kernel.org/>
References: <bug-213599-2300@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D213599

Frank Kruger (fkrueger@mailbox.org) changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
                 CC|                            |fkrueger@mailbox.org

--- Comment #3 from Frank Kruger (fkrueger@mailbox.org) ---
Probably a dup of https://bugzilla.kernel.org/show_bug.cgi?id=3D213561. Acc=
ording
to https://lists.freedesktop.org/archives/amd-gfx/2021-June/065612.html pat=
ches
are on its way. Version 5.12.12 works fine here.

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
