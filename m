Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 041792120D9
	for <lists+dri-devel@lfdr.de>; Thu,  2 Jul 2020 12:18:51 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6BFB76E09C;
	Thu,  2 Jul 2020 10:18:48 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4501F6E09C
 for <dri-devel@lists.freedesktop.org>; Thu,  2 Jul 2020 10:18:48 +0000 (UTC)
From: bugzilla-daemon@bugzilla.kernel.org
Authentication-Results: mail.kernel.org;
 dkim=permerror (bad message/signature format)
To: dri-devel@lists.freedesktop.org
Subject: [Bug 208411] New: GPU reset end with ret = -110
Date: Thu, 02 Jul 2020 10:18:47 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: new
X-Bugzilla-Watch-Reason: AssignedTo drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Video(DRI - non Intel)
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: high
X-Bugzilla-Who: phil2sat@gmail.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: bug_id short_desc product version
 cf_kernel_version rep_platform op_sys cf_tree bug_status bug_severity
 priority component assigned_to reporter cf_regression
Message-ID: <bug-208411-2300@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=208411

            Bug ID: 208411
           Summary: GPU reset end with ret = -110
           Product: Drivers
           Version: 2.5
    Kernel Version: Mainline 5.7.6
          Hardware: x86-64
                OS: Linux
              Tree: Mainline
            Status: NEW
          Severity: high
          Priority: P1
         Component: Video(DRI - non Intel)
          Assignee: drivers_video-dri@kernel-bugs.osdl.org
          Reporter: phil2sat@gmail.com
        Regression: No

[ 1922.162071] [drm:amdgpu_dm_atomic_commit_tail [amdgpu]] *ERROR* Waiting for
fences timed out!
[ 1927.068795] [drm:amdgpu_job_timedout [amdgpu]] *ERROR* ring sdma0 timeout,
signaled seq=13670, emitted seq=13672
[ 1927.068928] [drm:amdgpu_job_timedout [amdgpu]] *ERROR* Process information:
process  pid 0 thread  pid 0
[ 1927.068934] amdgpu 0000:03:00.0: GPU reset begin!
[ 1927.084510] [drm] [Link 0] WARNING MOD_HDCP_STATUS_DISPLAY_NOT_FOUND IN
STATE HDCP_UNINITIALIZED STAY COUNT 0
[ 1927.225062] amdgpu 0000:03:00.0: GPU reset succeeded, trying to resume
[ 1927.225189] [drm] PCIE GART of 1024M enabled (table at 0x000000F400900000).
[ 1927.225215] [drm] VRAM is lost due to GPU reset!
[ 1927.225367] [drm] PSP is resuming...
[ 1927.225371] sos fw version = 0x110043.
[ 1927.245401] [drm] reserve 0x400000 from 0xf41f800000 for PSP TMR
[ 1927.545277] SMU is resuming...
[ 1927.545337] SMU is resumed successfully!
[ 1927.730819] [drm] kiq ring mec 2 pipe 1 q 0
[ 1927.877005] amdgpu 0000:03:00.0: [drm:amdgpu_ring_test_helper [amdgpu]]
*ERROR* ring sdma0 test failed (-110)
[ 1927.877071] [drm:amdgpu_device_ip_resume_phase2 [amdgpu]] *ERROR* resume of
IP block <sdma_v4_0> failed -110
[ 1927.877127] amdgpu 0000:03:00.0: GPU reset(1) failed
[ 1927.877143] amdgpu 0000:03:00.0: GPU reset end with ret = -110

-- 
You are receiving this mail because:
You are watching the assignee of the bug.
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
