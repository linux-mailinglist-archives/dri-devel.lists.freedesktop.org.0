Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CAA0D4D73AB
	for <lists+dri-devel@lfdr.de>; Sun, 13 Mar 2022 09:08:58 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BBA8F10E176;
	Sun, 13 Mar 2022 08:08:53 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from ams.source.kernel.org (ams.source.kernel.org
 [IPv6:2604:1380:4601:e00::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A5DCE10E176
 for <dri-devel@lists.freedesktop.org>; Sun, 13 Mar 2022 08:08:52 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 56B62B80123
 for <dri-devel@lists.freedesktop.org>; Sun, 13 Mar 2022 08:08:49 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 90982C340F8
 for <dri-devel@lists.freedesktop.org>; Sun, 13 Mar 2022 08:08:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1647158927;
 bh=9SMTTuycN8cpJCFo3n+LpJxMzcUgX3bn8vNB1/sebGk=;
 h=From:To:Subject:Date:In-Reply-To:References:From;
 b=LM4Py1r5OWBJNWOyyhv4RzGY2Y+eCbgfMaaqCrarLizbtEyuReYCeBGzim0v432XE
 t0n52k1EDC6R+T7ZcqnRk10KLDe38ldRAvKv12sjU9cN5nqbu2aeM5Ryi30j8NEjF0
 BkgWaotNaMhLg+SOFIsN2F7e1/abOtuNE7J0AjWdFYMjQKHy2Go4w2uOVSnYwQ0N50
 ZNHM830aGnp4065o6cgRk79F0AD8pXoiO72GoR9hYIUUXPYEc4X/MUBS20fxjiaqGV
 Bu+pN3xxzOVu/GaNqVtUXQ8qKIEyl7L5UqJayPIRblM19TXlMQDF/bQVCAXR35upfw
 ypHUhhhSGW1Xg==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix,
 from userid 48) id 7D3E9C05FD2; Sun, 13 Mar 2022 08:08:47 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 211807] [drm:drm_dp_mst_dpcd_read] *ERROR* mstb
 000000004e6288dd port 3: DPCD read on addr 0x60 for 1 bytes NAKed
Date: Sun, 13 Mar 2022 08:08:47 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Video(DRI - non Intel)
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: low
X-Bugzilla-Who: song.fc@gmail.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: cc
Message-ID: <bug-211807-2300-2gqTbVdDcv@https.bugzilla.kernel.org/>
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

notsyncing (song.fc@gmail.com) changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
                 CC|                            |song.fc@gmail.com

--- Comment #20 from notsyncing (song.fc@gmail.com) ---
I also have this on my laptop, using a USB-C to 3xHDMI adapter with 3 monit=
ors.
When I unplug and replug it, sometimes the screen will freeze and I have to
force reboot.

log shows:

i915 0000:00:02.0: [drm] *ERROR* mstb 00000000c152fe9e port 1: DPCD read on
addr 0x4b0 for 1 bytes NAKed
i915 0000:00:02.0: [drm] *ERROR* mstb 00000000c152fe9e port 2: DPCD read on
addr 0x4b0 for 1 bytes NAKed

The machine also dies when resuming from suspend with the adapter plugged i=
n,
but I could not get any log, just guessing it might be the same issue.

my setup:

HP Envy 13 ad110tu (i5-8250U, UHD 620)
Archlinux with kernel 5.16.13-arch1-1 x86_64, KDE Plasma 5.24.3 on Wayland

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
