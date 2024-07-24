Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 76F3C93AD8D
	for <lists+dri-devel@lfdr.de>; Wed, 24 Jul 2024 09:55:48 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0720010E3D7;
	Wed, 24 Jul 2024 07:55:46 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="BJZomtc4";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 87B8910E3D7
 for <dri-devel@lists.freedesktop.org>; Wed, 24 Jul 2024 07:55:32 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 9EACE611CD
 for <dri-devel@lists.freedesktop.org>; Wed, 24 Jul 2024 07:55:31 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 2F5A4C4AF12
 for <dri-devel@lists.freedesktop.org>; Wed, 24 Jul 2024 07:55:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1721807731;
 bh=hckJP1SSuHQx2WnaywlXbXPa/H3hEMT6GgzsVR3mfvY=;
 h=From:To:Subject:Date:In-Reply-To:References:From;
 b=BJZomtc4tGseolX2cAacH7JPG+uep5Xfj0LSK1wVegBuUZeAiKauXTs9ft2B+inVX
 nzDLWTDMxxpwglVgth13VKs+1hbNS1LJ46D9r4C/0myQHlIN1ITCcJJMkrAh0HQ8QR
 EBt187qnwxEBsdvmmKd3Mu5OwKxHJrrzKYwSxlIgSNkh1fUYXKhewxsxvPbMwCV6Ia
 c7BEkYiLHw2H3B5BJhaX/mT4A1VwPVRoGWIl1sxYJo/q6pkTqzyd8gZ3JWe+T2YBUz
 yVIaKaGOWDYOjpohyJe3DIh/VZ29Zha5Uo6T7KmfiQhjSZZjEUwQsvBPrVDCYLEKnD
 NZ14+jWFmdLYw==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix,
 from userid 48) id 2929AC53BB8; Wed, 24 Jul 2024 07:55:31 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 211807] [drm:drm_dp_mst_dpcd_read] *ERROR* mstb
 000000004e6288dd port 3: DPCD read on addr 0x60 for 1 bytes NAKed
Date: Wed, 24 Jul 2024 07:55:30 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Video(DRI - non Intel)
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: low
X-Bugzilla-Who: wellsedith352@gmail.com
X-Bugzilla-Status: RESOLVED
X-Bugzilla-Resolution: ANSWERED
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: cc
Message-ID: <bug-211807-2300-XRBi49ikyC@https.bugzilla.kernel.org/>
In-Reply-To: <bug-211807-2300@https.bugzilla.kernel.org/>
References: <bug-211807-2300@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D211807

joggarden (wellsedith352@gmail.com) changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
                 CC|                            |wellsedith352@gmail.com

--- Comment #28 from joggarden (wellsedith352@gmail.com) ---
This error indicates a problem with DisplayPort Multi-Stream Transport (MST=
) on
your system. While it hasn't caused visible issues, it's worth investigatin=
g.
You might try updating your kernel to the latest version if you haven't
already, as MST support has seen continuous improvements.
https://drift-hunters.io

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
