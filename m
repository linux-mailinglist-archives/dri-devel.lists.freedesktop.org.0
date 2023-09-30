Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 522997B3FDA
	for <lists+dri-devel@lfdr.de>; Sat, 30 Sep 2023 12:16:46 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D52BD10E075;
	Sat, 30 Sep 2023 10:16:39 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from ams.source.kernel.org (ams.source.kernel.org
 [IPv6:2604:1380:4601:e00::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B0F9010E075
 for <dri-devel@lists.freedesktop.org>; Sat, 30 Sep 2023 10:16:37 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by ams.source.kernel.org (Postfix) with ESMTP id 43B55B80816
 for <dri-devel@lists.freedesktop.org>; Sat, 30 Sep 2023 10:16:36 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 6F55EC433C8
 for <dri-devel@lists.freedesktop.org>; Sat, 30 Sep 2023 10:16:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1696068995;
 bh=5I2BWPPzg3tscpnt2hwdvY2rEJmrM4AFOO0Krwpdn6E=;
 h=From:To:Subject:Date:In-Reply-To:References:From;
 b=PTR/bhRFuY8KEcZgsFbojPm/3drlxs1U0ZBr+DxLi+E9IBZA/w0jVi6UaVpVHLj12
 wwU0gnRLnaLp5jAVousOeoAkmd0EWMkDA24a/+RT16mcVXkmc0j00ejU7/n4xMcv77
 gQoKsg0VigqxV3A/bVZ72/QqfFd2dY9QVx86QyCUbdADJ39VNwbuuRCsjFtYo5Ai4q
 aJ0/YQnsa4RTnRdcmAKz38j+3ZrnoNGffBtQw1HWwRAIyqbZPcQi+QkuGYjj4RDvbO
 4xnnBeuWtY5vxMTEzPn6RYxfITMcM6EfbzdJwxM0qmH4uSFW99AnRTWwB7J5yDBoLa
 BvjsxDZ6GceYQ==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix,
 from userid 48) id 56785C53BD0; Sat, 30 Sep 2023 10:16:35 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 217958] Crashes if I boot the computer with the second display
 connected to HDMI output
Date: Sat, 30 Sep 2023 10:16:35 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Video(DRI - non Intel)
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: aros@gmx.com
X-Bugzilla-Status: RESOLVED
X-Bugzilla-Resolution: ANSWERED
X-Bugzilla-Priority: P3
X-Bugzilla-Assigned-To: drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: bug_status resolution
Message-ID: <bug-217958-2300-hmeP0SUsPM@https.bugzilla.kernel.org/>
In-Reply-To: <bug-217958-2300@https.bugzilla.kernel.org/>
References: <bug-217958-2300@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D217958

Artem S. Tashkinov (aros@gmx.com) changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
             Status|NEW                         |RESOLVED
         Resolution|---                         |ANSWERED

--- Comment #1 from Artem S. Tashkinov (aros@gmx.com) ---
This bug reports belongs to https://gitlab.freedesktop.org/drm/amd/-/issues

Please repost.

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
