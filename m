Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 4416D2E2FB5
	for <lists+dri-devel@lfdr.de>; Sun, 27 Dec 2020 04:03:27 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1581889269;
	Sun, 27 Dec 2020 03:03:22 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D535F89266
 for <dri-devel@lists.freedesktop.org>; Sun, 27 Dec 2020 03:03:20 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPS id 790CC2225E
 for <dri-devel@lists.freedesktop.org>; Sun, 27 Dec 2020 03:03:20 +0000 (UTC)
Received: by pdx-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
 id 7494E86738; Sun, 27 Dec 2020 03:03:20 +0000 (UTC)
From: bugzilla-daemon@bugzilla.kernel.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 210849] Black screen after resume from long suspend. Open/Close
 lid. AMDGPU
Date: Sun, 27 Dec 2020 03:03:20 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Video(DRI - non Intel)
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: blocking
X-Bugzilla-Who: jvdelisle@charter.net
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: cc
Message-ID: <bug-210849-2300-qGk70k4pF2@https.bugzilla.kernel.org/>
In-Reply-To: <bug-210849-2300@https.bugzilla.kernel.org/>
References: <bug-210849-2300@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=210849

JerryD (jvdelisle@charter.net) changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
                 CC|                            |jvdelisle@charter.net

--- Comment #5 from JerryD (jvdelisle@charter.net) ---
There is an old bug report that has been closed related to
/usr/lib/firmware/amdgpu/raven_dmcu.bin.  This file was being incorrectly
loaded or has a probelm. To correct this, I renamed the file to
raven_dmcu.bin.old so that it would not load.  The problem would return every
time firmware updates would come through that supplied a new raven_dmcu.bin.

I had no problems until recently when the kernel was bumped from
5.8.18-200.fc32.x86_64 to the first instance of 5.9.

The previous fix was accomplished y uninstalling the kernel, rename the
troublesome file, and then reintall the kernel.

I took another look today and see there is a new raven_dmcu.bin so I will
repeat the procedure again.  It may not be the same problem, but I will give it
a try.

-- 
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
