Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D5DB03F9838
	for <lists+dri-devel@lfdr.de>; Fri, 27 Aug 2021 12:44:41 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BF9FA6E91C;
	Fri, 27 Aug 2021 10:44:36 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1FDE16E91C
 for <dri-devel@lists.freedesktop.org>; Fri, 27 Aug 2021 10:44:36 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPS id CED6C60FE7
 for <dri-devel@lists.freedesktop.org>; Fri, 27 Aug 2021 10:44:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1630061075;
 bh=OhWaJfmetirYyXBUDktGSz7HnjJCIN4kFOpsRrVnJU0=;
 h=From:To:Subject:Date:From;
 b=JMgLuuQRqkjy4A+AFTMQGAOUFHY7JzWMu9r/JMsc5lIahwKjqjO1rBIF5NvFNVXK8
 5KbVB+LOt6G9cfjEW6hlxoALpRPWJML4K9zHMnWXROb3N5mhlvoFh4svA67XoKz8M5
 buH3BFdKzsd37EJk3URoBA8CG9Yt0z98bgdkjfQ9VVg5Rz/4xf0RFHMHrhbdWeHiBH
 Pd5sVw5FsfkBffYmTdV+4CpTtJeEApaq2vJy5wkbIH052OFISGKfMm2DWNNL+OE47c
 G+j8022hLng8sYa3tuyUaY2bhTqyZNF807sM+zeDtHLoWSKXvFwqvOk5OWjDdPLZLK
 L2WwvMUzaZPVQ==
Received: by pdx-korg-bugzilla-2.web.codeaurora.org (Postfix, from userid 48)
 id C13C760EBC; Fri, 27 Aug 2021 10:44:35 +0000 (UTC)
From: bugzilla-daemon@bugzilla.kernel.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 214197] New: [Asus G713QY] RX6800M not usable after exiting
 Vulkan application
Date: Fri, 27 Aug 2021 10:44:35 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: new
X-Bugzilla-Watch-Reason: AssignedTo drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Video(DRI - non Intel)
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: velemas@gmail.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: bug_id short_desc product version
 cf_kernel_version rep_platform op_sys cf_tree bug_status bug_severity
 priority component assigned_to reporter cf_regression
Message-ID: <bug-214197-2300@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D214197

            Bug ID: 214197
           Summary: [Asus G713QY] RX6800M not usable after exiting Vulkan
                    application
           Product: Drivers
           Version: 2.5
    Kernel Version: 5.13.13
          Hardware: x86-64
                OS: Linux
              Tree: Mainline
            Status: NEW
          Severity: normal
          Priority: P1
         Component: Video(DRI - non Intel)
          Assignee: drivers_video-dri@kernel-bugs.osdl.org
          Reporter: velemas@gmail.com
        Regression: No

Asus ROG Strix G17 Advantage Edition (G713QY) has hybrid-graphics with dGPU
RX6800M. After exiting any Vulkan application, it becomes unusable. Vulkani=
nfo
sees dGPU before Vulkan app and does not see RX6800M after.

After Vulkan app close, dmesg reports:

[  154.385749] amdgpu 0000:03:00.0: amdgpu: RAS: optional ras ta ucode is n=
ot
available
[  154.401405] amdgpu 0000:03:00.0: amdgpu: SECUREDISPLAY: securedisplay ta
ucode is not available
[  154.401409] amdgpu 0000:03:00.0: amdgpu: SMU is resuming...
[  159.038150] amdgpu 0000:03:00.0: amdgpu: message:        RunDcBtc (54)=
=20=20=20=20=20=20
param: 0x00000000 is timeout (no response)
[  159.038154] amdgpu 0000:03:00.0: amdgpu: Failed to setup smc hw!
[  159.038156] [drm:amdgpu_device_ip_resume_phase2 [amdgpu]] *ERROR* resume=
 of
IP block <smu> failed -62
[  159.038220] amdgpu 0000:03:00.0: amdgpu: amdgpu_device_ip_resume failed
(-62).

Using amdgpu.runpm=3D0 parameter fixes the issue.

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
