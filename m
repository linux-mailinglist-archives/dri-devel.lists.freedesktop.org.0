Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2FE078062B7
	for <lists+dri-devel@lfdr.de>; Wed,  6 Dec 2023 00:08:09 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F228C10E63A;
	Tue,  5 Dec 2023 23:08:06 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from ams.source.kernel.org (ams.source.kernel.org
 [IPv6:2604:1380:4601:e00::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 46C9310E63A
 for <dri-devel@lists.freedesktop.org>; Tue,  5 Dec 2023 23:08:04 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by ams.source.kernel.org (Postfix) with ESMTP id D6062B81BC2
 for <dri-devel@lists.freedesktop.org>; Tue,  5 Dec 2023 23:08:02 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 3900CC433C8
 for <dri-devel@lists.freedesktop.org>; Tue,  5 Dec 2023 23:08:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1701817682;
 bh=4Zaex1fW44fv08ZuE1VszhaF6SXrZ3wv6T25bXrb8x8=;
 h=From:To:Subject:Date:In-Reply-To:References:From;
 b=fr/M1RgHFaqHigTsk4bnLSxcgz0wSxHEh1Vv7PxY+qA+gV2mHAchVyemWu2Qfh/Pf
 vutatjREpWPtaRnUXIgnEP0Y+uubWhwFMfsBy1vG1xHvVKzzH3tu31bprceDQXHloW
 d47ac0B/cAHOUJv2eeMQuqDZ0H4bpntrX0OwK5Qp9swk12oLRoPuh3Uj4FmeXPsb+o
 RYl11ChNwi2pJU1RyDYtvD2IfRpI0Ot675sWpoNUYbn41ukhHG8fW7WxhIyFOE5gdL
 32WhcymUpAB3b3gexZocMp9Qoi/3tIE6y5fMsFIz3hMWn9fqKMa+TGM3UpTrTxFhq7
 YzeeIne3enFyA==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix,
 from userid 48) id 2237AC53BD2; Tue,  5 Dec 2023 23:08:02 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 218221] Nouveau GSP fail on command cli:0xc1d0000
Date: Tue, 05 Dec 2023 23:08:01 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Video(DRI - non Intel)
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: airlied@gmail.com
X-Bugzilla-Status: RESOLVED
X-Bugzilla-Resolution: CODE_FIX
X-Bugzilla-Priority: P3
X-Bugzilla-Assigned-To: drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-218221-2300-jmZ6XTgoGM@https.bugzilla.kernel.org/>
In-Reply-To: <bug-218221-2300@https.bugzilla.kernel.org/>
References: <bug-218221-2300@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D218221

--- Comment #5 from airlied@gmail.com ---
Yes I'd file that against mesa, I don't think we are quite there with
zink support yet, trying to push on it a bit.

