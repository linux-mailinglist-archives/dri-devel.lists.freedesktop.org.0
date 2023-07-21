Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4AF6975BC4F
	for <lists+dri-devel@lfdr.de>; Fri, 21 Jul 2023 04:33:52 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EAA8510E19F;
	Fri, 21 Jul 2023 02:33:47 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 580A310E19F
 for <dri-devel@lists.freedesktop.org>; Fri, 21 Jul 2023 02:33:46 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 63FAF61CB8
 for <dri-devel@lists.freedesktop.org>; Fri, 21 Jul 2023 02:33:45 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id CBB94C433C8
 for <dri-devel@lists.freedesktop.org>; Fri, 21 Jul 2023 02:33:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1689906824;
 bh=ECWj1CC3gI9zoVSH++pJrll5e7/2mzf8RsbqezBsMvk=;
 h=From:To:Subject:Date:From;
 b=GJ6PQjOkFewRzcN1glUK6AXq7wAqPmbLmNWxEMmwcqM81gYqpRoffJxiVUKiECwT1
 0lFqG4wt7mXcmURCLgzlettkB3IA9zku5EM4TjnUjAYfYQ5Hy+nQs/CU8UFsezJOIB
 /kHGytR9HEhLrGxGW1LX5LUp7mBovDqe61fvpz3Te7f1S10mP5UPTFhNx1tTUQIHgg
 DREutqD7jN3YqU7jcM3x/Sr0hI2HqQz/4KO/2xMKF8SuAv9Ynodl5RLqeOnmaDjuPn
 lRgkq7r8PqcIlFOiuHLHUmG6DBQgpI7jXV6/YOzv2R+2TLvsvw7d0hiUBxIzcLLWN1
 FhMAvLBhwj8DA==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix,
 from userid 48) id AF956C53BD2; Fri, 21 Jul 2023 02:33:44 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 217690] New: consistent amdgpu failures on Lenovo ThinkPad Z16:
 "[drm:amdgpu_dm_process_dmub_aux_transfer_sync [amdgpu]] *ERROR*
 wait_for_completion_timeout timeout!"
Date: Fri, 21 Jul 2023 02:33:44 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: new
X-Bugzilla-Watch-Reason: AssignedTo drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Video(DRI - non Intel)
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: high
X-Bugzilla-Who: mhall@mhcomputing.net
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P3
X-Bugzilla-Assigned-To: drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: bug_id short_desc product version rep_platform
 op_sys bug_status bug_severity priority component assigned_to reporter
 cf_regression
Message-ID: <bug-217690-2300@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D217690

            Bug ID: 217690
           Summary: consistent amdgpu failures on Lenovo ThinkPad Z16:
                    "[drm:amdgpu_dm_process_dmub_aux_transfer_sync
                    [amdgpu]] *ERROR* wait_for_completion_timeout
                    timeout!"
           Product: Drivers
           Version: 2.5
          Hardware: AMD
                OS: Linux
            Status: NEW
          Severity: high
          Priority: P3
         Component: Video(DRI - non Intel)
          Assignee: drivers_video-dri@kernel-bugs.osdl.org
          Reporter: mhall@mhcomputing.net
        Regression: No

I am using the following system:

System Information
        Manufacturer: LENOVO
        Product Name: 21D4000HUS
        Version: ThinkPad Z16 Gen 1
        Serial Number: PF3XPEBD
        UUID: 59e137b9-fc54-11ec-80f2-6c2408eab813
        Wake-up Type: Power Switch
        SKU Number: LENOVO_MT_21D4_BU_Think_FM_ThinkPad Z16 Gen 1
        Family: ThinkPad Z16 Gen 1

It has the following graphics controller:

Advanced Micro Devices, Inc. [AMD/ATI] Navi 24 [Radeon RX 6400/6500 XT/6500=
M]
(rev c3)

I see different bizarre AMD GPU errors from 6.2.0, 6.2.16, and 6.4.3. I have
never been able to find a kernel that works 100% stable, so I am not sure h=
ow
to narrow this down or work around it without some professional advice.

