Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 167391E0E4B
	for <lists+dri-devel@lfdr.de>; Mon, 25 May 2020 14:21:17 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1CE0389D6C;
	Mon, 25 May 2020 12:21:15 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DBFAD89C54
 for <dri-devel@lists.freedesktop.org>; Mon, 25 May 2020 12:21:13 +0000 (UTC)
From: bugzilla-daemon@bugzilla.kernel.org
Authentication-Results: mail.kernel.org;
 dkim=permerror (bad message/signature format)
To: dri-devel@lists.freedesktop.org
Subject: [Bug 201957] amdgpu: ring gfx timeout
Date: Mon, 25 May 2020 12:21:12 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Video(DRI - non Intel)
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: blocking
X-Bugzilla-Who: udovdh@xs4all.nl
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: cc
Message-ID: <bug-201957-2300-7Y5ZaXgzam@https.bugzilla.kernel.org/>
In-Reply-To: <bug-201957-2300@https.bugzilla.kernel.org/>
References: <bug-201957-2300@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=201957

udo (udovdh@xs4all.nl) changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
                 CC|                            |udovdh@xs4all.nl

--- Comment #33 from udo (udovdh@xs4all.nl) ---
I still see them on 5.6.13:

[191571.372560] sd 11:0:0:0: [sde] Synchronize Cache(10) failed: Result:
hostbyte=0x01 driverbyte=0x00
[205796.424607] [drm:amdgpu_job_timedout [amdgpu]] *ERROR* ring sdma0 timeout,
signaled seq=4518280, emitted seq=4518282
[205796.424637] [drm:amdgpu_job_timedout [amdgpu]] *ERROR* Process information:
process mpv pid 488243 thread mpv:cs0 pid 488257
[205796.424640] amdgpu 0000:0a:00.0: GPU reset begin!
[205800.840504] [drm:amdgpu_dm_atomic_commit_tail [amdgpu]] *ERROR* Waiting for
fences timed out!
[205800.937565] amdgpu 0000:0a:00.0: GPU reset succeeded, trying to resume
[205800.938060] [drm] PCIE GART of 1024M enabled (table at 0x000000F400900000).
[205800.938849] [drm] PSP is resuming...
[205800.958729] [drm] reserve 0x400000 from 0xf47f800000 for PSP TMR
[205800.972414] [drm] psp command (0x5) failed and response status is
(0xFFFF0007)
[205801.176411] amdgpu 0000:0a:00.0: RAS: ras ta ucode is not available
[205801.460775] [drm] kiq ring mec 2 pipe 1 q 0
[205801.460986] amdgpu 0000:0a:00.0: AMD-Vi: Event logged [IO_PAGE_FAULT
domain=0x0002 address=0x800002300 flags=0x0000]
[205801.516698] [drm] VCN decode and encode initialized successfully(under DPG
Mode).
[205801.516709] amdgpu 0000:0a:00.0: ring gfx uses VM inv eng 0 on hub 0
[205801.516713] amdgpu 0000:0a:00.0: ring comp_1.0.0 uses VM inv eng 1 on hub 0
[205801.516717] amdgpu 0000:0a:00.0: ring comp_1.1.0 uses VM inv eng 4 on hub 0
[205801.516720] amdgpu 0000:0a:00.0: ring comp_1.2.0 uses VM inv eng 5 on hub 0
[205801.516724] amdgpu 0000:0a:00.0: ring comp_1.3.0 uses VM inv eng 6 on hub 0
[205801.516727] amdgpu 0000:0a:00.0: ring comp_1.0.1 uses VM inv eng 7 on hub 0
[205801.516730] amdgpu 0000:0a:00.0: ring comp_1.1.1 uses VM inv eng 8 on hub 0
[205801.516733] amdgpu 0000:0a:00.0: ring comp_1.2.1 uses VM inv eng 9 on hub 0
[205801.516736] amdgpu 0000:0a:00.0: ring comp_1.3.1 uses VM inv eng 10 on hub
0
[205801.516740] amdgpu 0000:0a:00.0: ring kiq_2.1.0 uses VM inv eng 11 on hub 0
[205801.516743] amdgpu 0000:0a:00.0: ring sdma0 uses VM inv eng 0 on hub 1
[205801.516746] amdgpu 0000:0a:00.0: ring vcn_dec uses VM inv eng 1 on hub 1
[205801.516749] amdgpu 0000:0a:00.0: ring vcn_enc0 uses VM inv eng 4 on hub 1
[205801.516752] amdgpu 0000:0a:00.0: ring vcn_enc1 uses VM inv eng 5 on hub 1
[205801.516755] amdgpu 0000:0a:00.0: ring jpeg_dec uses VM inv eng 6 on hub 1
[205801.525996] [drm] recover vram bo from shadow start
[205801.525998] [drm] recover vram bo from shadow done
[205801.526008] [drm] Skip scheduling IBs!
[205801.526051] amdgpu 0000:0a:00.0: GPU reset(1) succeeded!
[205802.536444] [drm:amdgpu_job_timedout [amdgpu]] *ERROR* ring sdma0 timeout,
signaled seq=4518342, emitted seq=4518344
[205802.536523] [drm:amdgpu_job_timedout [amdgpu]] *ERROR* Process information:
process gnome-shell pid 3825 thread gnome-shel:cs0 pid 3834
[205802.536531] amdgpu 0000:0a:00.0: GPU reset begin!
[205806.728558] [drm:amdgpu_dm_atomic_commit_tail [amdgpu]] *ERROR* Waiting for
fences timed out!
[205806.821326] amdgpu 0000:0a:00.0: GPU reset succeeded, trying to resume
[205806.821578] [drm] PCIE GART of 1024M enabled (table at 0x000000F400900000).
[205806.821899] [drm] PSP is resuming...
[205806.841769] [drm] reserve 0x400000 from 0xf47f800000 for PSP TMR
[205806.856213] [drm] psp command (0x5) failed and response status is
(0xFFFF0007)
[205807.072210] amdgpu 0000:0a:00.0: RAS: ras ta ucode is not available
[205807.355997] [drm] kiq ring mec 2 pipe 1 q 0
[205807.356308] amdgpu 0000:0a:00.0: AMD-Vi: Event logged [IO_PAGE_FAULT
domain=0x0002 address=0x800072f00 flags=0x0000]
[205807.409389] [drm] VCN decode and encode initialized successfully(under DPG
Mode).
[205807.409401] amdgpu 0000:0a:00.0: ring gfx uses VM inv eng 0 on hub 0
[205807.409406] amdgpu 0000:0a:00.0: ring comp_1.0.0 uses VM inv eng 1 on hub 0
[205807.409410] amdgpu 0000:0a:00.0: ring comp_1.1.0 uses VM inv eng 4 on hub 0
[205807.409415] amdgpu 0000:0a:00.0: ring comp_1.2.0 uses VM inv eng 5 on hub 0
[205807.409418] amdgpu 0000:0a:00.0: ring comp_1.3.0 uses VM inv eng 6 on hub 0
[205807.409422] amdgpu 0000:0a:00.0: ring comp_1.0.1 uses VM inv eng 7 on hub 0
[205807.409425] amdgpu 0000:0a:00.0: ring comp_1.1.1 uses VM inv eng 8 on hub 0
[205807.409429] amdgpu 0000:0a:00.0: ring comp_1.2.1 uses VM inv eng 9 on hub 0
[205807.409432] amdgpu 0000:0a:00.0: ring comp_1.3.1 uses VM inv eng 10 on hub
0
[205807.409436] amdgpu 0000:0a:00.0: ring kiq_2.1.0 uses VM inv eng 11 on hub 0
[205807.409440] amdgpu 0000:0a:00.0: ring sdma0 uses VM inv eng 0 on hub 1
[205807.409444] amdgpu 0000:0a:00.0: ring vcn_dec uses VM inv eng 1 on hub 1
[205807.409447] amdgpu 0000:0a:00.0: ring vcn_enc0 uses VM inv eng 4 on hub 1
[205807.409451] amdgpu 0000:0a:00.0: ring vcn_enc1 uses VM inv eng 5 on hub 1
[205807.409454] amdgpu 0000:0a:00.0: ring jpeg_dec uses VM inv eng 6 on hub 1
[205807.418547] [drm] recover vram bo from shadow start
[205807.418549] [drm] recover vram bo from shadow done
[205807.418567] [drm] Skip scheduling IBs!
[205807.418569] [drm] Skip scheduling IBs!
[205807.418592] [drm] Skip scheduling IBs!
[205807.418613] amdgpu 0000:0a:00.0: GPU reset(2) succeeded!
[205808.428469] [drm:amdgpu_job_timedout [amdgpu]] *ERROR* ring gfx timeout,
but soft recovered
[205809.458201] [drm:amdgpu_job_timedout [amdgpu]] *ERROR* ring gfx timeout,
signaled seq=11463546, emitted seq=11463549
[205809.458282] [drm:amdgpu_job_timedout [amdgpu]] *ERROR* Process information:
process Xorg pid 3513 thread Xorg:cs0 pid 3514
[205809.458289] amdgpu 0000:0a:00.0: GPU reset begin!
[205812.872123] [drm:amdgpu_dm_atomic_commit_tail [amdgpu]] *ERROR* Waiting for
fences timed out!
[205812.981471] amdgpu 0000:0a:00.0: GPU reset succeeded, trying to resume
[205812.981823] [drm] PCIE GART of 1024M enabled (table at 0x000000F400900000).
[205812.982264] [drm] PSP is resuming...
[205813.002134] [drm] reserve 0x400000 from 0xf47f800000 for PSP TMR
[205813.012088] [drm] psp command (0x5) failed and response status is
(0xFFFF0007)
[205813.208005] amdgpu 0000:0a:00.0: RAS: ras ta ucode is not available
[205813.497603] [drm] kiq ring mec 2 pipe 1 q 0
[205813.551494] [drm] VCN decode and encode initialized successfully(under DPG
Mode).
[205813.551506] amdgpu 0000:0a:00.0: ring gfx uses VM inv eng 0 on hub 0
[205813.551510] amdgpu 0000:0a:00.0: ring comp_1.0.0 uses VM inv eng 1 on hub 0
[205813.551514] amdgpu 0000:0a:00.0: ring comp_1.1.0 uses VM inv eng 4 on hub 0
[205813.551517] amdgpu 0000:0a:00.0: ring comp_1.2.0 uses VM inv eng 5 on hub 0
[205813.551520] amdgpu 0000:0a:00.0: ring comp_1.3.0 uses VM inv eng 6 on hub 0
[205813.551524] amdgpu 0000:0a:00.0: ring comp_1.0.1 uses VM inv eng 7 on hub 0
[205813.551526] amdgpu 0000:0a:00.0: ring comp_1.1.1 uses VM inv eng 8 on hub 0
[205813.551529] amdgpu 0000:0a:00.0: ring comp_1.2.1 uses VM inv eng 9 on hub 0
[205813.551532] amdgpu 0000:0a:00.0: ring comp_1.3.1 uses VM inv eng 10 on hub
0
[205813.551535] amdgpu 0000:0a:00.0: ring kiq_2.1.0 uses VM inv eng 11 on hub 0
[205813.551538] amdgpu 0000:0a:00.0: ring sdma0 uses VM inv eng 0 on hub 1
[205813.551541] amdgpu 0000:0a:00.0: ring vcn_dec uses VM inv eng 1 on hub 1
[205813.551543] amdgpu 0000:0a:00.0: ring vcn_enc0 uses VM inv eng 4 on hub 1
[205813.551546] amdgpu 0000:0a:00.0: ring vcn_enc1 uses VM inv eng 5 on hub 1
[205813.551549] amdgpu 0000:0a:00.0: ring jpeg_dec uses VM inv eng 6 on hub 1
[205902.384966] traps: Bluez D-Bus thr[409727] trap invalid opcode
ip:555cd19202af sp:7f265cf9de10 error:0 in skypeforlinux[555ccfa02000+542a000]

-- 
You are receiving this mail because:
You are watching the assignee of the bug.
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
