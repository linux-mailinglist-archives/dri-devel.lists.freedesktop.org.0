Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 26C32502FDC
	for <lists+dri-devel@lfdr.de>; Fri, 15 Apr 2022 22:49:42 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B0A8D10E482;
	Fri, 15 Apr 2022 20:49:39 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E34DF10E499
 for <dri-devel@lists.freedesktop.org>; Fri, 15 Apr 2022 20:49:38 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 8341B6204B
 for <dri-devel@lists.freedesktop.org>; Fri, 15 Apr 2022 20:49:36 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id E65FBC385A4
 for <dri-devel@lists.freedesktop.org>; Fri, 15 Apr 2022 20:49:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1650055775;
 bh=vdEPXo3fx8dIcuYYS2HRJ9vVRyqk9LA8k5ECnV/M5m8=;
 h=From:To:Subject:Date:From;
 b=ZmmXNjdSGQSz7IbnTordIbyrz4QCDikUJ65C9rmDyPgR2LcUgo9Ev9lVzFa+d0dxM
 e4HPVQhxWxOU510KIVLbMrO/MiVZ2JsPfgOUEdGT0IZ5JpCAfFLq4k1RjsdUd216zj
 VQQrdowG0RW8yYDEHW2pkEhIbS0Ka6BhRNpubjd4FSkd7EPH0SlNBD+od/7m317Cfi
 IUGMmmnUwe8OFMHfwKQNdEAoMj2vCox1zAD4jbQuO553Gw2Z4RKVxYKXHhkd/RRXf6
 Wz7L/O3b9HfBXz6ETDhxgHTJ5qgCkjpFl4VTWtDRXm2cnBD1MZHqIkMlsxGSMiiZQ7
 NBBS/vYrAeJkw==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix,
 from userid 48) id C8ACDC05FF5; Fri, 15 Apr 2022 20:49:35 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 215842] New: PC freeze sidn kernel 5.17.x
Date: Fri, 15 Apr 2022 20:49:35 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: new
X-Bugzilla-Watch-Reason: AssignedTo drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Video(DRI - non Intel)
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: blocking
X-Bugzilla-Who: andreykoltsov@live.de
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: bug_id short_desc product version
 cf_kernel_version rep_platform op_sys cf_tree bug_status bug_severity
 priority component assigned_to reporter cf_regression
Message-ID: <bug-215842-2300@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D215842

            Bug ID: 215842
           Summary: PC freeze sidn kernel 5.17.x
           Product: Drivers
           Version: 2.5
    Kernel Version: 5.17.3
          Hardware: Intel
                OS: Linux
              Tree: Mainline
            Status: NEW
          Severity: blocking
          Priority: P1
         Component: Video(DRI - non Intel)
          Assignee: drivers_video-dri@kernel-bugs.osdl.org
          Reporter: andreykoltsov@live.de
        Regression: No

Hello,

the display of my PC freezes (i cant also go to thy tty and ssh also down).=
 I
can always recreate this by going to https://github.com/jonaburg/picom and
scrolling to the video. I can only see this behavior since the update to
5.17.x. Firefox version 99.0.1 (64-bit) is used as the browser. When switch=
ing
to the LTS kernel, the problem disappears and the PC no longer freezes. This
was tested many times on my productive system. I also tried different WMs
(xmonad, qtile, KDE, i3) and switching the filesystem from btrfs to ext4 - =
but
the problem remained. The PC has a SWAP. The XORG version is X.Org X Server
1.21.1.3. This Problem is also reproduceable on Wayland. I tested also by
uninstall of picom and reinstall it etc.

This are my components:

Resolution: 2560x1440=20
OS: Arch Linux x86_64=20
CPU: Intel i5-6600K (4) @ 4.600GHz
GPU: Intel HD Graphics 530=20
GPU: AMD ATI Radeon RX 470/480/570/570X/580/580X/590=20
Memory: 1049MiB / 14947MiB

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
