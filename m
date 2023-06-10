Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 43DC572A89E
	for <lists+dri-devel@lfdr.de>; Sat, 10 Jun 2023 05:05:57 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E3BCD10E178;
	Sat, 10 Jun 2023 03:05:50 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3A45910E178
 for <dri-devel@lists.freedesktop.org>; Sat, 10 Jun 2023 03:05:48 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 3AF8E60D54
 for <dri-devel@lists.freedesktop.org>; Sat, 10 Jun 2023 03:05:46 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 9DDD7C433EF
 for <dri-devel@lists.freedesktop.org>; Sat, 10 Jun 2023 03:05:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1686366345;
 bh=YpAwicnEhyReZQyc0+B9uiyccGqHY7UcuHzmJUoTyF0=;
 h=From:To:Subject:Date:From;
 b=Wolnpc9YofBKl9LqRNDh3PqBKK+9Sf1KPcunP/HPeyMFy5pXUnS6wufSNvLfcihez
 G6sADFOXuP7unn8/i/hkmErlDXWFmvThc9FZ0ud0uXHysSzwBuUBk0aGkpD/5cfLUT
 NKcfp/296KSIf0z/QjY5ue4ea4GB7KKIFNqvUCeZotzWjpfv+WZx8vazDA2dOY/Dl9
 vlfn7UNOYt35BgbLEjISiVDesr3INGjVYj+YzaGrKs4dXEcyvT8uJx8C7GGu+fo1oK
 +P+t8Ty5RU20rXFryxkhjARxUwVmzQY5pNKKGPGh08pCXg7g3QI4chvodkDy4EIBRT
 YhHJHZ3uAvPUA==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix,
 from userid 48) id 8435EC43143; Sat, 10 Jun 2023 03:05:45 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 217537] New: [AMDGPU] RDNA Freesync problem with CVT-Reduced
 display profile
Date: Sat, 10 Jun 2023 03:05:45 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: new
X-Bugzilla-Watch-Reason: AssignedTo drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Video(DRI - non Intel)
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: contato-myghi63@protonmail.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P3
X-Bugzilla-Assigned-To: drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: bug_id short_desc product version rep_platform
 op_sys bug_status bug_severity priority component assigned_to reporter
 cf_regression attachments.created
Message-ID: <bug-217537-2300@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D217537

            Bug ID: 217537
           Summary: [AMDGPU] RDNA Freesync problem with CVT-Reduced
                    display profile
           Product: Drivers
           Version: 2.5
          Hardware: AMD
                OS: Linux
            Status: NEW
          Severity: normal
          Priority: P3
         Component: Video(DRI - non Intel)
          Assignee: drivers_video-dri@kernel-bugs.osdl.org
          Reporter: contato-myghi63@protonmail.com
        Regression: No

Created attachment 304393
  --> https://bugzilla.kernel.org/attachment.cgi?id=3D304393&action=3Dedit
edid of my AOC 24G2 Monitor

The problem:
When a CVT-RB or CVT-RB2 monitor profile is enabled, using Freesync on a ga=
me
that demands 100% of GPU utilization makes the mouse pointer to perform very
slow (2~3fps) on Wayland, even if the game is running above 90fps smoothly.
Recording the screen results in a video without this problem happening (may=
be
pipewire simulates the mouse?)
With x11, the game itself starts jumping frames while recording the screen
(CVT-RB only), or always have a terrible struttering (CVT-RB2).

Why do I want to use CVT-RB or CVT-RB2 monitor profiles?
I want to decrease the idle power consumption of my GPU. Using one of those
monitor profiles do the trick (15W -> 3W).

Does these profiles work on Windows?
Yes, without any issue. I'm sure the problem is only happening on Linux
distros.

Which things I've done to try fixing the issues?
Tried linux-lts, switched between both amdvlk and radv (vulkan-radeon), tes=
ted
amdgpu.dc=3D0 (it ended up freezing the GPU before launching display server=
),
made a clean install of Arch Linux, tried different display profiles while
modifying the edid and none of these options helped at all.

Hardware:
GPU: AMD RX 5500XT 8GB (GV-R55XTOC-8GD)
Monitor: AOC 24G2 1920x1080 144hz Freesync Premium
Both are connected with DisplayPort 1.2

Software:
OS: Arch Linux
DE: Plasma 5.27.5
Kernel: linux 6.3.6 / linux-lts 6.1.33
Mesa: 23.1.1-1

I'm attaching the original edid of my monitor, just in case if someone want=
s to
analyze it (dumped with read-edid).

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
