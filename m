Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2058014178E
	for <lists+dri-devel@lfdr.de>; Sat, 18 Jan 2020 13:52:00 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5DA646E079;
	Sat, 18 Jan 2020 12:51:58 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E7EAE6E079
 for <dri-devel@lists.freedesktop.org>; Sat, 18 Jan 2020 12:51:56 +0000 (UTC)
From: bugzilla-daemon@bugzilla.kernel.org
Authentication-Results: mail.kernel.org;
 dkim=permerror (bad message/signature format)
To: dri-devel@lists.freedesktop.org
Subject: [Bug 206247] 5.4.x: WARNING: CPU: 1 PID: 561 at
 drivers/gpu/drm/amd/amdgpu/../display/dc/calcs/dcn_calcs.c:1464
 dcn_bw_update_from_pplib+0xa5/0x2e0 [amdgpu]
Date: Sat, 18 Jan 2020 12:51:56 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Video(DRI - non Intel)
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: udovdh@xs4all.nl
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-206247-2300-I9EO1vUw5e@https.bugzilla.kernel.org/>
In-Reply-To: <bug-206247-2300@https.bugzilla.kernel.org/>
References: <bug-206247-2300@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=206247

--- Comment #2 from udo (udovdh@xs4all.nl) ---
And:

[   37.213251] ---[ end trace fdc62e5509be6ed6 ]---
[   37.241010] [drm] DM_PPLIB: values for DCF clock
[   37.268901] [drm] DM_PPLIB:   300000 in kHz, 3099 in mV
[   37.299672] [drm] DM_PPLIB:   600000 in kHz, 3574 in mV
[   37.330452] [drm] DM_PPLIB:   626000 in kHz, 4250 in mV
[   37.361230] [drm] DM_PPLIB:   654000 in kHz, 4399 in mV
[   37.422755] [drm] Display Core initialized with v3.2.48!
[   37.479630] [drm] Supports vblank timestamp caching Rev 2 (21.10.2013).
[   37.519238] [drm] Driver supports precise vblank timestamp query.
[   37.559261] [drm] VCN decode and encode initialized successfully(under DPG
Mode).
[   37.606817] [drm] fb mappable at 0x60BC1000
[   37.631893] [drm] vram apper at 0x60000000
[   37.656429] [drm] size 33177600
[   37.675225] [drm] fb depth is 24
[   37.694545] [drm]    pitch is 15360
[   37.715700] fbcon: amdgpudrmfb (fb0) is primary device
[   37.760951] Console: switching to colour frame buffer device 480x135
[   37.855543] amdgpu 0000:0a:00.0: fb0: amdgpudrmfb frame buffer device
[   37.913255] amdgpu 0000:0a:00.0: ring gfx uses VM inv eng 0 on hub 0
[   37.913259] amdgpu 0000:0a:00.0: ring comp_1.0.0 uses VM inv eng 1 on hub 0
[   37.913262] amdgpu 0000:0a:00.0: ring comp_1.1.0 uses VM inv eng 4 on hub 0
[   37.913264] amdgpu 0000:0a:00.0: ring comp_1.2.0 uses VM inv eng 5 on hub 0
[   37.913266] amdgpu 0000:0a:00.0: ring comp_1.3.0 uses VM inv eng 6 on hub 0
[   37.913268] amdgpu 0000:0a:00.0: ring comp_1.0.1 uses VM inv eng 7 on hub 0
[   37.913271] amdgpu 0000:0a:00.0: ring comp_1.1.1 uses VM inv eng 8 on hub 0
[   37.913273] amdgpu 0000:0a:00.0: ring comp_1.2.1 uses VM inv eng 9 on hub 0
[   37.913275] amdgpu 0000:0a:00.0: ring comp_1.3.1 uses VM inv eng 10 on hub 0
[   37.913277] amdgpu 0000:0a:00.0: ring kiq_2.1.0 uses VM inv eng 11 on hub 0
[   37.913279] amdgpu 0000:0a:00.0: ring sdma0 uses VM inv eng 0 on hub 1
[   37.913281] amdgpu 0000:0a:00.0: ring vcn_dec uses VM inv eng 1 on hub 1
[   37.913283] amdgpu 0000:0a:00.0: ring vcn_enc0 uses VM inv eng 4 on hub 1
[   37.913285] amdgpu 0000:0a:00.0: ring vcn_enc1 uses VM inv eng 5 on hub 1
[   37.913288] amdgpu 0000:0a:00.0: ring vcn_jpeg uses VM inv eng 6 on hub 1
[   38.541203] [drm] Initialized amdgpu 3.35.0 20150101 for 0000:0a:00.0 on
minor 0

-- 
You are receiving this mail because:
You are watching the assignee of the bug.
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
