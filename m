Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B1C9064499B
	for <lists+dri-devel@lfdr.de>; Tue,  6 Dec 2022 17:45:38 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A362210E14E;
	Tue,  6 Dec 2022 16:45:32 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 27F3310E14E
 for <dri-devel@lists.freedesktop.org>; Tue,  6 Dec 2022 16:45:28 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 54DD0617E3
 for <dri-devel@lists.freedesktop.org>; Tue,  6 Dec 2022 16:45:27 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id B8D02C433C1
 for <dri-devel@lists.freedesktop.org>; Tue,  6 Dec 2022 16:45:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1670345126;
 bh=5r0+lZrCxisNuxYcflHFOE3LWs6seC5uF+buB74klxM=;
 h=From:To:Subject:Date:From;
 b=UAJBVf6xHBEMW0mAYw6Fr0TP0IGoBe+L4mzZa1M3jqYG1O1GYfr6IvBzegfii/sAq
 jlObhwkjPYsmPAoDITGNAHgH2m9KE+2A4BeDb2PAEWefvfH+nU5o2pi3AnpDKqs3Vo
 Hrr5wN7s1889EcqdsuJ1pVlANRctVLjOIsaGg5rm0Bi/cKL4ZCLw3wK7A27MbB22ND
 q+GJo3dSpSJ9oiztPYFx9U/tEmmZ6KWNAmfNOhxg6zihyCMkzrtW6xsvfK1f/fTVe1
 GRJcAa59km4cddBnlWAG5AjpS0cbNj7lTh2CAdL9at1MyD47yOQD4FuqVimSmNFGah
 7sLulA2pocZYw==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix,
 from userid 48) id 9DDA1C433E4; Tue,  6 Dec 2022 16:45:26 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 216780] New: problem of Mesa drawing boxes after resume from
 suspend with Geforce4 420 Go
Date: Tue, 06 Dec 2022 16:45:26 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: new
X-Bugzilla-Watch-Reason: AssignedTo drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Video(DRI - non Intel)
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: estellnb@elstel.org
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: bug_id short_desc product version
 cf_kernel_version rep_platform op_sys cf_tree bug_status bug_severity
 priority component assigned_to reporter cf_regression
Message-ID: <bug-216780-2300@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D216780

            Bug ID: 216780
           Summary: problem of Mesa drawing boxes after resume from
                    suspend with Geforce4 420 Go
           Product: Drivers
           Version: 2.5
    Kernel Version: 5.15.79-desktop586
          Hardware: All
                OS: Linux
              Tree: Mainline
            Status: NEW
          Severity: normal
          Priority: P1
         Component: Video(DRI - non Intel)
          Assignee: drivers_video-dri@kernel-bugs.osdl.org
          Reporter: estellnb@elstel.org
        Regression: No

When it has finished to boot everything works correctly: I can move the Pid=
gin
window or I can lock the screen: boxes are drawn correctly. Yet after resume
from s2ram/suspend you can see a black box as the background of the status =
bar
tray instead of a filled one, moving pidgin leads to box-shaped screen
distortions and the background box of the login dialogue is not drawn any m=
ore.
Using Mesa patches from Karol Herbst for gtk3 apps
(https://gitlab.freedesktop.org/drm/nouveau/-/issues/174); xscreensaver as =
well
as the drawing of the lxde status tray bar shall be independent from this
however (non-gtk).

kernel modules used for dri (as returned by lspci): rivafb, nvidiafb, nouve=
au
kernel: 5.15.79-desktop586 SMP i686 i386 GNU/Linux
graphics card: NVIDIA Corporation NV17M [GeForce4 420 Go] (rev a3)

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
