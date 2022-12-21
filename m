Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id F34B465321D
	for <lists+dri-devel@lfdr.de>; Wed, 21 Dec 2022 14:58:15 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7F6F610E120;
	Wed, 21 Dec 2022 13:57:38 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E5E4C10E1C2
 for <dri-devel@lists.freedesktop.org>; Wed, 21 Dec 2022 13:57:31 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id B95C0617BF
 for <dri-devel@lists.freedesktop.org>; Wed, 21 Dec 2022 13:56:57 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 24CB1C433D2
 for <dri-devel@lists.freedesktop.org>; Wed, 21 Dec 2022 13:56:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1671631017;
 bh=/y58wlYjqki58GIYEEZNcqoVYcfJTS9j3bG7ERGZXv4=;
 h=From:To:Subject:Date:In-Reply-To:References:From;
 b=aBGw5XwT5hoBvNNyL3g1HN0BdkEf2xswLUJO47+bE+k41zY9wx2wWij+Y5rbCG+xj
 rr1/Vf5dA458PiXksOK7iiD4Oj0GBGCpbEbmOX9PBtHBhrPwDZBKZFwjc6QwGVZrLY
 oDBxDmbZPIrWyLpgxh/HppUOXJk6lf/XLWTMu33OoGkrE8oZN3Y1ilgfHMIXaULLrH
 QKbARdeZlL4QYjJoREyhMNHcBMM1sqc2Hb9M64RmSoWmjp3CtvY+l32KS8KHOkOZRc
 PZOpnr3fiNAhIVQVOuuG46LoAfwtaseVGLN87dy0Uswng0+kHK1phiqZpukIiT51q8
 tbu+teoz/BZew==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix,
 from userid 48) id 0DE66C43144; Wed, 21 Dec 2022 13:56:57 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 216806] [Raven Ridge] console disappears after framebuffer
 device loads
Date: Wed, 21 Dec 2022 13:56:56 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Video(DRI - non Intel)
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: vinibali1@gmail.com
X-Bugzilla-Status: NEEDINFO
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-216806-2300-Bio8gCERCR@https.bugzilla.kernel.org/>
In-Reply-To: <bug-216806-2300@https.bugzilla.kernel.org/>
References: <bug-216806-2300@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D216806

--- Comment #4 from Balazs Vinarz (vinibali1@gmail.com) ---
Just some more information to share here. I gave it another try, and the
console  freezes exactly at the moment when drm enables the kernel modesett=
ing.=20
[    6.329371] [drm] amdgpu kernel modesetting enabled.
With nomodesetting it works like it should, the vgaconsole remain active and
useable.
Do we know somebody who has some knowledge to understand the DRM logs?
Otherwise these lines are pretty strange for me:
[    6.330490] amdgpu: Ignoring ACPI CRAT on non-APU system
.
.
.
[    6.515889] [drm] failed to load ucode RLC_RESTORE_LIST_CNTL(0x28)=20
[    6.515892] [drm] psp gfx command LOAD_IP_FW(0x6) failed and response st=
atus
is (0xFFFF300F)
[    6.516529] [drm] failed to load ucode RLC_RESTORE_LIST_GPM_MEM(0x29)=20
[    6.516531] [drm] psp gfx command LOAD_IP_FW(0x6) failed and response st=
atus
is (0xFFFF000F)
[    6.517064] [drm] failed to load ucode RLC_RESTORE_LIST_SRM_MEM(0x2A)=20
[    6.517066] [drm] psp gfx command LOAD_IP_FW(0x6) failed and response st=
atus
is (0xFFFF000F)
.
.
.
[    6.549311] [drm] psp gfx command LOAD_ASD(0x4) failed and response stat=
us
is (0x34)
[    6.549317] amdgpu 0000:04:00.0: amdgpu: RAS: optional ras ta ucode is n=
ot
available
[    6.550582] [drm] psp gfx command LOAD_TA(0x1) failed and response statu=
s is
(0x34)
[    6.551810] [drm] psp gfx command LOAD_TA(0x1) failed and response statu=
s is
(0x34)

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
