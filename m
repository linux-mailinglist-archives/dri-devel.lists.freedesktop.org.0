Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 65AEE31D1C0
	for <lists+dri-devel@lfdr.de>; Tue, 16 Feb 2021 21:53:49 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4F3A96E990;
	Tue, 16 Feb 2021 20:53:45 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 79BED6E990
 for <dri-devel@lists.freedesktop.org>; Tue, 16 Feb 2021 20:53:44 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPS id 50AE664E85
 for <dri-devel@lists.freedesktop.org>; Tue, 16 Feb 2021 20:53:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1613508822;
 bh=XHP+im6rH3YnODzzIy7UDnAcSWJxDfe6dXBqXC5jLQg=;
 h=From:To:Subject:Date:From;
 b=POv+5NgwNk+kZhxEnEtoADjBlf27vqSmemSmpq2u9pCG/uzlrbWjMg1CV0CVgN5ho
 92F9CiBoJ/K/VYFTM0l1MLbIFicM0OHXDk+cZL5qyfI5u+rUwYFUeDmZKy+5TbaYeS
 Js/9DP9XFK+VGiMj3QxPx5RVLvGh9elL+NJO9wGq/8J+9R9hpZuDnn62PSGzjNbzuU
 L/9k2iJaJMyreys7gcm2o4sgVpx/nHtjqIWMCTnSFPJk6T1PQJb0mfcnkW4TGUVtV/
 QU+1uFUfacis7eN9z/JiJ4FD8l1cu2MS/rqpOS5eeipzM7I+GKBMwScxzK0VSh/TIS
 dTBomVuKrHcJw==
Received: by pdx-korg-bugzilla-2.web.codeaurora.org (Postfix, from userid 48)
 id 400C8653B9; Tue, 16 Feb 2021 20:53:42 +0000 (UTC)
From: bugzilla-daemon@bugzilla.kernel.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 211807] New: [drm:drm_dp_mst_dpcd_read] *ERROR* mstb
 000000004e6288dd port 3: DPCD read on addr 0x60 for 1 bytes NAKed
Date: Tue, 16 Feb 2021 20:53:41 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: new
X-Bugzilla-Watch-Reason: AssignedTo drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Video(DRI - non Intel)
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: low
X-Bugzilla-Who: kernelbugs@equaeghe.nospammail.net
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: bug_id short_desc product version
 cf_kernel_version rep_platform op_sys cf_tree bug_status bug_severity
 priority component assigned_to reporter cf_regression
Message-ID: <bug-211807-2300@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=211807

            Bug ID: 211807
           Summary: [drm:drm_dp_mst_dpcd_read] *ERROR* mstb
                    000000004e6288dd port 3: DPCD read on addr 0x60 for 1
                    bytes NAKed
           Product: Drivers
           Version: 2.5
    Kernel Version: 5.10.16
          Hardware: All
                OS: Linux
              Tree: Mainline
            Status: NEW
          Severity: low
          Priority: P1
         Component: Video(DRI - non Intel)
          Assignee: drivers_video-dri@kernel-bugs.osdl.org
          Reporter: kernelbugs@equaeghe.nospammail.net
        Regression: No

In my logs, I see the following error:


[drm:drm_dp_mst_dpcd_read] *ERROR* mstb 000000004e6288dd port 3: DPCD read on
addr 0x60 for 1 bytes NAKed


It has not caused any detected issues, but I guess that if the kernel complains
this loudy, it is good to report it.

This is on a laptop with a Ryzen Pro 4750U APU. I custom-build the kernel, so
do not hesitate to request changing some config options to investigate.

-- 
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
