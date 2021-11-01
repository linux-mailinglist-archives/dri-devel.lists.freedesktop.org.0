Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 2CA65441769
	for <lists+dri-devel@lfdr.de>; Mon,  1 Nov 2021 10:34:00 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 013838992E;
	Mon,  1 Nov 2021 09:33:58 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id ED5118992E
 for <dri-devel@lists.freedesktop.org>; Mon,  1 Nov 2021 09:33:56 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPS id C9E0F610FC
 for <dri-devel@lists.freedesktop.org>; Mon,  1 Nov 2021 09:33:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1635759236;
 bh=Q5Azbo/aROi8PRHb3Oet4VuzpCibteqAiI8TJanKuXQ=;
 h=From:To:Subject:Date:In-Reply-To:References:From;
 b=HWRM/SQDg5HVnd/uo1Vnh6nzlS45KTeBZDH/g1JAlopjPFcAHgrzzIagt3VLV4OlW
 qhWq8iI55aIl4o+altlVJw78ShbcY5ZEyAtOFiCMcfMGo72I0ncfe/juCuBSNxSCHx
 YDwGYsxNlHXjK0tksyBDjTUADp3GAyZu2PSLETfkhtbAnRBWMVUqp6FEaMnvy9K1yP
 s6lCRlNJY2Zo66z9Sn2ztl/P388JQuIVLPwPWiB+V4Sxz+LziD9kh0Jw50DzwBy3aN
 7a2gamjm9YDiBml6wT5MqpNMDJQk58Qp5ajjxZXsNDD2jPVJK792DkjBIjhasAW+E9
 V9Lxw3/c6ieGA==
Received: by pdx-korg-bugzilla-2.web.codeaurora.org (Postfix, from userid 48)
 id C352A60FC0; Mon,  1 Nov 2021 09:33:56 +0000 (UTC)
From: bugzilla-daemon@bugzilla.kernel.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 214901] amdgpu freezes HP laptop at start up
Date: Mon, 01 Nov 2021 09:33:56 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Video(DRI - non Intel)
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: spasswolf@web.de
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-214901-2300-Rh6hSJ0TDh@https.bugzilla.kernel.org/>
In-Reply-To: <bug-214901-2300@https.bugzilla.kernel.org/>
References: <bug-214901-2300@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D214901

--- Comment #3 from spasswolf@web.de ---
Actually the above message is not complete:
Nov  1 00:22:49 bart kernel: [    2.136382] kfd kfd: amdgpu: Allocated 3969=
056
bytes on gart
Nov  1 00:22:49 bart kernel: [    2.136462] kfd kfd: amdgpu: error getting
iommu info. is the iommu enabled?
Nov  1 00:22:49 bart kernel: [    2.136470] kfd kfd: amdgpu: Error initiali=
zing
iommuv2
Nov  1 00:22:49 bart kernel: [    2.137386] kfd kfd: amdgpu: device 1002:98=
74
NOT added due to errors
Nov  1 00:22:49 bart kernel: [    2.137393] kfd kfd: amdgpu: Failed to resu=
me
IOMMU for device 1002:9874
Nov  1 00:22:49 bart kernel: [    2.137397] amdgpu 0000:00:01.0: amdgpu:
amdgpu_device_ip_init failed
Nov  1 00:22:49 bart kernel: [    2.137402] amdgpu 0000:00:01.0: amdgpu: Fa=
tal
error during GPU init
Nov  1 00:22:49 bart kernel: [    2.137406] amdgpu 0000:00:01.0: amdgpu:
amdgpu: finishing device.
Nov  1 00:22:49 bart kernel: [    2.139639] BUG: kernel NULL pointer
dereference, address: 00000000000001db
The messages from kfd have been there with older kernels, too, but were not
fatal. They are caused by the HP Laptop 15-bw0xx/8332, not having a iommu or
its BIOS not properly initializing it.
But linux-5.15 has added the following lines to the amdgpu_device_ip_init:=
=20
        r =3D amdgpu_amdkfd_resume_iommu(adev);
        if (r)
                goto init_failed;
which make causes the amdgpu_device_ip_init function to fail when kfd init
fails. As a workaround one could remove these.
A BIOS update could perhaps also solve the problem but seems to require a
Windows running on the Laptop (which was actually sold without Windows)

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
