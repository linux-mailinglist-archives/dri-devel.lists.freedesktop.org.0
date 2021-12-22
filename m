Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 8ED4347D854
	for <lists+dri-devel@lfdr.de>; Wed, 22 Dec 2021 21:33:17 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EAB0D10E195;
	Wed, 22 Dec 2021 20:33:14 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A77ED10E1AC
 for <dri-devel@lists.freedesktop.org>; Wed, 22 Dec 2021 20:33:13 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id F384061D0A
 for <dri-devel@lists.freedesktop.org>; Wed, 22 Dec 2021 20:33:12 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id A356DC36AF2
 for <dri-devel@lists.freedesktop.org>; Wed, 22 Dec 2021 20:33:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1640205192;
 bh=I7UvQ6qnbFi3oNAmcWHce27t4XmypqJJbDxXWb7GNWs=;
 h=From:To:Subject:Date:In-Reply-To:References:From;
 b=mZXXPyE5hyqwzeQHuAfpHmNg2E9iXIecU4GMBRrL10YCOuo1JFFspDfb3V4dWd8zj
 Qc0rYyKR5Y5QtbNacB7o5w54D8MWsj865AYkiN0/1cmrTvT1XvZfBo+WlJ39bTtiI4
 PFWSU7Za/roQvzDpSa04xIl/JR4rPdE+zX1yQJU9C9yuL6svWwImxRyaPJIn4p3w5i
 yf6OOum+1iS9OJmzHivSY3H4e5TqLVp0WZCK4Z6+OrO/5aAhSI1Za3SxZ/ZrMRBUf/
 Txk28LMctibRmCBFGYYOuWLYuR0b3+4oZ4oXqX/U3miBjLbFyZFRRxMagIlGQIXlpz
 AwdzU3YHXWLRw==
Received: by pdx-korg-bugzilla-2.web.codeaurora.org (Postfix, from userid 48)
 id 9379B61177; Wed, 22 Dec 2021 20:33:12 +0000 (UTC)
From: bugzilla-daemon@bugzilla.kernel.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 201957] amdgpu: ring gfx timeout
Date: Wed, 22 Dec 2021 20:33:07 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Video(DRI - non Intel)
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: blocking
X-Bugzilla-Who: coolx67@gmx.at
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: cc
Message-ID: <bug-201957-2300-wjsDVAGfOH@https.bugzilla.kernel.org/>
In-Reply-To: <bug-201957-2300@https.bugzilla.kernel.org/>
References: <bug-201957-2300@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D201957

roman (coolx67@gmx.at) changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
                 CC|                            |coolx67@gmx.at

--- Comment #52 from roman (coolx67@gmx.at) ---
I can confirm that=20
amdgpu.dpm=3D0=20
removes the issue=20
on an AMD Radeon PRO FIJI (Dual Fury) kernel: 5.15.10|FW:
20211027.1d00989-1|mesa: 21.3.2-1

Works perfectly fine in Gnome as long as there is no application accessing =
the
2nd GPU.=20

When opening Radeon-profile as long as card0 is selected, there is no issue=
 but
as soon as I select card1 I get instantly=20
Dec 22 21:15:46 Workstation kernel: amdgpu:=20
                                     failed to send message 171 ret is 0=20
Dec 22 21:15:49 Workstation kernel: amdgpu:=20
                                     last message was failed ret is 0

The application Radeon-profile freezes but desktop is still responsive.=20



When opening CS:GO with mangohud and configuring either

pci_dev =3D 0000:3d:00.0 # primary card works fine
or=20
pci_dev =3D 0000:3e:00.0 # secondary card, errors from above occur and CS:GO
loads super slow and after menu is visible it is stuck=20

When CSM is disabled in BIOS I have 2 GPUs=20

Dec 22 20:45:50 Workstation kernel: [drm] amdgpu kernel modesetting enabled.
Dec 22 20:45:50 Workstation kernel: amdgpu: CRAT table not found
Dec 22 20:45:50 Workstation kernel: amdgpu: Virtual CRAT table created for =
CPU
Dec 22 20:45:50 Workstation kernel: amdgpu: Topology: Add CPU node
Dec 22 20:45:50 Workstation kernel: amdgpu 0000:3d:00.0: vgaarb: deactivate=
 vga
