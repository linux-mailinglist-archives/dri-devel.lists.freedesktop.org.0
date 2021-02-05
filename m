Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DE0F0310416
	for <lists+dri-devel@lfdr.de>; Fri,  5 Feb 2021 05:35:17 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 054006E10C;
	Fri,  5 Feb 2021 04:35:16 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E3F806E10C
 for <dri-devel@lists.freedesktop.org>; Fri,  5 Feb 2021 04:35:14 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPS id 7BBB364F58
 for <dri-devel@lists.freedesktop.org>; Fri,  5 Feb 2021 04:35:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1612499714;
 bh=HzrpkilJVY4M0ffvVbtRO1csFg+WcK9QY8qcHXti5Pc=;
 h=From:To:Subject:Date:In-Reply-To:References:From;
 b=Rx9Bi/HwCJWSuR7EOfZTTMKsa0uJozhzkTknsP/qRtRDEugopcfSzF9tl5cpJXPMA
 gDBhizHQrO5rYjqzzAc0ONbCluQQuOTNeljVNVTU3F8rXe86puLcvC51rDgEQrdwyc
 uaT1r6Kx+AMAfFMadngK1N4S5Yp+dT4ucaAUX+BmSgGKbhDz+5KG7ZHZUYl7V3y7fp
 oko4Y86WldAoeNN3HMS5Ql48nFH+D+X+glFJ0ZMLN2EbHmMhofpQ0pCl7tIavPQE3v
 VtiLYOeQSPhabGG99XTzfVWKV/chds9UI6KWc6A2bY+eXpbj6UUrHNKBEIyy1Hh3cN
 BGTkmz3qX65MA==
Received: by pdx-korg-bugzilla-2.web.codeaurora.org (Postfix, from userid 48)
 id 674A16533E; Fri,  5 Feb 2021 04:35:14 +0000 (UTC)
From: bugzilla-daemon@bugzilla.kernel.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 210849] Black screen after resume from long suspend. Open/Close
 lid. AMDGPU
Date: Fri, 05 Feb 2021 04:35:14 +0000
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
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-210849-2300-chOq2KGOuR@https.bugzilla.kernel.org/>
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

--- Comment #10 from JerryD (jvdelisle@charter.net) ---
This bug has basically disabled two different machines I have that use AMD
graphics cards.  One, a work station running Fedora 33 will lose the display if
I do not log on right away after a power up.  The defaults that blank the
screen or just a simple lock screen sequence basically causes the monitor to
shutoff to save energy. At this point the display can not be recovered since
the driver loses it self.  It is a real shame as this system was working
perfectly for over a year beofre this happened.  The guilty patch should be
reverted immediately.

I can remote into the system from elsewhere ussing ssh and command a reboot to
bring it back.  The kernel underlying is running and completely functional. The
device driver AMDGPU is 'F'ed up.  In my many many years of using Fedora and
other linux distros, this is by far the worse cluster bug I have ever see.

-- 
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
