Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1FB8E3FA3C4
	for <lists+dri-devel@lfdr.de>; Sat, 28 Aug 2021 06:56:43 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 95A7C6E9FA;
	Sat, 28 Aug 2021 04:56:38 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5C4296E9FA
 for <dri-devel@lists.freedesktop.org>; Sat, 28 Aug 2021 04:56:37 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPS id D36A560EDF
 for <dri-devel@lists.freedesktop.org>; Sat, 28 Aug 2021 04:56:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1630126596;
 bh=Lpj/NjH8F6vAYskeVCNwtPGTdGdi77X9cVZPpKniq/I=;
 h=From:To:Subject:Date:From;
 b=Oo4PP1qNCMLtIYLEzdc92H0ac70bnpdAXTrrkCMln7mS3k3G3CY8M1B1VV9e7QW8/
 KJWH90axJYu1XTiZlwvCF3cj7sGwKHckhcry4iyaE4LjoASEV2Ta6+MXP1NBSf/K2n
 PWhFgMnYdAikADZ+SCPdNs4KBzsPh0C4MuipQdhhwEMmkxQzDa4Q+lsmQCipgXfTiM
 vDSK2G6JGg3RbJPO0VAN/PJvhvVrHF5UA7rklGQwDIlZDDcC/5J9AybcRxuAncnBc3
 zFckcX5RTy9UCm/r5tO271nXEDzkd4OhxbVT0f1HUTNcZv1tyC8RKdG49d2/HU2Sn2
 BhasM0GxfdCRg==
Received: by pdx-korg-bugzilla-2.web.codeaurora.org (Postfix, from userid 48)
 id CFDA160EE4; Sat, 28 Aug 2021 04:56:36 +0000 (UTC)
From: bugzilla-daemon@bugzilla.kernel.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 214207] New: Nouveau crash after play youtube video from surf
 browser
Date: Sat, 28 Aug 2021 04:56:36 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: new
X-Bugzilla-Watch-Reason: AssignedTo drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Video(DRI - non Intel)
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: high
X-Bugzilla-Who: ne-vlezay80@yandex.ru
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: bug_id short_desc product version
 cf_kernel_version rep_platform op_sys cf_tree bug_status bug_severity
 priority component assigned_to reporter cf_regression
Message-ID: <bug-214207-2300@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D214207

            Bug ID: 214207
           Summary: Nouveau crash after play youtube video from surf
                    browser
           Product: Drivers
           Version: 2.5
    Kernel Version: 5.10.0-8-amd64
          Hardware: x86-64
                OS: Linux
              Tree: Mainline
            Status: NEW
          Severity: high
          Priority: P1
         Component: Video(DRI - non Intel)
          Assignee: drivers_video-dri@kernel-bugs.osdl.org
          Reporter: ne-vlezay80@yandex.ru
        Regression: No

