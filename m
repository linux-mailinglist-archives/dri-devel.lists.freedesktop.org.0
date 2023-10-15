Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C0CDA7C98E6
	for <lists+dri-devel@lfdr.de>; Sun, 15 Oct 2023 14:09:21 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EA65410E036;
	Sun, 15 Oct 2023 12:09:17 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 52FBD10E036
 for <dri-devel@lists.freedesktop.org>; Sun, 15 Oct 2023 12:09:16 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 91F1860B85
 for <dri-devel@lists.freedesktop.org>; Sun, 15 Oct 2023 12:09:15 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id B97C5C433CA
 for <dri-devel@lists.freedesktop.org>; Sun, 15 Oct 2023 12:09:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1697371754;
 bh=pM1zKc7f+lL2S0LBgIftBNQ9QpBXYlPzZTZQLPwev9A=;
 h=From:To:Subject:Date:In-Reply-To:References:From;
 b=Q/+Aaw+f+KkC8+lbTYL88EJ20oM/qsVc3qR6LYOE0oUCunMbFJhw0CcygFKUX08xr
 ZQZVZ9pLXYZY4fYrDRevi2/WJYAi1uRCWbtcciPbZVMv/TjkMt7O+uXLiLiKWBpX1z
 YPnB/wvzMuJw/YV+X5JutjHI3/WAfbDnR7A+Di3ybYTYjRcRQ2FIKd3xoMmMrDK66w
 tlmev6K//sMcGgiRG2jUldJUYWV/JrnTe44C6Aw5VprhBvGD4NMp4GicIvwQvfLoOc
 +6J9SI4Dnf8vNfbKn3dHo3B++19an7DZ49oX2EPkyYZqb3qQVJL+spJCrKJoyppiPO
 tO6+4pwn8lZGQ==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix,
 from userid 48) id A8104C53BD2; Sun, 15 Oct 2023 12:09:14 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 205089] amdgpu : drm:amdgpu_cs_ioctl : Failed to initialize
 parser -125
Date: Sun, 15 Oct 2023 12:09:13 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Video(DRI - non Intel)
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: nintyfan19@gmail.com
X-Bugzilla-Status: RESOLVED
X-Bugzilla-Resolution: CODE_FIX
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-205089-2300-7DhXxRonaH@https.bugzilla.kernel.org/>
In-Reply-To: <bug-205089-2300@https.bugzilla.kernel.org/>
References: <bug-205089-2300@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D205089

--- Comment #60 from nintyfan19@gmail.com (nintyfan19@gmail.com) ---

Memory info (GL_NVX_gpu_memory_info):
    Dedicated video memory: 512 MB
    Total available memory: 8210 MB
    Currently available dedicated video memory: 19 MB

This makes me nervous long ago. It always allocate near 512 MB. No matter i=
f It
displays only blank desktop or I use many applications with games. Maybe th=
ere
is problem?

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
