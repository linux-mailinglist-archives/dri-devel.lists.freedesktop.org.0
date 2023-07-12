Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 76C467503F8
	for <lists+dri-devel@lfdr.de>; Wed, 12 Jul 2023 11:59:19 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A0DC810E4C7;
	Wed, 12 Jul 2023 09:59:17 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6CB2E10E4BB
 for <dri-devel@lists.freedesktop.org>; Wed, 12 Jul 2023 09:59:16 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 2237A616EA
 for <dri-devel@lists.freedesktop.org>; Wed, 12 Jul 2023 09:59:15 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 8BF54C433C7
 for <dri-devel@lists.freedesktop.org>; Wed, 12 Jul 2023 09:59:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1689155954;
 bh=WMhCENP84NxKQJIOraBekTx43nQ0QeTVrbLddzhOPRI=;
 h=From:To:Subject:Date:From;
 b=XraTMmLblFOqad6Ois+hFZKGQQ62cnE+FJQYl7ZEyZoL/GuhKXi2mSrxv3AQdjaez
 45566IWaksn7uP+6TS6U1+BBELv73I1kyEqtt4BMOWUQikJMrfn2hpTsIiiHyORReh
 wfBLur62fuPO0YOhCq3/Xq9inkB4f5JbZmxkgmMS5u5zBJBc7Wmugj5twy4vwxPkz/
 mRZ062jQyI6okBRnTPd1+so3cSgtqH1UTBt/PhcuN5/DIuJYGI+2QtY7kmIdZ581L+
 WUlqsYtTnsJt4tYtDIrqtpvlIisgAF+gXYpULlC6T3+h53Ci/z2Q1SSe2H+J+uPvlX
 md8QDUQ/eahOA==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix,
 from userid 48) id 7AB96C53BD0; Wed, 12 Jul 2023 09:59:14 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 217664] New: Laptop doesnt wake up from suspend mode.
Date: Wed, 12 Jul 2023 09:59:14 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: new
X-Bugzilla-Watch-Reason: AssignedTo drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Video(DRI - non Intel)
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: penteljapan@o2.pl
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P3
X-Bugzilla-Assigned-To: drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: bug_id short_desc product version rep_platform
 op_sys bug_status bug_severity priority component assigned_to reporter
 cf_regression
Message-ID: <bug-217664-2300@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D217664

            Bug ID: 217664
           Summary: Laptop doesnt wake up from suspend mode.
           Product: Drivers
           Version: 2.5
          Hardware: All
                OS: Linux
            Status: NEW
          Severity: normal
          Priority: P3
         Component: Video(DRI - non Intel)
          Assignee: drivers_video-dri@kernel-bugs.osdl.org
          Reporter: penteljapan@o2.pl
        Regression: No

Operating System: Kubuntu 23.04
KDE Plasma Version: 5.27.4
KDE Frameworks Version: 5.104.0
Qt Version: 5.15.8
Kernel Version: 6.2.0-25-generic (64-bit)
Graphics Platform: X11
Processors: 12 =C3=97 AMD Ryzen 5 5600H with Radeon Graphics
Memory: 22.8 GiB of RAM
Graphics Processor: AMD Radeon Graphics
Manufacturer: MEDION
Product Name: Crawler E25
System Version: Not Applicable


05:00.0 VGA compatible controller: Advanced Micro Devices, Inc. [AMD/ATI]
Cezanne [Radeon Vega Series / Radeon Vega Mobile Series] (rev c6) (prog-if =
00
[VGA controller])
        Subsystem: CLEVO/KAPOK Computer Cezanne [Radeon Vega Series / Radeon
Vega Mobile Series]
        Flags: bus master, fast devsel, latency 0, IRQ 50, IOMMU group 6
        Memory at fc10000000 (64-bit, prefetchable) [size=3D256M]
        Memory at fc20000000 (64-bit, prefetchable) [size=3D2M]
        I/O ports at 1000 [size=3D256]
        Memory at d1500000 (32-bit, non-prefetchable) [size=3D512K]
        Capabilities: [48] Vendor Specific Information: Len=3D08 <?>
        Capabilities: [50] Power Management version 3
        Capabilities: [64] Express Legacy Endpoint, MSI 00
        Capabilities: [a0] MSI: Enable- Count=3D1/4 Maskable- 64bit+
        Capabilities: [c0] MSI-X: Enable+ Count=3D4 Masked-
        Capabilities: [100] Vendor Specific Information: ID=3D0001 Rev=3D1 =
Len=3D010
<?>
        Capabilities: [270] Secondary PCI Express
        Capabilities: [2b0] Address Translation Service (ATS)
        Capabilities: [2c0] Page Request Interface (PRI)
        Capabilities: [2d0] Process Address Space ID (PASID)
        Capabilities: [400] Data Link Feature <?>
        Capabilities: [410] Physical Layer 16.0 GT/s <?>
        Capabilities: [440] Lane Margining at the Receiver <?>
        Kernel driver in use: amdgpu
        Kernel modules: amdgpu
```````````````

dmesg --> https://pastebin.com/SXmYX9NL

`````````````````````



Since closing lid is a basic thing of laptops and only sense it would be go=
od
to use this functionality. Many people having same problem, ignored for many
years. Dont know which section it should be reported: X11, drivers or ACPI.
dmesg saying nothing.
Opening lid doenst turn on screen but fans still are alive. Hard shutdown w=
orks
(power button for few seconds), in general system works ( i suspect) beyond
main feature - display

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
