Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 65879444F97
	for <lists+dri-devel@lfdr.de>; Thu,  4 Nov 2021 08:19:38 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8FE616E519;
	Thu,  4 Nov 2021 07:19:35 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 498486E519
 for <dri-devel@lists.freedesktop.org>; Thu,  4 Nov 2021 07:19:34 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPS id 1BCBA61168
 for <dri-devel@lists.freedesktop.org>; Thu,  4 Nov 2021 07:19:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1636010374;
 bh=JWhBVUKFQFzNKkuikN5QWFmbvtLDMvIZJqLm2wJE1UQ=;
 h=From:To:Subject:Date:In-Reply-To:References:From;
 b=L0A0Ux216K3Zl79m14HfrVIec/qP42I6UstaNGjDsp5QAShdUNyANwSSNC2ljwT/X
 PZUfriX43PtIzm67GKSMTFWKAFRKlTZX0MdIJXgUABJ+i42P1e1TW8jzoqvd321WQd
 1r3gaV6JXwelcPsJ8d0WUAfj/lYBLCPWTdQDRJNcFyZ4c6M+JR9LaDkg2VBcYJrnRn
 ZY+yvIBBwHqFVrVsm78+xPUXqlPV1tF+exbUlXMruhi6RQag4AvD+upMvAjd5XJF/h
 1AIUVG1YS8TGXhAXmQdE5k1YOR2xJRlIZ11MHVUldl9/y/jYBKZ4a6tId2QWGpFIV8
 OuyRNaoqmAv7A==
Received: by pdx-korg-bugzilla-2.web.codeaurora.org (Postfix, from userid 48)
 id 18E29610FD; Thu,  4 Nov 2021 07:19:34 +0000 (UTC)
From: bugzilla-daemon@bugzilla.kernel.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 214621] WARNING: CPU: 3 PID: 521 at
 drivers/gpu/drm/ttm/ttm_bo.c:409 ttm_bo_release+0xb64/0xe40 [ttm]
Date: Thu, 04 Nov 2021 07:19:33 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Video(DRI - non Intel)
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: christian.koenig@amd.com
X-Bugzilla-Status: RESOLVED
X-Bugzilla-Resolution: DUPLICATE
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-214621-2300-KDQrlJS184@https.bugzilla.kernel.org/>
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

--- Comment #7 from Christian K=C3=B6nig (christian.koenig@amd.com) ---
Yeah, that won't work. As far as I can see the problem is not inside amdgpu,
but rather inside the driver which is importing buffers from amdgpu.

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