console
Dec 22 20:45:50 Workstation kernel: amdgpu 0000:3d:00.0: enabling device (0=
106
-> 0107)
Dec 22 20:45:50 Workstation kernel: amdgpu 0000:3d:00.0: amdgpu: Trusted Me=
mory
Zone (TMZ) feature not supported
Dec 22 20:45:50 Workstation kernel: amdgpu 0000:3d:00.0: amdgpu: Fetched VB=
IOS
from ROM BAR
Dec 22 20:45:50 Workstation kernel: amdgpu: ATOM BIOS: 113-C88801MS-102
Dec 22 20:45:50 Workstation kernel: amdgpu 0000:3d:00.0: amdgpu: VRAM: 4096M
0x000000F400000000 - 0x000000F4FFFFFFFF (4096M used)
Dec 22 20:45:50 Workstation kernel: amdgpu 0000:3d:00.0: amdgpu: GART: 1024M
0x000000FF00000000 - 0x000000FF3FFFFFFF
Dec 22 20:45:50 Workstation kernel: [drm] amdgpu: 4096M of VRAM memory ready
Dec 22 20:45:50 Workstation kernel: [drm] amdgpu: 4096M of GTT memory ready.
Dec 22 20:45:50 Workstation kernel: amdgpu: hwmgr_sw_init smu backed is
fiji_smu
Dec 22 20:45:50 Workstation kernel: snd_hda_intel 0000:3d:00.1: bound
0000:3d:00.0 (ops amdgpu_dm_audio_component_bind_ops [amdgpu])
Dec 22 20:45:50 Workstation kernel: [drm:retrieve_link_cap [amdgpu]] *ERROR*
retrieve_link_cap: Read receiver caps dpcd data failed.
Dec 22 20:45:50 Workstation kernel: kfd kfd: amdgpu: Allocated 3969056 byte=
s on
gart
Dec 22 20:45:50 Workstation kernel: amdgpu: Virtual CRAT table created for =
GPU
Dec 22 20:45:50 Workstation kernel: amdgpu: Topology: Add dGPU node
[0x7300:0x1002]
Dec 22 20:45:50 Workstation kernel: kfd kfd: amdgpu: added device 1002:7300
Dec 22 20:45:50 Workstation kernel: amdgpu 0000:3d:00.0: amdgpu: SE 4, SH p=
er
SE 1, CU per SH 16, active_cu_number 64
Dec 22 20:45:50 Workstation kernel: fbcon: amdgpu (fb0) is primary device
Dec 22 20:45:51 Workstation kernel: amdgpu 0000:3d:00.0: [drm] fb0: amdgpu
frame buffer device
Dec 22 20:45:51 Workstation kernel: amdgpu 0000:3d:00.0: amdgpu: Using BACO=
 for
runtime pm
Dec 22 20:45:51 Workstation kernel: [drm] Initialized amdgpu 3.42.0 20150101
for 0000:3d:00.0 on minor 0
Dec 22 20:45:51 Workstation kernel: amdgpu 0000:3e:00.0: enabling device (0=
106
-> 0107)
Dec 22 20:45:51 Workstation kernel: amdgpu 0000:3e:00.0: amdgpu: Trusted Me=
mory
Zone (TMZ) feature not supported
Dec 22 20:45:51 Workstation kernel: amdgpu 0000:3e:00.0: amdgpu: Fetched VB=
IOS
from ROM BAR
Dec 22 20:45:51 Workstation kernel: amdgpu: ATOM BIOS: 113-C88801SL-102
Dec 22 20:45:51 Workstation kernel: amdgpu 0000:3e:00.0: amdgpu: VRAM: 4096M
0x000000F400000000 - 0x000000F4FFFFFFFF (4096M used)
Dec 22 20:45:51 Workstation kernel: amdgpu 0000:3e:00.0: amdgpu: GART: 1024M
0x000000FF00000000 - 0x000000FF3FFFFFFF
Dec 22 20:45:51 Workstation kernel: [drm] amdgpu: 4096M of VRAM memory ready
Dec 22 20:45:51 Workstation kernel: [drm] amdgpu: 4096M of GTT memory ready.
Dec 22 20:45:51 Workstation kernel: amdgpu: hwmgr_sw_init smu backed is
fiji_smu
Dec 22 20:45:51 Workstation kernel: kfd kfd: amdgpu: Allocated 3969056 byte=
s on
gart
Dec 22 20:45:51 Workstation kernel: amdgpu: Virtual CRAT table created for =
GPU
Dec 22 20:45:51 Workstation kernel: amdgpu: Topology: Add dGPU node
[0x7300:0x1002]
Dec 22 20:45:51 Workstation kernel: kfd kfd: amdgpu: added device 1002:7300
Dec 22 20:45:51 Workstation kernel: amdgpu 0000:3e:00.0: amdgpu: SE 4, SH p=
er
SE 1, CU per SH 16, active_cu_number 64
Dec 22 20:45:51 Workstation kernel: amdgpu 0000:3e:00.0: amdgpu: Using BACO=
 for
