Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id BBC442B2E84
	for <lists+dri-devel@lfdr.de>; Sat, 14 Nov 2020 17:45:55 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AC7B86E933;
	Sat, 14 Nov 2020 16:45:53 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 34E356E933
 for <dri-devel@lists.freedesktop.org>; Sat, 14 Nov 2020 16:45:52 +0000 (UTC)
From: bugzilla-daemon@bugzilla.kernel.org
Authentication-Results: mail.kernel.org;
 dkim=permerror (bad message/signature format)
To: dri-devel@lists.freedesktop.org
Subject: [Bug 210201] New: [amdpgu] crash when playing after suspend/resume
Date: Sat, 14 Nov 2020 16:45:51 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: new
X-Bugzilla-Watch-Reason: AssignedTo drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Video(DRI - non Intel)
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: arturbac.ab@gmail.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: bug_id short_desc product version
 cf_kernel_version rep_platform op_sys cf_tree bug_status bug_severity
 priority component assigned_to reporter cf_regression attachments.created
Message-ID: <bug-210201-2300@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=210201

            Bug ID: 210201
           Summary: [amdpgu] crash when playing after suspend/resume
           Product: Drivers
           Version: 2.5
    Kernel Version: 5.9.8, 5.6.19, 5.8.18
          Hardware: x86-64
                OS: Linux
              Tree: Mainline
            Status: NEW
          Severity: normal
          Priority: P1
         Component: Video(DRI - non Intel)
          Assignee: drivers_video-dri@kernel-bugs.osdl.org
          Reporter: arturbac.ab@gmail.com
        Regression: No

Created attachment 293669
  --> https://bugzilla.kernel.org/attachment.cgi?id=293669&action=edit
Full dmesg after video crash

When i play vulkan games, like Kerbal Space Program, ReadDeadRedemption2(via
Proton) after i return from suspend, after runing them after 30min - 1h
graphics driver crashes.



OS: Gentoo 
Kernel: x86_64 Linux 5.9.8
Resolution: 7680x2160 (2 monitors attached 4K free sync)
DE: KDE 5.75.0 / Plasma 5.20.3
WM: KWin
GTK Theme: Adwaita [GTK2/3]
CPU: AMD Ryzen 9 3900X 12-Core @ 24x 3.8GHz
GPU: AMD Radeon RX 5700 XT (NAVI10, DRM 3.39.0, 5.9.8, LLVM 10.0.1) Mesa 20.2.2
RAM: 32038MiB

Full dmesg attached.

[104307.850190] amdgpu 0000:0f:00.0: amdgpu: ring gfx_0.0.0 uses VM inv eng 0
on hub 0
[104307.850192] amdgpu 0000:0f:00.0: amdgpu: ring comp_1.0.0 uses VM inv eng 1
on hub 0
[104307.850194] amdgpu 0000:0f:00.0: amdgpu: ring comp_1.1.0 uses VM inv eng 4
on hub 0
[104307.850195] amdgpu 0000:0f:00.0: amdgpu: ring comp_1.2.0 uses VM inv eng 5
on hub 0
[104307.850196] amdgpu 0000:0f:00.0: amdgpu: ring comp_1.3.0 uses VM inv eng 6
on hub 0
[104307.850198] amdgpu 0000:0f:00.0: amdgpu: ring comp_1.0.1 uses VM inv eng 7
on hub 0
[104307.850199] amdgpu 0000:0f:00.0: amdgpu: ring comp_1.1.1 uses VM inv eng 8
on hub 0
[104307.850201] amdgpu 0000:0f:00.0: amdgpu: ring comp_1.2.1 uses VM inv eng 9
on hub 0
[104307.850202] amdgpu 0000:0f:00.0: amdgpu: ring comp_1.3.1 uses VM inv eng 10
on hub 0
[104307.850203] amdgpu 0000:0f:00.0: amdgpu: ring kiq_2.1.0 uses VM inv eng 11
on hub 0
[104307.850205] amdgpu 0000:0f:00.0: amdgpu: ring sdma0 uses VM inv eng 12 on
hub 0
[104307.850206] amdgpu 0000:0f:00.0: amdgpu: ring sdma1 uses VM inv eng 13 on
hub 0
[104307.850208] amdgpu 0000:0f:00.0: amdgpu: ring vcn_dec uses VM inv eng 0 on
hub 1
[104307.850209] amdgpu 0000:0f:00.0: amdgpu: ring vcn_enc0 uses VM inv eng 1 on
hub 1
[104307.850210] amdgpu 0000:0f:00.0: amdgpu: ring vcn_enc1 uses VM inv eng 4 on
hub 1
[104307.850212] amdgpu 0000:0f:00.0: amdgpu: ring jpeg_dec uses VM inv eng 5 on
hub 1
[104307.852128] [drm] recover vram bo from shadow start
[104307.872340] [drm] recover vram bo from shadow done
[104307.872342] [drm] Skip scheduling IBs!
[104307.872343] [drm] Skip scheduling IBs!
[104307.872357] [drm] Skip scheduling IBs!
[104307.872362] amdgpu 0000:0f:00.0: amdgpu: GPU reset(2) succeeded!
[104307.872373] [drm] Skip scheduling IBs!
[repeated many times...]
[104307.872440] [drm] Skip scheduling IBs!
[104314.769174] [drm:amdgpu_gem_va_ioctl [amdgpu]] *ERROR* Couldn't update
BO_VA (-16)
[104314.795600] [drm:amdgpu_gem_va_ioctl [amdgpu]] *ERROR* Couldn't update
BO_VA (-16)
[104314.847946] amdgpu 0000:0f:00.0: amdgpu: failed to clear page tables on GEM
object close (-16)
[repeated many times...]
[104315.300254] amdgpu 0000:0f:00.0: amdgpu: failed to clear page tables on GEM
object close (-16)
[104325.487235] GpuWatchdog[731778]: segfault at 0 ip 00007f9be2bf92dd sp
00007f9bd77ed670 error 6 in libcef.so[7f9bdee73000+69a4000]
[104325.488266] Code: 00 79 09 48 8b 7d a0 e8 21 80 c1 02 41 8b 85 00 01 00 00
85 c0 0f 84 ab 00 00 00 49 8b 45 00 4c 89 ef be 01 00 00 00 ff 50 58 <c7> 04 25
00 00 00 00 37 13 00 00 c6 05 c1 a5 37 03 01 80 bd 7f ff
[104335.590624] GpuWatchdog[731809]: segfault at 0 ip 00007f494f6142dd sp
00007f4944208670 error 6 in libcef.so[7f494b88e000+69a4000]
[104335.590631] Code: 00 79 09 48 8b 7d a0 e8 21 80 c1 02 41 8b 85 00 01 00 00
85 c0 0f 84 ab 00 00 00 49 8b 45 00 4c 89 ef be 01 00 00 00 ff 50 58 <c7> 04 25
00 00 00 00 37 13 00 00 c6 05 c1 a5 37 03 01 80 bd 7f ff
[104345.690401] GpuWatchdog[731833]: segfault at 0 ip 00007fcbb4c722dd sp
00007fcba9866670 error 6 in libcef.so[7fcbb0eec000+69a4000]
[104345.692176] Code: 00 79 09 48 8b 7d a0 e8 21 80 c1 02 41 8b 85 00 01 00 00
85 c0 0f 84 ab 00 00 00 49 8b 45 00 4c 89 ef be 01 00 00 00 ff 50 58 <c7> 04 25
00 00 00 00 37 13 00 00 c6 05 c1 a5 37 03 01 80 bd 7f ff

-- 
You are receiving this mail because:
You are watching the assignee of the bug.
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
