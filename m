Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 2AB76217C31
	for <lists+dri-devel@lfdr.de>; Wed,  8 Jul 2020 02:25:16 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 375CC89F0A;
	Wed,  8 Jul 2020 00:25:12 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5127389F0A
 for <dri-devel@lists.freedesktop.org>; Wed,  8 Jul 2020 00:25:10 +0000 (UTC)
From: bugzilla-daemon@bugzilla.kernel.org
Authentication-Results: mail.kernel.org;
 dkim=permerror (bad message/signature format)
To: dri-devel@lists.freedesktop.org
Subject: [Bug 207383] [Regression] 5.7 amdgpu/polaris11 gpf:
 amdgpu_atomic_commit_tail
Date: Wed, 08 Jul 2020 00:25:09 +0000
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
Message-ID: <bug-207383-2300-Wnw689Z73u@https.bugzilla.kernel.org/>
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

--- Comment #48 from Duncan (1i5t5.duncan@cox.net) ---
(In reply to Duncan from comment #47)
> > [I]dea to just try patch-reverting them on top of
> > 5.7 or current 5.8-rc, thus eliminating the apparently unrelated
> > kernel-panics I''ve twice triggered at the current bisect step.
> 
> So I tried this with the 11 above commits against
> 5.8.0-rc4-00025-gbfe91da29, which previously tested as triggering the freeze
> for me.  Of the 11, nine clean-reversed and I simply noted and skipped the
> other two (3202fa62f and 630f289b7) for the moment.  The patched kernel
> successfully built and I'm booted to it now.

Bah, humbug!  Got a freeze and the infamous logged trace on that too!  I was
hoping to demonstrably prove it to be in those nine!  I proved it *NOT* to be!

Well, there's still the two commits to look at that wouldn't cleanly
simple-revert.  Maybe I'll get lucky and it's just an ordering thing, since I
applied out of order compared to original commit, and they'll simple-revert on
top of the others.  Otherwise I'll have to actually look and see if I can make
sense of it and manual revert, maybe/maybe-not for a non-coder, or try on 5.7
instead of 5.8-rc.

If not them, maybe I'll just have to declare defeat on the bisect and hope for
a fix without that.  Last resort there's the buy-my-way-out solution, tho of
course that leaves others without that option in a bind.  But given the hours
I've put into this (that I've only been able to thanks to COVID work
suspension), at some point you just gotta cut your losses and declare defeat
defeat.

But we're not there yet.  There's still the two to look at first, and the
middle-ground 5.7 to try all 11 against.  Hopefully...

-- 
You are receiving this mail because:
You are watching the assignee of the bug.
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
