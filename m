Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 501CDB49D9B
	for <lists+dri-devel@lfdr.de>; Tue,  9 Sep 2025 01:51:08 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9CA9610E216;
	Mon,  8 Sep 2025 23:51:05 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="tMnNENfq";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8ADD810E216
 for <dri-devel@lists.freedesktop.org>; Mon,  8 Sep 2025 23:51:04 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id 6BC0C402F3
 for <dri-devel@lists.freedesktop.org>; Mon,  8 Sep 2025 23:51:03 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 4A1C5C4CEF8
 for <dri-devel@lists.freedesktop.org>; Mon,  8 Sep 2025 23:51:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1757375463;
 bh=sn59eHOx25H13Jqy6xRLSTHBOUW2ZvFBW8FkbYU6Mfc=;
 h=From:To:Subject:Date:From;
 b=tMnNENfqlTNLa7Pp6K5oPD9UKozASHELeGPPJ12nrLdlaLII60zL7CyzMC5rC+z+y
 PqLlfh903TeCRjhwPrOB6SoDWeJ8DpO7k33X5gSCepa0FlxEwrAEbco2KnoPRGIHvl
 1oTQCK3dr/Jd3OkYedQtCE8Zfybe2sJporPAjcEJvMhMUcFpXzu7KRMJikXktCw3n1
 iHfluMmZ/xIwgPaktLLLg8Ft33Xn1U2UENUH5uJpQOQOs58+m6WtWNXgUvc3pmuVms
 ZQJ/n8QBaet/A3eIp+1DlknGGVTcKIycwgVeWAtEEj/nwaQ2v1/sWrQh/b5kTrvSKe
 unIWWxhTHdUqQ==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix,
 from userid 48) id 413A2C41614; Mon,  8 Sep 2025 23:51:03 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 220554] New: Display powers off after every update.
Date: Mon, 08 Sep 2025 23:51:03 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: new
X-Bugzilla-Watch-Reason: AssignedTo drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Video(DRI - non Intel)
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: vicencb@gmail.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P3
X-Bugzilla-Assigned-To: drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: bug_id short_desc product version rep_platform
 op_sys bug_status bug_severity priority component assigned_to reporter
 cf_regression
Message-ID: <bug-220554-2300@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D220554

            Bug ID: 220554
           Summary: Display powers off after every update.
           Product: Drivers
           Version: 2.5
          Hardware: ARM
                OS: Linux
            Status: NEW
          Severity: normal
          Priority: P3
         Component: Video(DRI - non Intel)
          Assignee: drivers_video-dri@kernel-bugs.osdl.org
          Reporter: vicencb@gmail.com
        Regression: No

The behaviour happens since 6.17. Tested on rc2 and rc5.
It does not happen on 6.16.


The platform is gru/kevin (arm64,RK3399) with the Panfrost DRM driver.


When it boots in console mode, the blinking of the cursor keeps the display=
 on.
If it is turned off via /sys/class/graphics/fbcon/cursor_blink, then the
display briefly shows each key press presented on screen for less than one
second and then powers off.


When starting the graphical mode (wayland), if there are no applications
drawing on the screen, the only way to keep the display on is by continuous=
ly
moving the mouse.

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
