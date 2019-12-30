Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 860F312D1AF
	for <lists+dri-devel@lfdr.de>; Mon, 30 Dec 2019 17:02:27 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5DD7F89EB8;
	Mon, 30 Dec 2019 16:02:25 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BD94D89E9E
 for <dri-devel@lists.freedesktop.org>; Mon, 30 Dec 2019 16:02:23 +0000 (UTC)
From: bugzilla-daemon@bugzilla.kernel.org
Authentication-Results: mail.kernel.org;
 dkim=permerror (bad message/signature format)
To: dri-devel@lists.freedesktop.org
Subject: [Bug 206017] New: Kernel 5.4.x unusable with GUI due to
 [drm:amdgpu_dm_atomic_commit_tail [amdgpu]] *ERROR* Waiting for fences timed
 out!
Date: Mon, 30 Dec 2019 16:02:23 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: new
X-Bugzilla-Watch-Reason: AssignedTo drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Video(DRI - non Intel)
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: high
X-Bugzilla-Who: udovdh@xs4all.nl
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: bug_id short_desc product version
 cf_kernel_version rep_platform op_sys cf_tree bug_status bug_severity
 priority component assigned_to reporter cf_regression
Message-ID: <bug-206017-2300@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=206017

            Bug ID: 206017
           Summary: Kernel 5.4.x unusable with GUI due to
                    [drm:amdgpu_dm_atomic_commit_tail [amdgpu]] *ERROR*
                    Waiting for fences timed out!
           Product: Drivers
           Version: 2.5
    Kernel Version: 5.4.x
          Hardware: x86-64
                OS: Linux
              Tree: Mainline
            Status: NEW
          Severity: high
          Priority: P1
         Component: Video(DRI - non Intel)
          Assignee: drivers_video-dri@kernel-bugs.osdl.org
          Reporter: udovdh@xs4all.nl
        Regression: No

AMD Ryzen 5 3400G with Radeon Vega Graphics on Gigabyte X570 AORUS PRO, running
Fedora 31, kernel.org kernels, git mesa, etc
After booting into 5.4, soon the GUI freezes, e.g. right when I start Firefox.
On 5.3.18 it takes days to crash amdgpu.
Soft recovery does not help.
5.3.18 is EOLed so 5.4 issues need priority:

(..)
[   12.884828] pps pps0: new PPS source serial0
[   12.884832] pps pps0: source "/dev/ttyS0" added
[   12.898511] it87: it87 driver version <not provided>
[   12.898635] it87: Found IT8792E/IT8795E chip at 0xa60, revision 3
[   12.898675] it87: Beeping is supported
[   14.244524] igb 0000:04:00.0: changing MTU from 1500 to 7200
[   17.328845] igb 0000:04:00.0 eth0: igb: eth0 NIC Link is Up 1000 Mbps Full
Duplex, Flow Control: RX/TX
[   17.331973] IPv6: ADDRCONF(NETDEV_CHANGE): eth0: link becomes ready
[   18.564142] io scheduler mq-deadline registered
[   22.352636] igb 0000:04:00.0 eth0: igb: eth0 NIC Link is Up 1000 Mbps Full
Duplex, Flow Control: RX/TX
[   31.464130] fuse: init (API version 7.31)
[   75.198868] [drm:amdgpu_dm_atomic_commit_tail [amdgpu]] *ERROR* Waiting for
fences timed out!
[   80.318799] [drm:amdgpu_job_timedout [amdgpu]] *ERROR* ring gfx timeout, but
soft recovered

-- 
You are receiving this mail because:
You are watching the assignee of the bug.
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
