Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 1A72B2E31D1
	for <lists+dri-devel@lfdr.de>; Sun, 27 Dec 2020 17:24:29 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 21B15893D0;
	Sun, 27 Dec 2020 16:24:24 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 68EE3893D0
 for <dri-devel@lists.freedesktop.org>; Sun, 27 Dec 2020 16:24:23 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPS id 1D1E4207CF
 for <dri-devel@lists.freedesktop.org>; Sun, 27 Dec 2020 16:24:23 +0000 (UTC)
Received: by pdx-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
 id 174AB816C5; Sun, 27 Dec 2020 16:24:23 +0000 (UTC)
From: bugzilla-daemon@bugzilla.kernel.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 210683] Nasty amdgpu powersave regression Navi14
Date: Sun, 27 Dec 2020 16:24:22 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Video(DRI - non Intel)
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: high
X-Bugzilla-Who: m4ng4n@gmx.de
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-210683-2300-AczGDayRPs@https.bugzilla.kernel.org/>
In-Reply-To: <bug-210683-2300@https.bugzilla.kernel.org/>
References: <bug-210683-2300@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=210683

--- Comment #9 from Andreas Prittwitz (m4ng4n@gmx.de) ---
I have done some addtional testing.
I am running an up to date openSUSE Tumleweed with KDE Plasma.
My monitor is capable of running at 60, 100, 120 and 144 Hz refresh rate.

For some reason unknown to me it was set to 60 Hz after the last update.
With this setting it idled at 35 W instead of the usual 11 W.
Also the memory/GPU frequencies come down to what they used to and where they
should be.

After setting it back to 144 Hz, wattage at idle came back down to 11 W.
Setting it back to 60 Hz refresh rate lets the wattage come back up to 35 W.
This is reproducible any time.

Setting it to 100 and 120 Hz resepectively lets the graphics card also idle at
11W.

It seems, at least on my system, that this bug only affects me, when the
monitor is set to 60 Hz refresh rate.

-- 
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
