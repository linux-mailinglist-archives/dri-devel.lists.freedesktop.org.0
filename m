Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C600B62679F
	for <lists+dri-devel@lfdr.de>; Sat, 12 Nov 2022 08:18:07 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1BB3310E03A;
	Sat, 12 Nov 2022 07:17:58 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from ams.source.kernel.org (ams.source.kernel.org
 [IPv6:2604:1380:4601:e00::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 20FF610E03A
 for <dri-devel@lists.freedesktop.org>; Sat, 12 Nov 2022 07:17:54 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 5A364B80113
 for <dri-devel@lists.freedesktop.org>; Sat, 12 Nov 2022 07:17:52 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 0A82AC433D6
 for <dri-devel@lists.freedesktop.org>; Sat, 12 Nov 2022 07:17:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1668237471;
 bh=kk4UsO1DGqSovEig09UNyJgfpHrOhEWdroxUOFJfz9k=;
 h=From:To:Subject:Date:From;
 b=R8FdqFN/s8nNiI1dQ0L0btwz9uIq1khTmt0e54BsbpUi3DYbLQXmMdZwrjcHvk4Pw
 kH03VwbwEo3M97Z3bSCQMrEiPECPoEVkyjb+HwoUJygiywhvWTneJYjXLCPxoaidqJ
 KLnlGK15Gx/MhQcI9Fp5VQDbxMAyXO1xSKbsMeTwToCLHJ0QawsanhbDxhjwa8vtAL
 2W+Ne9+SrjM7yUVt6s5+ga7jMeOeYxH993wi2HdBFKUKFjtdD7G5LAX8ICPQ6bl4wY
 Q4u4IusBXgc8M+k5UFo2lMJovm6rrUPn2WC0QGuBJppvNKiO/4TI81CslWr0FwNgXs
 KdNT/LbxlE2rg==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix,
 from userid 48) id E9709C433E7; Sat, 12 Nov 2022 07:17:50 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 216684] New: amdgpu graphics freezing about every 10 seconds in
 5.17 and later
Date: Sat, 12 Nov 2022 07:17:50 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: new
X-Bugzilla-Watch-Reason: AssignedTo drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Video(DRI - non Intel)
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: memredogan3626@gmail.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: bug_id short_desc product version
 cf_kernel_version rep_platform op_sys cf_tree bug_status bug_severity
 priority component assigned_to reporter cf_regression attachments.created
Message-ID: <bug-216684-2300@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D216684

            Bug ID: 216684
           Summary: amdgpu graphics freezing about every 10 seconds in
                    5.17 and later
           Product: Drivers
           Version: 2.5
    Kernel Version: 5.17 and later
          Hardware: All
                OS: Linux
              Tree: Mainline
            Status: NEW
          Severity: normal
          Priority: P1
         Component: Video(DRI - non Intel)
          Assignee: drivers_video-dri@kernel-bugs.osdl.org
          Reporter: memredogan3626@gmail.com
        Regression: No

Created attachment 303158
  --> https://bugzilla.kernel.org/attachment.cgi?id=3D303158&action=3Dedit
dmesg using 6.0.8

GPU: AMD R7 240 2GB with amdgpu=20
OS: Arch Linux with a custom kernel=20=20
Graphics freeze every 10 seconds in every kernel version after 5.17.=20
tried different Desktop managers and Wayland only using older kernel version
fixed it.
watching a video mpv shows dropped frames in output.

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
