Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 65B9BA5A3F2
	for <lists+dri-devel@lfdr.de>; Mon, 10 Mar 2025 20:42:58 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D47FA10E4CF;
	Mon, 10 Mar 2025 19:42:54 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="s2Zc7oI4";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3F98210E4CF
 for <dri-devel@lists.freedesktop.org>; Mon, 10 Mar 2025 19:42:49 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id A1C205C41F9
 for <dri-devel@lists.freedesktop.org>; Mon, 10 Mar 2025 19:40:27 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 18B5AC4CEEC
 for <dri-devel@lists.freedesktop.org>; Mon, 10 Mar 2025 19:42:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1741635764;
 bh=Fz5yncv7yqfp+qMxsFV2ZBol3awVK59AbfbG6UN5FOQ=;
 h=From:To:Subject:Date:In-Reply-To:References:From;
 b=s2Zc7oI4uZAWF7DElJPeagxftq48fMW9P5JHoBpS+8/gkl/tCo1p6a2CmLwASLt2H
 jxdbyXvX1BqOqMcISuAkmEertzj7/dZ1/kyyRWqNM9B3LPZirtUtcPVYeNgyztIofO
 3gNtm816H94fpbEJUOcy4xGFfbW8Qn/kY1ULIN4eya2XhGo8Q9cAq+yJYA6S4Aw7DY
 SOQyfwZmJo8eZTYKEciVdDQgD2awVzRzzzO5TeRSq6Tp8KZ6V+Dg9iaZWV92SdCWvk
 QK0ELusGdcmj++C5Oy4hW+53SckYfiRGZOKM3kW2AL+/mlYZymvcVeN5TuG/NTkLqt
 5D5fgv1tE2D3w==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix,
 from userid 48) id 09827C53BBF; Mon, 10 Mar 2025 19:42:44 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 219507] nouveau: GeForce GT 710: irq 166 handler
 nvkm_intr+0x0/0x1b3 [nouveau] enabled interrupts
Date: Mon, 10 Mar 2025 19:42:43 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Video(DRI - non Intel)
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: high
X-Bugzilla-Who: linux-kernel@jmbreuer.net
X-Bugzilla-Status: RESOLVED
X-Bugzilla-Resolution: ANSWERED
X-Bugzilla-Priority: P3
X-Bugzilla-Assigned-To: drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: cc
Message-ID: <bug-219507-2300-0JCg1mF8Vn@https.bugzilla.kernel.org/>
In-Reply-To: <bug-219507-2300@https.bugzilla.kernel.org/>
References: <bug-219507-2300@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D219507

Joe Breuer (linux-kernel@jmbreuer.net) changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
                 CC|                            |linux-kernel@jmbreuer.net

--- Comment #6 from Joe Breuer (linux-kernel@jmbreuer.net) ---
I get a very similar thing with kernel 6.13.5, and an (OK, it's ancient) nV=
idia
GeForce 8600 GT (G84):

irq 25 handler nvkm_intr+0x0/0x210 enabled interrupts
WARNING: CPU: 1 PID: 1355 at kernel/irq/handle.c:161 __handle_irq_event_per=
cpu
(kernel/irq/handle.c:161 (discriminator 1))=20
...

I also have some other diagnostics from nouveau in dmesg - 5 copies of this,
about 12 seconds before the kernel WARNING:
nouveau 0000:01:00.0: fifo: DMA_PUSHER - ch 3 [sddm-greeter-qt[1199]] get
0000216004 put 0000216088 ib_get 00000007 ib_put 00000008 state 800081a4 (e=
rr:
INVALID_CMD) push 00406040

I'll try the workaround suggested above; and take any findings on to the li=
nked
freedesktop issue.

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
