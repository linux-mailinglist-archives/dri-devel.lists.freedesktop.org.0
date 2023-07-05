Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5D824748ED3
	for <lists+dri-devel@lfdr.de>; Wed,  5 Jul 2023 22:23:16 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9D68410E3C2;
	Wed,  5 Jul 2023 20:23:14 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 359E110E3C2
 for <dri-devel@lists.freedesktop.org>; Wed,  5 Jul 2023 20:23:13 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 723DF61595
 for <dri-devel@lists.freedesktop.org>; Wed,  5 Jul 2023 20:23:11 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id D77D1C433C7
 for <dri-devel@lists.freedesktop.org>; Wed,  5 Jul 2023 20:23:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1688588590;
 bh=dXbfk3Q8wQ+Q+uEDT4JqG5FcnupL7BTY1/iq/Mt1Fv4=;
 h=From:To:Subject:Date:From;
 b=hp2DPWXiXbbTeQv70KamuIeJ1A7PFPcj4d0ucLonNeI86kWxkIVu8LSlkOIbHAMI8
 jmWB3iKLuXy5VFb9Kndo0KGouuiI/h+hbdMztUOqhhFuRrQM6uPihOo7J8wY2aF3Ui
 Zq/JWet08GTJPvWxjKzR5sXpnOxHbkJuVzytmI1HFwaK4nJDqsnOh/FjK/tMkR/FId
 4y5+hbPd1vkwhf9ieoqJKy1EcbIFCMXhDD/h3JllS359PNWaG8449XAmwNAdAFtmtj
 VzUkPVjKpcLHMg3udUzGJ8YkmkcqX8RBZ26TuqudT3HVhSulEV1CzKF3sOGWkr6xFa
 k8vcBc+uGxyiQ==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix,
 from userid 48) id BF6E6C53BD0; Wed,  5 Jul 2023 20:23:10 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 217636] New: Commit edcfed8671 disables previously supported
 video resolutions (on AMD Rembrandt)
Date: Wed, 05 Jul 2023 20:23:10 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: new
X-Bugzilla-Watch-Reason: AssignedTo drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Video(DRI - non Intel)
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: saverio.pub2@gmail.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P3
X-Bugzilla-Assigned-To: drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: bug_id short_desc product version rep_platform
 op_sys bug_status bug_severity priority component assigned_to reporter
 cf_regression
Message-ID: <bug-217636-2300@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D217636

            Bug ID: 217636
           Summary: Commit edcfed8671 disables previously supported video
                    resolutions (on AMD Rembrandt)
           Product: Drivers
           Version: 2.5
          Hardware: All
                OS: Linux
            Status: NEW
          Severity: normal
          Priority: P3
         Component: Video(DRI - non Intel)
          Assignee: drivers_video-dri@kernel-bugs.osdl.org
          Reporter: saverio.pub2@gmail.com
        Regression: No

I have a laptop with an AMD Rembrandt APU (6800U).

The display has a native resolution of 2880x1800, however, via
`~/.config/monitors.xml`, I set it 1920x1200.

After the upgrade to the kernel v6.3.9, the resolution 1920x1200 is not all=
owed
anymore, and on login, I see a brief popup with an error.

After bisection, i've isolated the culprit to commit `edcfed8671`
("drm/amd/display: edp do not add non-edid timings").

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
