Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 9EB4D7B4361
	for <lists+dri-devel@lfdr.de>; Sat, 30 Sep 2023 21:47:25 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 20AF210E17F;
	Sat, 30 Sep 2023 19:47:20 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2824210E17F
 for <dri-devel@lists.freedesktop.org>; Sat, 30 Sep 2023 19:47:18 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 6C30460B47
 for <dri-devel@lists.freedesktop.org>; Sat, 30 Sep 2023 19:47:17 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 3CADFC433C7
 for <dri-devel@lists.freedesktop.org>; Sat, 30 Sep 2023 19:47:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1696103237;
 bh=M4PvkWY4f6U9nu5V6VPgv+UODNxiYiChcxW7Rw9e4NA=;
 h=From:To:Subject:Date:In-Reply-To:References:From;
 b=eZaomYADUY2eqriu5k5WGV2OZKPvlLHHDd8bSIsTanmSpqfCmK4GRrczlO/65ZUyy
 e59Ej4r1srCaSvCIU8VDM49wOC//vGVldcNpJm62KmI8ltYg3hflTKVxULuBHx8AFq
 j4kRXkpLy2O0ocZz4/TbqcSuBCnLkHI+TQZSvgFBazlkuLneSD2XU/1ZVL+O3NpnRr
 abYohx/uS4x7CdxSQVeAvSbAY5sorY916coIjo2UsZttfNLu5TDtFrKVKaVEvV06fM
 FFSubzxtWRDbyLq7SSDOF98sdCyFGVSYYCVbDH3ZXas9jniDRnUYLJiWHT9HLqcK3/
 UWQlYVk22xW4g==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix,
 from userid 48) id 10C30C53BC6; Sat, 30 Sep 2023 19:47:17 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 201957] amdgpu: ring gfx timeout
Date: Sat, 30 Sep 2023 19:47:13 +0000
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
Message-ID: <bug-201957-2300-6qE36JuW5L@https.bugzilla.kernel.org/>
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

--- Comment #96 from KC (kcohar@gmail.com) ---
The default is now -1.
https://unix.stackexchange.com/questions/756281/kernel-6-5-2-seems-to-have-=
amdgpu-crash-on-no-retry-page-fault
https://www.kernel.org/doc/html/v6.5/gpu/amdgpu/module-parameters.html

I set it to zero and I haven't had a single crash since (Fedora 39 beta,
Linux 6.5.5).
This one parameter change made my system entirely unusable (it would crash
very quickly after booting).


On Sat, Sep 30, 2023 at 9:35=E2=80=AFPM <bugzilla-daemon@kernel.org> wrote:

> https://bugzilla.kernel.org/show_bug.cgi?id=3D201957
>
> --- Comment #95 from aspicer@gmail.com ---
> (In reply to KC from comment #94)
>
> Did you have it set to 1 previously? If not, I'm not sure if that was the
> silver bullet, because it looks like it defaults to 0.
> https://dri.freedesktop.org/docs/drm/gpu/amdgpu.html
>
> mcbp (int)
>
> It is used to enable mid command buffer preemption. (0 =3D disabled
> (default), 1
> =3D enabled)
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