Here are the errors from Linux version 6.4.3-060403-generic (kernel@kathlee=
n)
(x86_64-linux-gnu-gcc-12 (Ubuntu 12.3.0-1ubuntu1) 12.3.0, GNU ld (GNU Binut=
ils
for Ubuntu) 2.40) #202307110536 SMP PREEMPT_DYNAMIC Tue Jul 11 05:43:58 UTC
2023.

When the errors happen, X / Wayland freezes up. The problem happens more of=
ten
in Wayland than X, from what I can see. Sometimes, you can mode-switch to t=
he
TTY and try to recover some work, but other times it locks up any local
interaction with the machine, so you can only get in via SSH. It does not s=
eem
to fully cripple the machine, but the machine usually refuses to complete t=
he
normal shutdown process when the infinite timeout message loop described be=
low
occurs.

I am not 100% sure what information would be most helpful for debugging thi=
s,
but let me know and I will provide whatever is needed ASAP.

2023-07-14T13:12:00.727393-07:00 mhall-xps-01 kernel: [601793.214603]
[drm:amdgpu_job_timedout [amdgpu]] *ERROR* ring gfx_0.0.0 timeout, signaled
seq=3D9336145, emitted seq=3D9336147
2023-07-14T13:12:00.727411-07:00 mhall-xps-01 kernel: [601793.215114]
[drm:amdgpu_job_timedout [amdgpu]] *ERROR* Process information: process
kwin_wayland pid 2368 thread kwin_wayla:cs0 pid 2378
2023-07-14T13:12:00.727413-07:00 mhall-xps-01 kernel: [601793.215552] amdgpu
0000:67:00.0: amdgpu: GPU reset begin!
2023-07-14T13:12:01.439388-07:00 mhall-xps-01 kernel: [601793.927226] amdgpu
0000:67:00.0: amdgpu: MODE2 reset
2023-07-14T13:12:01.452637-07:00 mhall-xps-01 kernel: [601793.936646] amdgpu
0000:67:00.0: amdgpu: GPU reset succeeded, trying to resume
2023-07-14T13:12:01.452643-07:00 mhall-xps-01 kernel: [601793.936835] [drm]
PCIE GART of 1024M enabled (table at 0x000000F41FC00000).
2023-07-14T13:12:01.455390-07:00 mhall-xps-01 kernel: [601793.941616] [drm]=
 PSP
is resuming...
2023-07-14T13:12:01.475649-07:00 mhall-xps-01 kernel: [601793.963877] [drm]
reserve 0xa00000 from 0xf41e000000 for PSP TMR
2023-07-14T13:12:01.799694-07:00 mhall-xps-01 kernel: [601794.288086] amdgpu
0000:67:00.0: amdgpu: RAS: optional ras ta ucode is not available
2023-07-14T13:12:01.811380-07:00 mhall-xps-01 kernel: [601794.300087] amdgpu
0000:67:00.0: amdgpu: RAP: optional rap ta ucode is not available
2023-07-14T13:12:01.811389-07:00 mhall-xps-01 kernel: [601794.300089] amdgpu
0000:67:00.0: amdgpu: SECUREDISPLAY: securedisplay ta ucode is not available
2023-07-14T13:12:01.811390-07:00 mhall-xps-01 kernel: [601794.300094] amdgpu
0000:67:00.0: amdgpu: SMU is resuming...
2023-07-14T13:12:01.815388-07:00 mhall-xps-01 kernel: [601794.301356] amdgpu
0000:67:00.0: amdgpu: SMU is resumed successfully!
2023-07-14T13:12:01.815403-07:00 mhall-xps-01 kernel: [601794.303468] [drm]
DMUB hardware initialized: version=3D0x0400002E
2023-07-14T13:12:02.839400-07:00 mhall-xps-01 kernel: [601794.311151] [drm]
Watermarks table not configured properly by SMU
2023-07-14T13:12:02.839419-07:00 mhall-xps-01 kernel: [601795.324614] [drm]=
 kiq
ring mec 2 pipe 1 q 0
2023-07-14T13:12:02.843825-07:00 mhall-xps-01 kernel: [601795.330387] [drm]=
 VCN
