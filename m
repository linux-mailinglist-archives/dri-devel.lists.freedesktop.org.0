Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6600E656FEB
	for <lists+dri-devel@lfdr.de>; Tue, 27 Dec 2022 22:17:43 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E41A110E178;
	Tue, 27 Dec 2022 21:17:10 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8300310E178
 for <dri-devel@lists.freedesktop.org>; Tue, 27 Dec 2022 21:17:09 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 8772B61253
 for <dri-devel@lists.freedesktop.org>; Tue, 27 Dec 2022 21:16:35 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id E8B0EC433D2
 for <dri-devel@lists.freedesktop.org>; Tue, 27 Dec 2022 21:16:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1672175794;
 bh=zkDZzxySwNqcGrf9+8TR3qZSyLZk6CqXSZ+4NgRWhjM=;
 h=From:To:Subject:Date:From;
 b=VWxpDHw0foQJfIwjdO/NHlJJoBHqzEtf+DOldSmI9pH5FVwOt/gQ1QAlXrWY/7Jl6
 ettVdPxdwf1X4oE6xWb2FmnyBwa6rArQcL04k5k4xscPRXDKsWUsgQlnjfvfNCfNwL
 38PyCAklHjhTFjNt0bI4zDr2zVhNbXizAMEzIABnZK1hB6VrGeFVIhAsvz7ihXGnnP
 NoPwu0i2bWp8EdANl5vtVJplHSOR/W1mTWrqcg4p8X8K6H6t9RFl1ygJIcZAL4vFZB
 D7RJDlb+kEPHB7H5twGebZlx1BouHcXHdsLj3HI64GYHoVurCaD6pHWr0GdQ8ie/0Q
 4qOcsnUVo7IXw==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix,
 from userid 48) id D4723C43143; Tue, 27 Dec 2022 21:16:34 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 216855] New: drivers/gpu/drm/nouveau/dispnv50/wndw.c:696:1:
 warning: conflicting types
Date: Tue, 27 Dec 2022 21:16:34 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: new
X-Bugzilla-Watch-Reason: AssignedTo drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Video(DRI - non Intel)
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: milan.buska@yahoo.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: bug_id short_desc product version
 cf_kernel_version rep_platform op_sys cf_tree bug_status bug_severity
 priority component assigned_to reporter cf_regression attachments.created
Message-ID: <bug-216855-2300@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D216855

            Bug ID: 216855
           Summary: drivers/gpu/drm/nouveau/dispnv50/wndw.c:696:1:
                    warning: conflicting types
           Product: Drivers
           Version: 2.5
    Kernel Version: 6.2-rc1
          Hardware: All
                OS: Linux
              Tree: Mainline
            Status: NEW
          Severity: normal
          Priority: P1
         Component: Video(DRI - non Intel)
          Assignee: drivers_video-dri@kernel-bugs.osdl.org
          Reporter: milan.buska@yahoo.com
        Regression: No

Created attachment 303491
  --> https://bugzilla.kernel.org/attachment.cgi?id=3D303491&action=3Dedit
conflicting types for 'nv50_wndw_new_' due to enum/integer mismatch

Build kernel use gcc-13.0.0 warning drivers/gpu/drm/nouveau/dispnv50/wndw.c

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
