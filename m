Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 48EB64D777D
	for <lists+dri-devel@lfdr.de>; Sun, 13 Mar 2022 19:54:25 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 82A9F10E205;
	Sun, 13 Mar 2022 18:54:19 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from ams.source.kernel.org (ams.source.kernel.org
 [IPv6:2604:1380:4601:e00::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0C8E389F6D
 for <dri-devel@lists.freedesktop.org>; Sun, 13 Mar 2022 18:54:18 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 59035B80BA6
 for <dri-devel@lists.freedesktop.org>; Sun, 13 Mar 2022 18:54:16 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id ECB4AC340FD
 for <dri-devel@lists.freedesktop.org>; Sun, 13 Mar 2022 18:54:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1647197654;
 bh=mxLmgqryFhGj5BBk41CYX6xrrGbQJ7odsen9KOoB0eQ=;
 h=From:To:Subject:Date:In-Reply-To:References:From;
 b=WtpNfj07kvlzp17rLe8xzKA7HEEgAU76RsNhyhwYUWWhUoYbb2GDyd2zU1StXEyJV
 ixPSb34AlHBvgseElI26s8Noakfz8sEIQx/iHdQsmCmTfHw9AttlVnsqCIwaP4WlJx
 rvJqhONQX8D0mkuDO6+NknUWiau8pjPLIkJwJhPGXgQ6wur3z84YI6qckwzwYsz1Gw
 wVy1DxuYr4YCmmVYZhQVWPp1q7Wt97UUSTND/0kpnfFL9UDI2pyvZIb3VyqUEfkjl0
 sFvK+dRfWXtrsW3GbVL0ZZmUs1lgy6zxTDvjUVhw7v8kwAGYMmQNZMDecmncM0/wmx
 xs+plxFk0KmJw==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix,
 from userid 48) id DA506CAC6E2; Sun, 13 Mar 2022 18:54:13 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 205089] amdgpu : drm:amdgpu_cs_ioctl : Failed to initialize
 parser -125
Date: Sun, 13 Mar 2022 18:54:13 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Video(DRI - non Intel)
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: cwebber@dustycloud.org
X-Bugzilla-Status: RESOLVED
X-Bugzilla-Resolution: CODE_FIX
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-205089-2300-MJl6xdfEfj@https.bugzilla.kernel.org/>
In-Reply-To: <bug-205089-2300@https.bugzilla.kernel.org/>
References: <bug-205089-2300@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D205089

--- Comment #35 from Christine Lemmer-Webber (cwebber@dustycloud.org) ---
Here's the dmesg output that appears to be associated with when everything
broke:

