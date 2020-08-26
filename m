Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C42CD2536B6
	for <lists+dri-devel@lfdr.de>; Wed, 26 Aug 2020 20:23:42 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 54FED6E357;
	Wed, 26 Aug 2020 18:23:40 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 248756E357
 for <dri-devel@lists.freedesktop.org>; Wed, 26 Aug 2020 18:23:39 +0000 (UTC)
From: bugzilla-daemon@bugzilla.kernel.org
Authentication-Results: mail.kernel.org;
 dkim=permerror (bad message/signature format)
To: dri-devel@lists.freedesktop.org
Subject: [Bug 209019] [drm:dpcd_set_source_specific_data [amdgpu]] *ERROR*
 Error in DP aux read transaction, not writing source specific data
Date: Wed, 26 Aug 2020 18:23:38 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Video(DRI - non Intel)
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: rtmasura+kernel@hotmail.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-209019-2300-mZmpYnHPbE@https.bugzilla.kernel.org/>
In-Reply-To: <bug-209019-2300@https.bugzilla.kernel.org/>
References: <bug-209019-2300@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=209019

--- Comment #5 from rtmasura+kernel@hotmail.com ---
Since I started getting this I was using the LTS kernel during the day because
this is my work from home machine. I just had it happen with 5.4.60-1-lts. The
virtual machine running on top of the machine IS using 5.8.2, but as this one
does not have anything passed through other than USB devices, and the graphical
display is spice, I think it's unlikely to be caused by the kernel. It's likely
something else, so that means this ticket probably should be closed. I was one
of the people bothered by https://bugzilla.kernel.org/show_bug.cgi?id=207383
and it was just suspicious that it began happening only after the upgrade to
5.8.1 which included the fix. 

As a troubleshooting step I disconnected power but not video, which caused the
issue to remain. Only unplugging the video input stopped it. I've replaced the
wire as a first troubleshooting step. If you have an idea what could cause it
I'm all ears; right now I'll just assume hardware until I can rule it out.

Thanks for your help.

-- 
You are receiving this mail because:
You are watching the assignee of the bug.
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
