Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A9AC6A741E6
	for <lists+dri-devel@lfdr.de>; Fri, 28 Mar 2025 02:05:43 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3EE2A10E959;
	Fri, 28 Mar 2025 01:05:38 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="U+Pt+CsY";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CECD710E959
 for <dri-devel@lists.freedesktop.org>; Fri, 28 Mar 2025 01:05:27 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 0277A5C4B25
 for <dri-devel@lists.freedesktop.org>; Fri, 28 Mar 2025 01:03:07 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 59D57C4CEDD
 for <dri-devel@lists.freedesktop.org>; Fri, 28 Mar 2025 01:05:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1743123923;
 bh=ux5aupLrKnKbu9gsbpTOFuN+AGW/3PidnuT3mwu//QU=;
 h=From:To:Subject:Date:From;
 b=U+Pt+CsY6yXGS9plLZoTnQOLNUTMm5UwiH0wo/GXGNiOxkS3zqnstAHuLSlfHH9N3
 47tDKdf7RxKzr+4nhrqR4p+F1Hol70Gv3YofTrJ3CilAroLDT7tugedanIQt0UszHw
 ErWIa0nVecCarD93cVxYBUDwIYjS+knDU0ovgs/P1oBcSx6noT7YsjMsYR3de+pKGV
 oxIgh4y+cymA9ZBJ5z/rHprLUKPd0VKrdmotfOvXtmhpEK0K7K6dXtl1jkwpPwD1R8
 34GrhGYGu4FYAtzGp1aHZn6BgfpYuOl1Gitxtl0DC/t4BG22AeFoiBtGFt7FWdEi/+
 zfR8VasjTaXWg==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix,
 from userid 48) id 4A44FC41612; Fri, 28 Mar 2025 01:05:23 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 219929] New: Direct firmware load for amdgpu/isp_4_1_0.bin
 failed with error -2
Date: Fri, 28 Mar 2025 01:05:22 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: new
X-Bugzilla-Watch-Reason: AssignedTo drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Video(DRI - non Intel)
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: atiqcx@gmail.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P3
X-Bugzilla-Assigned-To: drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: bug_id short_desc product version rep_platform
 op_sys bug_status bug_severity priority component assigned_to reporter
 cf_regression attachments.created
Message-ID: <bug-219929-2300@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D219929

            Bug ID: 219929
           Summary: Direct firmware load for amdgpu/isp_4_1_0.bin failed
                    with error -2
           Product: Drivers
           Version: 2.5
          Hardware: All
                OS: Linux
            Status: NEW
          Severity: normal
          Priority: P3
         Component: Video(DRI - non Intel)
          Assignee: drivers_video-dri@kernel-bugs.osdl.org
          Reporter: atiqcx@gmail.com
        Regression: No

Created attachment 307900
  --> https://bugzilla.kernel.org/attachment.cgi?id=3D307900&action=3Dedit
`journalctl --boot` output

On AMD Ryzen AI 9 HX 370 w/ Radeon 890M, seeing this error on kernel logs:

amdgpu 0000:65:00.0: Direct firmware load for amdgpu/isp_4_1_0.bin failed w=
ith
error -2


Steps to Reproduce:
1. Boot


Looks like the Graphics is working okay, `lspci` gives this,

65:00.0 Display controller: Advanced Micro Devices, Inc. [AMD/ATI] Strix
[Radeon 880M / 890M] (rev c1)
        Subsystem: ASUSTeK Computer Inc. Device 37f8
        Flags: bus master, fast devsel, latency 0, IRQ 73, IOMMU group 18
        Memory at 7a10000000 (64-bit, prefetchable) [size=3D256M]
        Memory at dd200000 (64-bit, prefetchable) [size=3D2M]
        I/O ports at e000 [size=3D256]
        Memory at dd700000 (32-bit, non-prefetchable) [size=3D512K]
        Capabilities: [48] Vendor Specific Information: Len=3D08 <?>
        Capabilities: [50] Power Management version 3
        Capabilities: [64] Express Legacy Endpoint, IntMsgNum 0
        Capabilities: [a0] MSI: Enable- Count=3D1/4 Maskable- 64bit+
        Capabilities: [c0] MSI-X: Enable+ Count=3D4 Masked-
        Capabilities: [100] Vendor Specific Information: ID=3D0001 Rev=3D1 =
Len=3D010
<?>
        Capabilities: [270] Secondary PCI Express
        Capabilities: [2a0] Access Control Services
        Capabilities: [2b0] Address Translation Service (ATS)
        Capabilities: [2c0] Page Request Interface (PRI)
        Capabilities: [2d0] Process Address Space ID (PASID)
        Capabilities: [410] Physical Layer 16.0 GT/s <?>
        Capabilities: [450] Lane Margining at the Receiver
        Kernel driver in use: amdgpu
        Kernel modules: amdgpu


In that case, wondering why this error show up? Is the firmware file
'isp_4_1_0.bin' not necessary?


Kernel: 6.13.8
Distro: fedora 41
Device: Asus P16 H7606WV
Desktop: gnome
Xorg or wayland: wayland

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
