Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C3E5C5E8D13
	for <lists+dri-devel@lfdr.de>; Sat, 24 Sep 2022 15:24:09 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7C39C10E203;
	Sat, 24 Sep 2022 13:24:03 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B370810E179
 for <dri-devel@lists.freedesktop.org>; Sat, 24 Sep 2022 13:23:59 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 11B9560DD3
 for <dri-devel@lists.freedesktop.org>; Sat, 24 Sep 2022 13:23:59 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id D93E9C433C1
 for <dri-devel@lists.freedesktop.org>; Sat, 24 Sep 2022 13:23:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1664025838;
 bh=amMq3P4/SLQK84rJqtmgdhDsUtPO4jHyzYOiHQAoAlc=;
 h=From:To:Subject:Date:From;
 b=SEjLWa1W7dENBnzfcxpybL9DKoxrGDfOrnmluNpefCuoaiAGXdASJh5xwdPWHi+rY
 cxvpApppBVGv/4sure++/y9asUqwxEqk3sEqEO4vq5gRM0nxQZ8QzhRGiyAMUlSrgE
 BaBfa/ia2zNKjkozcbzydIXfsmTeEDrBZgb80hj1sQAPvTTPoMS5s4FILTatzenncC
 Y76GHajD1mgYRY5p0JIoVydZ+A7HkVZOME7xxdqm4EagnCZ0HYkagODO1Jh6Xb3PV8
 /Nfz0CglMkjoIrwFx07peK5wUmarG/sZrEiUTuyoPAoIOfWQaoP0eCNBpq8TFMEPAI
 6TClDK8mfQGwg==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix,
 from userid 48) id BEA7CC433E7; Sat, 24 Sep 2022 13:23:58 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 216525] New: amdgpu VM_L2_PROTECTION_FAULT_STATUS:0x00000000
Date: Sat, 24 Sep 2022 13:23:58 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: new
X-Bugzilla-Watch-Reason: AssignedTo drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Video(DRI - non Intel)
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: high
X-Bugzilla-Who: ionut_n2001@yahoo.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: bug_id short_desc product version
 cf_kernel_version rep_platform op_sys cf_tree bug_status bug_severity
 priority component assigned_to reporter cf_regression
Message-ID: <bug-216525-2300@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D216525

            Bug ID: 216525
           Summary: amdgpu VM_L2_PROTECTION_FAULT_STATUS:0x00000000
           Product: Drivers
           Version: 2.5
    Kernel Version: 6.0.0-rc4
          Hardware: AMD
                OS: Linux
              Tree: Mainline
            Status: NEW
          Severity: high
          Priority: P1
         Component: Video(DRI - non Intel)
          Assignee: drivers_video-dri@kernel-bugs.osdl.org
          Reporter: ionut_n2001@yahoo.com
        Regression: No

Hi Kernel Team,


I notice today one issue with amdgpu driver.
This driver is crashed, but within 40 seconds it is recovered and my display
appears correctly.

