Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 05F972C4F10
	for <lists+dri-devel@lfdr.de>; Thu, 26 Nov 2020 08:02:48 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6FBD76E59D;
	Thu, 26 Nov 2020 07:02:45 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CFA3A6E59D
 for <dri-devel@lists.freedesktop.org>; Thu, 26 Nov 2020 07:02:44 +0000 (UTC)
From: bugzilla-daemon@bugzilla.kernel.org
Authentication-Results: mail.kernel.org;
 dkim=permerror (bad message/signature format)
To: dri-devel@lists.freedesktop.org
Subject: [Bug 210369] New: amdgpu fails to resume from suspend
Date: Thu, 26 Nov 2020 07:02:43 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: new
X-Bugzilla-Watch-Reason: AssignedTo drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Video(DRI - non Intel)
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: sevenever@gmail.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: bug_id short_desc product version
 cf_kernel_version rep_platform op_sys cf_tree bug_status bug_severity
 priority component assigned_to reporter cf_regression attachments.created
Message-ID: <bug-210369-2300@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=210369

            Bug ID: 210369
           Summary: amdgpu fails to resume from suspend
           Product: Drivers
           Version: 2.5
    Kernel Version: 5.9.10-050910-generic #202011221708
          Hardware: All
                OS: Linux
              Tree: Mainline
            Status: NEW
          Severity: normal
          Priority: P1
         Component: Video(DRI - non Intel)
          Assignee: drivers_video-dri@kernel-bugs.osdl.org
          Reporter: sevenever@gmail.com
        Regression: No

Created attachment 293817
  --> https://bugzilla.kernel.org/attachment.cgi?id=293817&action=edit
syslog

Computer fails to resume from suspend.
From the logs it looks like AMDGPU fails to resume.

It is a thinkpad T14 AMD APU R7 4750U, before suspend it is connected to an
external display via USB-C to miniDP adapter, after resuming the external
display is not light up.

repeated logs like below in syslog:
Nov 26 13:21:46 FengsTP kernel: [ 3977.841180] amdgpu 0000:07:00.0: amdgpu:
[gfxhub0] retry page fault (src_id:0 ring:0 vmid:6 pasid:32769, for process
Xorg pid 1831 thread Xorg:cs0 pid 1833)
Nov 26 13:21:46 FengsTP kernel: [ 3977.841182] amdgpu 0000:07:00.0: amdgpu:  
in page starting at address 0x000080010a004000 from client 27
Nov 26 13:21:46 FengsTP kernel: [ 3977.841184] amdgpu 0000:07:00.0: amdgpu:
VM_L2_PROTECTION_FAULT_STATUS:0x00601031
Nov 26 13:21:46 FengsTP kernel: [ 3977.841186] amdgpu 0000:07:00.0: amdgpu:    
 Faulty UTCL2 client ID: 0x8
Nov 26 13:21:46 FengsTP kernel: [ 3977.841187] amdgpu 0000:07:00.0: amdgpu:    
 MORE_FAULTS: 0x1
Nov 26 13:21:46 FengsTP kernel: [ 3977.841189] amdgpu 0000:07:00.0: amdgpu:    
 WALKER_ERROR: 0x0
Nov 26 13:21:46 FengsTP kernel: [ 3977.841191] amdgpu 0000:07:00.0: amdgpu:    
 PERMISSION_FAULTS: 0x3
Nov 26 13:21:46 FengsTP kernel: [ 3977.841193] amdgpu 0000:07:00.0: amdgpu:    
 MAPPING_ERROR: 0x0
Nov 26 13:21:46 FengsTP kernel: [ 3977.841195] amdgpu 0000:07:00.0: amdgpu:    
 RW: 0x0

-- 
You are receiving this mail because:
You are watching the assignee of the bug.
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