[   51.645260] amdgpu 0000:05:00.0: amdgpu: [gfxhub0] retry page fault
(src_id:0 ring:0 vmid:4 pasid:32774, for process blender pid 1724 thread
blender:cs0 pid 1754)
[   51.645272] amdgpu 0000:05:00.0: amdgpu:   in page starting at address
0x0000032a02a2a000 from IH client 0x1b (UTCL2)
[   51.645278] amdgpu 0000:05:00.0: amdgpu:
VM_L2_PROTECTION_FAULT_STATUS:0x00401431
[   51.645280] amdgpu 0000:05:00.0: amdgpu:      Faulty UTCL2 client ID: SQC
(data) (0xa)
[   51.645282] amdgpu 0000:05:00.0: amdgpu:      MORE_FAULTS: 0x1
[   51.645283] amdgpu 0000:05:00.0: amdgpu:      WALKER_ERROR: 0x0
[   51.645284] amdgpu 0000:05:00.0: amdgpu:      PERMISSION_FAULTS: 0x3
[   51.645285] amdgpu 0000:05:00.0: amdgpu:      MAPPING_ERROR: 0x0
[   51.645286] amdgpu 0000:05:00.0: amdgpu:      RW: 0x0
[   51.645302] amdgpu 0000:05:00.0: amdgpu: [gfxhub0] retry page fault
(src_id:0 ring:0 vmid:4 pasid:32774, for process blender pid 1724 thread
blender:cs0 pid 1754)
[   51.645305] amdgpu 0000:05:00.0: amdgpu:   in page starting at address
0x000002a2a0202000 from IH client 0x1b (UTCL2)
[   51.645310] amdgpu 0000:05:00.0: amdgpu:
VM_L2_PROTECTION_FAULT_STATUS:0x00401431
[   51.645312] amdgpu 0000:05:00.0: amdgpu:      Faulty UTCL2 client ID: SQC
(data) (0xa)
[   51.645314] amdgpu 0000:05:00.0: amdgpu:      MORE_FAULTS: 0x1
[   51.645316] amdgpu 0000:05:00.0: amdgpu:      WALKER_ERROR: 0x0
[   51.645318] amdgpu 0000:05:00.0: amdgpu:      PERMISSION_FAULTS: 0x3
[   51.645319] amdgpu 0000:05:00.0: amdgpu:      MAPPING_ERROR: 0x0
[   51.645321] amdgpu 0000:05:00.0: amdgpu:      RW: 0x0
[   51.645335] amdgpu 0000:05:00.0: amdgpu: [gfxhub0] retry page fault
(src_id:0 ring:0 vmid:4 pasid:32774, for process blender pid 1724 thread
blender:cs0 pid 1754)
[   51.645338] amdgpu 0000:05:00.0: amdgpu:   in page starting at address
0x0000030320203000 from IH client 0x1b (UTCL2)
[   51.645342] amdgpu 0000:05:00.0: amdgpu:
VM_L2_PROTECTION_FAULT_STATUS:0x00401431
[   51.645343] amdgpu 0000:05:00.0: amdgpu:      Faulty UTCL2 client ID: SQC
(data) (0xa)
[   51.645345] amdgpu 0000:05:00.0: amdgpu:      MORE_FAULTS: 0x1
[   51.645346] amdgpu 0000:05:00.0: amdgpu:      WALKER_ERROR: 0x0
[   51.645348] amdgpu 0000:05:00.0: amdgpu:      PERMISSION_FAULTS: 0x3
[   51.645349] amdgpu 0000:05:00.0: amdgpu:      MAPPING_ERROR: 0x0
[   51.645350] amdgpu 0000:05:00.0: amdgpu:      RW: 0x0
[   51.645368] amdgpu 0000:05:00.0: amdgpu: [gfxhub0] retry page fault
(src_id:0 ring:0 vmid:4 pasid:32774, for process blender pid 1724 thread
blender:cs0 pid 1754)
[   51.645371] amdgpu 0000:05:00.0: amdgpu:   in page starting at address
0x0000202032320000 from IH client 0x1b (UTCL2)
[   51.645375] amdgpu 0000:05:00.0: amdgpu:
VM_L2_PROTECTION_FAULT_STATUS:0x00401431
[   51.645376] amdgpu 0000:05:00.0: amdgpu:      Faulty UTCL2 client ID: SQC
(data) (0xa)
[   51.645377] amdgpu 0000:05:00.0: amdgpu:      MORE_FAULTS: 0x1
[   51.645379] amdgpu 0000:05:00.0: amdgpu:      WALKER_ERROR: 0x0
[   51.645380] amdgpu 0000:05:00.0: amdgpu:      PERMISSION_FAULTS: 0x3
[   51.645382] amdgpu 0000:05:00.0: amdgpu:      MAPPING_ERROR: 0x0
[   51.645383] amdgpu 0000:05:00.0: amdgpu:      RW: 0x0
[   51.645404] amdgpu 0000:05:00.0: amdgpu: [gfxhub0] retry page fault
(src_id:0 ring:0 vmid:4 pasid:32774, for process blender pid 1724 thread
blender:cs0 pid 1754)
[   51.645407] amdgpu 0000:05:00.0: amdgpu:   in page starting at address
0x0000320303202000 from IH client 0x1b (UTCL2)
[   51.645411] amdgpu 0000:05:00.0: amdgpu:
VM_L2_PROTECTION_FAULT_STATUS:0x00401431
[   51.645413] amdgpu 0000:05:00.0: amdgpu:      Faulty UTCL2 client ID: SQC
(data) (0xa)
[   51.645414] amdgpu 0000:05:00.0: amdgpu:      MORE_FAULTS: 0x1
[   51.645416] amdgpu 0000:05:00.0: amdgpu:      WALKER_ERROR: 0x0
[   51.645418] amdgpu 0000:05:00.0: amdgpu:      PERMISSION_FAULTS: 0x3
[   51.645419] amdgpu 0000:05:00.0: amdgpu:      MAPPING_ERROR: 0x0
[   51.645421] amdgpu 0000:05:00.0: amdgpu:      RW: 0x0
[   51.645435] amdgpu 0000:05:00.0: amdgpu: [gfxhub0] retry page fault
(src_id:0 ring:0 vmid:4 pasid:32774, for process blender pid 1724 thread
blender:cs0 pid 1754)
[   51.645438] amdgpu 0000:05:00.0: amdgpu:   in page starting at address
0x0000032020323000 from IH client 0x1b (UTCL2)
[   51.645442] amdgpu 0000:05:00.0: amdgpu:
VM_L2_PROTECTION_FAULT_STATUS:0x00401431
[   51.645444] amdgpu 0000:05:00.0: amdgpu:      Faulty UTCL2 client ID: SQC
(data) (0xa)
[   51.645445] amdgpu 0000:05:00.0: amdgpu:      MORE_FAULTS: 0x1
[   51.645447] amdgpu 0000:05:00.0: amdgpu:      WALKER_ERROR: 0x0
[   51.645448] amdgpu 0000:05:00.0: amdgpu:      PERMISSION_FAULTS: 0x3
[   51.645450] amdgpu 0000:05:00.0: amdgpu:      MAPPING_ERROR: 0x0
[   51.645452] amdgpu 0000:05:00.0: amdgpu:      RW: 0x0
[   51.645465] amdgpu 0000:05:00.0: amdgpu: [gfxhub0] retry page fault
(src_id:0 ring:0 vmid:4 pasid:32774, for process blender pid 1724 thread
blender:cs0 pid 1754)
[   51.645469] amdgpu 0000:05:00.0: amdgpu:   in page starting at address
0x0000323203032000 from IH client 0x1b (UTCL2)
[   51.645473] amdgpu 0000:05:00.0: amdgpu:
VM_L2_PROTECTION_FAULT_STATUS:0x00401431
[   51.645475] amdgpu 0000:05:00.0: amdgpu:      Faulty UTCL2 client ID: SQC
(data) (0xa)
[   51.645477] amdgpu 0000:05:00.0: amdgpu:      MORE_FAULTS: 0x1
[   51.645479] amdgpu 0000:05:00.0: amdgpu:      WALKER_ERROR: 0x0
[   51.645481] amdgpu 0000:05:00.0: amdgpu:      PERMISSION_FAULTS: 0x3
[   51.645482] amdgpu 0000:05:00.0: amdgpu:      MAPPING_ERROR: 0x0
[   51.645484] amdgpu 0000:05:00.0: amdgpu:      RW: 0x0
[   51.645501] amdgpu 0000:05:00.0: amdgpu: [gfxhub0] retry page fault
(src_id:0 ring:0 vmid:4 pasid:32774, for process blender pid 1724 thread
blender:cs0 pid 1754)
[   51.645504] amdgpu 0000:05:00.0: amdgpu:   in page starting at address
0x00002a0202a0a000 from IH client 0x1b (UTCL2)
[   51.645510] amdgpu 0000:05:00.0: amdgpu:
VM_L2_PROTECTION_FAULT_STATUS:0x00401431
[   51.645513] amdgpu 0000:05:00.0: amdgpu:      Faulty UTCL2 client ID: SQC
(data) (0xa)
[   51.645515] amdgpu 0000:05:00.0: amdgpu:      MORE_FAULTS: 0x1
[   51.645516] amdgpu 0000:05:00.0: amdgpu:      WALKER_ERROR: 0x0
[   51.645518] amdgpu 0000:05:00.0: amdgpu:      PERMISSION_FAULTS: 0x3
[   51.645520] amdgpu 0000:05:00.0: amdgpu:      MAPPING_ERROR: 0x0
[   51.645522] amdgpu 0000:05:00.0: amdgpu:      RW: 0x0
[   51.645534] amdgpu 0000:05:00.0: amdgpu: [gfxhub0] retry page fault
(src_id:0 ring:0 vmid:4 pasid:32774, for process blender pid 1724 thread
blender:cs0 pid 1754)
[   51.645537] amdgpu 0000:05:00.0: amdgpu:   in page starting at address
0x0000203232030000 from IH client 0x1b (UTCL2)
[   51.645542] amdgpu 0000:05:00.0: amdgpu:
VM_L2_PROTECTION_FAULT_STATUS:0x00401431
[   51.645544] amdgpu 0000:05:00.0: amdgpu:      Faulty UTCL2 client ID: SQC
(data) (0xa)
[   51.645545] amdgpu 0000:05:00.0: amdgpu:      MORE_FAULTS: 0x1
[   51.645546] amdgpu 0000:05:00.0: amdgpu:      WALKER_ERROR: 0x0
[   51.645547] amdgpu 0000:05:00.0: amdgpu:      PERMISSION_FAULTS: 0x3
[   51.645548] amdgpu 0000:05:00.0: amdgpu:      MAPPING_ERROR: 0x0
[   51.645549] amdgpu 0000:05:00.0: amdgpu:      RW: 0x0
[   51.645593] amdgpu 0000:05:00.0: amdgpu: [gfxhub0] retry page fault
(src_id:0 ring:0 vmid:4 pasid:32774, for process blender pid 1724 thread
blender:cs0 pid 1754)
[   51.645595] amdgpu 0000:05:00.0: amdgpu:   in page starting at address
0x0000a02032320000 from IH client 0x1b (UTCL2)
[   51.645599] amdgpu 0000:05:00.0: amdgpu:
VM_L2_PROTECTION_FAULT_STATUS:0x00401431
[   51.645601] amdgpu 0000:05:00.0: amdgpu:      Faulty UTCL2 client ID: SQC
(data) (0xa)
[   51.645602] amdgpu 0000:05:00.0: amdgpu:      MORE_FAULTS: 0x1
[   51.645603] amdgpu 0000:05:00.0: amdgpu:      WALKER_ERROR: 0x0
[   51.645604] amdgpu 0000:05:00.0: amdgpu:      PERMISSION_FAULTS: 0x3
[   51.645605] amdgpu 0000:05:00.0: amdgpu:      MAPPING_ERROR: 0x0
[   51.645606] amdgpu 0000:05:00.0: amdgpu:      RW: 0x0
[   61.685353] [drm:amdgpu_job_timedout [amdgpu]] *ERROR* ring gfx timeout,
signaled seq=3D4230, emitted seq=3D4232
[   61.685637] [drm:amdgpu_job_timedout [amdgpu]] *ERROR* Process informati=
on:
process blender pid 1724 thread blender:cs0 pid 1754
[   61.685887] amdgpu 0000:05:00.0: amdgpu: GPU reset begin!

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