runtime pm
Dec 22 20:45:51 Workstation kernel: [drm] Initialized amdgpu 3.42.0 20150101
for 0000:3e:00.0 on minor 1
Dec 22 20:45:53 Workstation gnome-shell[1988]: Added device '/dev/dri/card0'
(amdgpu) using atomic mode setting.
Dec 22 20:45:53 Workstation gnome-shell[1988]: Added device '/dev/dri/card1'
(amdgpu) using atomic mode setting.
Dec 22 20:45:55 Workstation gnome-shell[1988]: Disabling DMA buffer screen
sharing for driver 'amdgpu'.
Dec 22 20:46:03 Workstation gnome-shell[2527]: Added device '/dev/dri/card0'
(amdgpu) using atomic mode setting.
Dec 22 20:46:04 Workstation gnome-shell[2527]: Added device '/dev/dri/card1'
(amdgpu) using atomic mode setting.
Dec 22 20:46:05 Workstation gnome-shell[2527]: Disabling DMA buffer screen
sharing for driver 'amdgpu'.


With enabled CSM only the primary GPU is available
Dec 17 18:17:51 Workstation kernel: [drm] amdgpu kernel modesetting enabled.
Dec 17 18:17:51 Workstation kernel: amdgpu: CRAT table not found
Dec 17 18:17:51 Workstation kernel: amdgpu: Virtual CRAT table created for =
CPU
Dec 17 18:17:51 Workstation kernel: amdgpu: Topology: Add CPU node
Dec 17 18:17:51 Workstation kernel: fb0: switching to amdgpu from EFI VGA
Dec 17 18:17:51 Workstation kernel: amdgpu 0000:3d:00.0: vgaarb: deactivate=
 vga
console
Dec 17 18:17:51 Workstation kernel: amdgpu 0000:3d:00.0: amdgpu: Trusted Me=
mory
Zone (TMZ) feature not supported
Dec 17 18:17:51 Workstation kernel: amdgpu 0000:3d:00.0: No more image in t=
he
PCI ROM
Dec 17 18:17:51 Workstation kernel: amdgpu 0000:3d:00.0: amdgpu: Fetched VB=
IOS
from ROM BAR
Dec 17 18:17:51 Workstation kernel: amdgpu: ATOM BIOS: 113-C88801MS-102
Dec 17 18:17:51 Workstation kernel: amdgpu 0000:3d:00.0: BAR 2: releasing [=
mem
0xb0000000-0xb01fffff 64bit pref]
Dec 17 18:17:51 Workstation kernel: amdgpu 0000:3d:00.0: BAR 0: releasing [=
mem
0xa0000000-0xafffffff 64bit pref]
Dec 17 18:17:51 Workstation kernel: amdgpu 0000:3d:00.0: BAR 0: assigned [m=
em
0x388000000000-0x3880ffffffff 64bit pref]
Dec 17 18:17:51 Workstation kernel: amdgpu 0000:3d:00.0: BAR 2: assigned [m=
em
0x388100000000-0x3881001fffff 64bit pref]
Dec 17 18:17:51 Workstation kernel: amdgpu 0000:3d:00.0: amdgpu: VRAM: 4096M
0x000000F400000000 - 0x000000F4FFFFFFFF (4096M used)
Dec 17 18:17:51 Workstation kernel: amdgpu 0000:3d:00.0: amdgpu: GART: 1024M
0x000000FF00000000 - 0x000000FF3FFFFFFF
Dec 17 18:17:51 Workstation kernel: [drm] amdgpu: 4096M of VRAM memory ready
Dec 17 18:17:51 Workstation kernel: [drm] amdgpu: 4096M of GTT memory ready.
Dec 17 18:17:51 Workstation kernel: amdgpu: hwmgr_sw_init smu backed is
fiji_smu
Dec 17 18:17:51 Workstation kernel: snd_hda_intel 0000:3d:00.1: bound
0000:3d:00.0 (ops amdgpu_dm_audio_component_bind_ops [amdgpu])
Dec 17 18:17:51 Workstation kernel: [drm:retrieve_link_cap [amdgpu]] *ERROR*
retrieve_link_cap: Read receiver caps dpcd data failed.
Dec 17 18:17:51 Workstation kernel: kfd kfd: amdgpu: Allocated 3969056 byte=
s on
gart
Dec 17 18:17:51 Workstation kernel: amdgpu: Virtual CRAT table created for =
GPU
Dec 17 18:17:51 Workstation kernel: amdgpu: Topology: Add dGPU node
[0x7300:0x1002]
Dec 17 18:17:51 Workstation kernel: kfd kfd: amdgpu: added device 1002:7300
Dec 17 18:17:51 Workstation kernel: amdgpu 0000:3d:00.0: amdgpu: SE 4, SH p=
er
SE 1, CU per SH 16, active_cu_number 64
Dec 17 18:17:51 Workstation kernel: fbcon: amdgpu (fb0) is primary device
Dec 17 18:17:51 Workstation kernel: amdgpu 0000:3d:00.0: [drm] fb0: amdgpu
frame buffer device
Dec 17 18:17:51 Workstation kernel: amdgpu 0000:3d:00.0: amdgpu: Using BACO=
 for
