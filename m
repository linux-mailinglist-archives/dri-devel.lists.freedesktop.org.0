Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 706CF48FEB1
	for <lists+dri-devel@lfdr.de>; Sun, 16 Jan 2022 20:39:14 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B0A2710E342;
	Sun, 16 Jan 2022 19:39:09 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4561C10E273
 for <dri-devel@lists.freedesktop.org>; Sun, 16 Jan 2022 19:39:08 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 7C41860FB3
 for <dri-devel@lists.freedesktop.org>; Sun, 16 Jan 2022 19:39:07 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id D1EA0C36AEC
 for <dri-devel@lists.freedesktop.org>; Sun, 16 Jan 2022 19:39:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1642361946;
 bh=GEuGJKWIS8QrtWjki8/600SutnYO2ybEVhBM2Sqo49o=;
 h=From:To:Subject:Date:From;
 b=kAUAGrHSE0Y/tSaGpW5DBw17bq0gqIHLY44jYX1auAtiClirVA6iLyRbHJueTzyG2
 IV9vhbXLeMn4s8MIQk1U56UsGiJ6aXX4kUycYVjUtGAbpXj6z61+ZoQE4TQfafeK5S
 fL9FjloNhzhTEfLfSAh3uoQmledNyv32ZiBSvKoW9x5GFRVjoHRzVJ+tcGLCrCFE9Y
 1iazwXitUv51GnJ225CikJOgyURXp0UhGq9GOY8u28swskm7c8JQT5alJun4GITq9o
 7LWvyQnbkQ9E7eqO2W7kBlgsFU/3rtCRwGtRwscMGxFsjTPSm7HGKPCLxH6i66bVLh
 eNhxpIbSp3KKg==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix,
 from userid 48) id BBE1CCC13AE; Sun, 16 Jan 2022 19:39:06 +0000 (UTC)
From: bugzilla-daemon@bugzilla.kernel.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 215499] New: AMDGPU: Tahiti flagged as "[drm] Unsupported asic.
 Remove me when IP discovery init is in place."
Date: Sun, 16 Jan 2022 19:39:06 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: new
X-Bugzilla-Watch-Reason: AssignedTo drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Video(DRI - non Intel)
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: alexandre.f.demers@gmail.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: bug_id short_desc product version
 cf_kernel_version rep_platform op_sys cf_tree bug_status bug_severity
 priority component assigned_to reporter cf_regression
Message-ID: <bug-215499-2300@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D215499

            Bug ID: 215499
           Summary: AMDGPU: Tahiti flagged as "[drm] Unsupported asic.
                    Remove me when IP discovery init is in place."
           Product: Drivers
           Version: 2.5
    Kernel Version: 5.16
          Hardware: All
                OS: Linux
              Tree: Mainline
            Status: NEW
          Severity: normal
          Priority: P1
         Component: Video(DRI - non Intel)
          Assignee: drivers_video-dri@kernel-bugs.osdl.org
          Reporter: alexandre.f.demers@gmail.com
        Regression: No

Until kernel 5.16, using a Tahiti GPU was working great along the amdgpu
driver. With the move to IP=20
discovery table, Tahiti is listed as not supported. Here, both kernels 5.15=
.2
and 5.16 are launched with the following parameters: radeon.si_support=3D0
radeon.cik_support=3D0 amdgpu.si_support=3D1 amdgpu.cik_support=3D1 amdgpu.=
dpm=3D1
amdgpu.dc=3D1 amdgpu.ppfeaturemask=3D0xffffffff

This is what's reported by amdgpu since kernel 5.16 related to the IP disco=
very
table integration:
---
jan 15 20:23:04 Xander kernel: [drm] radeon kernel modesetting enabled.
jan 15 20:23:04 Xander kernel: radeon 0000:04:00.0: SI support disabled by
module param
jan 15 20:23:04 Xander kernel: [drm] amdgpu kernel modesetting enabled.
jan 15 20:23:04 Xander kernel: amdgpu: Ignoring ACPI CRAT on non-APU system
jan 15 20:23:04 Xander kernel: amdgpu: Virtual CRAT table created for CPU
jan 15 20:23:04 Xander kernel: amdgpu: Topology: Add CPU node
jan 15 20:23:04 Xander kernel: [drm] Unsupported asic.  Remove me when IP
discovery init is in place.
...

This is what was reported prior, in version 5.15.2:
---
d=C3=A9c 11 16:30:33 Xander kernel: [drm] radeon kernel modesetting enabled.
d=C3=A9c 11 16:30:33 Xander kernel: radeon 0000:04:00.0: SI support disable=
d by
module param
d=C3=A9c 11 16:30:33 Xander kernel: [drm] amdgpu kernel modesetting enabled.
d=C3=A9c 11 16:30:33 Xander kernel: amdgpu: Ignoring ACPI CRAT on non-APU s=
ystem
d=C3=A9c 11 16:30:33 Xander kernel: amdgpu: Virtual CRAT table created for =
CPU
d=C3=A9c 11 16:30:33 Xander kernel: amdgpu: Topology: Add CPU node
d=C3=A9c 11 16:30:33 Xander kernel: checking generic (e0000000 7f0000) vs hw
(e0000000 10000000)
d=C3=A9c 11 16:30:33 Xander kernel: fb0: switching to amdgpu from EFI VGA
d=C3=A9c 11 16:30:33 Xander kernel: Console: switching to colour dummy devi=
ce 80x25
d=C3=A9c 11 16:30:33 Xander kernel: amdgpu 0000:04:00.0: vgaarb: deactivate=
 vga
console
d=C3=A9c 11 16:30:33 Xander kernel: [drm] initializing kernel modesetting (=
TAHITI
0x1002:0x6798 0x174B:0x3001 0x00).
d=C3=A9c 11 16:30:33 Xander kernel: amdgpu 0000:04:00.0: amdgpu: Trusted Me=
mory Zone
(TMZ) feature not supported
d=C3=A9c 11 16:30:33 Xander kernel: [drm] register mmio base: 0xFCA00000
d=C3=A9c 11 16:30:33 Xander kernel: [drm] register mmio size: 262144
d=C3=A9c 11 16:30:33 Xander kernel: [drm] PCIE atomic ops is not supported
d=C3=A9c 11 16:30:33 Xander kernel: [drm] add ip block number 0 <si_common>
d=C3=A9c 11 16:30:33 Xander kernel: [drm] add ip block number 1 <gmc_v6_0>
d=C3=A9c 11 16:30:33 Xander kernel: [drm] add ip block number 2 <si_ih>
d=C3=A9c 11 16:30:33 Xander kernel: [drm] add ip block number 3 <gfx_v6_0>
d=C3=A9c 11 16:30:33 Xander kernel: [drm] add ip block number 4 <si_dma>
d=C3=A9c 11 16:30:33 Xander kernel: [drm] add ip block number 5 <si_dpm>
d=C3=A9c 11 16:30:33 Xander kernel: [drm] add ip block number 6 <dm>
d=C3=A9c 11 16:30:33 Xander kernel: [drm] add ip block number 7 <uvd_v3_1>
...

Moving to IP discovery table shouldn't remove support to any already suppor=
ted
ASIC, even if this doesn't add any new feature.

Is this expected? Is the support to be added?

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
