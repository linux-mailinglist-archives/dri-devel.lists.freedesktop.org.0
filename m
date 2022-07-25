Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C648F580270
	for <lists+dri-devel@lfdr.de>; Mon, 25 Jul 2022 18:07:56 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F3D5BC0BE1;
	Mon, 25 Jul 2022 16:07:51 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 98010C0BE1
 for <dri-devel@lists.freedesktop.org>; Mon, 25 Jul 2022 16:07:50 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 0FFAF612DB
 for <dri-devel@lists.freedesktop.org>; Mon, 25 Jul 2022 16:07:50 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 3270AC36AF2
 for <dri-devel@lists.freedesktop.org>; Mon, 25 Jul 2022 16:07:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1658765268;
 bh=CkfrHFP9+KWsoCnoVHo1C+a/ZyIZfSY4DobozInHFlg=;
 h=From:To:Subject:Date:In-Reply-To:References:From;
 b=rqToYuB0z+1gbKLLAu9BjWgRvxHY2H9re/dKCcGB1va4qU5rHG2p1HU2XtzHc26Vm
 8gOoQOblcSa6zsN67Mg4GHOAbkeceCKV2kugztGZtAHXIC9bi2njgI6HwPaVTH3WvS
 0fqy/1wfNBFbMuxLkIIRt2wz/8YMi2Cqb4Jdq9aoAwZxS9zTlKF56K6mA7n1vmszEW
 /wtKaYek5VG/kUYCmKe80Oy8q8ahILk7Mc7YWcWm/xO7MCoi+UTaZKR/vBdsttbS8g
 NttRgMs7rgI+nor4IN3g15DwAOMU7444eUFK/64Zk10uFYDhWqw5I+E9nk36mQlpo6
 /A8ntBjBHFIkQ==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix,
 from userid 48) id 1D0ECC05FD6; Mon, 25 Jul 2022 16:07:48 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 216277] X11 doesn't wait for amdgpu driver to be up
Date: Mon, 25 Jul 2022 16:07:47 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Video(DRI - non Intel)
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: dark_sylinc@yahoo.com.ar
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-216277-2300-lrw9nHPiv7@https.bugzilla.kernel.org/>
In-Reply-To: <bug-216277-2300@https.bugzilla.kernel.org/>
References: <bug-216277-2300@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D216277

--- Comment #4 from dark_sylinc@yahoo.com.ar ---
Thanks for the hint!

The amdgpu driver (nor the firmware) are definitely NOT in
/boot/initrd.img-5.18.11+

I will have to lookup how to include them into initrd.

Though it may be worth mentioning neither are they included in 5.13 (my cus=
tom
build) nor in Ubuntu's official kernels.

I do wonder if previously was working fine by mere luck (i.e. race condition
was just much harder to trigger) or if something changed that causes whatev=
er
Ubuntu does to wait on amdgpu to no longer wait

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
