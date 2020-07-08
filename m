Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id ED980218E21
	for <lists+dri-devel@lfdr.de>; Wed,  8 Jul 2020 19:19:31 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C58B66E8FB;
	Wed,  8 Jul 2020 17:19:28 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 546256E8FB
 for <dri-devel@lists.freedesktop.org>; Wed,  8 Jul 2020 17:19:28 +0000 (UTC)
From: bugzilla-daemon@bugzilla.kernel.org
Authentication-Results: mail.kernel.org;
 dkim=permerror (bad message/signature format)
To: dri-devel@lists.freedesktop.org
Subject: [Bug 208333] Black screen with Kernel 5.8 rc1/2/3/4 with Nvidia Gtx
 760 driver nouveau
Date: Wed, 08 Jul 2020 17:19:27 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Video(DRI - non Intel)
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: high
X-Bugzilla-Who: robyguerrini@yahoo.it
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-208333-2300-WA9yPnkLOE@https.bugzilla.kernel.org/>
In-Reply-To: <bug-208333-2300@https.bugzilla.kernel.org/>
References: <bug-208333-2300@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=208333

--- Comment #4 from Roberto Guerrini (robyguerrini@yahoo.it) ---
Il giorno lun, 06/07/2020 alle 05.10 +0000, bugzilla-
daemon@bugzilla.kernel.org ha scritto:
> https://bugzilla.kernel.org/show_bug.cgi?id=208333
> 
> Ilia Mirkin (imirkin@alum.mit.edu) changed:
> 
>            What    |Removed                     |Added
> -------------------------------------------------------------------
> ---------
>                  CC|                            |imirkin@alum.mit.edu
> 
> --- Comment #3 from Ilia Mirkin (imirkin@alum.mit.edu) ---
> Has nouveau ever worked with this board? Can you get dmesg from a
> failing boot?
> 
> Unfortunately without logs, it's a bit hard to tell what's going on.
> Chances
> are the machine is fine, so you should be able to ssh in and get
> them. Or
> perhaps you can acquire logs from a previous boot, depending on your
> logging
> system.
> 
> Hi, you are right ... you need the log to know what happens ... As
> soon as I can I reassemble the 5.8 kernel and then I will save the
> log to make you understand what the problem is !!! However with
> Kernel 5.7 it works perfectly .... this with the Nouveau driver ...
> there was the problem with the 5.7 of the hadmi audio not working but
> it was solved with the 5.7.7 version which works very well but
> unfortunately the 5.8 it doesn't work and the screen remains black
> even if the machine is free ... so something of the video driver has
> been changed from 5.7 to 5.8 and with the Nvidia gtx 760 and driver
> nouveau the result is this ... soon I'll send you the log 5.8 not
> working ... hello and thank you !!

-- 
You are receiving this mail because:
You are watching the assignee of the bug.
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
