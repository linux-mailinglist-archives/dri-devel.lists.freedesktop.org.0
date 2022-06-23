Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 8EB7455775A
	for <lists+dri-devel@lfdr.de>; Thu, 23 Jun 2022 12:04:20 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5E1F610ED49;
	Thu, 23 Jun 2022 10:04:17 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 61F2D10ED49
 for <dri-devel@lists.freedesktop.org>; Thu, 23 Jun 2022 10:04:16 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id ABB6F61E29
 for <dri-devel@lists.freedesktop.org>; Thu, 23 Jun 2022 10:04:13 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 20B03C385A2
 for <dri-devel@lists.freedesktop.org>; Thu, 23 Jun 2022 10:04:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1655978653;
 bh=p+EudBSIp4Bw20P5zuVNhMjGL/qv8H7uxGnAwfUvhTU=;
 h=From:To:Subject:Date:In-Reply-To:References:From;
 b=Jk4AIsv6YXZREQT26QlKauQNP3nIe5ML6S0bJGdW1sK7LpV1Uqmcocw5AAdQEHexs
 iYQH2a8ajPZZKgfZFU19IfgcW+uU19PGMo7Tk1EdEct5Rd7PVZCOrRtmjhQaptCGbK
 SFG7LDr7PacpLs1kuRpB96sgghxkt179hy3WTr8B0zRyHUUXuvuin6tv9qziZ7iFK1
 aY9jQZimhZDwULC24NRwHg7KF0KqQ+mzCpAJZWLHZ8AQPylspjNWbFqn2xE14UMc53
 U0yD8vvEp+1TW1zoG+z5CP7AFHmUI9SAmkiPFSyP8pbhZCcAYBlt6xpbgnSmV637sB
 YNozBvHJ/xOUQ==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix,
 from userid 48) id 00F34C05FF5; Thu, 23 Jun 2022 10:04:12 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 201957] amdgpu: ring gfx timeout
Date: Thu, 23 Jun 2022 10:04:04 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Video(DRI - non Intel)
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: blocking
X-Bugzilla-Who: s48gs.w@gmail.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-201957-2300-EKBl5z0i3A@https.bugzilla.kernel.org/>
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

--- Comment #75 from Danil (s48gs.w@gmail.com) ---
> Did you try with the latest Linux Kernel? I had a lot of gpu lockups like
> this. Also try these kernel parameters : "amdgpu.ppfeaturemask=3D0xffffbf=
fb=20
> amdgpu.noretry=3D0 amdgpu.lockup_timeout=3D0 amdgpu.gpu_recovery=3D1
> amdgpu.audio=3D0 amdgpu.deep_color=3D1 amd_iommu=3Don iommu=3Dpt"" ( you =
might also
> try with amdgpu.ppfeaturemask=3D0xfffd7fff or amdgpu.ppfeaturemask=3D0xff=
ffffff )

I tried.

my kernel:
"Linux 5.17.4-1-default #1 SMP PREEMPT Wed Apr 20 07:43:03 UTC 2022 (75e996=
1)
x86_64 x86_64 x86_64 GNU/Linux"

(this video linked above - were not able to freeze integrated AMD GPU for m=
e, I
mean before I tested with no kernel parameters)

Result is surprising - no crash/freeze for 4+ hours already, I did launch l=
ots
of apps that were reason of freeze for me before.=20

As I described above - https://bugzilla.kernel.org/show_bug.cgi?id=3D201957=
#c68
for me this freeze happening only when I used OpenGL/Vulkan and video on
background(everything on integrated GPU), and how it was looking from user
experience - when bug triggered(randomly) everything just slowly become low=
er
and lower FPS, apps that was working on 60fps on fullscreen drop to 5 FPS, =
and
video also drop to 5-10fps (UI still was responsible)... and freeze in next=
 few
mins/seconds.

Full kernel boot option now: "splash=3Dsilent quiet
amdgpu.ppfeaturemask=3D0xffffbffb amdgpu.noretry=3D0 amdgpu.lockup_timeout=
=3D0
amdgpu.gpu_recovery=3D1 amdgpu.audio=3D0 amdgpu.deep_color=3D1 amd_iommu=3D=
on iommu=3Dpt
"

Now, after boot with these options, I see:

Just after boot everything working (OpenGL/Vulkan acceleration by integrated
GPU) with expected performance.

After trying to "trigger bug" (opening multiple OpenGL apps with Vulkan and
WebGL and playing many videos) - OpenGL and Vulkan drops FPS to 20(constant=
 for
single triangle in fullscreen), WebGL2 does not work anymore in webbrowser(=
even
after browser restart), but Video - still playing with 60 fps with no lag, =
and
system UI also does not lag.

So GPU graphics acceleration just drop to very low performance mode look li=
ke,
but everything else works fine. (also launching graphic apps(native only) u=
sing
Nvidia GPU works with 60fps as expected).

Interesting - since FPS droped 20 I can no longer launch "anything" in Wine
(any version include Proton) (after boot it was working), I launched few ap=
ps
after boot and check them when GPU FPS drops wine always crash with:
"wine: Unhandled page fault on execute access to 00007F894E200460 at address
00007F894E200460 (thread 0070), starting debugger..."
(not being able to use Wine is a big disadvantage)

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
