Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3188F7B4351
	for <lists+dri-devel@lfdr.de>; Sat, 30 Sep 2023 21:35:46 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EEB4E10E17E;
	Sat, 30 Sep 2023 19:35:41 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from ams.source.kernel.org (ams.source.kernel.org
 [IPv6:2604:1380:4601:e00::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0F9A510E17E
 for <dri-devel@lists.freedesktop.org>; Sat, 30 Sep 2023 19:35:38 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by ams.source.kernel.org (Postfix) with ESMTP id 9E21FB80315
 for <dri-devel@lists.freedesktop.org>; Sat, 30 Sep 2023 19:35:36 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 0176BC433C8
 for <dri-devel@lists.freedesktop.org>; Sat, 30 Sep 2023 19:35:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1696102536;
 bh=2rdUiE20JHwAjCxDex6MvYMLiK5tUFCCLmxErjTYx6s=;
 h=From:To:Subject:Date:In-Reply-To:References:From;
 b=MwmN8smxEUk8t1NuWFYZBA4ViNpFRXF/o0xhaitqhFYWUxkbW94P3+R/p37kV/mcp
 5DUAxAIrq5uASPI8cFED3jLV+svi77tCihJ6yhrRmBPrfXmXNiwX5McragZouveB9n
 tz9HKYkhmMUDNovdzD9slvXsMJNVb1rawtpaewtWt5gkQh4qJ6hw9QW5uCU7ZjWk7B
 U9dQPqYmf9g8gEgF4X+n7mHzKaNOZWm9f/HdhSyTzE3cCsRcs6bhVa1lcKM1j0TtfO
 VrA+qhxbvaCflonzpXh/aN+vT9dzQE/XVCqdYLX6yXgYq9lzRqPX9fQtv5fR+lWgHn
 7lbeGq1mi3Tzw==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix,
 from userid 48) id DBDACC4332E; Sat, 30 Sep 2023 19:35:35 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 201957] amdgpu: ring gfx timeout
Date: Sat, 30 Sep 2023 19:35:26 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Video(DRI - non Intel)
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: blocking
X-Bugzilla-Who: aspicer@gmail.com
X-Bugzilla-Status: RESOLVED
X-Bugzilla-Resolution: ANSWERED
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-201957-2300-MEoaKaSWxn@https.bugzilla.kernel.org/>
In-Reply-To: <bug-201957-2300@https.bugzilla.kernel.org/>
References: <bug-201957-2300@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D201957

--- Comment #95 from aspicer@gmail.com ---
(In reply to KC from comment #94)

Did you have it set to 1 previously? If not, I'm not sure if that was the
silver bullet, because it looks like it defaults to 0.
https://dri.freedesktop.org/docs/drm/gpu/amdgpu.html

mcbp (int)

It is used to enable mid command buffer preemption. (0 =3D disabled (defaul=
t), 1
=3D enabled)

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