decode and encode initialized successfully(under DPG Mode).
2023-07-14T13:12:02.843842-07:00 mhall-xps-01 kernel: [601795.330870] [drm]
JPEG decode initialized successfully.
2023-07-14T13:12:02.843845-07:00 mhall-xps-01 kernel: [601795.330877] amdgpu
0000:67:00.0: amdgpu: ring gfx_0.0.0 uses VM inv eng 0 on hub 0
2023-07-14T13:12:02.843846-07:00 mhall-xps-01 kernel: [601795.330882] amdgpu
0000:67:00.0: amdgpu: ring comp_1.0.0 uses VM inv eng 1 on hub 0
2023-07-14T13:12:02.843848-07:00 mhall-xps-01 kernel: [601795.330886] amdgpu
0000:67:00.0: amdgpu: ring comp_1.1.0 uses VM inv eng 4 on hub 0
2023-07-14T13:12:02.843849-07:00 mhall-xps-01 kernel: [601795.330888] amdgpu
0000:67:00.0: amdgpu: ring comp_1.2.0 uses VM inv eng 5 on hub 0
2023-07-14T13:12:02.843851-07:00 mhall-xps-01 kernel: [601795.330889] amdgpu
0000:67:00.0: amdgpu: ring comp_1.3.0 uses VM inv eng 6 on hub 0
2023-07-14T13:12:02.843852-07:00 mhall-xps-01 kernel: [601795.330891] amdgpu
0000:67:00.0: amdgpu: ring comp_1.0.1 uses VM inv eng 7 on hub 0
2023-07-14T13:12:02.843852-07:00 mhall-xps-01 kernel: [601795.330893] amdgpu
0000:67:00.0: amdgpu: ring comp_1.1.1 uses VM inv eng 8 on hub 0
2023-07-14T13:12:02.843854-07:00 mhall-xps-01 kernel: [601795.330895] amdgpu
0000:67:00.0: amdgpu: ring comp_1.2.1 uses VM inv eng 9 on hub 0
2023-07-14T13:12:02.843855-07:00 mhall-xps-01 kernel: [601795.330896] amdgpu
0000:67:00.0: amdgpu: ring comp_1.3.1 uses VM inv eng 10 on hub 0
2023-07-14T13:12:02.843856-07:00 mhall-xps-01 kernel: [601795.330898] amdgpu
0000:67:00.0: amdgpu: ring kiq_2.1.0 uses VM inv eng 11 on hub 0
2023-07-14T13:12:02.843857-07:00 mhall-xps-01 kernel: [601795.330900] amdgpu
0000:67:00.0: amdgpu: ring sdma0 uses VM inv eng 12 on hub 0
2023-07-14T13:12:02.843858-07:00 mhall-xps-01 kernel: [601795.330902] amdgpu
0000:67:00.0: amdgpu: ring vcn_dec_0 uses VM inv eng 0 on hub 1
2023-07-14T13:12:02.843860-07:00 mhall-xps-01 kernel: [601795.330904] amdgpu
0000:67:00.0: amdgpu: ring vcn_enc_0.0 uses VM inv eng 1 on hub 1
2023-07-14T13:12:02.843860-07:00 mhall-xps-01 kernel: [601795.330906] amdgpu
0000:67:00.0: amdgpu: ring vcn_enc_0.1 uses VM inv eng 4 on hub 1
2023-07-14T13:12:02.843861-07:00 mhall-xps-01 kernel: [601795.330908] amdgpu
0000:67:00.0: amdgpu: ring jpeg_dec uses VM inv eng 5 on hub 1
2023-07-14T13:12:02.849015-07:00 mhall-xps-01 kernel: [601795.337869] amdgpu
0000:67:00.0: amdgpu: recover vram bo from shadow start
2023-07-14T13:12:02.849027-07:00 mhall-xps-01 kernel: [601795.337873] amdgpu
0000:67:00.0: amdgpu: recover vram bo from shadow done
2023-07-14T13:12:02.849029-07:00 mhall-xps-01 kernel: [601795.337922] [drm]
Skip scheduling IBs!
2023-07-14T13:12:02.849039-07:00 mhall-xps-01 kernel: [601795.337938] amdgpu
0000:67:00.0: amdgpu: GPU reset(2) succeeded!
2023-07-14T13:12:02.849041-07:00 mhall-xps-01 kernel: [601795.337940] [drm]
Skip scheduling IBs!
2023-07-14T13:12:03.659407-07:00 mhall-xps-01 kernel: [601796.144908] [drm]
PCIE GART of 512M enabled (table at 0x00000080FEB00000).
2023-07-14T13:12:03.659436-07:00 mhall-xps-01 kernel: [601796.144933] [drm]=
 PSP
