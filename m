Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 62B1B45FEDC
	for <lists+dri-devel@lfdr.de>; Sat, 27 Nov 2021 14:34:20 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6CC5E6E049;
	Sat, 27 Nov 2021 13:34:17 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8DF146E049
 for <dri-devel@lists.freedesktop.org>; Sat, 27 Nov 2021 13:34:15 +0000 (UTC)
Received: from mail.kernel.org (unknown [198.145.29.99])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 9AA81B817AC
 for <dri-devel@lists.freedesktop.org>; Sat, 27 Nov 2021 13:34:13 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPS id 3ABCB604E9
 for <dri-devel@lists.freedesktop.org>; Sat, 27 Nov 2021 13:34:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1638020052;
 bh=XUN3KE+w6meibE5vI5+RK2PKwagD0W1xACqOu3eKSbo=;
 h=From:To:Subject:Date:In-Reply-To:References:From;
 b=TvIRmRzgmuZS8ImmrwJFElhLYRpyRY0NcTWzbS/wZ0TGl/psNjwx6r50rvF4TdkML
 /iy65yhmMp1aO6qkoP/O0DP1PUbaNllxY7Wgt/P5zdX6PIbC/ex+SbCAyRe/6X7JGJ
 49aNPKNI0OYk4tgU3p5+gH0Aaq9p2xjGRy5M0uJP++jI5YuBATpqNW2pI3t7jmCduF
 5vNC9eEuGlYprXOShsqWaS2I5Sf9Ikt+BwL1Vo89GEJKh0OyfD8GPZ1P2Hu3oxcHsH
 opNLjymQwsUZA2UEMMtRfmQq/qE7wkncIlvd1LEX1AJaohlMJMxSDEq95lU0/ToQeY
 1zcWLjNjWSW2Q==
Received: by pdx-korg-bugzilla-2.web.codeaurora.org (Postfix, from userid 48)
 id 369AE610C9; Sat, 27 Nov 2021 13:34:12 +0000 (UTC)
From: bugzilla-daemon@bugzilla.kernel.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 211425] [drm:atom_op_jump] *ERROR* atombios stuck in loop for
 more than 20secs aborting
Date: Sat, 27 Nov 2021 13:34:11 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Video(DRI - non Intel)
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: blocking
X-Bugzilla-Who: icedragon.aw@web.de
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: cf_kernel_version bug_severity
Message-ID: <bug-211425-2300-wn6Udhb1Cj@https.bugzilla.kernel.org/>
In-Reply-To: <bug-211425-2300@https.bugzilla.kernel.org/>
References: <bug-211425-2300@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D211425

Andreas (icedragon.aw@web.de) changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
     Kernel Version|5.15                        |5.15.5
           Severity|normal                      |blocking

--- Comment #23 from Andreas (icedragon.aw@web.de) ---
I tried a lot different configurations:

A) A different cable DP-to-DP instead DP-to-miniDP (both 4k and 60Hz capabl=
e):
makes no difference

B) The issue can still be triggered and it recovers after 2x20 seconds with=
 the
error message above until at least 5.15.2!

C) Beginning from kernel 5.15.3 it can be still triggered, BUT it did not
recover any more until reboot! Also the Error message are changed to:

[147325.153678] BUG: workqueue lockup - pool cpus=3D7 node=3D0 flags=3D0x0 =
nice=3D-20
stuck for 32s!
[147325.153694] Showing busy workqueues and worker pools:
[147325.153697] workqueue events: flags=3D0x0
[147325.153700]   pwq 30: cpus=3D15 node=3D0 flags=3D0x0 nice=3D0 active=3D=
1/256 refcnt=3D2
[147325.153706]     in-flight: 127037:dbs_work_handler
[147325.153735] workqueue events_highpri: flags=3D0x10
[147325.153740]   pwq 15: cpus=3D7 node=3D0 flags=3D0x0 nice=3D-20 active=
=3D2/256
refcnt=3D3
[147325.153745]     in-flight: 477:dm_irq_work_func
[147325.153749]     pending: dm_irq_work_func
[147325.153851] pool 15: cpus=3D7 node=3D0 flags=3D0x0 nice=3D-20 hung=3D32=
s workers=3D2
idle: 59
[147325.153856] pool 30: cpus=3D15 node=3D0 flags=3D0x0 nice=3D0 hung=3D0s =
workers=3D2
idle: 110635

D) from 5.15.4 to 5.15.5 it still occurs and hangs until reboot, BUT in
addition I can not find any error message in the kernel log (like above) any
more! Also no error message with activated debug symbols!

Because the occurring can not be controlled, this makes a stable use of ker=
nel
5.15.3 and newer impossible!!!

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
