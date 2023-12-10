Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id AE96780BC1D
	for <lists+dri-devel@lfdr.de>; Sun, 10 Dec 2023 17:16:05 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9B38910E242;
	Sun, 10 Dec 2023 16:15:59 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sin.source.kernel.org (sin.source.kernel.org [145.40.73.55])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 58E6010E242
 for <dri-devel@lists.freedesktop.org>; Sun, 10 Dec 2023 16:15:57 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sin.source.kernel.org (Postfix) with ESMTP id 1B757CE0930
 for <dri-devel@lists.freedesktop.org>; Sun, 10 Dec 2023 16:15:54 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 56728C433C9
 for <dri-devel@lists.freedesktop.org>; Sun, 10 Dec 2023 16:15:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1702224953;
 bh=SuuI3CZ+Oo+fAf59QDIh8HYjNTnfYxjvlPOBl+Xs8FI=;
 h=From:To:Subject:Date:From;
 b=kFWHKSFXukcb19NYaSPqy7+sLeK4FIilr/0s5cBRs1eBpQZ+NfESczFGByqRBl0Yt
 u9kEjXZOWklHeGH3KGxQ74+j/YsnDQx+O0nvOsf4/Za4Lm9L59DtI0qKLZ+ccR4Zv/
 7Fw1AYQ387rxjcquXGrMueQoyZhW7ci/QZru9M4BfYvmLHlpASoxvzgMe2qouyTcVz
 zwpuo56yM0tA56R2G2egiTkf4ECzl3nJ9rjfGBjOi3yzixCDrytQ3bLehpPM3ePB24
 221gyKONodR0gSGAlYpy8eoZ1dReeWnZXeTKcjfH+sE//nXdR2zG2K5UfHzaQx2cgh
 OsZgMqL3lYZUQ==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix,
 from userid 48) id 3DBE6C53BCD; Sun, 10 Dec 2023 16:15:53 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 218250] New: Regression nouveau driver
Date: Sun, 10 Dec 2023 16:15:52 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: new
X-Bugzilla-Watch-Reason: AssignedTo drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Video(DRI - non Intel)
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: blocking
X-Bugzilla-Who: 19.jaime.91@gmail.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P3
X-Bugzilla-Assigned-To: drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: bug_id short_desc product version rep_platform
 op_sys bug_status bug_severity priority component assigned_to reporter
 cf_regression attachments.created
Message-ID: <bug-218250-2300@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D218250

            Bug ID: 218250
           Summary: Regression nouveau driver
           Product: Drivers
           Version: 2.5
          Hardware: All
                OS: Linux
            Status: NEW
          Severity: blocking
          Priority: P3
         Component: Video(DRI - non Intel)
          Assignee: drivers_video-dri@kernel-bugs.osdl.org
          Reporter: 19.jaime.91@gmail.com
        Regression: No

Created attachment 305577
  --> https://bugzilla.kernel.org/attachment.cgi?id=3D305577&action=3Dedit
dmesg

ae1aadb1eb8d3cbc52e42bee71d67bd4a71f9f07 is the first bad commit
commit ae1aadb1eb8d3cbc52e42bee71d67bd4a71f9f07
Author: Dave Airlie <airlied@redhat.com>
Date:   Thu Nov 16 00:39:33 2023 +1000

    nouveau: don't fail driver load if no display hw present.

    If we get back ENODEV don't fail load. There are nvidia devices
    that don't have display blocks and the driver should work on those.

    Fixes: 15740541e8f0 ("drm/nouveau/devinit/tu102-: prepare for GSP-RM")
    Link: https://gitlab.freedesktop.org/drm/nouveau/-/issues/270
    Signed-off-by: Dave Airlie <airlied@redhat.com>
    Signed-off-by: Danilo Krummrich <dakr@redhat.com>
    Link:
https://patchwork.freedesktop.org/patch/msgid/20231115143933.261287-1-airli=
ed@gmail.com

 drivers/gpu/drm/nouveau/nouveau_display.c | 5 +++++
 1 file changed, 5 insertions(+)

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
