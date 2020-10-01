Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A3EAA2806AE
	for <lists+dri-devel@lfdr.de>; Thu,  1 Oct 2020 20:36:09 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8C1BF6E8CF;
	Thu,  1 Oct 2020 18:36:07 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 29A4A6E8CF
 for <dri-devel@lists.freedesktop.org>; Thu,  1 Oct 2020 18:36:06 +0000 (UTC)
From: bugzilla-daemon@bugzilla.kernel.org
Authentication-Results: mail.kernel.org;
 dkim=permerror (bad message/signature format)
To: dri-devel@lists.freedesktop.org
Subject: [Bug 209457] AMDGPU resume fail with RX 580 GPU
Date: Thu, 01 Oct 2020 18:36:05 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Video(DRI - non Intel)
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: rmuncrief@humanavance.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: attachments.created
Message-ID: <bug-209457-2300-EYhXS5ex9y@https.bugzilla.kernel.org/>
In-Reply-To: <bug-209457-2300@https.bugzilla.kernel.org/>
References: <bug-209457-2300@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=209457

--- Comment #2 from Robert M. Muncrief (rmuncrief@humanavance.com) ---
Created attachment 292741
  --> https://bugzilla.kernel.org/attachment.cgi?id=292741&action=edit
Resume failure, full dmesg output from kernel 5.8.5

The last full dmesg output I have is from kernel 5.8.5, and I've attached it to
this response. However the messages haven't changed since then.  

Going forward would you rather I run the current 5.8 (on arch it's 5.8.12) or
the 5.9 RC release candidates (currently 5.9-rc6) to capture the next event?  

I can bisect, but don't know how to bisect a random issue like this. It's
difficult to say how often it happens, but I'd estimate one out of seven to
twelve times.  

I actually tried purposely going through multiple suspend/resume cycles
sometime ago in hopes of gathering more info for a bug report, but got to 20
cycles with no errors so I gave up. So it seems the issue only occurs if my
computer has been suspended for a significant period of time, as it only occurs
when my computer has been suspended overnight.  

It's also significant to note that I have two identical XFX Radeon RX 580 GTS
XXX Edition GPUs, and one is passed through via VFIO at boot.  

In any case I'll be happy to assist on this issue in any way I can. I've seen
multiple complaints about it online, but saw other bug reports that I assumed
were already addressing it or I would have filed a new bug report sooner. I
wasn't aware of my error until this morning.

-- 
You are receiving this mail because:
You are watching the assignee of the bug.
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
