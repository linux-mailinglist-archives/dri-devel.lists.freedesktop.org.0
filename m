Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C38031D0A6B
	for <lists+dri-devel@lfdr.de>; Wed, 13 May 2020 10:02:49 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C758B6E9BE;
	Wed, 13 May 2020 08:02:47 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AE20F6E9BD
 for <dri-devel@lists.freedesktop.org>; Wed, 13 May 2020 08:02:46 +0000 (UTC)
From: bugzilla-daemon@bugzilla.kernel.org
Authentication-Results: mail.kernel.org;
 dkim=permerror (bad message/signature format)
To: dri-devel@lists.freedesktop.org
Subject: [Bug 195159] nouveau incorrect ACPI usgage results in ACPI Error :
 AE_AML_PACKAGE_LIMIT
Date: Wed, 13 May 2020 08:02:46 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Video(DRI - non Intel)
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: joerg.kadau@gmx.de
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-195159-2300-eTEpViXhB7@https.bugzilla.kernel.org/>
In-Reply-To: <bug-195159-2300@https.bugzilla.kernel.org/>
References: <bug-195159-2300@https.bugzilla.kernel.org/>
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

https://bugzilla.kernel.org/show_bug.cgi?id=195159

--- Comment #12 from linux4all (joerg.kadau@gmx.de) ---
on a HP ZBook 17 G4
17: PCI 100.0: 0300 VGA compatible controller (VGA)             
  [Created at pci.386]
  Unique ID: VCu0.mCEkXGSxUXA
  Parent ID: vSkL.fBtNDRZZiP3
  SysFS ID: /devices/pci0000:00/0000:00:01.0/0000:01:00.0
  SysFS BusID: 0000:01:00.0
  Hardware Class: graphics card
  Model: "nVidia GP104GLM [Quadro P4000 Mobile]"
  Vendor: pci 0x10de "nVidia Corporation"
  Device: pci 0x1bb7 "GP104GLM [Quadro P4000 Mobile]"
  SubVendor: pci 0x103c "Hewlett-Packard Company"
  SubDevice: pci 0x8272 
  Revision: 0xa1
  Driver: "nvidia"
  Driver Modules: "nvidia"
  Memory Range: 0xe3000000-0xe3ffffff (rw,non-prefetchable)
  Memory Range: 0xa0000000-0xafffffff (ro,non-prefetchable)
  Memory Range: 0xb0000000-0xb1ffffff (ro,non-prefetchable)
  I/O Ports: 0x5000-0x5fff (rw)
  Memory Range: 0xe4080000-0xe40fffff (ro,non-prefetchable,disabled)
  IRQ: 173 (41186 events)
  Module Alias: "pci:v000010DEd00001BB7sv0000103Csd00008272bc03sc00i00"
  Driver Info #0:
    Driver Status: nouveau is not active
    Driver Activation Cmd: "modprobe nouveau"
  Driver Info #1:
    Driver Status: nvidia_drm is active
    Driver Activation Cmd: "modprobe nvidia_drm"
  Driver Info #2:
    Driver Status: nvidia is active
    Driver Activation Cmd: "modprobe nvidia"
  Config Status: cfg=no, avail=yes, need=no, active=unknown
  Attached to: #13 (PCI bridge)

Primary display adapter: #17

-- 
You are receiving this mail because:
You are watching the assignee of the bug.
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
