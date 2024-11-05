Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DAA399BCA63
	for <lists+dri-devel@lfdr.de>; Tue,  5 Nov 2024 11:23:57 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 23D0B10E552;
	Tue,  5 Nov 2024 10:23:44 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="e+8aw6mm";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C3AF210E552
 for <dri-devel@lists.freedesktop.org>; Tue,  5 Nov 2024 10:23:42 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 10D025C10CB
 for <dri-devel@lists.freedesktop.org>; Tue,  5 Nov 2024 10:22:57 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 8402BC4CECF
 for <dri-devel@lists.freedesktop.org>; Tue,  5 Nov 2024 10:23:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1730802221;
 bh=/U4IVw/+a1i/9MWI/PEhBRR6LvnjS3SXDNzP+7kagrg=;
 h=From:To:Subject:Date:From;
 b=e+8aw6mmgmfHH81/aUjSRh0T+RPguwXr9XqmhRupwIZdIpLzFcof/xxG9IQyJStqG
 5NmAKYT5pzCeFdoAGuryOLlR1TNOfIY6NRyibf/xqyvalPsULNfAkiJ3B2bmxkqKb1
 +B5NycFGPkEgDZvhq/pILLqlQqDS9DkWiF3jOocyfY6XxlIB5/yXCPyKTG0L9/znDN
 eZSWZ9AAQdwNM8qiUnsNW4fnf6TTFEs8EGbUAXpxBFvi8sF3W566gNG7JbKRX6Jl5M
 SZ09V18bjeZ1m4B54/VXWhk4Y0Wpbjhh6E7I2BohOlEFoKYl+qjtlqsljhW/kTJQ0M
 vFq48WwcB4zXg==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix,
 from userid 48) id 7D276C53BC5; Tue,  5 Nov 2024 10:23:41 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 219468] New: Screen flickering on Radeon 680M - 6.12
Date: Tue, 05 Nov 2024 10:23:41 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: new
X-Bugzilla-Watch-Reason: AssignedTo drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Video(DRI - non Intel)
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: low
X-Bugzilla-Who: leejm516@gmail.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P3
X-Bugzilla-Assigned-To: drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: bug_id short_desc product version rep_platform
 op_sys bug_status bug_severity priority component assigned_to reporter
 cf_regression attachments.created
Message-ID: <bug-219468-2300@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D219468

            Bug ID: 219468
           Summary: Screen flickering on Radeon 680M - 6.12
           Product: Drivers
           Version: 2.5
          Hardware: AMD
                OS: Linux
            Status: NEW
          Severity: low
          Priority: P3
         Component: Video(DRI - non Intel)
          Assignee: drivers_video-dri@kernel-bugs.osdl.org
          Reporter: leejm516@gmail.com
        Regression: No

Created attachment 307141
  --> https://bugzilla.kernel.org/attachment.cgi?id=3D307141&action=3Dedit
dmesg

Random screen flickering is observed after upgrading to 6.12 (from rc1), wh=
ich
was not observed in 6.11 kernels.=20

The phenomenon is more notable when trying to scroll the screen with mouse.

Seen on a machine running KDE Plasma 6.2 (w/ wayland) on Arch Linux. Other =
WMs
have not been tested.=20

My English is not so good for describing the problem exactly. So I link two
clips where the display was taken.

I could identify nothing special from dmesg. The dmesg and kernel configura=
tion
are attached.

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
