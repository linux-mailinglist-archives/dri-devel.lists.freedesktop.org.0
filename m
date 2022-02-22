Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0E3514BF011
	for <lists+dri-devel@lfdr.de>; Tue, 22 Feb 2022 04:30:11 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D468010E37D;
	Tue, 22 Feb 2022 03:30:07 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1F07110E4C5
 for <dri-devel@lists.freedesktop.org>; Tue, 22 Feb 2022 03:30:06 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id CE3E7B81851
 for <dri-devel@lists.freedesktop.org>; Tue, 22 Feb 2022 03:30:02 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 7934FC340F0
 for <dri-devel@lists.freedesktop.org>; Tue, 22 Feb 2022 03:30:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1645500601;
 bh=yja+dWVtfPqo5tQMvIJaBtRHz1SW6bO/7d4sEH8WFmQ=;
 h=From:To:Subject:Date:From;
 b=AGk1ld4uO/DSICIFXedtSwDTr18ozwYW7p2Z8khnI3HS+ZGgH/nr8NV6G44GoeMAG
 usQs2Jyffxe1qpOzApHHDASvqZZXeXL0GXYcaf22OnWuYj0XRlzQt9/oARLPok+EI4
 36RXp/1+h6aC3EBzPMCy5uRY1vUks0DE5ahcSOw3Zkxq4NZDJTTDDXgb1bMxUk4kL5
 hwos44qYNNInjnQX+aZ6p3GH5wCcS/dw61vU63x10iLZxYrWnZOjFE7LZflMHutI3G
 LapK3vTDwfp8VOVsUePt4kR4I8an7j4z/IVsq8rwpPv3h6zEMqEwNRfGqaAcqVzQqZ
 V3xOIfvwG59eQ==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix,
 from userid 48) id 45DA3C05FCE; Tue, 22 Feb 2022 03:30:01 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 215631] New: Some Desktop oriented mode setting drivers are
 missing DRM PRIME support
Date: Tue, 22 Feb 2022 03:30:01 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: new
X-Bugzilla-Watch-Reason: AssignedTo drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Video(DRI - non Intel)
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: bluescreen_avenger@verizon.net
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: bug_id short_desc product version
 cf_kernel_version rep_platform op_sys cf_tree bug_status bug_severity
 priority component assigned_to reporter cf_regression
Message-ID: <bug-215631-2300@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D215631

            Bug ID: 215631
           Summary: Some Desktop oriented mode setting drivers are missing
                    DRM PRIME support
           Product: Drivers
           Version: 2.5
    Kernel Version: 5.14
          Hardware: Intel
                OS: Linux
              Tree: Mainline
            Status: NEW
          Severity: normal
          Priority: P1
         Component: Video(DRI - non Intel)
          Assignee: drivers_video-dri@kernel-bugs.osdl.org
          Reporter: bluescreen_avenger@verizon.net
        Regression: No

Hi

It seems that not all Desktop GPU oriented DRM drivers support PRIME, which=
 it
now appears that wlroots requires. Seeing that even SimpleDRM supports PRIME
though, I think that it should be possible for other drivers.=20=20

The drivers appear to be
ast
gma500
bochs
i2c
vboxvideo
These are the ones that Debian has turned on that to my knowledge are missi=
ng
this support, so that is what I am considering to be a Desktop GPU, althoug=
h I
might be wrong. I admit I am being very x86-centric.

I am not sure if I should open a separate bug for each driver, However I am=
 not
able to test all of them, as I really can only test the two virtual ones. T=
he
others I am going by grepping the kernel source for lines that I have been =
told
to check for, and an online database https://drmdb.emersion.fr/capabilities

I am invested in this because I think pairing the wlroots based cage with a
terminal emulator like foot is probably the best solution, and in a recent
release of wlroots, DRM Prime is a hard requirement. (probably for how they=
 do
multiple GPUs, I am not sure)


Thanks

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
