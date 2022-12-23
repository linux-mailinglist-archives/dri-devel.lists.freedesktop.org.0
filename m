Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CD6316554D5
	for <lists+dri-devel@lfdr.de>; Fri, 23 Dec 2022 23:03:18 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3C2B510E225;
	Fri, 23 Dec 2022 22:02:44 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9A97A10E225
 for <dri-devel@lists.freedesktop.org>; Fri, 23 Dec 2022 22:02:40 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id C060161F60
 for <dri-devel@lists.freedesktop.org>; Fri, 23 Dec 2022 22:02:36 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 325C1C433EF
 for <dri-devel@lists.freedesktop.org>; Fri, 23 Dec 2022 22:02:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1671832956;
 bh=P5Hr8whAdctL56+gpB85CCSjo1VROLo5tfHVVt/VcfM=;
 h=From:To:Subject:Date:From;
 b=gTDAsHazttiD1dlgXPsasqP64HH4beYxjekq/6qSyKWYlfdg6pN/c5M6p9I/WnxfX
 vmiM4l1VaHimCggvc6ValvFL5HEEUXRN8VCh5cQdM0d1wNU2nAVnEiVxmTUsa/SP0H
 GhY97XQO35ZU4LryWf6GST3TEIeUnWPinzY2m+Mg8VRL+NCINkbENynE/ubSXyxF4t
 /DKe7IesVtbKD/qjCaekLFsVPFmepXutITDnKeSOFNDnlMLo2yROO3mW/n7OHbuhPu
 eccWAjBsqted59ZZ2CdhacLwL+ZAm56yTVFLtcxNKDUVGXqXqxDjn5e3YQmMuhn6n3
 2VEYjT8/Pz3pA==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix,
 from userid 48) id 1F8A8C43141; Fri, 23 Dec 2022 22:02:36 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 216840] New: AMDGPU trace message at boot
Date: Fri, 23 Dec 2022 22:02:35 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: new
X-Bugzilla-Watch-Reason: AssignedTo drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Video(DRI - non Intel)
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: low
X-Bugzilla-Who: carlosalvatore@gmail.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: bug_id short_desc product version
 cf_kernel_version rep_platform op_sys cf_tree bug_status bug_severity
 priority component assigned_to reporter cf_regression
Message-ID: <bug-216840-2300@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D216840

            Bug ID: 216840
           Summary: AMDGPU trace message at boot
           Product: Drivers
           Version: 2.5
    Kernel Version: 6.1.0
          Hardware: AMD
                OS: Linux
              Tree: Mainline
            Status: NEW
          Severity: low
          Priority: P1
         Component: Video(DRI - non Intel)
          Assignee: drivers_video-dri@kernel-bugs.osdl.org
          Reporter: carlosalvatore@gmail.com
        Regression: No

Hi,=20

I don't know whether this is important, but I'd like to know what is causing
this trace message: https://pastebin.pl/view/94557be6 when booting.

Hardware details:
- MB: ASUS M5A97 R2.0
- CPU: AMD FX-8350
- Kernel: 6.1.0
- GPU: Radeon HD 7970 (Tahiti) [Gigabyte GV-R797OC-3GD]

There are no critical problems when using the system. Other than HDMI port =
not
working anymore (I don't know if this is related. At some point HDMI stopped
working and I've got this message: "drm:detect_link_and_local_sink [amdgpu]]
*ERROR* No EDID read.", which I bypassed using a HDMI>DP adapter).

GRUB command line arguments are:=20
amdgpu.si_support=3D1 radeon.si_support=3D0 modprobe.blacklist=3Dradeon
amdgpu.vm_update_mode=3D3 amdgpu.dpm=3D1 amdgpu.dc=3D1 amd_iommu=3Don iommu=
=3Dpt
video=3DDisplayPort-0:edid/1204x800.bin

Regards.

--
CarloSalvatore

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
