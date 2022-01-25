Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 6188449BB7C
	for <lists+dri-devel@lfdr.de>; Tue, 25 Jan 2022 19:49:29 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B79B810E437;
	Tue, 25 Jan 2022 18:49:25 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 50D9B10E437
 for <dri-devel@lists.freedesktop.org>; Tue, 25 Jan 2022 18:49:24 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 96F2061639
 for <dri-devel@lists.freedesktop.org>; Tue, 25 Jan 2022 18:49:23 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 8BDD3C340E7
 for <dri-devel@lists.freedesktop.org>; Tue, 25 Jan 2022 18:49:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1643136562;
 bh=U+ELAqGUdihs7g5P9G7cdkm8cIV+43CwoJgGRJ5a4dM=;
 h=From:To:Subject:Date:In-Reply-To:References:From;
 b=CVvXOZnelL/9dn9XADZN4ZwE+3IFAxS1rph6qTEZDZFN0zQK1LibnqAc0lu7oGv9Y
 XhKwxvGNqZbU9ej+wct/+KZAAr2sOt+3E1C3ycLNjfuW4u5J4FYpu7Q9JVVUGT1cw6
 uXvHZptq+uMJ+A0RPRyFFkpVVfbZHQYGC/c4WISYnWscn2FP3T2A02n7JtweIoTCBQ
 Y1R+a2JWZxXwbhpLJWsrK+d/X5RnqXD9QEI9B/t7rxLOGp73cat1+gnjlP1z8u2RwS
 payaaGRvM9Wu+dvgIZjea8ySWfWFH49nbygQAnf+t67d327ztVfwQjd3uxalv/NnNC
 qllLZ6U2eMGWw==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix,
 from userid 48) id 7B16ACC13AF; Tue, 25 Jan 2022 18:49:22 +0000 (UTC)
From: bugzilla-daemon@bugzilla.kernel.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 201957] amdgpu: ring gfx timeout
Date: Tue, 25 Jan 2022 18:49:20 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Video(DRI - non Intel)
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: blocking
X-Bugzilla-Who: smp@nandre.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-201957-2300-2kgDUEPWsf@https.bugzilla.kernel.org/>
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

--- Comment #60 from Spencer (smp@nandre.com) ---
As an append to both comments, a working boot spits out this:

Loading firmware: amdgpu/navi10_sos.bin
Loading firmware: amdgpu/navi10_asd.bin
Loading firmware: amdgpu/navi10_ta.bin
amdgpu 0000:28:00.0: amdgpu: PSP runtime database doesn't exist
Loading firmware: amdgpu/navi10_smc.bin
Loading firmware: amdgpu/navi10_pfp.bin
Loading firmware: amdgpu/navi10_me.bin
Loading firmware: amdgpu/navi10_ce.bin
Loading firmware: amdgpu/navi10_rlc.bin
Loading firmware: amdgpu/navi10_mec.bin
Loading firmware: amdgpu/navi10_mec2.bin
Loading firmware: amdgpu/navi10_sdma.bin
Loading firmware: amdgpu/navi10_sdma1.bin
Loading firmware: amdgpu/navi10_vcn.bin
amdgpu 0000:28:00.0: amdgpu: Will use PSP to load VCN firmware
amdgpu 0000:28:00.0: amdgpu: RAS: optional ras ta ucode is not available
amdgpu 0000:28:00.0: amdgpu: RAP: optional rap ta ucode is not available
amdgpu 0000:28:00.0: amdgpu: SECUREDISPLAY: securedisplay ta ucode is not
available
amdgpu 0000:28:00.0: amdgpu: use vbios provided pptable
amdgpu 0000:28:00.0: amdgpu: smc_dpm_info table revision(format.content): 4=
.5
amdgpu 0000:28:00.0: amdgpu: SMU is initialized successfully!
kfd kfd: amdgpu: Allocated 3969056 bytes on gart
amdgpu: HMM registered 6128MB device memory
amdgpu: SRAT table not found
amdgpu: Virtual CRAT table created for GPU
amdgpu: Topology: Add dGPU node [0x731f:0x1002]
kfd kfd: amdgpu: added device 1002:731f
amdgpu 0000:28:00.0: amdgpu: SE 2, SH per SE 2, CU per SH 10, active_cu_num=
ber
36
fbcon: amdgpudrmfb (fb0) is primary device

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