is resuming...
2023-07-14T13:12:03.735392-07:00 mhall-xps-01 kernel: [601796.221134] [drm]
reserve 0xa00000 from 0x80fd000000 for PSP TMR
2023-07-14T13:12:03.835392-07:00 mhall-xps-01 kernel: [601796.320820] amdgpu
0000:03:00.0: amdgpu: RAS: optional ras ta ucode is not available
2023-07-14T13:12:03.847400-07:00 mhall-xps-01 kernel: [601796.335924] amdgpu
0000:03:00.0: amdgpu: SECUREDISPLAY: securedisplay ta ucode is not available
2023-07-14T13:12:03.847414-07:00 mhall-xps-01 kernel: [601796.335931] amdgpu
0000:03:00.0: amdgpu: SMU is resuming...
2023-07-14T13:12:03.847418-07:00 mhall-xps-01 kernel: [601796.335938] amdgpu
0000:03:00.0: amdgpu: smu driver if version =3D 0x0000000d, smu fw if versi=
on =3D
0x0000000f, smu fw program =3D 0, version =3D 0x00491f00 (73.31.0)
2023-07-14T13:12:03.847422-07:00 mhall-xps-01 kernel: [601796.335944] amdgpu
0000:03:00.0: amdgpu: SMU driver if version not matched
2023-07-14T13:12:03.847424-07:00 mhall-xps-01 kernel: [601796.335987] amdgpu
0000:03:00.0: amdgpu: use vbios provided pptable
2023-07-14T13:12:03.887360-07:00 mhall-xps-01 kernel: [601796.374699] amdgpu
0000:03:00.0: amdgpu: SMU is resumed successfully!
2023-07-14T13:12:03.887364-07:00 mhall-xps-01 kernel: [601796.375979] [drm]
DMUB hardware initialized: version=3D0x02020017
2023-07-14T13:12:03.891378-07:00 mhall-xps-01 kernel: [601796.378784] [drm]=
 kiq
ring mec 2 pipe 1 q 0
2023-07-14T13:12:03.895371-07:00 mhall-xps-01 kernel: [601796.382127] [drm]=
 VCN
