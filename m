Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 65563621BD0
	for <lists+dri-devel@lfdr.de>; Tue,  8 Nov 2022 19:23:44 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BCFA910E4E4;
	Tue,  8 Nov 2022 18:23:38 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 698A610E4E4
 for <dri-devel@lists.freedesktop.org>; Tue,  8 Nov 2022 18:23:32 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id D3AF3B81BD6
 for <dri-devel@lists.freedesktop.org>; Tue,  8 Nov 2022 18:23:30 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 7AB58C433D7
 for <dri-devel@lists.freedesktop.org>; Tue,  8 Nov 2022 18:23:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1667931809;
 bh=Aq4P/k3pEGWe/nBDVjFPjm7Gh6lc9ixd7LmyoZiflbM=;
 h=From:To:Subject:Date:In-Reply-To:References:From;
 b=QumoFJtv+DWXDbNHZLxAOuVhNdpD0WiQcCuhEtnW4ah8xqB+uMGQXCDZFO93QivjW
 opBnDbg4J7RrZXx8h3iL/gSYvHXM9R5Si6Kl4uZtv0/LNJ5TeNwS7kYhHj2OL9Ulng
 KXzh7LNIxN55DPuWie1ZbKxstwaFHqGBQU7clhFk5qn4o1QYpUyPjFtda4QThxrIL/
 /RQH293JKgrE+sIcmW36PXWcmowa/+Vy+wiq8alS+UKw7UfOB7FQhfrD25BKZYyQY2
 4/8fGaWQJ3R/qiVAEH0R0ithRiERy7iK8E+XdJc4y4kDyetwJGJVV2/hrD4bxnOxdn
 llv3cmXyfQx8w==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix,
 from userid 48) id 663BDC433E4; Tue,  8 Nov 2022 18:23:29 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 203033] nouveau hung task
Date: Tue, 08 Nov 2022 18:23:28 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Video(DRI - non Intel)
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: murph@clurictec.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: cc
Message-ID: <bug-203033-2300-WuA150pj3w@https.bugzilla.kernel.org/>
In-Reply-To: <bug-203033-2300@https.bugzilla.kernel.org/>
References: <bug-203033-2300@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D203033

Murph (murph@clurictec.com) changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
                 CC|                            |murph@clurictec.com

--- Comment #6 from Murph (murph@clurictec.com) ---
Having a similar issue here. GUI locks up but system is still running in the
background (meetings can still see and hear me, I can hear them). Can't swi=
tch
to different tty, have to hard reset.

=CE=BB ~/ lspci | grep VGA
01:00.0 VGA compatible controller: NVIDIA Corporation TU117M [GeForce GTX 1=
650
Mobile / Max-Q] (rev a1)

=CE=BB ~/ uname -a
Linux murph-icl-gen2 5.15.74 #1-NixOS SMP Sat Oct 15 05:59:05 UTC 2022 x86_=
64
GNU/Linux

Nov 08 09:19:38 murph-icl-gen2 kernel: task:kworker/u32:42  state:D stack: =
   0
pid:66054 ppid:     2 flags:0x00004000
Nov 08 09:19:38 murph-icl-gen2 kernel: Workqueue: events_unbound
nv50_disp_atomic_commit_work [nouveau]
Nov 08 09:19:38 murph-icl-gen2 kernel: Call Trace:
Nov 08 09:19:38 murph-icl-gen2 kernel:  <TASK>
Nov 08 09:19:38 murph-icl-gen2 kernel:  __schedule+0x2e1/0x1350
Nov 08 09:19:38 murph-icl-gen2 kernel:  ? nvkm_event_get+0x70/0x90 [nouveau]
Nov 08 09:19:38 murph-icl-gen2 kernel:  ? nvkm_client_notify_get+0x23/0x40
[nouveau]
Nov 08 09:19:38 murph-icl-gen2 kernel:  schedule+0x5b/0xd0
Nov 08 09:19:38 murph-icl-gen2 kernel:  schedule_timeout+0x104/0x140
Nov 08 09:19:38 murph-icl-gen2 kernel:  ?
nouveau_fence_enable_signaling+0x2a/0x70 [nouveau]
Nov 08 09:19:38 murph-icl-gen2 kernel:  dma_fence_default_wait+0x1a8/0x240
Nov 08 09:19:38 murph-icl-gen2 kernel:  ? dma_fence_free+0x20/0x20
Nov 08 09:19:38 murph-icl-gen2 kernel:  dma_fence_wait_timeout+0xb6/0xd0
Nov 08 09:19:38 murph-icl-gen2 kernel:=20
drm_atomic_helper_wait_for_fences+0x82/0xe0 [drm_kms_helper]
Nov 08 09:19:38 murph-icl-gen2 kernel:  nv50_disp_atomic_commit_tail+0x90/0=
x850
[nouveau]
Nov 08 09:19:38 murph-icl-gen2 kernel:  process_one_work+0x1ee/0x390
Nov 08 09:19:38 murph-icl-gen2 kernel:  worker_thread+0x53/0x3e0
Nov 08 09:19:38 murph-icl-gen2 kernel:  ? process_one_work+0x390/0x390
Nov 08 09:19:38 murph-icl-gen2 kernel:  kthread+0x124/0x150
Nov 08 09:19:38 murph-icl-gen2 kernel:  ? set_kthread_struct+0x50/0x50
Nov 08 09:19:38 murph-icl-gen2 kernel:  ret_from_fork+0x1f/0x30
Nov 08 09:19:38 murph-icl-gen2 kernel:  </TASK>

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
