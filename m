Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2D0CF5E71B9
	for <lists+dri-devel@lfdr.de>; Fri, 23 Sep 2022 04:05:19 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C5ED810E17F;
	Fri, 23 Sep 2022 02:05:10 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from ams.source.kernel.org (ams.source.kernel.org
 [IPv6:2604:1380:4601:e00::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B9D6810E17F
 for <dri-devel@lists.freedesktop.org>; Fri, 23 Sep 2022 02:05:04 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 2ADF9B808C6
 for <dri-devel@lists.freedesktop.org>; Fri, 23 Sep 2022 02:05:03 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id E5D8FC433C1
 for <dri-devel@lists.freedesktop.org>; Fri, 23 Sep 2022 02:05:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1663898701;
 bh=h7kaubJK5nxu9zYFVgJGKCvNIkjeFojhEVCyMsJI21M=;
 h=From:To:Subject:Date:From;
 b=DGASAap28gJ1cAFuKasYPCTXuSMo9llgPmQP2ZNGKBG6ILKixWwWH82jpJ9sUjmFe
 SbcKZmug6K259Buj/DdPyUKBx++4L/tL0MMilduZtGXVLQkSWFl7RIhAcjvg6P9Gix
 rpZNjXfm0p0mZc9f77+TOe4tDwrjIAFVCFnI/hD4Ppr5a5ugCWdq2+RVDZEiZctm+h
 kVL6zfUYmSYptfV8LYQBLFRtMfZD0Ayi46TnRQnlvBUB5M3s0F4cDcvZ9P6dEV2nbH
 Ckpdthm/2MIJsnjCnHzdX0md6AqX6Gd+j3d3lkrZAyvazjY5RbJJzb1FporIPjgovy
 4gQIRbX55kSeQ==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix,
 from userid 48) id C9E8FC433E4; Fri, 23 Sep 2022 02:05:01 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 216516] New: s2ram freezes screen (Ryzen-5650U incl. Radeon GPU)
Date: Fri, 23 Sep 2022 02:05:01 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: new
X-Bugzilla-Watch-Reason: AssignedTo drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Video(DRI - non Intel)
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: kolAflash@kolahilft.de
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: bug_id short_desc product version
 cf_kernel_version rep_platform op_sys cf_tree bug_status bug_severity
 priority component assigned_to reporter cf_regression
Message-ID: <bug-216516-2300@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D216516

            Bug ID: 216516
           Summary: s2ram freezes screen (Ryzen-5650U incl. Radeon GPU)
           Product: Drivers
           Version: 2.5
    Kernel Version: 6.0-rc6
          Hardware: AMD
                OS: Linux
              Tree: Mainline
            Status: NEW
          Severity: normal
          Priority: P1
         Component: Video(DRI - non Intel)
          Assignee: drivers_video-dri@kernel-bugs.osdl.org
          Reporter: kolAflash@kolahilft.de
        Regression: No

Beginning with this commit (regression) s2ram freezes the screen and I have=
 to
restart the XServer.
https://git.kernel.org/pub/scm/linux/kernel/git/stable/linux.git/commit/?id=
=3D7123d39dc24dcd21ff23d75f46f926b15269b9da
git describe: 5.18-rc7-1-g7123d39dc24d
s2ram =3D> systemctl start suspend.target

Before v5.18-rc7 the system sometimes stays awake instead of entering S3 sl=
eep.
But in that case the system keeps running stable and the screen doesn't fre=
eze.
And on the second try the system then successfully enters S3. You can see t=
his
behaviour in the attached linux-v5.18-rc7.txt for 5.18.0-rc7-v5.18-rc7.
This "stays awake" behaviour is probably a bug on it's own.
(I may may open another bug report when this one is solved)

Later on in the attached linux-v5.18-rc7.txt you'll see how
5.18.0-rc7-v5.18-rc7-1-g7123d39dc24d behaves when the screen is getting fro=
zen.


Reverting commit 7123d39dc on v5.19.10 or v6.0-rc7 makes the problem disapp=
ear.


=3D System =3D
Model: HP EliteBook 845 G8 (notebook)
CPU+GPU: Ryzen 5650U incl. Radeon GPU
OS: openSUSE-15.4

The HP EliteBook 845 G8 uses s0ix/s2idle by default. But I changed the ACPI
BIOS settings to enable classic S3 s2ram.

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
