Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 933A44D16B6
	for <lists+dri-devel@lfdr.de>; Tue,  8 Mar 2022 12:55:30 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 54F1810E5E6;
	Tue,  8 Mar 2022 11:55:27 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C5B6110E359
 for <dri-devel@lists.freedesktop.org>; Tue,  8 Mar 2022 11:55:25 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 211E7616C1
 for <dri-devel@lists.freedesktop.org>; Tue,  8 Mar 2022 11:55:25 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 86EA7C340F9
 for <dri-devel@lists.freedesktop.org>; Tue,  8 Mar 2022 11:55:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1646740524;
 bh=f16WRJmmYtTQs8oQmR2t+pYbGfUEHGRe1CSuMHeChko=;
 h=From:To:Subject:Date:From;
 b=jvVQMvjHuDL7CD+VZ+Lh6aYbRYfqZ/WPlyeZ5OYcWOixKiuGS+308YnW7kSWsibdJ
 0eOfp37AEUmmy8Pj+YdlxRL5lWSVjRgibkyIRr+T3eR/uvCJ0d28e0Ry/6MSJlNg6c
 hxDxpiJb+gWymn3whRXN/dLXED+EwVknVWIak1FlPVsXL9JoPfk2/cMFKoToidzLmw
 u19hZZbNv1YFRP/ohVHmJtUX81HM15CL2L2OBNlw+BCWi9lTd87/L5qMP075BXOsnX
 /9buXk92eABJh1lptzu7RWe/hpUv4Gtr3F7eyWDmsCEI9JEutaH2ai6B7YW4jH6DP3
 zdZKk+qWn4eww==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix,
 from userid 48) id 7531FC05F98; Tue,  8 Mar 2022 11:55:24 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 215669] New: [drm:gfx_v10_0_priv_reg_irq [amdgpu]] *ERROR*
 Illegal register access in command stream
Date: Tue, 08 Mar 2022 11:55:23 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: new
X-Bugzilla-Watch-Reason: AssignedTo drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Video(DRI - non Intel)
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: andreas.polnas93@hotmail.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: bug_id short_desc product version
 cf_kernel_version rep_platform op_sys cf_tree bug_status bug_severity
 priority component assigned_to reporter cf_regression
Message-ID: <bug-215669-2300@https.bugzilla.kernel.org/>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

https://bugzilla.kernel.org/show_bug.cgi?id=3D215669

            Bug ID: 215669
           Summary: [drm:gfx_v10_0_priv_reg_irq [amdgpu]] *ERROR* Illegal
                    register access in command stream
           Product: Drivers
           Version: 2.5
    Kernel Version: 5.10.103-1-MANJARO x86_64 GNU/Linux
          Hardware: All
                OS: Linux
              Tree: Mainline
            Status: NEW
          Severity: normal
          Priority: P1
         Component: Video(DRI - non Intel)
          Assignee: drivers_video-dri@kernel-bugs.osdl.org
          Reporter: andreas.polnas93@hotmail.com
        Regression: No

Hardware specs:
CPU: Intel(R) Core(TM) i7-4770K
Motherboard Z97-S02 (MS-7821)
GPU: Radeon RX 5500/5500M / Pro 5500M

When playing Elden ring on Linux I have gotten following issue today:

mar 08 12:31:46 Manjaro-desktop kernel: [drm:gfx_v10_0_priv_reg_irq [amdgpu=
]]
*ERROR* Illegal register access in command stream
mar 08 12:31:46 Manjaro-desktop kernel: [drm:amdgpu_job_timedout [amdgpu]]
*ERROR* ring gfx_0.0.0 timeout, signaled seq=3D2590353, emitted seq=3D25903=
55
mar 08 12:31:46 Manjaro-desktop kernel: [drm:amdgpu_job_timedout [amdgpu]]
*ERROR* Process information: process eldenring.exe pid 3576 thread
eldenring.exe pid 3687
mar 08 12:31:50 Manjaro-desktop kernel: amdgpu 0000:03:00.0:
[drm:amdgpu_ring_test_helper [amdgpu]] *ERROR* ring kiq_2.1.0 test failed
(-110)
mar 08 12:31:50 Manjaro-desktop kernel: [drm:gfx_v10_0_hw_fini [amdgpu]]
*ERROR* KGQ disable failed
mar 08 12:31:51 Manjaro-desktop kernel: amdgpu 0000:03:00.0:
[drm:amdgpu_ring_test_helper [amdgpu]] *ERROR* ring kiq_2.1.0 test failed
(-110)
mar 08 12:31:51 Manjaro-desktop kernel: [drm:gfx_v10_0_hw_fini [amdgpu]]
*ERROR* KCQ disable failed
mar 08 12:31:51 Manjaro-desktop kernel: [drm:gfx_v10_0_hw_fini [amdgpu]]
*ERROR* failed to halt cp gfx
mar 08 12:31:53 Manjaro-desktop kernel: [drm:amdgpu_cs_ioctl [amdgpu]] *ERR=
OR*
Failed to initialize parser -125!
mar 08 12:31:53 Manjaro-desktop kernel: [drm:amdgpu_cs_ioctl [amdgpu]] *ERR=
OR*
Failed to initialize parser -125!
mar 08 12:31:53 Manjaro-desktop kernel: [drm:amdgpu_dm_atomic_commit_tail
[amdgpu]] *ERROR* got no status for stream 00000000a096b549 on
acrtc0000000023c89ab0
mar 08 12:32:04 Manjaro-desktop kernel:
[drm:drm_atomic_helper_wait_for_flip_done [drm_kms_helper]] *ERROR*
[CRTC:66:crtc-0] flip_done timed out
mar 08 12:32:04 Manjaro-desktop kernel: [drm:amdgpu_dm_atomic_check [amdgpu=
]]
*ERROR* [CRTC:66:crtc-0] hw_done or flip_done timed out
mar 08 12:32:04 Manjaro-desktop kernel: [drm:amdgpu_cs_ioctl [amdgpu]] *ERR=
OR*
Failed to initialize parser -125!
mar 08 12:32:14 Manjaro-desktop kernel:
[drm:drm_atomic_helper_wait_for_flip_done [drm_kms_helper]] *ERROR*
[CRTC:69:crtc-1] flip_done timed out

The screen goes haywire with the colors and im unable to recover from this =
as
the computer freezes, only way to recover is by forcefully rebooting the
machine.

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