runtime pm
Dec 17 18:17:51 Workstation kernel: [drm] Initialized amdgpu 3.42.0 20150101
for 0000:3d:00.0 on minor 0
Dec 17 18:17:51 Workstation kernel: amdgpu 0000:3e:00.0: enabling device (0=
100
-> 0103)
Dec 17 18:17:51 Workstation kernel: amdgpu 0000:3e:00.0: amdgpu: Trusted Me=
mory
Zone (TMZ) feature not supported
Dec 17 18:17:52 Workstation kernel: amdgpu 0000:3e:00.0: amdgpu: Fetched VB=
IOS
from ROM BAR
Dec 17 18:17:52 Workstation kernel: amdgpu: ATOM BIOS: 113-C88801SL-102
Dec 17 18:17:52 Workstation kernel: amdgpu 0000:3e:00.0: BAR 2: releasing [=
???
0x00000000 flags 0x0]
Dec 17 18:17:52 Workstation kernel: amdgpu 0000:3e:00.0: BAR 0: releasing [=
???
0x00000000 flags 0x0]
Dec 17 18:17:52 Workstation kernel: [drm:amdgpu_device_resize_fb_bar [amdgp=
u]]
*ERROR* Problem resizing BAR0 (-16).
Dec 17 18:17:52 Workstation kernel: [drm:amdgpu_device_init.cold [amdgpu]]
*ERROR* sw_init of IP block <gmc_v8_0> failed -19
Dec 17 18:17:52 Workstation kernel: amdgpu 0000:3e:00.0: amdgpu:
amdgpu_device_ip_init failed
Dec 17 18:17:52 Workstation kernel: amdgpu 0000:3e:00.0: amdgpu: Fatal error
during GPU init
Dec 17 18:17:52 Workstation kernel: amdgpu 0000:3e:00.0: amdgpu: amdgpu:
finishing device.
Dec 17 18:18:00 Workstation gnome-shell[1921]: Added device '/dev/dri/card0'
(amdgpu) using atomic mode setting.
Dec 17 18:18:02 Workstation gnome-shell[1921]: Disabling DMA buffer screen
sharing for driver 'amdgpu'.
Dec 17 18:18:13 Workstation gnome-shell[2410]: Added device '/dev/dri/card0'
(amdgpu) using atomic mode setting.
Dec 17 18:18:14 Workstation gnome-shell[2410]: Disabling DMA buffer screen
sharing for driver 'amdgpu'.

Hopefully @Alex  can do/forward this since this is a P1 blocking issue and =
open
for 3 years.

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
