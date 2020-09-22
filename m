Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 3F9DD2743E8
	for <lists+dri-devel@lfdr.de>; Tue, 22 Sep 2020 16:16:09 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9C5AD8979D;
	Tue, 22 Sep 2020 14:16:05 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2D34089DAB
 for <dri-devel@lists.freedesktop.org>; Tue, 22 Sep 2020 14:14:15 +0000 (UTC)
From: bugzilla-daemon@bugzilla.kernel.org
Authentication-Results: mail.kernel.org;
 dkim=permerror (bad message/signature format)
To: dri-devel@lists.freedesktop.org
Subject: [Bug 209345] [nouveau] unknown chipset (0f22d0a1) (nVidia Tesla K80)
Date: Tue, 22 Sep 2020 14:14:14 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Video(DRI - non Intel)
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: kallisti5@unixzen.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-209345-2300-i7f03DDiov@https.bugzilla.kernel.org/>
In-Reply-To: <bug-209345-2300@https.bugzilla.kernel.org/>
References: <bug-209345-2300@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=209345

--- Comment #8 from Alexander von Gluck (kallisti5@unixzen.com) ---
rebooted without TB3 enclosure attached. Msnuslly loaded nouveau vis insmod
after the TB3 attachment calmed down, and got something a bit cleaner:


[  176.083524] nouveau: loading out-of-tree module taints kernel.
[  176.084343] nouveau: module verification failed: signature and/or required
key missing - tainting kernel
[  176.124991] ACPI Warning: \_SB.PCI0.GFX0._DSM: Argument #4 type mismatch -
Found [Buffer], ACPI requires [Package] (20200528/nsarguments-59)
[  176.125405] nouveau 0000:08:00.0: NVIDIA GK120 (0f22d0a1)
[  176.406057] nouveau 0000:08:00.0: bios: version 80.21.1f.00.01
[  176.537701] nouveau 0000:08:00.0: fb: 11520 MiB GDDR5
[  176.562278] nouveau 0000:08:00.0: bar: one-time init failed, -12
[  176.562522] nouveau 0000:08:00.0: init failed with -12
[  176.562523] nouveau: DRM-master:00000000:00000080: init failed with -12
[  176.562525] nouveau 0000:08:00.0: DRM-master: Device allocation failed: -12
[  176.563099] nouveau: probe of 0000:08:00.0 failed with error -12
[  176.563387] nouveau 0000:09:00.0: NVIDIA GK120 (0f22d0a1)
[  176.842900] nouveau 0000:09:00.0: bios: version 80.21.1f.00.02
[  176.977507] nouveau 0000:09:00.0: fb: 11520 MiB GDDR5
[  177.002138] nouveau 0000:09:00.0: bar: one-time init failed, -12
[  177.002380] nouveau 0000:09:00.0: init failed with -12
[  177.002382] nouveau: DRM-master:00000000:00000080: init failed with -12
[  177.002384] nouveau 0000:09:00.0: DRM-master: Device allocation failed: -12
[  177.003019] nouveau: probe of 0000:09:00.0 failed with error -12


So, each GK120 gets 11.5 GiB to make up that 24GiB of ram.

-- 
You are receiving this mail because:
You are watching the assignee of the bug.
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
