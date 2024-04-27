Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CCF9F8B472A
	for <lists+dri-devel@lfdr.de>; Sat, 27 Apr 2024 18:43:48 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F2DFA10F6A5;
	Sat, 27 Apr 2024 16:43:45 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="D58fwAFp";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2825A10F6A5
 for <dri-devel@lists.freedesktop.org>; Sat, 27 Apr 2024 16:43:45 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 1E96C61C60
 for <dri-devel@lists.freedesktop.org>; Sat, 27 Apr 2024 16:43:44 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id BD5AAC2BD11
 for <dri-devel@lists.freedesktop.org>; Sat, 27 Apr 2024 16:43:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1714236223;
 bh=EmYBiwZgTQ4wu3mLJHp7TBZ+8P9H3+lV01plwQRzijs=;
 h=From:To:Subject:Date:From;
 b=D58fwAFplgGIWiDsJ32c6PHUVyXYf9V9cpmlXh8c/hNbZ1AYfuJIQOfyPxfgrAqD6
 nNAYto8uxtFk5LNPeI+p0A8ffmPTGaW3UK1pi/5zkHKNNU7kyaUFVkHdb9Q75kUjj+
 T4BgbC59sDvYp7tkPRGVQmHCC2QQP++Tfge7K+zegChPIOgPvqIc1DuhIAdURSorJU
 OXaWSe5O15RgT2GQSouINHAoUxuISUMcneV/xRlJHMoMdqDp/Cw4Z0j198gukQAOrH
 DtVqbkUrMUtIIndtSWJTfAyn5nLE6hcO3/EafOTeZDJvXRO6hYCK2q78znG9HYMnBV
 iKle3KonnqK+A==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix,
 from userid 48) id ADE68C43230; Sat, 27 Apr 2024 16:43:43 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 218785] New: HP Victus by HP Laptop 16-e0xxx. HDMI connection
 doesn't detect counterpart projector.
Date: Sat, 27 Apr 2024 16:43:43 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: new
X-Bugzilla-Watch-Reason: AssignedTo drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Video(DRI - non Intel)
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: icegood1980@gmail.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P3
X-Bugzilla-Assigned-To: drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: bug_id short_desc product version rep_platform
 op_sys bug_status bug_severity priority component assigned_to reporter
 cf_regression
Message-ID: <bug-218785-2300@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D218785

            Bug ID: 218785
           Summary: HP Victus by HP Laptop 16-e0xxx. HDMI connection
                    doesn't detect counterpart projector.
           Product: Drivers
           Version: 2.5
          Hardware: All
                OS: Linux
            Status: NEW
          Severity: normal
          Priority: P3
         Component: Video(DRI - non Intel)
          Assignee: drivers_video-dri@kernel-bugs.osdl.org
          Reporter: icegood1980@gmail.com
        Regression: No

As for me, it is regression.
On the same laptop and different OSes:

1) Linux fedora 6.0.17-200.fc36.x86_64 #1 SMP PREEMPT_DYNAMIC Wed Jan 4
16:00:03 UTC 2023 x86_64 GNU/Linux
everything is fine. UDEV has changes during cable plug in:

KERNEL[48.311971] change=20=20
/devices/pci0000:00/0000:00:01.1/0000:01:00.0/drm/card0 (drm)
UDEV  [48.317955] change=20=20
/devices/pci0000:00/0000:00:01.1/0000:01:00.0/drm/card0 (drm)
KERNEL[49.453282] add=20=20=20=20=20
/devices/pci0000:00/0000:00:01.1/0000:01:00.0/graphics/fb1 (graphics)
UDEV  [49.455485] add=20=20=20=20=20
/devices/pci0000:00/0000:00:01.1/0000:01:00.0/graphics/fb1 (graphics)

2) In both new ubuntu=20
Linux ice-home 6.8.0-31-generic #31-Ubuntu SMP PREEMPT_DYNAMIC Sat Apr 20
00:40:06 UTC 2024 x86_64 x86_64 x86_64 GNU/Linux
and fedora vmlinuz-6.8.7-300.fc40.x86_64

udev is empty. No changes

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
