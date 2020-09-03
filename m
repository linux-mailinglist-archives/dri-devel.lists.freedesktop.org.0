Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5FBE325BE9C
	for <lists+dri-devel@lfdr.de>; Thu,  3 Sep 2020 11:49:13 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D0C4A6E978;
	Thu,  3 Sep 2020 09:49:09 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3839C6E978
 for <dri-devel@lists.freedesktop.org>; Thu,  3 Sep 2020 09:49:08 +0000 (UTC)
From: bugzilla-daemon@bugzilla.kernel.org
Authentication-Results: mail.kernel.org;
 dkim=permerror (bad message/signature format)
To: dri-devel@lists.freedesktop.org
Subject: [Bug 209129] HW related error message under Gnome important tab
Date: Thu, 03 Sep 2020 09:49:07 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Video(DRI - non Intel)
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: high
X-Bugzilla-Who: bp@alien8.de
X-Bugzilla-Status: NEEDINFO
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: component assigned_to product
Message-ID: <bug-209129-2300-KTq1UWEvce@https.bugzilla.kernel.org/>
In-Reply-To: <bug-209129-2300@https.bugzilla.kernel.org/>
References: <bug-209129-2300@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=209129

Borislav Petkov (bp@alien8.de) changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
          Component|x86-64                      |Video(DRI - non Intel)
           Assignee|platform_x86_64@kernel-bugs |drivers_video-dri@kernel-bu
                   |.osdl.org                   |gs.osdl.org
            Product|Platform Specific/Hardware  |Drivers

--- Comment #11 from Borislav Petkov (bp@alien8.de) ---
Hmm, so it looks like that GpuWatchdog thing is chrome thread. And the error in
your dmesg before it:

[  266.208179] [TTM] Buffer eviction failed
[  266.346883] GpuWatchdog[2984]: segfault at 0 ip

says that a buffer eviction in the TTM fails which probably causes the watchdog
to segfault. In any case, this is a DRM issue, not a platform one.
Reassigning...

What you could do for starters is try the latest kernel 5.8 to check whether
this has been fixed in the meantime.

HTH.

-- 
You are receiving this mail because:
You are watching the assignee of the bug.
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
