Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 01DBC14191A
	for <lists+dri-devel@lfdr.de>; Sat, 18 Jan 2020 20:20:35 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B6B476E11D;
	Sat, 18 Jan 2020 19:20:30 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 523196E11D
 for <dri-devel@lists.freedesktop.org>; Sat, 18 Jan 2020 19:20:29 +0000 (UTC)
From: bugzilla-daemon@bugzilla.kernel.org
Authentication-Results: mail.kernel.org;
 dkim=permerror (bad message/signature format)
To: dri-devel@lists.freedesktop.org
Subject: [Bug 206225] nouveau: Screen distortion and lockup on resume
Date: Sat, 18 Jan 2020 19:20:28 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Video(DRI - non Intel)
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: high
X-Bugzilla-Who: derchiller-foren@online.de
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-206225-2300-RKZssplLHK@https.bugzilla.kernel.org/>
In-Reply-To: <bug-206225-2300@https.bugzilla.kernel.org/>
References: <bug-206225-2300@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=206225

--- Comment #7 from Christoph Marz (derchiller-foren@online.de) ---
(In reply to Ilia Mirkin from comment #6)
> I see you have nouveau.config=PCRYPT=0 in your kernel config. Why did you
> add this -- was there some kind of issue with the engine? Did someone in
> #nouveau tell you to do it to help some issue?

Hello Ilia,

I had found a bug report (https://bugs.freedesktop.org/show_bug.cgi?id=58378)
dealing with a similar issue, and there you suggested to try that option
(https://bugs.freedesktop.org/show_bug.cgi?id=58378#c46), and it seemingly
solved the issue, so I gave it a try, but removed it after I noticed that it
had no effect at all.

>It's normally used for copy
> acceleration on G96 (which would, in turn, be used to copy off any vram data
> to ram on suspend).
> 
> The reason I ask is that starting with kernel 4.3, that will no longer have
> the effect of disabling PCRYPT. The new config to achieve that would be
> nouveau.config=cipher=0.

Ok, thanks for clarification. Copy acceleration sounds good, is there any
downside?

> Note that for G96, I don't think anything in firmware-misc-nonfree would
> affect it either way.

I will uninstall that package and report back.

BTW: No problems with 5.4.13 so far.

-- 
You are receiving this mail because:
You are watching the assignee of the bug.
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
