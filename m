Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2276D4D7758
	for <lists+dri-devel@lfdr.de>; Sun, 13 Mar 2022 18:46:22 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0B46E10E341;
	Sun, 13 Mar 2022 17:46:20 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 71C3E10E332
 for <dri-devel@lists.freedesktop.org>; Sun, 13 Mar 2022 17:46:18 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 9B05161245
 for <dri-devel@lists.freedesktop.org>; Sun, 13 Mar 2022 17:46:17 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 07693C340FF
 for <dri-devel@lists.freedesktop.org>; Sun, 13 Mar 2022 17:46:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1647193576;
 bh=TjE4DTKF6yDc0ctVNFljLeNQjNprGiqPsllw2SkVKbA=;
 h=From:To:Subject:Date:In-Reply-To:References:From;
 b=DoNNOHkWGSGFoUouDyjulm2/pn2s9LvCdPUNbkZf7JbB3uSYA1XoGSPssH6r4taTL
 /VHGi+RaVai1Cq/tc1PXVXL6VJIBZLNiZZdRs6Q6uWdq7e0zsN7NBldMoF4FemXMq7
 FHdXmNDkW1i/0hc4cvNvDKyEI4UhL9x9p+Vk+YX3ZK21qU7/ve6DZt2/ceF2tP/QuN
 iAPQeYB6U9VLfzxeKLqk1N3Cb46B5jFLZFEB5Cxho9za4tZwk+mDLsqyMoboqsd0RT
 rUqHbw9bnr7NGeTdp4FPodF0+fb1rxtyFCy9Iu1/gpJntkqJ+vvDEm67QYBywXYB+7
 vKfZZ1NAWC/GQ==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix,
 from userid 48) id E8D7BC05FF5; Sun, 13 Mar 2022 17:46:15 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 205089] amdgpu : drm:amdgpu_cs_ioctl : Failed to initialize
 parser -125
Date: Sun, 13 Mar 2022 17:46:15 +0000
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
X-Bugzilla-Changed-Fields: cc
Message-ID: <bug-205089-2300-wO1uKnuZ0D@https.bugzilla.kernel.org/>
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

Christine Lemmer-Webber (cwebber@dustycloud.org) changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
                 CC|                            |cwebber@dustycloud.org

--- Comment #34 from Christine Lemmer-Webber (cwebber@dustycloud.org) ---
Hello,

I'm running a mostly stock upstream Linux kernel, 5.16.11 on Guix (using the
nonguix channel to get the upstream kernel).

  05:00.0 VGA compatible controller: Advanced Micro Devices, Inc. [AMD/ATI]
Device 164c (rev c1)
model name      : AMD Ryzen 7 5700U with Radeon Graphics

I've been hitting the same error ("[drm:amdgpu_cs_ioctl [amdgpu]] *ERROR*
Failed to initialize parser -125!" as posted in the top of this thread) and=
 it
can take out my whole desktop if using an accelerated compositor like Gnome
Shell.  Here's how to reproduce:

 - Open Blender 3.0
 - click the "New File -> 2D Animation" option from the splash screen
 - if it doesn't crash the first time, try it a few more times

Sometimes the desktop recovers, but often not.  If press ctrl-alt-f1 I see =
that
error being spit out repeatedly at the STTY.

If I'm running XFCE, it seems like similar issues happen in Blender in that=
 it
stutters, etc, but it seems to make the screen go black for a second, then =
it's
able to recover.

Here's another way to trigger it: try opening a fresh scene and going to vi=
ew
-> viewpoint -> camera.  Similarly, you might have to try this a few times.=
=20
Strangely, the issue may be even worse: even on XFCE, Blender can't general=
ly
recover in a usable way, I have to restart it.

Would love to see this fixed!  If I should open a new bug instead, let me k=
now.

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
