Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 25633549155
	for <lists+dri-devel@lfdr.de>; Mon, 13 Jun 2022 18:28:01 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B373010F003;
	Mon, 13 Jun 2022 16:27:56 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sin.source.kernel.org (sin.source.kernel.org [145.40.73.55])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E245B10F003
 for <dri-devel@lists.freedesktop.org>; Mon, 13 Jun 2022 16:27:54 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by sin.source.kernel.org (Postfix) with ESMTPS id F2C58CE12F5
 for <dri-devel@lists.freedesktop.org>; Mon, 13 Jun 2022 16:27:48 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 5AEEFC3411B
 for <dri-devel@lists.freedesktop.org>; Mon, 13 Jun 2022 16:27:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1655137667;
 bh=tP/07jVkdAkUYkFKUs9UkLlTilpxc036a2SnpnmnDCY=;
 h=From:To:Subject:Date:From;
 b=BvzW8Z/Oxm45yGSXn+AzGMnv/Ey9vIMaT7o7Pybas/9RS7xVjT0v6ULSS0BLfnsNC
 P0KgqJdyBry4DS0a0vXEJvBdnfD3WqLFhLblmfeNbqX0jJ22ZSrUGBhU6uFQI70S09
 qgEFMKnkhapoqO6S4QvkBe6LyUaQPxJvj6AjckkfqWpufm0/XHS9ZRiaDwz/5LZPUN
 mmLaEfNxlvoEMxENQLmLhgltl2+QB/HSYZ2YE4A2ykJSu7hY4yeZ6iq0Pxt4wqp3Hd
 v2jhY4EcCL3YfLMn2KMiCH50LYMhBgIdENybnt25Ejy13xQEZo5/+GciM+LsY2nejp
 sbn2UIS3z1ESg==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix,
 from userid 48) id 3DACCC05FD2; Mon, 13 Jun 2022 16:27:47 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 216120] New: [BISECTED][REGRESSION] drm/amdgpu:  add drm buddy
 support to amdgpu
Date: Mon, 13 Jun 2022 16:27:46 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: new
X-Bugzilla-Watch-Reason: AssignedTo drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Video(DRI - non Intel)
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: mat200300h@gmail.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: bug_id short_desc product version
 cf_kernel_version rep_platform op_sys cf_tree bug_status bug_severity
 priority component assigned_to reporter cf_regression
Message-ID: <bug-216120-2300@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D216120

            Bug ID: 216120
           Summary: [BISECTED][REGRESSION] drm/amdgpu:  add drm buddy
                    support to amdgpu
           Product: Drivers
           Version: 2.5
    Kernel Version: 5.19-rc1
          Hardware: Intel
                OS: Linux
              Tree: Mainline
            Status: NEW
          Severity: normal
          Priority: P1
         Component: Video(DRI - non Intel)
          Assignee: drivers_video-dri@kernel-bugs.osdl.org
          Reporter: mat200300h@gmail.com
        Regression: No

KDE plasma panel at the bottom of the desktop is empty. If I revert the pat=
ch
drm/amdgpu: add drm buddy support to amdgpu=20=20=20=20
c9cad937c0c58618fe5b0310fd539a854dc1ae95 the panel shows widgets and running
programs again. Fortunately the patch seems to revert cleanly.

BISECT_LOG and lspci attached

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
