Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A104020BF3B
	for <lists+dri-devel@lfdr.de>; Sat, 27 Jun 2020 09:07:45 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 910526E52A;
	Sat, 27 Jun 2020 07:07:41 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B328D6E52A
 for <dri-devel@lists.freedesktop.org>; Sat, 27 Jun 2020 07:07:40 +0000 (UTC)
From: bugzilla-daemon@bugzilla.kernel.org
Authentication-Results: mail.kernel.org;
 dkim=permerror (bad message/signature format)
To: dri-devel@lists.freedesktop.org
Subject: [Bug 207383] [Regression] 5.7 amdgpu/polaris11 gpf:
 amdgpu_atomic_commit_tail
Date: Sat, 27 Jun 2020 07:07:39 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Video(DRI - non Intel)
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: blocking
X-Bugzilla-Who: 1i5t5.duncan@cox.net
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-207383-2300-tnoY0bZ4ym@https.bugzilla.kernel.org/>
In-Reply-To: <bug-207383-2300@https.bugzilla.kernel.org/>
References: <bug-207383-2300@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=207383

--- Comment #28 from Duncan (1i5t5.duncan@cox.net) ---
(In reply to rtmasura+kernel from comment #27)
> and another crash, chrome's good at causing them (watching youtube). Used -s
> "" for the setting which I think should set it to 'auto', and what I assumed
> was default. I've changed that to -s "off" to see if that helps.

You just added those updates as I was typing a comment pointing out that
chrome/chromium in your bug; bugzilla warned of a mid-air collision! 
Chrom(e|ium) has new vulkan accel code and very likely exercises some of the
same relatively new amdgpu kernel code kwin does, so both of them triggering
the bug wouldn't surprise me at all.

As it happens I switched back to firefox during the 5.6 kernel cycle, so
haven't seen chromium's interaction with the (kernel 5.7) bug myself, but once
I saw it in that trace I said to myself I bet that's his trigger!


FWIW I advanced a couple more bisect steps pretty quickly as it was triggering
as I tried to complete system updates (which on gentoo of course means building
the packages), but then I hit an apparently good kernel, and uptime says 3 days
now, something I've not seen in awhile!  Only thing is, I finished those
updates and they were pretty calm the next couple days, so I've not been
stressing the system to the same extent, either.  Given the problems I got
myself into the first bisect run, I'm going to run on this kernel a bit longer
before I do that bisect good to advance a step.  If it reaches a week and I've
done either a good system update or a some heavy 4k@60 youtube on firefox, I'll
call it good, but I'm not ready to yet.

The good news is, in a couple more bisect steps I'll be down to some practical
number of remaining commits to report the range here, and if they have the
time, a dev with a practiced eye should be able to narrow it down by say 3/4
(two steps ahead of my bisect), leaving something actually practical to examine
closer.  After that it'll be past the point of my bisect being the only
bottleneck, if it's big enough to get dev priority time, of course.  If not,
I'll just have to keep plugging away at the bisect...

-- 
You are receiving this mail because:
You are watching the assignee of the bug.
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
