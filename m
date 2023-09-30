Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 422F07B432F
	for <lists+dri-devel@lfdr.de>; Sat, 30 Sep 2023 21:08:37 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 63FB210E17C;
	Sat, 30 Sep 2023 19:08:31 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8FF8F10E17C
 for <dri-devel@lists.freedesktop.org>; Sat, 30 Sep 2023 19:08:30 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id D13E860B4D
 for <dri-devel@lists.freedesktop.org>; Sat, 30 Sep 2023 19:08:29 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 9EB59C433C7
 for <dri-devel@lists.freedesktop.org>; Sat, 30 Sep 2023 19:08:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1696100909;
 bh=im7M6AXA9CuGRKdgb1NKTnHn9b8efoh6OQhxO5cJW3o=;
 h=From:To:Subject:Date:In-Reply-To:References:From;
 b=Eqfl5yMIZYUvKKBdhfrpQNYeze3KA7cO1Rtdz3ygPl6zLBVBDLENRl437jXSbQhes
 TURfxBad4NvFX47iGygInEuMaY9PAwG34vUJbf3acfuLOVIsUDlOdRyE12ChzniY3x
 P7azT9AHPIW5pccpKXqnb7iBz359uJuQHBeAH9g2boYezMarWJd+s48P0ymXIFxu+Q
 QVgxF71uWooBRQ83srqVJjCDcUhsZH6tClnXP9ySoDciaeKzApgKk1r0v0Ma1l6skU
 crMgXQ5137slcWEQ0WW6fv2BCDCdGD+tK51GFfdbl8/t+WDAJIX41gkZleJljL7e9t
 018BnXh90+IVA==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix,
 from userid 48) id 86F9BC53BD3; Sat, 30 Sep 2023 19:08:29 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 201957] amdgpu: ring gfx timeout
Date: Sat, 30 Sep 2023 19:08:21 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Video(DRI - non Intel)
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: blocking
X-Bugzilla-Who: kcohar@gmail.com
X-Bugzilla-Status: RESOLVED
X-Bugzilla-Resolution: ANSWERED
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-201957-2300-lXMN9nVo5W@https.bugzilla.kernel.org/>
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

--- Comment #94 from KC (kcohar@gmail.com) ---
In my case the fix was adding amdgpu.mcbp=3D0 to the kernel parameters.

On Sat, Sep 30, 2023 at 8:57=E2=80=AFPM <bugzilla-daemon@kernel.org> wrote:

> https://bugzilla.kernel.org/show_bug.cgi?id=3D201957
>
> aspicer@gmail.com changed:
>
>            What    |Removed                     |Added
>
> -------------------------------------------------------------------------=
---
>                  CC|                            |aspicer@gmail.com
>
> --- Comment #93 from aspicer@gmail.com ---
> I have also been having this issue. It started occurring recently (last 2=
-3
> months). No other changes.
>
> Mostly lockups while gaming (yuzu), one lockup because of chrome.
>
> I was able to fix this issue by switching from HDMI to DP or DVI.
>
> --
> You may reply to this email to add a comment.
>
> You are receiving this mail because:
> You are on the CC list for the bug.

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
