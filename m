Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 4C49C222B16
	for <lists+dri-devel@lfdr.de>; Thu, 16 Jul 2020 20:37:11 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DA8606E06E;
	Thu, 16 Jul 2020 18:37:06 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BE74D6E06E
 for <dri-devel@lists.freedesktop.org>; Thu, 16 Jul 2020 18:37:05 +0000 (UTC)
From: bugzilla-daemon@bugzilla.kernel.org
Authentication-Results: mail.kernel.org;
 dkim=permerror (bad message/signature format)
To: dri-devel@lists.freedesktop.org
Subject: [Bug 208587] New: amdgpu hang and gnome shell crash if playing video
 on 5600M with DRI_PRIME
Date: Thu, 16 Jul 2020 18:37:05 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: new
X-Bugzilla-Watch-Reason: AssignedTo drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Video(DRI - non Intel)
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: dani@rodler-keller.de
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: bug_id short_desc product version
 cf_kernel_version rep_platform op_sys cf_tree bug_status bug_severity
 priority component assigned_to reporter cf_regression attachments.created
Message-ID: <bug-208587-2300@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=208587

            Bug ID: 208587
           Summary: amdgpu hang and gnome shell crash if playing video on
                    5600M with DRI_PRIME
           Product: Drivers
           Version: 2.5
    Kernel Version: 5.8.0-rc5
          Hardware: x86-64
                OS: Linux
              Tree: Mainline
            Status: NEW
          Severity: normal
          Priority: P1
         Component: Video(DRI - non Intel)
          Assignee: drivers_video-dri@kernel-bugs.osdl.org
          Reporter: dani@rodler-keller.de
        Regression: No

Created attachment 290321
  --> https://bugzilla.kernel.org/attachment.cgi?id=290321&action=edit
dmesg

On my Dell Inc. G5 5505 the Gnome Shell Wayland session crashes when I try to
watch a video with "DRI_PRIME=1 firefox" on the AMD 5600M I get the following
kernel error messages

[Do Jul 16 20:16:03 2020] [drm:mod_hdcp_add_display_to_topology [amdgpu]]
*ERROR* Failed to add display topology, DTM TA is not initialized.
[Do Jul 16 20:16:03 2020] [drm] [Link 0] WARNING MOD_HDCP_STATUS_FAILURE IN
STATE HDCP_UNINITIALIZED STAY COUNT 0
[Do Jul 16 20:16:03 2020] ------------[ cut here ]------------
[Do Jul 16 20:16:03 2020] WARNING: CPU: 7 PID: 181 at
drivers/gpu/drm/amd/amdgpu/../display/dc/dcn20/dcn20_resource.c:3194
dcn20_validate_bandwidth_fp+0x7a/0xb0 [amdgpu]

CPU Brand:  AMD Ryzen 7 4800H with Radeon Graphics   

Operating System Version:
    "Arch Linux" (64 bit)
    Kernel Name:  Linux
    Kernel Version:  5.8.0-rc5-1-mainline
    Window Manager:  GNOME Shell (Wayland)
    Firefox 78

DRI_PRIME=1 glxinfo

Device: AMD Radeon RX 5600M (NAVI10, DRM 3.38.0, 5.8.0-rc5-1-mainline, LLVM
10.0.0) (0x731f)
    Version: 20.1.3

DRI_PRIME=0 glxinfo

    Device: AMD RENOIR (DRM 3.38.0, 5.8.0-rc5-1-mainline, LLVM 10.0.0) (0x1636)
    Version: 20.1.3

-- 
You are receiving this mail because:
You are watching the assignee of the bug.
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
