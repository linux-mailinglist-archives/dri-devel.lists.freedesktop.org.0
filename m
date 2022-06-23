Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 467A3558B26
	for <lists+dri-devel@lfdr.de>; Fri, 24 Jun 2022 00:13:05 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AB03310E289;
	Thu, 23 Jun 2022 22:13:00 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C294B10E289
 for <dri-devel@lists.freedesktop.org>; Thu, 23 Jun 2022 22:12:59 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id D920D61F11
 for <dri-devel@lists.freedesktop.org>; Thu, 23 Jun 2022 22:12:58 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id BBB9CC341EE
 for <dri-devel@lists.freedesktop.org>; Thu, 23 Jun 2022 22:12:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1656022377;
 bh=W9njP0eWjQ6W7LT+K7wnQ8RJXm9JTPDlDgZm24wOkvM=;
 h=From:To:Subject:Date:In-Reply-To:References:From;
 b=oL29uw2FDUtV6YqqT+7j3Tau3rhsKItix9SB2R19+yOR4mJoqmK4VEoSj+z+Ekdso
 sxpsohUoqvuKbUXTaMpGlIcOmT4adFzhdUghQ57OC1Lw4kZrbNLulJxVLWd2JbmjJX
 EHol82qpj1kvh37hxHSciqVOnNV9qFXJOn6qNqg3YR+NBMwu3h0AayGYjK4iDUMQSI
 XdJWxhvHoeKCbFAXwj/ZJ0U7LP0K0PyMQ5ZDhYRRVc+cftQsTTaU5pGECQ5YHWSMxA
 stQvai1V1sI5Ilhy9PCPHlliVGYi9civByvwVTk2gfwCGf2ul+gXoEjLl/fmB/t6OR
 dUYpRaJhLEo5Q==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix,
 from userid 48) id ACBC6C05FD5; Thu, 23 Jun 2022 22:12:57 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 201957] amdgpu: ring gfx timeout
Date: Thu, 23 Jun 2022 22:12:55 +0000
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
Message-ID: <bug-201957-2300-fSe6m0N2ZZ@https.bugzilla.kernel.org/>
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

--- Comment #79 from Danil (s48gs.w@gmail.com) ---
Updated to kernel 5.18.4-1-default #1 SMP PREEMPT_DYNAMIC Wed Jun 15 06:00:=
33
UTC 2022 (ed6345d) x86_64 x86_64 x86_64 GNU/Linux (OpenSuSe latest for now)

Seems my integrated AMD GPU freeze completely fixed even without using prev=
ious
boot option (in 5.17 it was freezing without boot option), also integrated =
GPU
does not go to "low performance mode forever"(like it was with boot option
before) it continues working for hours on max performance(I mean it works
without slowdown like before)

... but now Nvidia GPU does not work anymore from AMD (when integrated is m=
ain
GPU), Nvidia 515.48.07 driver(latest now), in X11 and Wayland, Nvidia driver
correctly installed and device visible (nvidia-smi works and vulkaninfo
--summary list Nvidia GPU correctly), on creating Vulkan surface on Nvidia
device application always crash (any application)... (just tested - disabli=
ng
AMD integrated and boot using Nvidia - everything works there, Vulkan etc)

So fixing integrated AMD GPU result in Nvidia does not work anymore... okey=
 (im
back to use discrete Nvidia only again)

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
