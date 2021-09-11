Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2E5194079CD
	for <lists+dri-devel@lfdr.de>; Sat, 11 Sep 2021 19:16:20 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 80CAD6EC0D;
	Sat, 11 Sep 2021 17:16:14 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 87E0A6EC0D
 for <dri-devel@lists.freedesktop.org>; Sat, 11 Sep 2021 17:16:13 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPS id 5263C60FDA
 for <dri-devel@lists.freedesktop.org>; Sat, 11 Sep 2021 17:16:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1631380573;
 bh=GEXnwb/0WLMlJxgKrzF38WWArP4W23tIiyg9U82pHtA=;
 h=From:To:Subject:Date:From;
 b=f0h11SawyZJMvBllMasagC/RJ0tDUqPxecNfZVufk2TsGlTZCXQTQZmHf+JlcDcmG
 4PJ2hwkUVdgsoPU78TvQUSEFVmRpag4QeMQQc04aHNOfAFr7zW4GrNXIETCyyq3HBU
 01t+51NJk3xiANpUC1yHJ74z7TYzdhOHgL3EQMHVaRP0StCgenQz8JTBaIcxThEs9/
 +VxfQRuul1QJy9RpTY0V4iPaq3NvsCKh3njm0AxKAQRo42w8IE58+m5gBakwGQZm0B
 153rBeFP1kKs+2pYYWsSyN3e7yMq9vlYpieEcqkeJvrBOfXFXMwwp4sEKZqcM+z+bl
 dbQo4jBoYbTRA==
Received: by pdx-korg-bugzilla-2.web.codeaurora.org (Postfix, from userid 48)
 id 3E28D603E7; Sat, 11 Sep 2021 17:16:13 +0000 (UTC)
From: bugzilla-daemon@bugzilla.kernel.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 214369] New: Radeon HD5770 incorrect refresh rate via display
 port
Date: Sat, 11 Sep 2021 17:16:12 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: new
X-Bugzilla-Watch-Reason: AssignedTo drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Video(DRI - non Intel)
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: roxmail@list.ru
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: bug_id short_desc product version
 cf_kernel_version rep_platform op_sys cf_tree bug_status bug_severity
 priority component assigned_to reporter cf_regression attachments.created
Message-ID: <bug-214369-2300@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D214369

            Bug ID: 214369
           Summary: Radeon HD5770 incorrect refresh rate via display port
           Product: Drivers
           Version: 2.5
    Kernel Version: 5.14.2
          Hardware: All
                OS: Linux
              Tree: Mainline
            Status: NEW
          Severity: normal
          Priority: P1
         Component: Video(DRI - non Intel)
          Assignee: drivers_video-dri@kernel-bugs.osdl.org
          Reporter: roxmail@list.ru
        Regression: No

Created attachment 298751
  --> https://bugzilla.kernel.org/attachment.cgi?id=3D298751&action=3Dedit
dmesg

Monitor connected via display port to radeon hd5770 card.
Mouse cursor and windows movements are choppy, monitor says that video mode=
 are
1920x1080 at 44Hz.
$ xrandr
Screen 0: minimum 320 x 200, current 1920 x 1080, maximum 8192 x 8192
DisplayPort-0 connected primary 1920x1080+0+0 (normal left inverted right x
axis y axis) 600mm x 340mm
   1920x1080     60.00*+  59.94=20=20
   3840x2160     30.00=20=20
   2560x1440     59.95=20=20
   1920x1080_59.94  59.94=20=20
   1920x1080_59.55  59.53=20=20
   1920x1080_59.57  59.57=20=20
   1920x1080_59.56  59.56=20=20
   1920x1080_59.53  59.53=20=20
   1600x900      60.00=20=20
   1280x1024     60.02=20=20
   1280x800      59.81=20=20
   1280x720      60.00    59.94=20=20
   1024x768      60.00=20=20
   800x600       60.32=20=20
   720x480       60.00    59.94=20=20
   640x480       60.00    59.94=20=20
HDMI-0 disconnected (normal left inverted right x axis y axis)
DVI-0 disconnected (normal left inverted right x axis y axis)
DVI-1 disconnected (normal left inverted right x axis y axis)

With 2560x1440 refresh rate are 27Hz (from monitor), and there are black sc=
reen
while trying to set 3840x2160. I don't know whether it's regression. hdmi a=
nd
dvi works as expected (at least with 1920x1080).

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