Log:
[  796.192899] nouveau 0000:01:00.0: fifo: PBDMA0: 00040000 [PBENTRY] ch 7
[003f8f9000 Xorg[1301]] subc 0 mthd 0000 data 00000000
[  796.192919] nouveau 0000:01:00.0: gr: DATA_ERROR 0000000d [BEGIN_END_ACT=
IVE]
ch 7 [003f8f9000 Xorg[1301]] subc 0 class a197 mthd 1614 data 00000000
[  796.391497] nouveau 0000:01:00.0: gr: DATA_ERROR 0000000c [INVALID_BITFI=
ELD]
ch 7 [003f8f9000 Xorg[1301]] subc 0 class a197 mthd 2384 data 02580000
[  796.391511] nouveau 0000:01:00.0: fifo: PBDMA0: 00040000 [PBENTRY] ch 7
[003f8f9000 Xorg[1301]] subc 0 mthd 0000 data 00000000
[  796.391524] nouveau 0000:01:00.0: gr: TRAP ch 7 [003f8f9000 Xorg[1301]]
[  796.391528] nouveau 0000:01:00.0: gr: DISPATCH 80000002
[CLASS_SUBCH_MISMATCH]
[  796.391536] nouveau 0000:01:00.0: fifo: PBDMA0: 00200000 [METHOD] ch 7
[003f8f9000 Xorg[1301]] subc 0 mthd 000c data 00000040
[  796.391548] nouveau 0000:01:00.0: fifo: PBDMA0: 02000000 [SEMAPHORE] ch 7
[003f8f9000 Xorg[1301]] subc 0 mthd 001c data 200503f8
[  796.391564] nouveau 0000:01:00.0: fifo: PBDMA0: 00200000 [METHOD] ch 7
[003f8f9000 Xorg[1301]] subc 0 mthd 0030 data 00000000
[  796.391580] nouveau 0000:01:00.0: fifo: PBDMA0: 00200000 [METHOD] ch 7
[003f8f9000 Xorg[1301]] subc 0 mthd 0034 data 2001054e
[  796.391595] nouveau 0000:01:00.0: fifo: PBDMA0: 00200000 [METHOD] ch 7
[003f8f9000 Xorg[1301]] subc 0 mthd 0038 data 00000001
[  796.391610] nouveau 0000:01:00.0: fifo: PBDMA0: 00200000 [METHOD] ch 7
[003f8f9000 Xorg[1301]] subc 0 mthd 003c data 2003048a
[  796.391625] nouveau 0000:01:00.0: fifo: PBDMA0: 00200000 [METHOD] ch 7
[003f8f9000 Xorg[1301]] subc 0 mthd 0040 data 00000320
[  796.391638] nouveau 0000:01:00.0: fifo: PBDMA0: 00200000 [METHOD] ch 7
[003f8f9000 Xorg[1301]] subc 0 mthd 0044 data 00000258
[  796.391652] nouveau 0000:01:00.0: fifo: PBDMA0: 00200000 [METHOD] ch 7
[003f8f9000 Xorg[1301]] subc 0 mthd 0048 data 00010001
[  796.391664] nouveau 0000:01:00.0: fifo: PBDMA0: 00200000 [METHOD] ch 7
[003f8f9000 Xorg[1301]] subc 0 mthd 004c data 200105e7
[  796.391820] nouveau 0000:01:00.0: fifo: PBDMA0: 00200000 [METHOD] ch 7
[003f8f9000 Xorg[1301]] subc 0 mthd 0054 data 20010487
[  796.391833] nouveau 0000:01:00.0: fifo: PBDMA0: 00200000 [METHOD] ch 7
[003f8f9000 Xorg[1301]] subc 0 mthd 0058 data 0fac6881
[  796.391847] nouveau 0000:01:00.0: fifo: PBDMA0: 00200000 [METHOD] ch 7
[003f8f9000 Xorg[1301]] subc 0 mthd 005c data 80000574
[  796.391859] nouveau 0000:01:00.0: fifo: PBDMA0: 00200000 [METHOD] ch 7
[003f8f9000 Xorg[1301]] subc 0 mthd 0060 data 80000671
[  796.391872] nouveau 0000:01:00.0: fifo: PBDMA0: 00200000 [METHOD] ch 7
[003f8f9000 Xorg[1301]] subc 0 mthd 0064 data 800004b9
[  796.391883] nouveau 0000:01:00.0: fifo: PBDMA0: 00200000 [METHOD] ch 7
[003f8f9000 Xorg[1301]] subc 0 mthd 0068 data 80000e04
[  796.391896] nouveau 0000:01:00.0: fifo: PBDMA0: 00200000 [METHOD] ch 7
[003f8f9000 Xorg[1301]] subc 0 mthd 006c data 800103e4
[  796.391910] nouveau 0000:01:00.0: fifo: PBDMA0: 00200000 [METHOD] ch 7
[003f8f9000 Xorg[1301]] subc 0 mthd 0070 data 20010680
[  796.391923] nouveau 0000:01:00.0: fifo: PBDMA0: 00200000 [METHOD] ch 7
[003f8f9000 Xorg[1301]] subc 0 mthd 0074 data 00001111
[  796.391935] nouveau 0000:01:00.0: fifo: PBDMA0: 00400000 [METHODCRC] ch 7
[003f8f9000 Xorg[1301]] subc 0 mthd 007c data 00000000
[  796.391948] nouveau 0000:01:00.0: fifo: PBDMA0: 00200000 [METHOD] ch 7
[003f8f9000 Xorg[1301]] subc 0 mthd 0084 data 8000066f
[  796.391960] nouveau 0000:01:00.0: fifo: PBDMA0: 00200000 [METHOD] ch 7
[003f8f9000 Xorg[1301]] subc 0 mthd 0088 data 800004e0
[  796.391973] nouveau 0000:01:00.0: fifo: PBDMA0: 00200000 [METHOD] ch 7
[003f8f9000 Xorg[1301]] subc 0 mthd 008c data 800004bb
[  796.391985] nouveau 0000:01:00.0: fifo: PBDMA0: 00200000 [METHOD] ch 7
[003f8f9000 Xorg[1301]] subc 0 mthd 0090 data 20024062
[  796.391999] nouveau 0000:01:00.0: fifo: PBDMA0: 00200000 [METHOD] ch 7
[003f8f9000 Xorg[1301]] subc 0 mthd 0094 data 00000000
[  796.392011] nouveau 0000:01:00.0: fifo: PBDMA0: 00200000 [METHOD] ch 7
[003f8f9000 Xorg[1301]] subc 0 mthd 0098 data 008e19c0
[  796.392024] nouveau 0000:01:00.0: fifo: PBDMA0: 00200000 [METHOD] ch 7
[003f8f9000 Xorg[1301]] subc 0 mthd 009c data 20024060
[  796.392037] nouveau 0000:01:00.0: fifo: PBDMA0: 00200000 [METHOD] ch 7
[003f8f9000 Xorg[1301]] subc 0 mthd 00a0 data 00000020
[  796.392049] nouveau 0000:01:00.0: fifo: PBDMA0: 00200000 [METHOD] ch 7
[003f8f9000 Xorg[1301]] subc 0 mthd 00a4 data 800105a1
[  796.392062] nouveau 0000:01:00.0: fifo: PBDMA0: 00240000 [PBENTRY METHOD=
] ch
7 [003f8f9000 Xorg[1301]] subc 0 mthd 00a8 data 800005a2
[  796.392075] nouveau 0000:01:00.0: fifo: PBDMA0: 00240000 [PBENTRY METHOD=
] ch
7 [003f8f9000 Xorg[1301]] subc 0 mthd 00ac data 80000980
[  796.392098] nouveau 0000:01:00.0: gr: ILLEGAL_CLASS ch 7 [003f8f9000
Xorg[1301]] subc 0 class 0320 mthd 13a8 data 02a20000

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
