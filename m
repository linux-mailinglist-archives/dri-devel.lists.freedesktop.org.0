Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 73C3734F195
	for <lists+dri-devel@lfdr.de>; Tue, 30 Mar 2021 21:29:06 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B80AB6E09C;
	Tue, 30 Mar 2021 19:29:02 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4ADA96E09C
 for <dri-devel@lists.freedesktop.org>; Tue, 30 Mar 2021 19:29:01 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPS id 64AF76199A
 for <dri-devel@lists.freedesktop.org>; Tue, 30 Mar 2021 19:28:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1617132539;
 bh=4U99FbRAgIWybn1btupFzxxTcFinmlX5TO5/iUe/7iU=;
 h=From:To:Subject:Date:In-Reply-To:References:From;
 b=eWtCktk5MYO8DiA1DKZlQFB1GCFrS95MebNK+pEPeGGBZVbdFakm9hHqEkQiteFBH
 HKZCDj20lv9FjwIPFwH3H3AhIwDdvflGvwThwycvi1+hO6DWt8sFVapb+fx9+D5l0o
 pJvUHr58a8dwDgjYQ7IAPxcGbnJQmrVW+NdUnRRVjv5J9M9sTC6oQPLzQ1ZlWXf61V
 YkErw6fnuUb1cXw9ntmNnQQG9sbSENyNVZJcIyTwv6jLhl0D7lvIpKODQWTX1nxDIP
 93OpAp08mHxeOMFHxZGorOBkluRGEE9Vdst+j5BXDJrvZY7g1LHNqgV1+SEEfDEn7N
 0jEFegbYbUtbg==
Received: by pdx-korg-bugzilla-2.web.codeaurora.org (Postfix, from userid 48)
 id 541FF62AB7; Tue, 30 Mar 2021 19:28:59 +0000 (UTC)
From: bugzilla-daemon@bugzilla.kernel.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 211425] [drm:atom_op_jump] *ERROR* atombios stuck in loop for
 more than 20secs aborting
Date: Tue, 30 Mar 2021 19:28:58 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Video(DRI - non Intel)
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: icedragon.aw@web.de
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: cf_kernel_version
Message-ID: <bug-211425-2300-Gsa5rX3I9f@https.bugzilla.kernel.org/>
In-Reply-To: <bug-211425-2300@https.bugzilla.kernel.org/>
References: <bug-211425-2300@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=211425

Andreas (icedragon.aw@web.de) changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
     Kernel Version|5.11.5                      |5.11.11

--- Comment #13 from Andreas (icedragon.aw@web.de) ---
I have make a comparison with a second full AMD System:
A) Ryzen 7 PRO 4750G APU (with build in Vega20) - Renoir
B) Ryzen Threadripper 1900X with dedicated Vega64 GPU
Both systems have installed the same OS (Kubuntu 20.10 with latest updates),
same Xorg configuration (because both have a Vega-GPU), same User IO (monitor,
keyboard and mouse) and running with the same mainline Kernel 5.11.11 (similar
.config file).

- Only my System A) is reproducible infected with the atombios errors (see
comments above) and with the two times monitor blackout of each 20sec - after
triggering the issue with simple putting the monitor off and on again (after
waiting some seconds).

- Because both systems have a vega gpu and using the same driver - it seem to
be a Renoir APU only problem.

- I also observed, that the issue can not be triggered (or is very hard to
reproduce) during the sddm login screen! It seems to be, that only a regular
KDE user or root session (inclusive the lock screen from a session) is affected
by the issue.
-> What is the difference? The usage of opengl or other 3d accelerations? I'm
also tested with switching the rendering during a session, but I could not
observe any difference whatever I used (opengl 2.0, 3.2 or xrendering).

From now I'll only update the bug header for the latest tested (released)
kernel version/subversion.

-- 
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
