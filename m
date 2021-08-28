Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 5E7103FA70F
	for <lists+dri-devel@lfdr.de>; Sat, 28 Aug 2021 19:49:44 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3DA026EA6A;
	Sat, 28 Aug 2021 17:49:42 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 15C406EA6A
 for <dri-devel@lists.freedesktop.org>; Sat, 28 Aug 2021 17:49:41 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPS id DA1B160E78
 for <dri-devel@lists.freedesktop.org>; Sat, 28 Aug 2021 17:49:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1630172980;
 bh=iavVgPBNGRWzsG0I3KQzKdbo6TvUPGa0j4UBFuMQwvU=;
 h=From:To:Subject:Date:In-Reply-To:References:From;
 b=GVG25/uWslz90Mps+zzEq6Pv3Jb7jl/7B7YgVoeNLEBO959qXWopDZrOkLN4kxpQ7
 G5Db8BL2u1PrXczTvEhWLfC1Vzfn7rPSHe9C+EB9bGCUhmXbns4uKIgmy80p6lukYN
 yM6GwjEgVsydL8bUtx9T5JW8lqgFLEmYSqHL4tn5KjizLzsAHl78dUMm4efAfmUD6s
 FCvlmZGpQ32JB4l+330G/LjDLiITiL2D46PU8JLwfKGA+tuYQMujQK4d0jSks/cnZJ
 pVWWUmN7Yqy6HKw+1RPgSAMoWHN3Y39bnDymKU9tDPieSkeeLTbx3VIB+kHc8tvve/
 VAjMKRyaVG4EA==
Received: by pdx-korg-bugzilla-2.web.codeaurora.org (Postfix, from userid 48)
 id D500E60EE5; Sat, 28 Aug 2021 17:49:40 +0000 (UTC)
From: bugzilla-daemon@bugzilla.kernel.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 214197] [Asus G713QY] RX6800M not usable after exiting Vulkan
 application
Date: Sat, 28 Aug 2021 17:49:40 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
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
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-214197-2300-iio7g84owG@https.bugzilla.kernel.org/>
In-Reply-To: <bug-214197-2300@https.bugzilla.kernel.org/>
References: <bug-214197-2300@https.bugzilla.kernel.org/>
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

--- Comment #4 from velemas@gmail.com ---

(In reply to Alex Deucher from comment #2)
> Does this patch fix the issue?
> https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/
> ?id=3D202ead5a3c589b0594a75cb99f080174f6851fed

Kernel 5.13.13 has this patch already. So apparently it does not fix the
problem.
It occurs with radv, amdvlk, and amdvlk-pro. External monitor is attached v=
ia
HDMI (although it happens without ext. monitor too).

Sometimes dmesg does not contain above mentioned lines but dGPU is still
unusable. Sometimes DXVK delivers VK_ERROR_DEVICE_LOST status even during
runtime.

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