decode and encode initialized successfully(under DPG Mode).
2023-07-14T13:12:03.895382-07:00 mhall-xps-01 kernel: [601796.382143] amdgpu
0000:03:00.0: amdgpu: ring gfx_0.0.0 uses VM inv eng 0 on hub 0
2023-07-14T13:12:03.895384-07:00 mhall-xps-01 kernel: [601796.382145] amdgpu
0000:03:00.0: amdgpu: ring comp_1.0.0 uses VM inv eng 1 on hub 0
2023-07-14T13:12:03.895384-07:00 mhall-xps-01 kernel: [601796.382146] amdgpu
0000:03:00.0: amdgpu: ring comp_1.1.0 uses VM inv eng 4 on hub 0
2023-07-14T13:12:03.895385-07:00 mhall-xps-01 kernel: [601796.382147] amdgpu
0000:03:00.0: amdgpu: ring comp_1.2.0 uses VM inv eng 5 on hub 0
2023-07-14T13:12:03.895406-07:00 mhall-xps-01 kernel: [601796.382147] amdgpu
0000:03:00.0: amdgpu: ring comp_1.3.0 uses VM inv eng 6 on hub 0
2023-07-14T13:12:03.895408-07:00 mhall-xps-01 kernel: [601796.382148] amdgpu
0000:03:00.0: amdgpu: ring comp_1.0.1 uses VM inv eng 7 on hub 0
2023-07-14T13:12:03.895409-07:00 mhall-xps-01 kernel: [601796.382148] amdgpu
0000:03:00.0: amdgpu: ring comp_1.1.1 uses VM inv eng 8 on hub 0
2023-07-14T13:12:03.895410-07:00 mhall-xps-01 kernel: [601796.382149] amdgpu
0000:03:00.0: amdgpu: ring comp_1.2.1 uses VM inv eng 9 on hub 0
2023-07-14T13:12:03.895411-07:00 mhall-xps-01 kernel: [601796.382150] amdgpu
0000:03:00.0: amdgpu: ring comp_1.3.1 uses VM inv eng 10 on hub 0
2023-07-14T13:12:03.895412-07:00 mhall-xps-01 kernel: [601796.382151] amdgpu
0000:03:00.0: amdgpu: ring kiq_2.1.0 uses VM inv eng 11 on hub 0
2023-07-14T13:12:03.895413-07:00 mhall-xps-01 kernel: [601796.382151] amdgpu
0000:03:00.0: amdgpu: ring sdma0 uses VM inv eng 12 on hub 0
2023-07-14T13:12:03.895415-07:00 mhall-xps-01 kernel: [601796.382152] amdgpu
0000:03:00.0: amdgpu: ring vcn_dec_0 uses VM inv eng 0 on hub 1
2023-07-14T13:12:30.415435-07:00 mhall-xps-01 kernel: [601812.660226]
[drm:amdgpu_dm_process_dmub_aux_transfer_sync [amdgpu]] *ERROR*
wait_for_completion_timeout timeout!
2023-07-14T13:12:34.415365-07:00 mhall-xps-01 kernel: [601822.899679]
[drm:amdgpu_dm_process_dmub_aux_transfer_sync [amdgpu]] *ERROR*
wait_for_completion_timeout timeout!
2023-07-14T13:12:34.415376-07:00 mhall-xps-01 kernel: [601826.899898] [drm]
PCIE GART of 512M enabled (table at 0x00000080FEB00000).
2023-07-14T13:12:34.415378-07:00 mhall-xps-01 kernel: [601826.899922] [drm]=
 PSP
is resuming...
2023-07-14T13:12:34.491417-07:00 mhall-xps-01 kernel: [601826.976455] [drm]
reserve 0xa00000 from 0x80fd000000 for PSP TMR
2023-07-14T13:12:34.591378-07:00 mhall-xps-01 kernel: [601827.075900] amdgpu
0000:03:00.0: amdgpu: RAS: optional ras ta ucode is not available
2023-07-14T13:12:34.603398-07:00 mhall-xps-01 kernel: [601827.091423] amdgpu
0000:03:00.0: amdgpu: SECUREDISPLAY: securedisplay ta ucode is not available
2023-07-14T13:12:34.603421-07:00 mhall-xps-01 kernel: [601827.091433] amdgpu
0000:03:00.0: amdgpu: SMU is resuming...
2023-07-14T13:12:34.603422-07:00 mhall-xps-01 kernel: [601827.091439] amdgpu
0000:03:00.0: amdgpu: smu driver if version =3D 0x0000000d, smu fw if versi=
on =3D
0x0000000f, smu fw program =3D 0, version =3D 0x00491f00 (73.31.0)
2023-07-14T13:12:34.603425-07:00 mhall-xps-01 kernel: [601827.091444] amdgpu
0000:03:00.0: amdgpu: SMU driver if version not matched
2023-07-14T13:12:34.603426-07:00 mhall-xps-01 kernel: [601827.091474] amdgpu
0000:03:00.0: amdgpu: use vbios provided pptable
2023-07-14T13:12:34.643366-07:00 mhall-xps-01 kernel: [601827.130769] amdgpu
0000:03:00.0: amdgpu: SMU is resumed successfully!
2023-07-14T13:12:34.647347-07:00 mhall-xps-01 kernel: [601827.132081] [drm]
DMUB hardware initialized: version=3D0x02020017
2023-07-14T13:12:34.647351-07:00 mhall-xps-01 kernel: [601827.135330] [drm]=
 kiq
