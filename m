Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CBB892901DF
	for <lists+dri-devel@lfdr.de>; Fri, 16 Oct 2020 11:31:03 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C9D7F6E0FB;
	Fri, 16 Oct 2020 09:31:01 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E57126E0FB
 for <dri-devel@lists.freedesktop.org>; Fri, 16 Oct 2020 09:31:00 +0000 (UTC)
From: bugzilla-daemon@bugzilla.kernel.org
Authentication-Results: mail.kernel.org;
 dkim=permerror (bad message/signature format)
To: dri-devel@lists.freedesktop.org
Subject: =?UTF-8?B?W0J1ZyAyMDk3MTNdIE5ldzogYW1kZ3B1IGRyaXZlcnMvZ3B1L2Ry?=
 =?UTF-8?B?bS9hbWQvYW1kZ3B1Ly4uL2Rpc3BsYXkvZGMvZGNuMTAvZGNuMTBfbGlua19l?=
 =?UTF-8?B?bmNvZGVyLmM6NDgzIGRjbjEwX2dldF9kaWdfZnJvbnRlbmQrMHg5ZS8weGMw?=
 =?UTF-8?B?IFthbWRncHVdIHdoZW4gcmVzdW1pbmcgZnJvbSBTMyBzdGF0ZQ==?=
Date: Fri, 16 Oct 2020 09:31:00 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: new
X-Bugzilla-Watch-Reason: AssignedTo drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Video(DRI - non Intel)
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: low
X-Bugzilla-Who: samy@lahfa.xyz
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: bug_id short_desc product version
 cf_kernel_version rep_platform op_sys cf_tree bug_status bug_severity
 priority component assigned_to reporter cf_regression attachments.created
Message-ID: <bug-209713-2300@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=209713

            Bug ID: 209713
           Summary: amdgpu
                    drivers/gpu/drm/amd/amdgpu/../display/dc/dcn10/dcn10_l
                    ink_encoder.c:483 dcn10_get_dig_frontend+0x9e/0xc0
                    [amdgpu] when resuming from S3 state
           Product: Drivers
           Version: 2.5
    Kernel Version: 5.8.13-arch1-1
          Hardware: x86-64
                OS: Linux
              Tree: Mainline
            Status: NEW
          Severity: low
          Priority: P1
         Component: Video(DRI - non Intel)
          Assignee: drivers_video-dri@kernel-bugs.osdl.org
          Reporter: samy@lahfa.xyz
        Regression: No

Created attachment 293025
  --> https://bugzilla.kernel.org/attachment.cgi?id=293025&action=edit
parts of dmesg where the call trace happens during the resume from S3 sleep
state.

I'm thinking that this bug is a regression since I haven't seen this call trace
before on kernel older than 5.8.12-arch1-1 but I have yet to confirm this.

The call trace may also happen only in a very specific way, my current computer
has a USB-C Dock that is plugged in and the call trace happened when the USB-C
was plugged in and the computer was suspended, then resumed.

It is a Lenovo Thinkpad T495 model 20NKS28F00 with an AMD Ryzen 7 3700U and a
Vega Radeon RX 10.

Further comments will confirm if the call trace happens only when the USB-C
Dock is plugged.

As well as if this call trace happens on kernels older than 5.8.12-arch1-1.

The computer does resume successfully and there is a like a minor screen glitch
for a millisecond so it's not a very severe bug.

-- 
You are receiving this mail because:
You are watching the assignee of the bug.
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
