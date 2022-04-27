Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 52222510EB4
	for <lists+dri-devel@lfdr.de>; Wed, 27 Apr 2022 04:23:52 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3776E10EB7A;
	Wed, 27 Apr 2022 02:23:49 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sin.source.kernel.org (sin.source.kernel.org [145.40.73.55])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8B92810EB87
 for <dri-devel@lists.freedesktop.org>; Wed, 27 Apr 2022 02:23:47 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by sin.source.kernel.org (Postfix) with ESMTPS id 12D40CE2289
 for <dri-devel@lists.freedesktop.org>; Wed, 27 Apr 2022 02:23:45 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 5CD50C385AD
 for <dri-devel@lists.freedesktop.org>; Wed, 27 Apr 2022 02:23:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1651026223;
 bh=895imvyrTert8i8n6YOoTUAfopYVZ8ZPL639KEGVzTM=;
 h=From:To:Subject:Date:From;
 b=M1AOykMvpXnK9sEU+luumQKeZDGTb2x+S6MO7tcJBuQr63g1QXTlwtfoLufQsuSae
 et4KssiqzNzxGWVG5vCuq+FyXIp69u/9JX2c6XF8FpRRt5QdFos5WALr4DN8QUAV9E
 2KvADmhVqZqEcT37T4FiJP3r2P+x1MpNOY5YNB8eQWYvSf3d8tJZnjSRKFtMUJNmLE
 48FkR4r8xpuy6f63Vp7EobSq4sMBMk51qsd6LcbkkLy2FA7HQBZMlDCz3EVe8VNjW+
 pJK+YoAdeFLj4G/66W1TQW+FBTKz1XFCj+ZUsGoenYv2X4C/o8ZVFsH1E3/j0qYE/9
 dR3dBjVHGZcjw==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix,
 from userid 48) id 3F78AC05FD2; Wed, 27 Apr 2022 02:23:43 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 215892] New: 6500XT [drm:amdgpu_dm_init.isra.0.cold [amdgpu]]
 *ERROR* Failed to register vline0 irq 30!
Date: Wed, 27 Apr 2022 02:23:42 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: new
X-Bugzilla-Watch-Reason: AssignedTo drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Video(DRI - non Intel)
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: ulatec@gmail.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: bug_id short_desc product version
 cf_kernel_version rep_platform op_sys cf_tree bug_status bug_severity
 priority component assigned_to reporter cf_regression attachments.created
Message-ID: <bug-215892-2300@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D215892

            Bug ID: 215892
           Summary: 6500XT [drm:amdgpu_dm_init.isra.0.cold [amdgpu]]
                    *ERROR* Failed to register vline0 irq 30!
           Product: Drivers
           Version: 2.5
    Kernel Version: 5.18-rc4
          Hardware: All
                OS: Linux
              Tree: Mainline
            Status: NEW
          Severity: normal
          Priority: P1
         Component: Video(DRI - non Intel)
          Assignee: drivers_video-dri@kernel-bugs.osdl.org
          Reporter: ulatec@gmail.com
        Regression: No

Created attachment 300811
  --> https://bugzilla.kernel.org/attachment.cgi?id=3D300811&action=3Dedit
New PowerColor board with chip that produces kernel errors

Hello!

This is my first time submitted a bug here. I apologize if I make any mista=
kes
here, but I am going to do my best to describe the efforts that I have gone
through to attempt to resolve this issue on my own. As well, I hope not to
overload with information, but just wish to help with skipping over the bas=
ic
questions.

I have numerous PowerColor RX 6500XT graphics cards, and all of them with a
specific chip package (picture attached) have the same issue. Any PowerColo=
r RX
6500XT with 2152 printed at the top of the package, and "TFTB43.00" at the
bottom of the package suffers the same kernel errors. Previously (up until a
few weeks ago) PowerColor was shipping 6500XT boards with chips that were
stamped with 2146 and "TFAW62.T5" at the top and bottom of the package
respectively. Boards with those chips have zero kernel errors and work
flawlessly. As well, I have tested various 6500XT and 6400 boards from
different AIB partners of AMD and have not had any issues other than this
specific variant from PowerColor.


To be honest, I am not sure if the root of the problem is in pcieport or in
amdgpu, but the amdgpu error throws first.=20

I have attached the full dmesg output but to save some time here are some
highlighted lines of issue:

[    5.506718] [drm:amdgpu_dm_init.isra.0.cold [amdgpu]] *ERROR* Failed to
register vline0 irq 30!
[   14.368915] pcieport 0000:01:00.0: can't change power state from D0 to D=
3hot
(config space inaccessible)
[   15.270778] pcieport 0000:01:00.0: can't change power state from D3cold =
to
D0 (config space inaccessible)
[   15.270799] pcieport 0000:02:00.0: can't change power state from D3cold =
to
D0 (config space inaccessible)
[   25.478689] pcieport 0000:01:00.0: can't change power state from D3cold =
to
D0 (config space inaccessible)
[   25.478696] pcieport 0000:02:00.0: can't change power state from D3cold =
to
D0 (config space inaccessible)
[   25.722619] amdgpu 0000:03:00.0: can't change power state from D3cold to=
 D0
(config space inaccessible)
[   35.833714] [drm:gmc_v10_0_flush_vm_hub.constprop.0 [amdgpu]] *ERROR*
Timeout waiting for VM flush hub: 0!
[   35.941450] [drm:gmc_v10_0_flush_vm_hub.constprop.0 [amdgpu]] *ERROR*
Timeout waiting for sem acquire in VM flush!
[   36.048999] [drm:gmc_v10_0_flush_vm_hub.constprop.0 [amdgpu]] *ERROR*
Timeout waiting for VM flush hub: 1!
[   36.156835] [drm:gmc_v10_0_flush_vm_hub.constprop.0 [amdgpu]] *ERROR*
Timeout waiting for sem acquire in VM flush!
[   36.264770] [drm:gmc_v10_0_flush_vm_hub.constprop.0 [amdgpu]] *ERROR*
Timeout waiting for VM flush hub: 1!
[   36.372616] [drm:gmc_v10_0_flush_vm_hub.constprop.0 [amdgpu]] *ERROR*
Timeout waiting for VM flush hub: 0!


What I have attempted so far:

Results were the same for the following kernels: 5.4.190, 5.10.111, 5.15.34,
5.17.4 and now 5.18-rc4.

Many different motherboards with varying chipsets (B250, H510, X370, B550).
Same result.

Enabling/Disabling clock gating, ASPM, extended synch control for PCIE. Same
result.

The problematic cards from PowerColor indeed do work in Windows without iss=
ue.
This leads me to believe that something may have changed with TUL's
implementation of the 6500XT from one production run to another. Hopefully
someone from the amdgpu team can help here.


To summarize, PowerColor's prior 6500XT production worked flawlessly with t=
he
drivers in the mainline kernel. New production for some reason is no longer
usable. New cards work in Windows, but now throw the errors above. Not an
isolated issue of one card, as I have tested 12 identical ones with the same
chip and all have the same result regardless of motherboard, cpu, power,
kernel, OS, etc. Cards (6500XT and 6400s) from other partners have not had =
any
issues.

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
