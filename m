Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D267C8240B6
	for <lists+dri-devel@lfdr.de>; Thu,  4 Jan 2024 12:33:52 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B3CD210E40A;
	Thu,  4 Jan 2024 11:33:47 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from ams.source.kernel.org (ams.source.kernel.org
 [IPv6:2604:1380:4601:e00::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E14E410E40A
 for <dri-devel@lists.freedesktop.org>; Thu,  4 Jan 2024 11:33:45 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by ams.source.kernel.org (Postfix) with ESMTP id 54C9DB817E3
 for <dri-devel@lists.freedesktop.org>; Thu,  4 Jan 2024 11:33:44 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 052D1C433AB
 for <dri-devel@lists.freedesktop.org>; Thu,  4 Jan 2024 11:33:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1704368023;
 bh=1LpTOTN9qWYLX47lU/ONAPElwcgCxytZGslARahkiJE=;
 h=From:To:Subject:Date:In-Reply-To:References:From;
 b=BuQYJCebZoVG0bz6w5/IXjK4E0Q6T0jDXQI93hMHHzcQ8iNUhDdeIuoYioiN1Y4E3
 O8Y0+aFS7/sCMl4LfGZXPxfGguF3UZJXpMLRM97IhhcdHwfk3J/Qrf2NHErik46tvU
 i9lOEcAxxMSOlJEGOXGFlCD4uqfls6/16xRM+exHtQtjLOXF8Kx5HdUSA453gY24xV
 QUA37/KwoH26KOOaXBs/at1DgXmTU0VLWUs6lpEpNDJTEtt9CztUKW+Z1eXwM9w5sx
 eguB1JIkQupgk6CpaLJXHbCwFIIVm2dE1zjVddckgUSYgl9zvxrkwYfOzsmoADLmSM
 blXSj8W3mAkkA==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix,
 from userid 48) id E961CC53BC6; Thu,  4 Jan 2024 11:33:42 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 213145] AMDGPU resets, timesout and crashes after "*ERROR*
 Waiting for fences timed out!"
Date: Thu, 04 Jan 2024 11:33:42 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Video(DRI - non Intel)
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: high
X-Bugzilla-Who: mikk351@gmail.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: cc
Message-ID: <bug-213145-2300-czylMoaUMK@https.bugzilla.kernel.org/>
In-Reply-To: <bug-213145-2300@https.bugzilla.kernel.org/>
References: <bug-213145-2300@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D213145

mikkk (mikk351@gmail.com) changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
                 CC|                            |mikk351@gmail.com

--- Comment #33 from mikkk (mikk351@gmail.com) ---
Also getting gfx_0.0.0 timeout error on brand new Lenovo ThinkPad T14 Gen 4=
 AMD
Ryzen=E2=84=A2 7 PRO 7840U w/ Radeon=E2=84=A2 780M Graphics =C3=97 16 on De=
bian.

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