Output Error:
[ 7706.167995] amdgpu 0000:04:00.0: amdgpu: [gfxhub0] no-retry page fault
(src_id:0 ring:40 vmid:2 pasid:32773, for process yandex_browser pid 63982
thread yandex_bro:cs0 pid 64029)
[ 7706.168007] amdgpu 0000:04:00.0: amdgpu:   in page starting at address
0x00008001191f0000 from IH client 0x1b (UTCL2)
[ 7706.168014] amdgpu 0000:04:00.0: amdgpu:
VM_L2_PROTECTION_FAULT_STATUS:0x00241051
[ 7706.168018] amdgpu 0000:04:00.0: amdgpu:      Faulty UTCL2 client ID: TCP
(0x8)
[ 7706.168022] amdgpu 0000:04:00.0: amdgpu:      MORE_FAULTS: 0x1
[ 7706.168024] amdgpu 0000:04:00.0: amdgpu:      WALKER_ERROR: 0x0
[ 7706.168028] amdgpu 0000:04:00.0: amdgpu:      PERMISSION_FAULTS: 0x5
[ 7706.168031] amdgpu 0000:04:00.0: amdgpu:      MAPPING_ERROR: 0x0
[ 7706.168033] amdgpu 0000:04:00.0: amdgpu:      RW: 0x1
[ 7706.168039] amdgpu 0000:04:00.0: amdgpu: [gfxhub0] no-retry page fault
(src_id:0 ring:40 vmid:2 pasid:32773, for process yandex_browser pid 63982
thread yandex_bro:cs0 pid 64029)
[ 7706.168047] amdgpu 0000:04:00.0: amdgpu:   in page starting at address
0x00008001191f1000 from IH client 0x1b (UTCL2)
[ 7706.168053] amdgpu 0000:04:00.0: amdgpu:
VM_L2_PROTECTION_FAULT_STATUS:0x00000000
[ 7706.168056] amdgpu 0000:04:00.0: amdgpu:      Faulty UTCL2 client ID: CB
(0x0)
[ 7706.168059] amdgpu 0000:04:00.0: amdgpu:      MORE_FAULTS: 0x0
[ 7706.168061] amdgpu 0000:04:00.0: amdgpu:      WALKER_ERROR: 0x0
[ 7706.168063] amdgpu 0000:04:00.0: amdgpu:      PERMISSION_FAULTS: 0x0
[ 7706.168064] amdgpu 0000:04:00.0: amdgpu:      MAPPING_ERROR: 0x0
[ 7706.168067] amdgpu 0000:04:00.0: amdgpu:      RW: 0x0
[ 7706.168070] amdgpu 0000:04:00.0: amdgpu: [gfxhub0] no-retry page fault
(src_id:0 ring:40 vmid:2 pasid:32773, for process yandex_browser pid 63982
thread yandex_bro:cs0 pid 64029)
[ 7706.168075] amdgpu 0000:04:00.0: amdgpu:   in page starting at address
0x00008001191f0000 from IH client 0x1b (UTCL2)
[ 7706.168078] amdgpu 0000:04:00.0: amdgpu:
VM_L2_PROTECTION_FAULT_STATUS:0x00000000
[ 7706.168080] amdgpu 0000:04:00.0: amdgpu:      Faulty UTCL2 client ID: CB
(0x0)
[ 7706.168083] amdgpu 0000:04:00.0: amdgpu:      MORE_FAULTS: 0x0
[ 7706.168085] amdgpu 0000:04:00.0: amdgpu:      WALKER_ERROR: 0x0
[ 7706.168088] amdgpu 0000:04:00.0: amdgpu:      PERMISSION_FAULTS: 0x0
[ 7706.168090] amdgpu 0000:04:00.0: amdgpu:      MAPPING_ERROR: 0x0
[ 7706.168092] amdgpu 0000:04:00.0: amdgpu:      RW: 0x0
[ 7706.168094] amdgpu 0000:04:00.0: amdgpu: [gfxhub0] no-retry page fault
(src_id:0 ring:40 vmid:2 pasid:32773, for process yandex_browser pid 63982
thread yandex_bro:cs0 pid 64029)
[ 7706.168099] amdgpu 0000:04:00.0: amdgpu:   in page starting at address
0x00008001191f0000 from IH client 0x1b (UTCL2)
[ 7706.168103] amdgpu 0000:04:00.0: amdgpu:
VM_L2_PROTECTION_FAULT_STATUS:0x00000000
[ 7706.168105] amdgpu 0000:04:00.0: amdgpu:      Faulty UTCL2 client ID: CB
(0x0)
[ 7706.168108] amdgpu 0000:04:00.0: amdgpu:      MORE_FAULTS: 0x0
[ 7706.168110] amdgpu 0000:04:00.0: amdgpu:      WALKER_ERROR: 0x0
[ 7706.168112] amdgpu 0000:04:00.0: amdgpu:      PERMISSION_FAULTS: 0x0
[ 7706.168115] amdgpu 0000:04:00.0: amdgpu:      MAPPING_ERROR: 0x0
[ 7706.168117] amdgpu 0000:04:00.0: amdgpu:      RW: 0x0
[ 7706.168119] amdgpu 0000:04:00.0: amdgpu: [gfxhub0] no-retry page fault
(src_id:0 ring:40 vmid:2 pasid:32773, for process yandex_browser pid 63982
thread yandex_bro:cs0 pid 64029)
[ 7706.168124] amdgpu 0000:04:00.0: amdgpu:   in page starting at address
0x00008001191f0000 from IH client 0x1b (UTCL2)
[ 7706.168129] amdgpu 0000:04:00.0: amdgpu:
VM_L2_PROTECTION_FAULT_STATUS:0x00000000
[ 7706.168132] amdgpu 0000:04:00.0: amdgpu:      Faulty UTCL2 client ID: CB
(0x0)
[ 7706.168134] amdgpu 0000:04:00.0: amdgpu:      MORE_FAULTS: 0x0
[ 7706.168137] amdgpu 0000:04:00.0: amdgpu:      WALKER_ERROR: 0x0
[ 7706.168140] amdgpu 0000:04:00.0: amdgpu:      PERMISSION_FAULTS: 0x0
[ 7706.168143] amdgpu 0000:04:00.0: amdgpu:      MAPPING_ERROR: 0x0
[ 7706.168146] amdgpu 0000:04:00.0: amdgpu:      RW: 0x0
[ 7706.168149] amdgpu 0000:04:00.0: amdgpu: [gfxhub0] no-retry page fault
(src_id:0 ring:40 vmid:2 pasid:32773, for process yandex_browser pid 63982
thread yandex_bro:cs0 pid 64029)
[ 7706.168155] amdgpu 0000:04:00.0: amdgpu:   in page starting at address
0x00008001191f1000 from IH client 0x1b (UTCL2)
[ 7706.168160] amdgpu 0000:04:00.0: amdgpu:
VM_L2_PROTECTION_FAULT_STATUS:0x00000000
[ 7706.168163] amdgpu 0000:04:00.0: amdgpu:      Faulty UTCL2 client ID: CB
(0x0)
[ 7706.168166] amdgpu 0000:04:00.0: amdgpu:      MORE_FAULTS: 0x0
[ 7706.168169] amdgpu 0000:04:00.0: amdgpu:      WALKER_ERROR: 0x0
[ 7706.168172] amdgpu 0000:04:00.0: amdgpu:      PERMISSION_FAULTS: 0x0
[ 7706.168175] amdgpu 0000:04:00.0: amdgpu:      MAPPING_ERROR: 0x0
[ 7706.168178] amdgpu 0000:04:00.0: amdgpu:      RW: 0x0
[ 7706.168181] amdgpu 0000:04:00.0: amdgpu: [gfxhub0] no-retry page fault
(src_id:0 ring:40 vmid:2 pasid:32773, for process yandex_browser pid 63982
thread yandex_bro:cs0 pid 64029)
[ 7706.168188] amdgpu 0000:04:00.0: amdgpu:   in page starting at address
0x00008001191f1000 from IH client 0x1b (UTCL2)
[ 7706.168191] amdgpu 0000:04:00.0: amdgpu:
VM_L2_PROTECTION_FAULT_STATUS:0x00000000
[ 7706.168194] amdgpu 0000:04:00.0: amdgpu:      Faulty UTCL2 client ID: CB
(0x0)
[ 7706.168195] amdgpu 0000:04:00.0: amdgpu:      MORE_FAULTS: 0x0
[ 7706.168197] amdgpu 0000:04:00.0: amdgpu:      WALKER_ERROR: 0x0
[ 7706.168200] amdgpu 0000:04:00.0: amdgpu:      PERMISSION_FAULTS: 0x0
[ 7706.168203] amdgpu 0000:04:00.0: amdgpu:      MAPPING_ERROR: 0x0
[ 7706.168207] amdgpu 0000:04:00.0: amdgpu:      RW: 0x0
[ 7706.168211] amdgpu 0000:04:00.0: amdgpu: [gfxhub0] no-retry page fault
(src_id:0 ring:40 vmid:2 pasid:32773, for process yandex_browser pid 63982
thread yandex_bro:cs0 pid 64029)
[ 7706.168218] amdgpu 0000:04:00.0: amdgpu:   in page starting at address
0x00008001191f1000 from IH client 0x1b (UTCL2)
[ 7706.168223] amdgpu 0000:04:00.0: amdgpu:
VM_L2_PROTECTION_FAULT_STATUS:0x00000000
[ 7706.168227] amdgpu 0000:04:00.0: amdgpu:      Faulty UTCL2 client ID: CB
(0x0)
[ 7706.168230] amdgpu 0000:04:00.0: amdgpu:      MORE_FAULTS: 0x0
[ 7706.168233] amdgpu 0000:04:00.0: amdgpu:      WALKER_ERROR: 0x0
[ 7706.168237] amdgpu 0000:04:00.0: amdgpu:      PERMISSION_FAULTS: 0x0
[ 7706.168240] amdgpu 0000:04:00.0: amdgpu:      MAPPING_ERROR: 0x0
[ 7706.168243] amdgpu 0000:04:00.0: amdgpu:      RW: 0x0
[ 7706.168248] amdgpu 0000:04:00.0: amdgpu: [gfxhub0] no-retry page fault
(src_id:0 ring:40 vmid:2 pasid:32773, for process yandex_browser pid 63982
thread yandex_bro:cs0 pid 64029)
[ 7706.168254] amdgpu 0000:04:00.0: amdgpu:   in page starting at address
0x00008001191f4000 from IH client 0x1b (UTCL2)
[ 7706.168256] amdgpu 0000:04:00.0: amdgpu:
VM_L2_PROTECTION_FAULT_STATUS:0x00000000
[ 7706.168258] amdgpu 0000:04:00.0: amdgpu:      Faulty UTCL2 client ID: CB
(0x0)
[ 7706.168259] amdgpu 0000:04:00.0: amdgpu:      MORE_FAULTS: 0x0
[ 7706.168261] amdgpu 0000:04:00.0: amdgpu:      WALKER_ERROR: 0x0
[ 7706.168262] amdgpu 0000:04:00.0: amdgpu:      PERMISSION_FAULTS: 0x0
[ 7706.168263] amdgpu 0000:04:00.0: amdgpu:      MAPPING_ERROR: 0x0
[ 7706.168265] amdgpu 0000:04:00.0: amdgpu:      RW: 0x0
[ 7706.168268] amdgpu 0000:04:00.0: amdgpu: [gfxhub0] no-retry page fault
(src_id:0 ring:40 vmid:2 pasid:32773, for process yandex_browser pid 63982
thread yandex_bro:cs0 pid 64029)
[ 7706.168273] amdgpu 0000:04:00.0: amdgpu:   in page starting at address
0x00008001191f3000 from IH client 0x1b (UTCL2)
[ 7706.168278] amdgpu 0000:04:00.0: amdgpu:
VM_L2_PROTECTION_FAULT_STATUS:0x00000000
[ 7706.168281] amdgpu 0000:04:00.0: amdgpu:      Faulty UTCL2 client ID: CB
(0x0)
[ 7706.168285] amdgpu 0000:04:00.0: amdgpu:      MORE_FAULTS: 0x0
[ 7706.168287] amdgpu 0000:04:00.0: amdgpu:      WALKER_ERROR: 0x0
[ 7706.168290] amdgpu 0000:04:00.0: amdgpu:      PERMISSION_FAULTS: 0x0
[ 7706.168293] amdgpu 0000:04:00.0: amdgpu:      MAPPING_ERROR: 0x0
[ 7706.168296] amdgpu 0000:04:00.0: amdgpu:      RW: 0x0
[ 7716.336698] [drm:amdgpu_job_timedout [amdgpu]] *ERROR* ring gfx timeout,=
 but
soft recovered
[ 7734.442406] fbcon: Taking over console
[ 7734.472820] Console: switching to colour frame buffer device 160x45


My OS: Ubuntu 22.10 (Kinetic Kudu)
Kernel: linux 6.0.0-rc4 #1 SMP PREEMPT_DYNAMIC Sat Sep 17 18:19:08 EEST 2022
x86_64 x86_64 x86_64 GNU/Linux

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
