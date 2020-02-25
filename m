Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 55FD816F12C
	for <lists+dri-devel@lfdr.de>; Tue, 25 Feb 2020 22:33:08 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 617606EBAF;
	Tue, 25 Feb 2020 21:33:04 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 57AB86EBAF
 for <dri-devel@lists.freedesktop.org>; Tue, 25 Feb 2020 21:33:03 +0000 (UTC)
From: bugzilla-daemon@bugzilla.kernel.org
Authentication-Results: mail.kernel.org;
 dkim=permerror (bad message/signature format)
To: dri-devel@lists.freedesktop.org
Subject: [Bug 206393] amdgpu: garbled screen after resume
Date: Tue, 25 Feb 2020 21:33:02 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Video(DRI - non Intel)
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: acjones8@hawaii.edu
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: cc
Message-ID: <bug-206393-2300-IikgLJRo0Z@https.bugzilla.kernel.org/>
In-Reply-To: <bug-206393-2300@https.bugzilla.kernel.org/>
References: <bug-206393-2300@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=206393

Alexander Jones (acjones8@hawaii.edu) changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
                 CC|                            |acjones8@hawaii.edu

--- Comment #7 from Alexander Jones (acjones8@hawaii.edu) ---
I can also confirm this bug, I'm suffering the exact same problem with my
ThinkPad A275. My glitchy screen looks like this: https://imgur.com/tKAxlI7

I'm also not able to restart X or switch VT, but I can confirm that the user
applications still run, as I've heard Kmail issue a notification while the
screen was glitchy. Other functions of the laptop, like the fan speed and
keyboard illumination, still work perfectly after waking up and function like
normal (if I press the shortcut to light the keyboard up, it changes intensity
properly). Switching back to an older version of the kernel, 5.4.10 in my case,
fixes the problem as well.

Curiously enough, I checked my dmesg for the SAD message after suspending with
the older kernel, and it now reads this:

[    5.450379] [drm] SADs count is: -2, don't need to read it

So it seems to be related to reading whatever the SAD is.

-- 
You are receiving this mail because:
You are watching the assignee of the bug.
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
