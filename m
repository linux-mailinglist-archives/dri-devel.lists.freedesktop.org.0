Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6C888A94AA9
	for <lists+dri-devel@lfdr.de>; Mon, 21 Apr 2025 04:12:08 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DEB6110E09C;
	Mon, 21 Apr 2025 02:12:04 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="DW95nkfb";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CD36C10E09C
 for <dri-devel@lists.freedesktop.org>; Mon, 21 Apr 2025 02:12:00 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id C103B5C4A66
 for <dri-devel@lists.freedesktop.org>; Mon, 21 Apr 2025 02:09:32 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 77D6FC4CEED
 for <dri-devel@lists.freedesktop.org>; Mon, 21 Apr 2025 02:11:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1745201509;
 bh=DulM6440nbelSUAN+lX6qJuZ4WRjmAAk89OyJuf6drc=;
 h=From:To:Subject:Date:In-Reply-To:References:From;
 b=DW95nkfbwsgyynuTA+JLFVdXdOE5suB2Qm6Z5J9UhGW1JRFiOKlyUxnHnYwTZE6P8
 iZHN4WiiACDDGIjmw847Bp0RoPXZNuwvUUHUXqhdUjllJiEtRcjuqIeZFD6sf0zLBA
 F8mo67n3VVMIJZBtIhdSCU/gCvE73lvnMjbtHjUY8+Xh+indfjn+wOpiMbMpx3jHJ4
 5l7kMUXtISfiOn1q+cK3gxhzUCHvTlzhKhMu+q4733fK8Fq8LGZSO2rKJvAcyQjhRa
 oIKr9/RfOZsK4/XlmNpO2sir3wmJV+hGWH4QUrLxs/LCbA700/uaTJM5Ge5SS/435p
 6apsMXI2i4X7g==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix,
 from userid 48) id 5C172C41616; Mon, 21 Apr 2025 02:11:49 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 220041] Frequent freezes in amdgpu with 6.14.3 kernel.
Date: Mon, 21 Apr 2025 02:11:49 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Video(DRI - non Intel)
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: arichter1337@gmail.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P3
X-Bugzilla-Assigned-To: drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-220041-2300-p7879xb8UC@https.bugzilla.kernel.org/>
In-Reply-To: <bug-220041-2300@https.bugzilla.kernel.org/>
References: <bug-220041-2300@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D220041

--- Comment #1 from Alan Richter (arichter1337@gmail.com) ---
I should have mentioned:

APU: AMD Ryzen AI 9 HX 370 w/ Radeon 890M

Hardware: Beelink SER9

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
