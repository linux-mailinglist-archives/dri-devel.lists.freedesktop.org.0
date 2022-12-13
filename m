Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7C28064BDFE
	for <lists+dri-devel@lfdr.de>; Tue, 13 Dec 2022 21:38:30 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 738F710E1F2;
	Tue, 13 Dec 2022 20:37:47 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from ams.source.kernel.org (ams.source.kernel.org
 [IPv6:2604:1380:4601:e00::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 030B110E1F2
 for <dri-devel@lists.freedesktop.org>; Tue, 13 Dec 2022 20:37:42 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id A008CB815BA
 for <dri-devel@lists.freedesktop.org>; Tue, 13 Dec 2022 20:37:33 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 6881CC433EF
 for <dri-devel@lists.freedesktop.org>; Tue, 13 Dec 2022 20:37:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1670963852;
 bh=7kVh3ZGVWDG6C+dPJTGnKmIUObp/ZZlILAp4CTdQa1U=;
 h=From:To:Subject:Date:From;
 b=BBs2yBO8SNMRSgBcuY29mT9Kw7d0i2mRBWtwrSRkfIzOzkR5n2W4QqPKGeJ9FXpUu
 bhTGxMhk/o5wYnBREZYrM95ObmHAjuObPdo1j4Puc0CkQUg4avT6R2b770VaKFJ5WZ
 T9Qc3/9XCCa7KYmxlr1D9/MlLt5moW3v8BWHxUGiN4F/F2Og/WnfHM0BXUj53G6fUA
 SPRM6Q68ct1fY8eup03TyL0CFJJNJXz0cupykFcBXrUqfa6nRlhs54WJeQmMdLk1MX
 jS8pgxlKgnLGeQVepjMxnc2YYTtWmMrTcM7xO3zc9uF7FhbqOkV06sLRxqfcQNYDXO
 baHC++AcvtR8w==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix,
 from userid 48) id 51B18C43143; Tue, 13 Dec 2022 20:37:32 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 216806] New: [Raven Ridge] console disappears after framebuffer
 device loads
Date: Tue, 13 Dec 2022 20:37:31 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: new
X-Bugzilla-Watch-Reason: AssignedTo drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Video(DRI - non Intel)
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: vinibali1@gmail.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: bug_id short_desc product version
 cf_kernel_version rep_platform op_sys cf_tree bug_status bug_severity
 priority component assigned_to reporter cf_regression attachments.created
Message-ID: <bug-216806-2300@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D216806

            Bug ID: 216806
           Summary: [Raven Ridge] console disappears after framebuffer
                    device loads
           Product: Drivers
           Version: 2.5
    Kernel Version: 6.0.8
          Hardware: AMD
                OS: Linux
              Tree: Mainline
            Status: NEW
          Severity: normal
          Priority: P1
         Component: Video(DRI - non Intel)
          Assignee: drivers_video-dri@kernel-bugs.osdl.org
          Reporter: vinibali1@gmail.com
        Regression: No

Created attachment 303402
  --> https://bugzilla.kernel.org/attachment.cgi?id=3D303402&action=3Dedit
dmesg - debug drm, no dc

I have an HP c645 Chromebook with Ryzen 3 3250C APU.
Everytime, when the FB/DRM loads and vgaconsole get's deactivated, the cons=
ole
freezes. I tried many common kernel parameters so far with no luck.
By default it freezes back in the boot sequence,
using amdgpu.dc=3D0 it freezes after the tty shows the login text.
I attached the logs with debug drm flags, with disabling the Display Core
driver, the last message is some BT device load message and right after tha=
t I
found the DRM load.

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
