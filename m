Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A090948E8A0
	for <lists+dri-devel@lfdr.de>; Fri, 14 Jan 2022 11:53:33 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0481A10ED07;
	Fri, 14 Jan 2022 10:53:28 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6D63F10ED06
 for <dri-devel@lists.freedesktop.org>; Fri, 14 Jan 2022 10:53:26 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 806A561ED3
 for <dri-devel@lists.freedesktop.org>; Fri, 14 Jan 2022 10:53:25 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id E40B6C36AEA
 for <dri-devel@lists.freedesktop.org>; Fri, 14 Jan 2022 10:53:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1642157604;
 bh=6R/I4RRDVqrwtyuhe4uEv0eJjzsIVuHAcdby3qh89LU=;
 h=From:To:Subject:Date:From;
 b=XZmsa/61MgEb3wYodG6sMRl0xOGakzvNAzkbk4t67Ygmc1tDdcPvkcLSvCDsbm4fo
 Jnm/J41bC7CoyZlmpf6wzr5+lNp9kvWv4SYYURxOm7cHLtCEbfOuYzfmuEGsnjfs54
 b1r/DEKWtXf/Tt1dTnKx7UzEpDFFIoAK79ETCJRL2WzJA0J70g0Y46e9QZUE1ewhQw
 mN8TMdlk5VPkmO6tf7hGki7zO60ThpeAXmUPXp7+KlKhx8gGQ61Z7FJXXtvkhStV+z
 tOB86n75Q2R/yq1LbtI6PWCM9QgEbml5zQvUKlJWP4ggtQIGvzkZMogg9MWr8ir4CH
 hTBJ8zzgojCOg==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix,
 from userid 48) id D1813CC13AE; Fri, 14 Jan 2022 10:53:24 +0000 (UTC)
From: bugzilla-daemon@bugzilla.kernel.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 215492] New: amdgpu si_support no longer working in 5.16
Date: Fri, 14 Jan 2022 10:53:24 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: new
X-Bugzilla-Watch-Reason: AssignedTo drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Video(DRI - non Intel)
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: knut.tidemann@gmail.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: bug_id short_desc product version
 cf_kernel_version rep_platform op_sys cf_tree bug_status bug_severity
 priority component assigned_to reporter cf_regression
Message-ID: <bug-215492-2300@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D215492

            Bug ID: 215492
           Summary: amdgpu si_support no longer working in 5.16
           Product: Drivers
           Version: 2.5
    Kernel Version: 5.16
          Hardware: x86-64
                OS: Linux
              Tree: Mainline
            Status: NEW
          Severity: normal
          Priority: P1
         Component: Video(DRI - non Intel)
          Assignee: drivers_video-dri@kernel-bugs.osdl.org
          Reporter: knut.tidemann@gmail.com
        Regression: No

After installing kernel 5.16 from the Arch Linux repository and booting it =
up I
can no longer get amdgpu to work on my Sea Islands card.

This is the output I get from the kernel:

Jan 14 11:41:43 kyle kernel: Command line: initrd=3D\amd-ucode.img
initrd=3D\initramfs-linux.img root=3D"LABEL=3Darch" radeon.cik_support=3D0
amdgpu.cik_support=3D1 radeon.si_support=3D0 amdgpu.si_support=3D1 amdgpu.d=
c=3D1
Jan 14 11:41:43 kyle kernel: Kernel command line: initrd=3D\amd-ucode.img
initrd=3D\initramfs-linux.img root=3D"LABEL=3Darch" radeon.cik_support=3D0
amdgpu.cik_support=3D1 radeon.si_support=3D0 amdgpu.si_support=3D1 amdgpu.d=
c=3D1
Jan 14 11:41:43 kyle kernel: ACPI: bus type drm_connector registered
Jan 14 11:41:43 kyle kernel: [drm] amdgpu kernel modesetting enabled.
Jan 14 11:41:43 kyle kernel: amdgpu: Ignoring ACPI CRAT on non-APU system
Jan 14 11:41:43 kyle kernel: amdgpu: Virtual CRAT table created for CPU
Jan 14 11:41:43 kyle kernel: amdgpu: Topology: Add CPU node
Jan 14 11:41:43 kyle kernel: [drm] Unsupported asic.  Remove me when IP
discovery init is in place.

Rebooting with kernel 5.15.14 and the same kernel command line arguments wo=
rks
fine.

My card is a Radeon R9 280X (taken on 5.15.14):
09:00.0 VGA compatible controller: Advanced Micro Devices, Inc. [AMD/ATI]
Tahiti XT [Radeon HD 7970/8970 OEM / R9 280X] (prog-if 00 [VGA controller])
        Subsystem: ASUSTeK Computer Inc. Tahiti XTL [Radeon R9 280X DirectC=
U II
TOP]
        Flags: bus master, fast devsel, latency 0, IRQ 100, IOMMU group 23
        Memory at e0000000 (64-bit, prefetchable) [size=3D256M]
        Memory at fce00000 (64-bit, non-prefetchable) [size=3D256K]
        I/O ports at e000 [size=3D256]
        Expansion ROM at fce40000 [disabled] [size=3D128K]
        Capabilities: [48] Vendor Specific Information: Len=3D08 <?>
        Capabilities: [50] Power Management version 3
        Capabilities: [58] Express Legacy Endpoint, MSI 00
        Capabilities: [a0] MSI: Enable+ Count=3D1/1 Maskable- 64bit+
        Capabilities: [100] Vendor Specific Information: ID=3D0001 Rev=3D1 =
Len=3D010
<?>
        Capabilities: [150] Advanced Error Reporting
        Capabilities: [270] Secondary PCI Express
        Capabilities: [2b0] Address Translation Service (ATS)
        Capabilities: [2c0] Page Request Interface (PRI)
        Capabilities: [2d0] Process Address Space ID (PASID)
        Kernel driver in use: amdgpu
        Kernel modules: radeon, amdgpu

Please let me know if I can add any more information.

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