On Tue, 5 Dec 2023 at 21:42, <bugzilla-daemon@kernel.org> wrote:
>
> https://bugzilla.kernel.org/show_bug.cgi?id=3D218221
>
> --- Comment #3 from marc barbier (mmarc471@gmail.com) ---
> (In reply to airlied from comment #2)
> > Can't remember my bz, but all those errors are fine, I've sent patches
> > to clean them up so we don't report them in dmesg anymore.
> >
> > On Tue, 5 Dec 2023 at 01:12, <bugzilla-daemon@kernel.org> wrote:
> > >
> > > https://bugzilla.kernel.org/show_bug.cgi?id=3D218221
> > >
> > >             Bug ID: 218221
> > >            Summary: Nouveau GSP fail on command cli:0xc1d0000
> > >            Product: Drivers
> > >            Version: 2.5
> > >           Hardware: All
> > >                 OS: Linux
> > >             Status: NEW
> > >           Severity: normal
> > >           Priority: P3
> > >          Component: Video(DRI - non Intel)
> > >           Assignee: drivers_video-dri@kernel-bugs.osdl.org
> > >           Reporter: mmarc471@gmail.com
> > >         Regression: No
> > >
> > > Running Linux 6.7.0-rc3 on Gentoo Linux
> > >
> > > I'm using a 3070(laptop) with the command line argument
> > > nouveau.config=3DNvGspRm=3D1
> > >
> > > I have confirmed that the Gsp firmware in present in my system, and I=
'm
> > > running
> > > mesa 23.3.0
> > >
> > > This should allow the nouveau kernel driver to call the GSP firmware =
for
> > > tasks
> > > such as reclocking.
> > >
> > > As my system is a laptop my main GPU is an integrated radeon gpu so
> > starting
> > > Xorg doesn't require nouveau to work.
> > >
> > > Once X11 is started I can try to launch vulkan applications which cau=
ses
> > the
> > > following errors to appear in the kernel log.
> > >
> > > > dmesg
> > > [   17.007772] nouveau 0000:01:00.0: gsp:msg fn:4123 len:0x24/0x4 res=
:0x0
> > > resp:0x0
> > > [   17.010650] nouveau 0000:01:00.0: gsp:msg fn:4108 len:0x38/0x18
> res:0x0
> > > resp:0x0
> > > [   17.010945] nouveau 0000:01:00.0: gsp:msg fn:4108 len:0x40/0x20
> res:0x0
> > > resp:0x0
> > > [15217.991692] nouveau 0000:01:00.0: gsp: cli:0xc1d00002 obj:0x007300=
00
> > ctrl
> > > cmd:0x00731341 failed: 0x0000ffff
> > > [15217.992913] nouveau 0000:01:00.0: gsp: cli:0xc1d00002 obj:0x007300=
00
> > ctrl
> > > cmd:0x00731341 failed: 0x0000ffff
> > > [15217.994155] nouveau 0000:01:00.0: gsp: cli:0xc1d00002 obj:0x007300=
00
> > ctrl
> > > cmd:0x00731341 failed: 0x0000ffff
> > > [15217.995408] nouveau 0000:01:00.0: gsp: cli:0xc1d00002 obj:0x007300=
00
> > ctrl
> > > cmd:0x00731341 failed: 0x0000ffff
> > > [15217.996738] nouveau 0000:01:00.0: gsp: cli:0xc1d00002 obj:0x007300=
00
> > ctrl
> > > cmd:0x00731341 failed: 0x0000ffff
> > > [15217.997859] nouveau 0000:01:00.0: gsp: cli:0xc1d00002 obj:0x007300=
00
> > ctrl
> > > cmd:0x00731341 failed: 0x0000ffff
> > > [15217.999154] nouveau 0000:01:00.0: gsp: cli:0xc1d00002 obj:0x007300=
00
> > ctrl
> > > cmd:0x00731341 failed: 0x0000ffff
> > > [15218.000392] nouveau 0000:01:00.0: gsp: cli:0xc1d00002 obj:0x007300=
00
> > ctrl
> > > cmd:0x00731341 failed: 0x0000ffff
> > > [15218.001799] nouveau 0000:01:00.0: gsp: cli:0xc1d00002 obj:0x007300=
00
> > ctrl
> > > cmd:0x00731341 failed: 0x0000ffff
> > > [15218.003055] nouveau 0000:01:00.0: gsp: cli:0xc1d00002 obj:0x007300=
00
> > ctrl
> > > cmd:0x00731341 failed: 0x0000ffff
> > > [15218.004271] nouveau 0000:01:00.0: gsp: cli:0xc1d00002 obj:0x007300=
00
> > ctrl
> > > cmd:0x00731341 failed: 0x0000ffff
> > > [15218.005615] nouveau 0000:01:00.0: gsp: cli:0xc1d00002 obj:0x007300=
00
> > ctrl
> > > cmd:0x00731341 failed: 0x0000ffff
> > > [15218.007023] nouveau 0000:01:00.0: gsp: cli:0xc1d00002 obj:0x007300=
00
> > ctrl
> > > cmd:0x00731341 failed: 0x0000ffff
> > > [15218.008281] nouveau 0000:01:00.0: gsp: cli:0xc1d00002 obj:0x007300=
00
> > ctrl
> > > cmd:0x00731341 failed: 0x0000ffff
> > > [15218.009543] nouveau 0000:01:00.0: gsp: cli:0xc1d00002 obj:0x007300=
00
> > ctrl
> > > cmd:0x00731341 failed: 0x0000ffff
> > > [15218.010843] nouveau 0000:01:00.0: gsp: cli:0xc1d00002 obj:0x007300=
00
> > ctrl
> > > cmd:0x00731341 failed: 0x0000ffff
> > > [15218.012054] nouveau 0000:01:00.0: gsp: cli:0xc1d00002 obj:0x007300=
00
> > ctrl
> > > cmd:0x00731341 failed: 0x0000ffff
> > > [15218.013295] nouveau 0000:01:00.0: gsp: cli:0xc1d00002 obj:0x007300=
00
> > ctrl
> > > cmd:0x00731341 failed: 0x0000ffff
> > > [15218.014570] nouveau 0000:01:00.0: gsp: cli:0xc1d00002 obj:0x007300=
00
> > ctrl
> > > cmd:0x00731341 failed: 0x0000ffff
> > > [15218.015841] nouveau 0000:01:00.0: gsp: cli:0xc1d00002 obj:0x007300=
00
> > ctrl
> > > cmd:0x00731341 failed: 0x0000ffff
> > > [15218.017084] nouveau 0000:01:00.0: gsp: cli:0xc1d00002 obj:0x007300=
00
> > ctrl
> > > cmd:0x00731341 failed: 0x0000ffff
> > > [15218.018206] nouveau 0000:01:00.0: gsp: cli:0xc1d00002 obj:0x007300=
00
> > ctrl
> > > cmd:0x00731341 failed: 0x0000ffff
> > > [15218.019532] nouveau 0000:01:00.0: gsp: cli:0xc1d00002 obj:0x007300=
00
> > ctrl
> > > cmd:0x00731341 failed: 0x0000ffff
> > > [15218.020804] nouveau 0000:01:00.0: gsp: cli:0xc1d00002 obj:0x007300=
00
> > ctrl
> > > cmd:0x00731341 failed: 0x0000ffff
> > > [15218.022064] nouveau 0000:01:00.0: gsp: cli:0xc1d00002 obj:0x007300=
00
> > ctrl
> > > cmd:0x00731341 failed: 0x0000ffff
> > > [15218.023324] nouveau 0000:01:00.0: gsp: cli:0xc1d00002 obj:0x007300=
00
> > ctrl
> > > cmd:0x00731341 failed: 0x0000ffff
> > > [15218.024644] nouveau 0000:01:00.0: gsp: cli:0xc1d00002 obj:0x007300=
00
> > ctrl
> > > cmd:0x00731341 failed: 0x0000ffff
> > > [15218.025870] nouveau 0000:01:00.0: gsp: cli:0xc1d00002 obj:0x007300=
00
> > ctrl
> > > cmd:0x00731341 failed: 0x0000ffff
> > > [15218.027143] nouveau 0000:01:00.0: gsp: cli:0xc1d00002 obj:0x007300=
00
> > ctrl
> > > cmd:0x00731341 failed: 0x0000ffff
> > > [15218.028388] nouveau 0000:01:00.0: gsp: cli:0xc1d00002 obj:0x007300=
00
> > ctrl
> > > cmd:0x00731341 failed: 0x0000ffff
> > > [15218.029801] nouveau 0000:01:00.0: gsp: cli:0xc1d00002 obj:0x007300=
00
> > ctrl
> > > cmd:0x00731341 failed: 0x0000ffff
> > > [15218.031055] nouveau 0000:01:00.0: gsp: cli:0xc1d00002 obj:0x007300=
00
> > ctrl
> > > cmd:0x00731341 failed: 0x0000ffff
> > >
> > > Running ZINK also inform me that DRI3 is not available.
> > >
> > > > MESA_LOADER_DRIVER_OVERRIDE=3Dzink glxgears
> > > WARNING: NVK is not a conformant Vulkan implementation, testing use o=
nly.
> > > ac_compute_device_uuid's output is based on invalid pci bus info.
> > > DRI3 not available
> > > failed to load driver: zink
> > > Error: couldn't get an RGB, Double-buffered visual
> > >
> > > --
> > > You may reply to this email to add a comment.
> > >
> > > You are receiving this mail because:
> > > You are watching the assignee of the bug.
>
> So i guess the second issue is purely mesa and has nothing to do with the
> kernel ?
>
> Thank you for taking time to respond.
>
> --
> You may reply to this email to add a comment.
>
> You are receiving this mail because:
> You are watching the assignee of the bug.

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
