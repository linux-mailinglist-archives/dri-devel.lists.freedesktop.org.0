Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DC92B445516
	for <lists+dri-devel@lfdr.de>; Thu,  4 Nov 2021 15:17:38 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AEA256F415;
	Thu,  4 Nov 2021 14:17:36 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6D44F6F40F
 for <dri-devel@lists.freedesktop.org>; Thu,  4 Nov 2021 14:17:35 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPS id 412D561212
 for <dri-devel@lists.freedesktop.org>; Thu,  4 Nov 2021 14:17:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1636035455;
 bh=VN1KPGlj+06ofdVsG63TTdNNbmOcnoPCkn/jfu3VvuI=;
 h=From:To:Subject:Date:In-Reply-To:References:From;
 b=Ur5S1jTmx3RxnTawHv+ZoMRUG15oicS111DBliTqD0WqRKpXA+jgMTw9R3uC1SoSp
 Y1ZL97tGlGhM8+iZQinnsUWHLt7dBGvkapQXJXDVQgpCZOUOOOcmmJ5A4Syn4Jn4Q2
 QRd2g9TkqPASClHdkxmC3NsXfqUJoreBe97vPl7/UsbM12lqXBrVqNKyaoMAVEAaFf
 iyfPh63JOvWUaaRDnVuZX1SflOOYdDX5ZvDh79pverWB3vGHnS31viT2eY3YFsZ1l1
 TzvTNX6ne89Apf4jxFCRpc/mcJpjvY218CCTi4s6G/lc1GGUUdCSzsj5+aw/0mqGAO
 qRexzUOnbhAAQ==
Received: by pdx-korg-bugzilla-2.web.codeaurora.org (Postfix, from userid 48)
 id 3E55E61106; Thu,  4 Nov 2021 14:17:35 +0000 (UTC)
From: bugzilla-daemon@bugzilla.kernel.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 214621] WARNING: CPU: 3 PID: 521 at
 drivers/gpu/drm/ttm/ttm_bo.c:409 ttm_bo_release+0xb64/0xe40 [ttm]
Date: Thu, 04 Nov 2021 14:17:34 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Video(DRI - non Intel)
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: alexdeucher@gmail.com
X-Bugzilla-Status: RESOLVED
X-Bugzilla-Resolution: DUPLICATE
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-214621-2300-oD9fC5R6kV@https.bugzilla.kernel.org/>
In-Reply-To: <bug-214621-2300@https.bugzilla.kernel.org/>
References: <bug-214621-2300@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D214621

--- Comment #16 from Alex Deucher (alexdeucher@gmail.com) ---
(In reply to Lang Yu from comment #15)
> Many thanks for your help! I made a test patch to find who pinned amdgpu
> dmabuf.

Did you forget to attach it?

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
