Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 06B5841068B
	for <lists+dri-devel@lfdr.de>; Sat, 18 Sep 2021 14:56:24 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E0C746E098;
	Sat, 18 Sep 2021 12:56:18 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6ECA26E098
 for <dri-devel@lists.freedesktop.org>; Sat, 18 Sep 2021 12:56:18 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPS id EEC3461355
 for <dri-devel@lists.freedesktop.org>; Sat, 18 Sep 2021 12:56:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1631969778;
 bh=mir/1rqTvFOBLweYo3LEI8oNu8M1ngNzKyl46Qtyz44=;
 h=From:To:Subject:Date:In-Reply-To:References:From;
 b=IiOmtpk1+RSdAOdwIGEhtO1ckaEC8bcgg/CscIrWRtfvta1b214W2smv46HTQnQqm
 XrD1IvPu/+/KyHwIj7Q0rMBJ9o/mZ4JhWXZkLWIPFbtgD0PfXiEuPR7ycFvSbH0Vap
 RZUTLkMgVXPMLl0nAro59omtFUh/T7BZESc0u07H2NCLBsaxtxwCrtwmFLbvJkqqM1
 xg+41SNEsi0eu3HmkrM9JLUVMewHTjK2cjqd6nCG0WNVLwV4e4KIkHX3C7ON/Wlt7i
 OTYm50cTA9uGVqUcWKC4/HPZM9KfhAOa47vwg2dpNvnSp9fWUl7nLjyS4479ObE+rh
 OSXP0ruLXj32Q==
Received: by pdx-korg-bugzilla-2.web.codeaurora.org (Postfix, from userid 48)
 id EAA35610FD; Sat, 18 Sep 2021 12:56:17 +0000 (UTC)
From: bugzilla-daemon@bugzilla.kernel.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 211807] [drm:drm_dp_mst_dpcd_read] *ERROR* mstb
 000000004e6288dd port 3: DPCD read on addr 0x60 for 1 bytes NAKed
Date: Sat, 18 Sep 2021 12:56:17 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Video(DRI - non Intel)
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: low
X-Bugzilla-Who: nils.tonnaett@posteo.de
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-211807-2300-vziYdrH9sx@https.bugzilla.kernel.org/>
In-Reply-To: <bug-211807-2300@https.bugzilla.kernel.org/>
References: <bug-211807-2300@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D211807

--- Comment #10 from Nils Tonn=C3=A4tt (nils.tonnaett@posteo.de) ---
I patched 5.14.5. I see now difference in behavior. When the screen stays b=
lack
it often works to switch to a tty or turn off and on the display. Dmesg see=
ms
to became a little more verbose about this:

[   64.800268] [drm] DM_MST: stopping TM on aconnector: 000000007957d743 [i=
d:
97]
[   64.820206] amdgpu 0000:09:00.0: [drm] Cannot find any crtc or sizes
[   66.970887] [drm] DM_MST: starting TM on aconnector: 000000007957d743 [i=
d:
97]
[   67.173165] amdgpu 0000:09:00.0: [drm] *ERROR* mstb 00000000ca721b5e por=
t 8:
DPCD read on addr 0x60 for 1 bytes NAKed
[   67.176906] [drm] fb mappable at 0x7C00502000
[   67.176907] [drm] vram apper at 0x7C00000000
[   67.176907] [drm] size 33177600
[   67.176908] [drm] fb depth is 24
[   67.176908] [drm]    pitch is 15360
[   67.176965] fbcon: amdgpu (fb0) is primary device
[   67.192813] amdgpu 0000:09:00.0: [drm] *ERROR* mstb 00000000ca721b5e por=
t 8:
DPCD read on addr 0x60 for 1 bytes NAKed
[   67.670123] Console: switching to colour frame buffer device 480x135
[   67.708683] amdgpu 0000:09:00.0: [drm] fb0: amdgpu frame buffer device
[   72.960002] rfkill: input handler disabled
[   73.139379] amdgpu 0000:09:00.0: [drm] *ERROR* mstb 00000000ca721b5e por=
t 8:
DPCD read on addr 0x60 for 1 bytes NAKed
[   80.216335] rfkill: input handler enabled
[   80.534571] amdgpu 0000:09:00.0: [drm] *ERROR* mstb 00000000ca721b5e por=
t 8:
DPCD read on addr 0x60 for 1 bytes NAKed

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
