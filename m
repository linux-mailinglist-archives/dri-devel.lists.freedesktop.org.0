Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DCE6C1C6AA4
	for <lists+dri-devel@lfdr.de>; Wed,  6 May 2020 09:58:16 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EACD789EA6;
	Wed,  6 May 2020 07:58:14 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D0DE289EAC
 for <dri-devel@lists.freedesktop.org>; Wed,  6 May 2020 07:58:13 +0000 (UTC)
From: bugzilla-daemon@bugzilla.kernel.org
Authentication-Results: mail.kernel.org;
 dkim=permerror (bad message/signature format)
To: dri-devel@lists.freedesktop.org
Subject: [Bug 207595] New: [amdgpu] Displayport MST not functional on AMD
 Stoney
Date: Wed, 06 May 2020 07:58:13 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: new
X-Bugzilla-Watch-Reason: AssignedTo drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Video(DRI - non Intel)
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: jjo.braun@gmail.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: bug_id short_desc product version
 cf_kernel_version rep_platform op_sys cf_tree bug_status bug_severity
 priority component assigned_to reporter cf_regression attachments.created
Message-ID: <bug-207595-2300@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=207595

            Bug ID: 207595
           Summary: [amdgpu] Displayport MST not functional on AMD Stoney
           Product: Drivers
           Version: 2.5
    Kernel Version: 5.4.28, 5.4.36
          Hardware: All
                OS: Linux
              Tree: Mainline
            Status: NEW
          Severity: normal
          Priority: P1
         Component: Video(DRI - non Intel)
          Assignee: drivers_video-dri@kernel-bugs.osdl.org
          Reporter: jjo.braun@gmail.com
        Regression: No

Created attachment 288939
  --> https://bugzilla.kernel.org/attachment.cgi?id=288939&action=edit
lspci output of Lenovo 14w notebook with stoney gpu

Hello,

I do have some issues running a Lenovo 14w notebook in a multi monitor setup.
The displays are connected as followed:

[Lenovo 14w]--(USB-C)-->[Dell U2719DC]--(Display Port)-->[Some other display]

The second display is not connected directly to the notebook. This display is
connected to the monitor output of the Dell display. The Dell display is
configured to use MST and this setup was successfully validated with a Windows
10 installation.

When I plug the Dell 2719DC with the daisy chained monitor via USB-C to the
notebook, the screens are staying black and I get crash of the amdgpu driver in
dmesg. Kernel logs (5.4.28 and 5.4.36) are attached.

My system is currently based on kernel 5.4.28. But I did checked also the
latest kernel version in the 5.4 LTS tree which was 5.4.36. The same error is
reproducable under Ubuntu 20.04 which is based on kernel 5.4.0.

If MST is disabled in the Dell 2719DC, it works as expected. My intenal
notebook screen is expanded with the USB-C connected Dell U2719DC. And the
third monitor is in clone mode with the Dell U2719DC.

Thank you for reading and kind regards,
Johannes Braun

-- 
You are receiving this mail because:
You are watching the assignee of the bug.
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
