Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 9F7D444118E
	for <lists+dri-devel@lfdr.de>; Mon,  1 Nov 2021 01:07:25 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B063989B0D;
	Mon,  1 Nov 2021 00:07:20 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4B42589B0D
 for <dri-devel@lists.freedesktop.org>; Mon,  1 Nov 2021 00:07:19 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPS id 1E4F760EE3
 for <dri-devel@lists.freedesktop.org>; Mon,  1 Nov 2021 00:07:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1635725239;
 bh=90vgwktyZPDKfFQjg/UrLp37Z+EztIPS46juN3I5AzE=;
 h=From:To:Subject:Date:In-Reply-To:References:From;
 b=qFcleqJO71QXdLCvOe2c5iJboHPTRi+vSajq4nRCa+w5juLGuGDYtrNo2t+QzPOHf
 SoJ0KTVUgNCEm4kfLhQ/cQ9wmdnVJXLZaiSUKmvOstSuYU5/q4JFqQ8zF5kc8+tNhe
 02W8LUKpeDPHp3iKnqFmCxqMBkiaBgAlf9q79Q8clXKJm56PVNnowSzwZ43xZrZcoG
 2OxMQFOiO57deAteaQBCYDMySpu8RgmhKlPAVOzLqEKBD9aGVklM0pDRC7oCop53y6
 8HtDm+8tM6VsZgJJiM8TazuKPRzqWtA92K2ugVCBJXxsFDO9IXQ9yPOOFoYluIpVG9
 HMEctb2Ohn2kA==
Received: by pdx-korg-bugzilla-2.web.codeaurora.org (Postfix, from userid 48)
 id 1439660F48; Mon,  1 Nov 2021 00:07:19 +0000 (UTC)
From: bugzilla-daemon@bugzilla.kernel.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 214901] amdgpu freezes HP laptop at start up
Date: Mon, 01 Nov 2021 00:07:18 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Video(DRI - non Intel)
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: spasswolf@web.de
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-214901-2300-5xNTM1N6E6@https.bugzilla.kernel.org/>
In-Reply-To: <bug-214901-2300@https.bugzilla.kernel.org/>
References: <bug-214901-2300@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D214901

--- Comment #1 from spasswolf@web.de ---
G
00:01.0 VGA compatible controller [0300]: Advanced Micro Devices, Inc.
[AMD/ATI] Wani [Radeon R5/R6/R7 Graphics] [1002:9874] (rev ca) (prog-if 00 =
[VGA
controller])
        DeviceName: ATI EG BROADWAY
        Subsystem: Hewlett-Packard Company Wani [Radeon R5/R6/R7 Graphics]
[103c:8332]
        Flags: bus master, fast devsel, latency 0, IRQ 37
        Memory at e0000000 (64-bit, prefetchable) [size=3D256M]
        Memory at f0800000 (64-bit, prefetchable) [size=3D8M]
        I/O ports at 4000 [size=3D256]
        Memory at f0400000 (32-bit, non-prefetchable) [size=3D256K]
        Expansion ROM at 000c0000 [disabled] [size=3D128K]
        Capabilities: <access denied>
        Kernel driver in use: amdgpu
        Kernel modules: amdgpu

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
