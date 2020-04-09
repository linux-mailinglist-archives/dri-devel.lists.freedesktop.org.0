Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BC1361A3BC1
	for <lists+dri-devel@lfdr.de>; Thu,  9 Apr 2020 23:14:06 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 34E896EC28;
	Thu,  9 Apr 2020 21:14:03 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 426C26EC28
 for <dri-devel@lists.freedesktop.org>; Thu,  9 Apr 2020 21:14:02 +0000 (UTC)
From: bugzilla-daemon@bugzilla.kernel.org
Authentication-Results: mail.kernel.org;
 dkim=permerror (bad message/signature format)
To: dri-devel@lists.freedesktop.org
Subject: [Bug 207183] New: radeon.dpm=1 with second monitor runs hot
Date: Thu, 09 Apr 2020 21:14:01 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: new
X-Bugzilla-Watch-Reason: AssignedTo drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Video(DRI - non Intel)
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: ehuels@gmail.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: bug_id short_desc product version
 cf_kernel_version rep_platform op_sys cf_tree bug_status bug_severity
 priority component assigned_to reporter cf_regression attachments.created
Message-ID: <bug-207183-2300@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=207183

            Bug ID: 207183
           Summary: radeon.dpm=1 with second monitor runs hot
           Product: Drivers
           Version: 2.5
    Kernel Version: 5.3.18
          Hardware: x86-64
                OS: Linux
              Tree: Mainline
            Status: NEW
          Severity: normal
          Priority: P1
         Component: Video(DRI - non Intel)
          Assignee: drivers_video-dri@kernel-bugs.osdl.org
          Reporter: ehuels@gmail.com
        Regression: No

Created attachment 288315
  --> https://bugzilla.kernel.org/attachment.cgi?id=288315&action=edit
dmesg | grep -iE "drm|radeon"

for a long time, I've been searching for the reason why my card was running
fans high on Linux. (It started after a kernel update; don't know which one --
years ago) While at the time, I ran Windows on the same laptop every now and
then, it would work correctly.

My card reports `lspci | grep VGA`:

01:00.0 VGA compatible controller: Advanced Micro Devices, Inc. [AMD/ATI] Venus
XT [Radeon HD 8870M / R9 M270X/M370X]


Without radeon.dpm or with radeon.dpm=1, the card runs hot: within minutes fans
will run at 3300+ RPM keeping the card barely below 66 degC. Note that
`radeontop` reports an `Graphics pipe` of 0.00% most of the time.

After discovery of the setting radeon.dpm yesterday, after a few failed trials
to set the setting to '1', I set `radeon.dpm=0`. After letting the PC cool down
(turned off) and starting again, the PC ran 10 minutes without fans and is
running at 53 degC with fans running at 2100 RPM.

-- 
You are receiving this mail because:
You are watching the assignee of the bug.
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
