Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D72DC63984F
	for <lists+dri-devel@lfdr.de>; Sat, 26 Nov 2022 22:51:36 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BB2C510E187;
	Sat, 26 Nov 2022 21:51:27 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5D63310E187
 for <dri-devel@lists.freedesktop.org>; Sat, 26 Nov 2022 21:51:23 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id C470360B3A
 for <dri-devel@lists.freedesktop.org>; Sat, 26 Nov 2022 21:51:22 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 3101BC433C1
 for <dri-devel@lists.freedesktop.org>; Sat, 26 Nov 2022 21:51:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1669499482;
 bh=e9IS6LQvoL4ym1uM+pEEOjzcuXa36x/AkTykSp+iqKw=;
 h=From:To:Subject:Date:From;
 b=lS6CEhxBY9nnVrCmRuaaKIpWnwqAOgPiUYESndMt6I6noAeGmUL43muZsm7AtRW/n
 ibMmATUyfOdUQfd1g0StN+AHmKnLod+fB5N9AQqov8fOf3yysfJSwg8jiS4zqQyc9l
 9end5YQ5qK1gXzDUmBtJZ4Q7aMBRTl39a7I1KteU9L966KzRSFC/1LbG71n8xRswAz
 Wabt/8MeyUUSO/TdfkoOysmFPt1qGnEurKpUF4rsy/r1Hscq4OF2hty7IG4LuD916s
 H0qotpMeqjtK5FeoYd9+NaTPXmpAwareuzpuIwCrx4/wDGs5vmNkNhMWLlSr6+rpsi
 6xuh2yMz42lKA==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix,
 from userid 48) id 1C3EBC433E7; Sat, 26 Nov 2022 21:51:22 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 216745] New: Kernel 6.1 breaks Thinkpad T14 Gen 2 AMD
 connection to USB-C dock Gen 2 with kernel Null pointer
Date: Sat, 26 Nov 2022 21:51:21 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: new
X-Bugzilla-Watch-Reason: AssignedTo drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Video(DRI - non Intel)
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: ezou@outlook.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: bug_id short_desc product version
 cf_kernel_version rep_platform op_sys cf_tree bug_status bug_severity
 priority component assigned_to reporter cf_regression attachments.created
Message-ID: <bug-216745-2300@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D216745

            Bug ID: 216745
           Summary: Kernel 6.1 breaks Thinkpad T14 Gen 2 AMD connection to
                    USB-C dock Gen 2 with kernel Null pointer
           Product: Drivers
           Version: 2.5
    Kernel Version: 6.1.0-rc6
          Hardware: AMD
                OS: Linux
              Tree: Mainline
            Status: NEW
          Severity: normal
          Priority: P1
         Component: Video(DRI - non Intel)
          Assignee: drivers_video-dri@kernel-bugs.osdl.org
          Reporter: ezou@outlook.com
        Regression: No

Created attachment 303299
  --> https://bugzilla.kernel.org/attachment.cgi?id=3D303299&action=3Dedit
journal output with DRM debug set to 0xf

Full description of the problem:
Connecting T14 Gen 2 AMD to Thinkpad USB C Dock Gen 2 via USB-C on DP Alt m=
ode.

Since kernel 6.1.0-rc4 (and rc 5, rc 6), once the usb c cable is plug in, t=
he
dock and computer detected the connection by blinking on both power buttons=
 (on
laptop and dock), and then the laptop became completely unresponsive, has t=
o be
powered off by long press on power button. Based on the journal output it l=
ooks
like something about DRM and AMDGPU, and Kernel null pointer (and oops
message).

Keywords:=20
DRM, AMDGPU

Most recent kernel version which did not have the bug:
Tried 5.19.17, 6.0.10 and it's working.

A journal output with DRM debug value set to 0xf is attached.

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
