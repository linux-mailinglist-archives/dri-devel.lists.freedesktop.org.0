Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A83F97D1D75
	for <lists+dri-devel@lfdr.de>; Sat, 21 Oct 2023 16:29:52 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7ADBD10E12C;
	Sat, 21 Oct 2023 14:29:47 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DCFD210E12C
 for <dri-devel@lists.freedesktop.org>; Sat, 21 Oct 2023 14:29:44 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id EC15460FE7
 for <dri-devel@lists.freedesktop.org>; Sat, 21 Oct 2023 14:29:43 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id BA0BAC43395
 for <dri-devel@lists.freedesktop.org>; Sat, 21 Oct 2023 14:29:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1697898583;
 bh=XGP48RhZ0pX6vr+rOQWcaca1uYfYTAX2gxrtnjSFGVE=;
 h=From:To:Subject:Date:In-Reply-To:References:From;
 b=lQoyFfKZGpg1zv+jzOjwWV1c+OD4oOfxgJ9VQZguTKwDOwTWsHlHhqduFKxiC+2+8
 yH+l3rro9EWnul5EGjCFhWNUJwtru7db6EU59RrkHWoUxD3DND7CxoEXmAoo3pP2vj
 zg1PlI1FzRcMka6JK//lx9giZ9nVk04q07NzVGB++SZLPr+w1CcBfkvgh62cVryoAm
 sJHb1Wul6tnuXjaYQiJrRrNvm3VFyQ5JKWzuxOFn0iMhBfoLnWh/HuFnMxpnmU91qr
 e7NCJDqQ9AhmcXydYq7vhQR0AzuUwcSf5SFbzB6uAImsZQTCqVRnSY7EZbkcet658P
 +fj+npxdGu/aw==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix,
 from userid 48) id AA1D0C53BD6; Sat, 21 Oct 2023 14:29:43 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 201957] amdgpu: ring gfx timeout
Date: Sat, 21 Oct 2023 14:29:40 +0000
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
X-Bugzilla-Changed-Fields: cc
Message-ID: <bug-201957-2300-QXeEQcZFV8@https.bugzilla.kernel.org/>
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

jeremy boyd (jer@jerdboyd.com) changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
                 CC|                            |jer@jerdboyd.com

--- Comment #97 from jeremy boyd (jer@jerdboyd.com) ---
Hello, I'm having this same issue with my thinkpad z16 laptop, Ryzen 6850H =
and
Radeon RX 6500M graphics card.

I do not use the laptop for gaming but for audio and video editing. I have =
not
had trouble with any video editing software but I can easily reproduce the
issue by loading up Ardour or Mixbus32C and either leaving it alone or work=
ing.
After 15 minutes the screen freezes although audio will continue for a time=
. At
this point Ardour or Mixbus will close and I can continue using the machine=
. If
I load up either program again it will fail again, usually within a couple
minutes and the whole laptop will freeze up until I ctrl-alt-F2 to get to a
terminal prompt.

The issue always happens when Im recording audio with an HDMI device attach=
ed
and 90% of the time without HDMI

I will attempt to set this kernel parameter amdgpu.mcbp=3D0 and report back.

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
