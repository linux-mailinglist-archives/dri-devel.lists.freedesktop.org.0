Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 204F97D24FA
	for <lists+dri-devel@lfdr.de>; Sun, 22 Oct 2023 19:35:59 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6AA6A10E062;
	Sun, 22 Oct 2023 17:35:53 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BD7B410E062
 for <dri-devel@lists.freedesktop.org>; Sun, 22 Oct 2023 17:35:51 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id A7952615CF
 for <dri-devel@lists.freedesktop.org>; Sun, 22 Oct 2023 17:35:50 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 7819DC43397
 for <dri-devel@lists.freedesktop.org>; Sun, 22 Oct 2023 17:35:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1697996150;
 bh=NcOqEgw2TM6B0A7lasn7hrQEOSgE/ExZ1VnLOARdoS0=;
 h=From:To:Subject:Date:In-Reply-To:References:From;
 b=dqstT+Ujkzw9ruMIWPq23BfmtH645pbXsP6ms7cfNQlWbH5/hiSorwwh5tPgdsp6y
 ScAuM7FRvY0obkAaOb2QaFxayhLqoEzY/MTHNvHx4DK//COkkDTopShDJJa5q2egSr
 8/lx342nP5SaxK0zVif4KsBfyev0mXxGEatimanPzDlnK1c4WVnWCWHX0NErOb0FOc
 eY+xlBX/P8xhq0ERins7fJqviVWYyKjwLi1Wx4b7/csfwx1qgeAfmVgNzspuL1AYzx
 YU/4srGhCaHwYB6hPwPMsA4TuWArJG33f7ftO6MpOOgQHE2yPIHpuDDiavdHA6qX8O
 2ttUQBfw+ZIFg==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix,
 from userid 48) id 683BCC53BD2; Sun, 22 Oct 2023 17:35:50 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 201957] amdgpu: ring gfx timeout
Date: Sun, 22 Oct 2023 17:35:47 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Video(DRI - non Intel)
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: blocking
X-Bugzilla-Who: jer@jerdboyd.com
X-Bugzilla-Status: RESOLVED
X-Bugzilla-Resolution: ANSWERED
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-201957-2300-JPxcw2HpPV@https.bugzilla.kernel.org/>
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

--- Comment #98 from jeremy boyd (jer@jerdboyd.com) ---
(In reply to jeremy boyd from comment #97)
> Hello, I'm having this same issue with my thinkpad z16 laptop, Ryzen 6850H
> and Radeon RX 6500M graphics card.
>=20
> I do not use the laptop for gaming but for audio and video editing. I have
> not had trouble with any video editing software but I can easily reproduce
> the issue by loading up Ardour or Mixbus32C and either leaving it alone or
> working. After 15 minutes the screen freezes although audio will continue
> for a time. At this point Ardour or Mixbus will close and I can continue
> using the machine. If I load up either program again it will fail again,
> usually within a couple minutes and the whole laptop will freeze up until=
 I
> ctrl-alt-F2 to get to a terminal prompt.
>=20
> The issue always happens when Im recording audio with an HDMI device
> attached and 90% of the time without HDMI
>=20
> I will attempt to set this kernel parameter amdgpu.mcbp=3D0 and report ba=
ck.

I can confirm that this did not solve my problem. I tested my system out for
several hours with no issue and thought that perhaps it had been solved but
while doing a libreoffice presentation with my audio software running it
happened again. here is the error from journalctl

Oct 22 09:40:01 fedora kernel: [drm:amdgpu_job_timedout [amdgpu]] *ERROR* r=
ing
gfx_0.0.0 timeout, signaled seq=3D433823, emitted seq=3D433825
Oct 22 09:40:01 fedora kernel: [drm:amdgpu_job_timedout [amdgpu]] *ERROR*
Process information: process Xorg pid 2189 thread Xorg:cs0 pid 2319
Oct 22 09:40:01 fedora kernel: amdgpu 0000:67:00.0: amdgpu: GPU reset begin!
Oct 22 09:40:02 fedora kernel: amdgpu 0000:67:00.0: amdgpu: MODE2 reset
Oct 22 09:40:02 fedora kernel: amdgpu 0000:67:00.0: amdgpu: GPU reset
succeeded, trying to resume

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
