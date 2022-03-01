Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 52D594C8E89
	for <lists+dri-devel@lfdr.de>; Tue,  1 Mar 2022 16:06:17 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1716310E50A;
	Tue,  1 Mar 2022 15:06:13 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AB4F110E50A
 for <dri-devel@lists.freedesktop.org>; Tue,  1 Mar 2022 15:06:11 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 3EB14B81986
 for <dri-devel@lists.freedesktop.org>; Tue,  1 Mar 2022 15:06:10 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id E66F1C340F3
 for <dri-devel@lists.freedesktop.org>; Tue,  1 Mar 2022 15:06:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1646147168;
 bh=ThgGFTq7r78gPpaqR1n78LlC9j9iv5LbHJftlzEzGNU=;
 h=From:To:Subject:Date:In-Reply-To:References:From;
 b=lg0MuUBp+01nJByV67xp2N1dfUGEULACFAxMKqeZL08rPLQmQ4vnDgm3y53FXvh6H
 xgwPuxNa0mr2iFIVXVv28sYgJaeE+jpY9obWF6SnJf3yt5e57w4QNO991YJF9CPg3J
 TRh+mY5ZQJgiF2lNSjALE+eEVbyaxSG4lEuujDOw1DW3d0zR7clazrF3sEw+txvCQz
 KmFwZICEHHZfjeUOW3y6y5VMdvXQ7JFHZq4qEOkXoz1g4e8b4NSlvAzxd+n1pkdlmQ
 VEcsptNrgKCiSkImALihKzyUBh+sd+ELVkT5IjprLJUm+p8S8PU7ACjJ/OkGpLgFnA
 2jBH9BvbBLWBg==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix,
 from userid 48) id C8722CAC6E2; Tue,  1 Mar 2022 15:06:08 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 215648] amdgpu: Changing monitor configuration
 (plug/unplug/wake from DPMS) causes kernel panic
Date: Tue, 01 Mar 2022 15:06:08 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Video(DRI - non Intel)
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: alexdeucher@gmail.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: cc
Message-ID: <bug-215648-2300-obJkSXtsLh@https.bugzilla.kernel.org/>
In-Reply-To: <bug-215648-2300@https.bugzilla.kernel.org/>
References: <bug-215648-2300@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D215648

Alex Deucher (alexdeucher@gmail.com) changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
                 CC|                            |alexdeucher@gmail.com

--- Comment #1 from Alex Deucher (alexdeucher@gmail.com) ---
Can you attach your full dmesg output when the issue happens?  Is it actual=
ly a
segfault or just a warning?

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
