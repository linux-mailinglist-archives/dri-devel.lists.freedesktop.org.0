Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DE4418FB536
	for <lists+dri-devel@lfdr.de>; Tue,  4 Jun 2024 16:27:14 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E789710E497;
	Tue,  4 Jun 2024 14:27:10 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="Jhz2Epqk";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3B4EB10E497
 for <dri-devel@lists.freedesktop.org>; Tue,  4 Jun 2024 14:27:09 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 514066130F
 for <dri-devel@lists.freedesktop.org>; Tue,  4 Jun 2024 14:27:08 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 247D3C2BBFC
 for <dri-devel@lists.freedesktop.org>; Tue,  4 Jun 2024 14:27:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1717511228;
 bh=LCLdaiwRwiKBrM/QLYdXoxfCcPWBk+nappsfFMPW6ps=;
 h=From:To:Subject:Date:In-Reply-To:References:From;
 b=Jhz2Epqkxp8Y1MIigCbnrUb1MIcvtNdjUAEubAY0o9UuWbluy44ILfXgK3SHaSbNX
 M4jnUOuGN70M0tbTeSB39XAPViNrkC16yzur2yIPEIHOaLTa4/a11ZRhlDmgHyfaLn
 eNnysH4xiHU0n/+KxHyQmH2aJAfXKTzbbD8uXpmQOufGkuuR+skcR/ZNGTUW35x4Fr
 v9/kBD8vbHBq6vrxf35xDdR5Gv/M+f5HABpfng9Kaf+CBtHVlAc0hVMIZUJBCYjS1a
 AoP58WkMtg/n/RietCpxBOuOePae9pz/E5pxWsjM6ixbxX8ucsb/kribvJVx0T68gG
 ludq5CFhiz7Hw==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix,
 from userid 48) id 1E5ABC53B50; Tue,  4 Jun 2024 14:27:08 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 201957] amdgpu: ring gfx timeout
Date: Tue, 04 Jun 2024 14:27:04 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Video(DRI - non Intel)
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: blocking
X-Bugzilla-Who: mario.limonciello@amd.com
X-Bugzilla-Status: RESOLVED
X-Bugzilla-Resolution: ANSWERED
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-201957-2300-h1maL9AGDm@https.bugzilla.kernel.org/>
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

--- Comment #101 from Mario Limonciello (AMD) (mario.limonciello@amd.com) -=
--
#100:

You have a GFX10 product, this is not affected by amdgpu.mcbp=3D0/1.  That'=
s only
for GFX9.  Please open your own issue for it.  Also in the kernel bug track=
er
please only report issues with mainline kernels.  6.8 is already EoL.

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
