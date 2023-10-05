Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9B4BB7B9AEA
	for <lists+dri-devel@lfdr.de>; Thu,  5 Oct 2023 07:28:42 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3381F10E1B8;
	Thu,  5 Oct 2023 05:28:39 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 92FBB10E1B8
 for <dri-devel@lists.freedesktop.org>; Thu,  5 Oct 2023 05:28:37 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 97FF161843
 for <dri-devel@lists.freedesktop.org>; Thu,  5 Oct 2023 05:28:36 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 4C09BC4339A
 for <dri-devel@lists.freedesktop.org>; Thu,  5 Oct 2023 05:28:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1696483716;
 bh=uy2I1Lrj+hUYxJN3eA30wrRt4jW+CsaKThvD76VrslE=;
 h=From:To:Subject:Date:In-Reply-To:References:From;
 b=jr9zeKTwOvnsb+Sn48noT4KoKWeZhnwxfPI39MNi45S4byIwBE6ccS03yOGj9L7nk
 FDiL9dYvI8aAKLJHsfryM9mFPEvf+LzNz+uY9UanVVXQa+Kxbb0pWUV2++nK6VdoUa
 EcKlQoJa+AJ6rC7x6Rr/BNWvWdyyQmGq76ghkpXElakbaBmmGRoXJDjiNnfQWDQV91
 bzyISjK0nHA5Ypm01xrI2SO8AbaP2cF+ikwm1xaOoobmZISlKOaf7dvpySR8Z2kDLe
 IXYfrS5S/7ikSASIyQlsaHWhVhjTJoP1TS7V/UPxkH6Ii/Y1YOgsteWTBQL7LMtMlL
 ATSwSM23Q5rXQ==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix,
 from userid 48) id 37561C53BD5; Thu,  5 Oct 2023 05:28:36 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 213917] Screen starts flickering when laptop(amdgpu) wakes up
 after suspend.
Date: Thu, 05 Oct 2023 05:28:35 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Video(DRI - non Intel)
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: kernel@mail.niknah.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: cc
Message-ID: <bug-213917-2300-PVJPTvlefj@https.bugzilla.kernel.org/>
In-Reply-To: <bug-213917-2300@https.bugzilla.kernel.org/>
References: <bug-213917-2300@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D213917

kernel@mail.niknah.com changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
                 CC|                            |kernel@mail.niknah.com

--- Comment #3 from kernel@mail.niknah.com ---
When I change the resolution or come back from suspend it flickers with ran=
dom
dots.  https://youtu.be/9hXqSQjU080

It works again when I either switch the mode back to the old resolution or
press ctrl-alt-f8 & alt-f2

It's only a problem on the laptop eDP display, external usb-c display is ok.

In kernel 6.5.5, it goes away when I press ctrl-alt-f8 & alt-f2 or when I
switch the mode back.

In kernel 6.5.1, I couldn't fix it with ctrl-alt-f8 & alt-f2, it only goes =
away
when I switch back to the previous mode.

AMD Ryzen 7 4800U with Radeon Graphics

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
