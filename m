Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 52F8956C9B5
	for <lists+dri-devel@lfdr.de>; Sat,  9 Jul 2022 15:54:33 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 50F13113CBE;
	Sat,  9 Jul 2022 13:54:31 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9121D113C51
 for <dri-devel@lists.freedesktop.org>; Sat,  9 Jul 2022 13:54:30 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id E6129609D0
 for <dri-devel@lists.freedesktop.org>; Sat,  9 Jul 2022 13:54:29 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 53A5FC341CB
 for <dri-devel@lists.freedesktop.org>; Sat,  9 Jul 2022 13:54:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1657374869;
 bh=rHGerH/pDydrr2hxordWwfE0DcyHy2yPBqPGjgwDRcQ=;
 h=From:To:Subject:Date:In-Reply-To:References:From;
 b=PKiZPI4iDgWreZ/05rHjlXhNi2kRqCDbgwyDmy+UysqRZN4wLbO8sbEdw6ovXla6x
 GaBRQc9HZDN8f5xvp1l2qUEayzY5W1NySdezJwv75gGJn3Be6WmBQwvc0jApuHuWus
 +2ScspLQVSpKTUiC0DWBKf7/Cren2ExTnfzxWqiEWNVKa4L3zCiBKXUh78kROnfg3V
 2dMdF9C39cKtK5v2nVrnQem2za9+WJ4Q/bqtfoYr3aVzxwrbGb0MARXilBcvMHqfKg
 MkeEwsZk1jd2bW4x6ETiysv9E9rtRHMf0SRzQ9D19tCgyFqnih8XW2RrKG7qYJAL6X
 oTSIMvCQYWT+w==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix,
 from userid 48) id 39C31CC13B7; Sat,  9 Jul 2022 13:54:29 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 195581] NULL pointer dereference when amdgpu driver calls
 drm_load_edid_firmware
Date: Sat, 09 Jul 2022 13:54:28 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Video(DRI - non Intel)
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: mario.limonciello@amd.com
X-Bugzilla-Status: NEEDINFO
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: bug_status cc
Message-ID: <bug-195581-2300-sFkIbGw9tJ@https.bugzilla.kernel.org/>
In-Reply-To: <bug-195581-2300@https.bugzilla.kernel.org/>
References: <bug-195581-2300@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D195581

Mario Limonciello (AMD) (mario.limonciello@amd.com) changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
             Status|NEW                         |NEEDINFO
                 CC|                            |mario.limonciello@amd.com

--- Comment #4 from Mario Limonciello (AMD) (mario.limonciello@amd.com) ---
Some patches were posted that might help this issue.  You might want to give
them a try.

https://lore.kernel.org/lkml/CFXOER.OW6JFDCNUAT32@gmail.com/T/#m434c4f24f01=
e06f747fdc6c7f41b12babd4fb764

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
