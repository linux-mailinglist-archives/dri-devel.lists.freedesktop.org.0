Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A491A551820
	for <lists+dri-devel@lfdr.de>; Mon, 20 Jun 2022 14:03:22 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 50F9E10FB1F;
	Mon, 20 Jun 2022 12:03:19 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 93D5A10FB1F
 for <dri-devel@lists.freedesktop.org>; Mon, 20 Jun 2022 12:03:18 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id AD46F61414
 for <dri-devel@lists.freedesktop.org>; Mon, 20 Jun 2022 12:03:17 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 3F17AC341D9
 for <dri-devel@lists.freedesktop.org>; Mon, 20 Jun 2022 12:03:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1655726597;
 bh=lGQ/V9v81hqQqIliaTvr87zkoIZjz/lI51F0D39aSO8=;
 h=From:To:Subject:Date:In-Reply-To:References:From;
 b=eAn6VRgBYHGYXJsWOA8+kExP4dQDafUu2YA18bXjBcBV7YZZIMsTRGBsOaPmlYWrb
 npQwAjQAzdCtaGLDp1i95bgmvtqhtbSjLI9hJvbkbwqXJfWREYC0QIg+4JDfVvoFPq
 fflIhl7i8D4iurgas0SiGM78lBcN9RldImQtK3lAyjoRYm/QdGWpH9lSQTDODoiWGq
 KwFTrAtlVuX/mEwchrOc8XtasI/xqJ2wRFlWDMgx69XvMbu5hsgNX/l7UqxrXK3DlF
 rqAm17rjs4yw81UAPDM1YvNzABIcb7L4s3EcOcoXbucT6CUOrX8tVccgbyJ1LBOOUc
 BHVdU0TpHC9lw==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix,
 from userid 48) id 2F1D2C05FD5; Mon, 20 Jun 2022 12:03:17 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 201957] amdgpu: ring gfx timeout
Date: Mon, 20 Jun 2022 12:03:14 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Video(DRI - non Intel)
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: blocking
X-Bugzilla-Who: martin.von.wittich@iserv.eu
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-201957-2300-GuHz01Tomb@https.bugzilla.kernel.org/>
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

--- Comment #72 from Martin von Wittich (martin.von.wittich@iserv.eu) ---
I can confirm that adding "amdgpu.dpm=3D0" to the kernel command line seems=
 to
resolve this issue - I enabled that option on 2022-06-12 13:24, and my syst=
em
didn't crash at all on 2022-06-12 - 2022-06-14 (I was on vacation from
2022-06-15 on and didn't use my computer from then on).

I don't use Linux for gaming and therefore can't comment how badly this aff=
ects
gaming performance, but I did notice mpv could no longer play 1080p x264 vi=
deo
without stuttering when it defaults to --vo=3Dgpu. Using another --vo like =
sdl
seems to be a viable workaround.

> Did you try with the latest Linux Kernel? I had a lot of gpu lockups like=
 this. Also try these kernel parameters : "amdgpu.ppfeaturemask=3D0xffffbff=
b  amdgpu.noretry=3D0 amdgpu.lockup_timeout=3D0 amdgpu.gpu_recovery=3D1 amd=
gpu.audio=3D0 amdgpu.deep_color=3D1 amd_iommu=3Don iommu=3Dpt"" ( you might=
 also try with amdgpu.ppfeaturemask=3D0xfffd7fff or amdgpu.ppfeaturemask=3D=
0xffffffff )

I'll try these next.

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
