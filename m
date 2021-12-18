Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B1450479A4E
	for <lists+dri-devel@lfdr.de>; Sat, 18 Dec 2021 11:28:51 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0321011210F;
	Sat, 18 Dec 2021 10:28:49 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from ams.source.kernel.org (ams.source.kernel.org
 [IPv6:2604:1380:4601:e00::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9F2B611210C
 for <dri-devel@lists.freedesktop.org>; Sat, 18 Dec 2021 10:28:47 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 4A5B4B80781
 for <dri-devel@lists.freedesktop.org>; Sat, 18 Dec 2021 10:28:46 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 1DCB2C36AE9
 for <dri-devel@lists.freedesktop.org>; Sat, 18 Dec 2021 10:28:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1639823325;
 bh=sYNNOUYdHLTdOJOyp7uR9ndr0x4XqkAN3QYQKVafGEc=;
 h=From:To:Subject:Date:In-Reply-To:References:From;
 b=JMyFjZ76c+9f/c1g1LfwGynGaoklaLHH21viuU7xWkJhklQ8i2+xGKhGZYZhDJgq7
 fFjWrRdcxeAFyBb0s6p56Q4BFkbRlyiMKbqomVdco+V6N91PIwJyD5C2+UP9fjWOvv
 zTyIeil26Zi9PJh8/57VBQrVjCHTCLx/4omaWvx61B5zGiJRNBBr98tl3mdDZqzbaE
 idBMN+GX0pKI4/2XIt8KWA+cuyUJVYr43d7CFsl+4jbLF4Z5ynQhZJ5TwyIihr27Ze
 iHeE7z3lj+RfVXLwdNPei6DuQl4AQXavksYDOmfpK+TqajKjdaNTtHuojXCdfISLmI
 UddUiyaM/n19Q==
Received: by pdx-korg-bugzilla-2.web.codeaurora.org (Postfix, from userid 48)
 id 0304D60F5B; Sat, 18 Dec 2021 10:28:45 +0000 (UTC)
From: bugzilla-daemon@bugzilla.kernel.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 211425] [drm:atom_op_jump] *ERROR* atombios stuck in loop for
 more than 20secs aborting
Date: Sat, 18 Dec 2021 10:28:44 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Video(DRI - non Intel)
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: blocking
X-Bugzilla-Who: icedragon.aw@web.de
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: cf_kernel_version
Message-ID: <bug-211425-2300-IyVpCSIHIT@https.bugzilla.kernel.org/>
In-Reply-To: <bug-211425-2300@https.bugzilla.kernel.org/>
References: <bug-211425-2300@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D211425

Andreas (icedragon.aw@web.de) changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
     Kernel Version|5.15.5                      |5.15.10

--- Comment #24 from Andreas (icedragon.aw@web.de) ---
In general the blocking bug still occurs until/with the current mainline ke=
rnel
version 5.15.10. With kernel 5.15.10 I could observe additionally some new
warnings messages before the "BUG: workqueue ..." errors (like last message)
starting:

[drm] Fence fallback timer expired on ring gfx
[drm] Fence fallback timer expired on ring gfx
BUG: workqueue lockup - pool cpus=3D7 node=3D0 flags=3D0x0 nice=3D-20 stuck=
 for 47s!
Showing busy workqueues and worker pools:
...

BUT I found a new hardware-patch solution! In my case the monitor accepts o=
nly
over the DP-to-DP link connection 4K@60Hz. Over a HDMI-to-HDMI (same comput=
er
and monitor) I got only the 4K@30Hz (not a cable limitation, it is a monitor
limit). But if I connect both cables at the same time, means DP-to-DP 4K@60=
Hz,
and in addition a HDMI-to-HDMI cable (but this screen connection disabled f=
rom
the desktop session control manager) - I could avoid the black screen
completely (without any limitations and stable over reboots)!!!

-> In this double cable configuration (HDMI disabled) the screen (DP
connection) always recovers after some seconds (no hung up and no 2x20sec
delay) - I was not able to trigger the error behaviour any more and I could
also not observe any of the above error messages.

-> But with this stable double cable configuration I observe some new warni=
ng
messages (more than one times):
[drm] Unknown EDID CEA parser results
...

Maybe this helps a little bit for progress ... If someone like, I could make
more tests ...

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
