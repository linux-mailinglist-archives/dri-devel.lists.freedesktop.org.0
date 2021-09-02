Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 157233FEA6F
	for <lists+dri-devel@lfdr.de>; Thu,  2 Sep 2021 10:10:46 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 19A066E487;
	Thu,  2 Sep 2021 08:10:41 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 470A86E487
 for <dri-devel@lists.freedesktop.org>; Thu,  2 Sep 2021 08:10:40 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPS id 0BCAD60F6C
 for <dri-devel@lists.freedesktop.org>; Thu,  2 Sep 2021 08:10:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1630570240;
 bh=aEggHXp6qbmDXwwtDZy8qa1McsH9cy4kF0dgrMQo2YU=;
 h=From:To:Subject:Date:In-Reply-To:References:From;
 b=OcCzLapsR6r6tW/1D/dcy+kIyl5F843+mhPo2aaSkuadLr4korAmQo1mX+JACQeXD
 jdeJNGIyZV0hpqDYp/mylkD/5vVyJYAyulbsNCdB1TEHtVQyW5+UTNNWb0t6mxejh/
 /Whd/zlMDmkrtjfasIxSwO3bJjnBZb/x+eso4BC/isx7BgApvOVtrT78Y8fPcF0+xP
 hwwlqCvtpMK7eOS9DfkEJCCTbL0GD9K+TEM0NbRAJprblrPBwm6KONlolLWQJmnjbp
 gEUKGqhxfZxN/3nXA4Amy4errfHLQiwXnNSl3YRpXMImz3PtIjv4hPFY5naV3ZIduO
 igNCHM+UqKSKQ==
Received: by pdx-korg-bugzilla-2.web.codeaurora.org (Postfix, from userid 48)
 id F260F61002; Thu,  2 Sep 2021 08:10:39 +0000 (UTC)
From: bugzilla-daemon@bugzilla.kernel.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 212655] AMDGPU crashes when resuming from suspend when
 amd_iommu=on
Date: Thu, 02 Sep 2021 08:10:39 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Video(DRI - non Intel)
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: high
X-Bugzilla-Who: kostas.kardaras@gmail.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: cc
Message-ID: <bug-212655-2300-nGKQHr71Y1@https.bugzilla.kernel.org/>
In-Reply-To: <bug-212655-2300@https.bugzilla.kernel.org/>
References: <bug-212655-2300@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D212655

coxackie (kostas.kardaras@gmail.com) changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
                 CC|                            |kostas.kardaras@gmail.com

--- Comment #1 from coxackie (kostas.kardaras@gmail.com) ---
I have the same problem on Alienware Aurora R10 - AMD Radeon RX 5700 GPU. A=
rch
linux, Now at kernel 5.13. I have not "turned on iommu AMDGPU", but there i=
s a
crash all the same. The monitor does not get any signal, so cannot turn on
after suspend.


logs:

```
amdgpu 0000:0d:00.0: amdgpu: message:          RunBtc (58)         param:
0x00000000 is timeout (no response)
amdgpu 0000:0d:00.0: amdgpu: RunBtc failed!
amdgpu 0000:0d:00.0: amdgpu: Failed to setup smc hw!
[drm:amdgpu_device_ip_resume_phase2 [amdgpu]] *ERROR* resume of IP block <s=
mu>
failed -62
amdgpu 0000:0d:00.0: amdgpu: amdgpu_device_ip_resume failed (-62).
PM: dpm_run_callback(): pci_pm_resume+0x0/0xe0 returns -62
amdgpu 0000:0d:00.0: PM: failed to resume async: error -62
amdgpu: Move buffer fallback to memcpy unavailable
[drm:amdgpu_cs_ioctl [amdgpu]] *ERROR* Failed to process the buffer list -1=
9!
```

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