ring mec 2 pipe 1 q 0
2023-07-14T13:12:34.651354-07:00 mhall-xps-01 kernel: [601827.138683] [drm]=
 VCN
decode and encode initialized successfully(under DPG Mode).
2023-07-14T13:12:34.651357-07:00 mhall-xps-01 kernel: [601827.138709] amdgpu
0000:03:00.0: amdgpu: ring gfx_0.0.0 uses VM inv eng 0 on hub 0
2023-07-14T13:12:34.651359-07:00 mhall-xps-01 kernel: [601827.138713] amdgpu
0000:03:00.0: amdgpu: ring comp_1.0.0 uses VM inv eng 1 on hub 0
2023-07-14T13:12:34.651360-07:00 mhall-xps-01 kernel: [601827.138715] amdgpu
0000:03:00.0: amdgpu: ring comp_1.1.0 uses VM inv eng 4 on hub 0
2023-07-14T13:12:34.651361-07:00 mhall-xps-01 kernel: [601827.138717] amdgpu
0000:03:00.0: amdgpu: ring comp_1.2.0 uses VM inv eng 5 on hub 0
2023-07-14T13:12:34.651362-07:00 mhall-xps-01 kernel: [601827.138719] amdgpu
0000:03:00.0: amdgpu: ring comp_1.3.0 uses VM inv eng 6 on hub 0
2023-07-14T13:12:34.651363-07:00 mhall-xps-01 kernel: [601827.138721] amdgpu
0000:03:00.0: amdgpu: ring comp_1.0.1 uses VM inv eng 7 on hub 0
2023-07-14T13:12:34.651365-07:00 mhall-xps-01 kernel: [601827.138723] amdgpu
0000:03:00.0: amdgpu: ring comp_1.1.1 uses VM inv eng 8 on hub 0
2023-07-14T13:12:34.651365-07:00 mhall-xps-01 kernel: [601827.138724] amdgpu
0000:03:00.0: amdgpu: ring comp_1.2.1 uses VM inv eng 9 on hub 0
2023-07-14T13:12:34.651366-07:00 mhall-xps-01 kernel: [601827.138726] amdgpu
0000:03:00.0: amdgpu: ring comp_1.3.1 uses VM inv eng 10 on hub 0
2023-07-14T13:12:34.651367-07:00 mhall-xps-01 kernel: [601827.138727] amdgpu
0000:03:00.0: amdgpu: ring kiq_2.1.0 uses VM inv eng 11 on hub 0
2023-07-14T13:12:34.651368-07:00 mhall-xps-01 kernel: [601827.138729] amdgpu
0000:03:00.0: amdgpu: ring sdma0 uses VM inv eng 12 on hub 0
2023-07-14T13:12:34.651377-07:00 mhall-xps-01 kernel: [601827.138731] amdgpu
0000:03:00.0: amdgpu: ring vcn_dec_0 uses VM inv eng 0 on hub 1
2023-07-14T13:12:50.895678-07:00 mhall-xps-01 kernel: [601833.139440]
[drm:amdgpu_dm_process_dmub_aux_transfer_sync [amdgpu]] *ERROR*
wait_for_completion_timeout timeout!
2023-07-14T13:13:01.135668-07:00 mhall-xps-01 kernel: [601843.379388]
[drm:amdgpu_dm_process_dmub_aux_transfer_sync [amdgpu]] *ERROR*
wait_for_completion_timeout timeout!
2023-07-14T13:13:11.375612-07:00 mhall-xps-01 kernel: [601853.618947]
[drm:amdgpu_dm_process_dmub_aux_transfer_sync [amdgpu]] *ERROR*
wait_for_completion_timeout timeout!
2023-07-14T13:13:21.615870-07:00 mhall-xps-01 kernel: [601863.858670]
[drm:amdgpu_dm_process_dmub_aux_transfer_sync [amdgpu]] *ERROR*
wait_for_completion_timeout timeout!
2023-07-14T13:13:31.855713-07:00 mhall-xps-01 kernel: [601874.098488]
[drm:amdgpu_dm_process_dmub_aux_transfer_sync [amdgpu]] *ERROR*
wait_for_completion_timeout timeout!
... infinite repeat until reboot ...

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
