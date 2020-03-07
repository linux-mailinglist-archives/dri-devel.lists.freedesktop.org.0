Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 6DD1117D053
	for <lists+dri-devel@lfdr.de>; Sat,  7 Mar 2020 22:42:00 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CDDBB6E112;
	Sat,  7 Mar 2020 21:41:56 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 98A736E112
 for <dri-devel@lists.freedesktop.org>; Sat,  7 Mar 2020 21:41:55 +0000 (UTC)
From: bugzilla-daemon@bugzilla.kernel.org
Authentication-Results: mail.kernel.org;
 dkim=permerror (bad message/signature format)
To: dri-devel@lists.freedesktop.org
Subject: [Bug 206781] New: GM104 (GeForce 840m) with many errors "fifo:
 SCHED_ERROR 20"
Date: Sat, 07 Mar 2020 21:41:54 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: new
X-Bugzilla-Watch-Reason: AssignedTo drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Video(DRI - non Intel)
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: high
X-Bugzilla-Who: gsedej@gmail.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: bug_id short_desc product version
 cf_kernel_version rep_platform op_sys cf_tree bug_status bug_severity
 priority component assigned_to reporter cf_regression attachments.created
Message-ID: <bug-206781-2300@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=206781

            Bug ID: 206781
           Summary: GM104 (GeForce 840m) with many errors "fifo:
                    SCHED_ERROR 20"
           Product: Drivers
           Version: 2.5
    Kernel Version: 5.4
          Hardware: All
                OS: Linux
              Tree: Mainline
            Status: NEW
          Severity: high
          Priority: P1
         Component: Video(DRI - non Intel)
          Assignee: drivers_video-dri@kernel-bugs.osdl.org
          Reporter: gsedej@gmail.com
        Regression: No

Created attachment 287821
  --> https://bugzilla.kernel.org/attachment.cgi?id=287821&action=edit
dmesg contining errors - shortend at end

Laptop HP Envy 15 with i7-4700mq and GeForce 840m on Ubuntu 18.04 and 20.04.

nouveau outputs many megabytes into system logs (kern.log and syslog) with
"nouveau 0000:07:00.0: fifo: SCHED_ERROR 20 []"


full log is in attachment

some relevant output before "SCHED_ERROR"


nouveau 0000:07:00.0: NVIDIA GM108 (118010a2)
...
nouveau 0000:07:00.0: bios: version 82.08.14.00.0e
...
nouveau 0000:07:00.0: fb: 2048 MiB DDR3
nouveau 0000:07:00.0: bus: MMIO read of 00000000 FAULT at 6013d4 [ IBUS ]
...
nouveau 0000:07:00.0: bus: MMIO read of 00000000 FAULT at 10ac08 [ IBUS ]
nouveau 0000:07:00.0: fifo: fault 01 [WRITE] at 0000000000150000 engine 05
[BAR2] client 08 [HUB/HOST_CPU_NB] reason 02 [PTE] on channel -1 [007fd38000
unknown]
nouveau 0000:07:00.0: fifo: fault 01 [WRITE] at 0000000000000000 engine 05
[BAR2] client 08 [HUB/HOST_CPU_NB] reason 0a [UNSUPPORTED_APERTURE] on channel
-1 [007fd38000 unknown]
vga_switcheroo: enabled
[TTM] Zone  kernel: Available graphics memory: 8164024 KiB
nouveau 0000:07:00.0: fifo: SCHED_ERROR 20 []
nouveau 0000:07:00.0: fifo: SCHED_ERROR 20 []
nouveau 0000:07:00.0: fifo: SCHED_ERROR 20 []
...


I have also reported here:
https://gitlab.freedesktop.org/xorg/driver/xf86-video-nouveau/issues/522

-- 
You are receiving this mail because:
You are watching the assignee of the bug.
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
