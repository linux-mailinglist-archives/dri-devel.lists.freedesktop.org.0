Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CB2CF301F75
	for <lists+dri-devel@lfdr.de>; Sun, 24 Jan 2021 23:57:03 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7402189C69;
	Sun, 24 Jan 2021 22:57:00 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 601D889C69
 for <dri-devel@lists.freedesktop.org>; Sun, 24 Jan 2021 22:56:59 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPS id 1B91622DA7
 for <dri-devel@lists.freedesktop.org>; Sun, 24 Jan 2021 22:56:59 +0000 (UTC)
Received: by pdx-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
 id 1794E81F0C; Sun, 24 Jan 2021 22:56:59 +0000 (UTC)
From: bugzilla-daemon@bugzilla.kernel.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 201957] amdgpu: ring gfx timeout
Date: Sun, 24 Jan 2021 22:56:57 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Video(DRI - non Intel)
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: blocking
X-Bugzilla-Who: majorgonzo@juno.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-201957-2300-p9m6FNAvB6@https.bugzilla.kernel.org/>
In-Reply-To: <bug-201957-2300@https.bugzilla.kernel.org/>
References: <bug-201957-2300@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=201957

--- Comment #42 from MajorGonzo (majorgonzo@juno.com) ---
I made a change a while back.  I added:
amdgpu.gpu_recovery=1 
as a grub parameter.  I have no other (of the many suggested) parameters set:
GRUB_CMDLINE_LINUX_DEFAULT="quiet splash amdgpu.ppfeaturemask=0xfffd7fff
amdgpu.gpu_recovery=1"

The feature mask was used to enable reducing the top speed of my video card to
reduce heating, and I was using corectrl for that.  However, it was something I
had to set manually after each boot.  Of course, I forgot to do so, and yet it
still stopped occurring.  So in reality, I don't think I need that anymore,
either.

Just checked my linux logs grepping for "ring gfx".  Before the change, I had
multiples each day up to Dec 10th.  Since then, I've had 3.

Also of note - for the last two, it was when I WASN'T playing.  Well, I was
playing a game, but I was AFK.  It seemed when I returned and did something, it
went black then.

Lastly, just to confirm, I checked my change log (my own log), and I did,
indeed, make that change on 10 Dec.

-- 
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
