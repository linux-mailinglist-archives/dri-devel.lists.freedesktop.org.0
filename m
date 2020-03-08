Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id DFC1F17D395
	for <lists+dri-devel@lfdr.de>; Sun,  8 Mar 2020 12:16:35 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 559B86E290;
	Sun,  8 Mar 2020 11:16:31 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AA7466E293
 for <dri-devel@lists.freedesktop.org>; Sun,  8 Mar 2020 11:16:29 +0000 (UTC)
From: bugzilla-daemon@bugzilla.kernel.org
Authentication-Results: mail.kernel.org;
 dkim=permerror (bad message/signature format)
To: dri-devel@lists.freedesktop.org
Subject: [Bug 206781] GM104 (GeForce 840m) with many errors "fifo:
 SCHED_ERROR 20"
Date: Sun, 08 Mar 2020 11:16:29 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Video(DRI - non Intel)
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: high
X-Bugzilla-Who: gsedej@gmail.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-206781-2300-Yy2xeHHRAn@https.bugzilla.kernel.org/>
In-Reply-To: <bug-206781-2300@https.bugzilla.kernel.org/>
References: <bug-206781-2300@https.bugzilla.kernel.org/>
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

https://bugzilla.kernel.org/show_bug.cgi?id=206781

--- Comment #2 from gsedej@gmail.com ---
In the first step:
what can be done that other users would not have to deal with
"nouveau.noaccel=1" or other kernel options just to use the system (assuming no
need for 3D from dedicated card)
I was also told it's issue with system (ubuntu's) logg-er or something?
For me - I am using Ubuntu 16.04 with nvidia blob on this laptop. But when
trying different ubuntu versions, I always get this spamming in system logs.
(the laptop is HP ENVY 15-j192nf - K4D07EAR#ABF)


For the actual bug - how can this issue be further diagnosed? 
I found similar issues:
https://bugzilla.kernel.org/show_bug.cgi?id=101911
https://gitlab.freedesktop.org/xorg/driver/xf86-video-nouveau/issues/175
https://gitlab.freedesktop.org/xorg/driver/xf86-video-nouveau/issues/352
https://bbs.archlinux.org/viewtopic.php?id=231444

-- 
You are receiving this mail because:
You are watching the assignee of the bug.
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
