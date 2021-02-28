Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id BA288327239
	for <lists+dri-devel@lfdr.de>; Sun, 28 Feb 2021 13:35:16 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 049606E1B4;
	Sun, 28 Feb 2021 12:35:12 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C0D8B6E1B4
 for <dri-devel@lists.freedesktop.org>; Sun, 28 Feb 2021 12:35:10 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPS id 83D0464EDD
 for <dri-devel@lists.freedesktop.org>; Sun, 28 Feb 2021 12:35:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1614515710;
 bh=WtLkUD4TNSQYqROHn4+BA1ODT79gGUOk9kuaOp8yfCQ=;
 h=From:To:Subject:Date:In-Reply-To:References:From;
 b=CspfU+jMdzdZoxc7KymHXk8v0eWubxqls/g7Pb0Db3mdA0y//hmHaF0LG8iEPm0h0
 Zo4Yj63Xj42d46bRXSh0AJ4Rb9DPNtmSpD6VYSR3n+eJx2eOZoIjjxSeSf7A7HiJL9
 k2UAWDcy4tHUq9p1QIxuEAFA4YZYP1JPrYpK7f2g+T+EHolxaZT7kYVkR04i/B2HaN
 682rDuQm+KF5BszDdiT5NcO2KrVsAVBG04a0w1Izk6gn4ulCv/xjPKVUTkEqNowAop
 ebYu6+U6/k0waW5zcuQxtOpXvjlylKq2/YXn7fsLIEYWCOiw7Rhy4QcoYWQ33dp33n
 cHZWfckQN6hYQ==
Received: by pdx-korg-bugzilla-2.web.codeaurora.org (Postfix, from userid 48)
 id 7A84B65356; Sun, 28 Feb 2021 12:35:10 +0000 (UTC)
From: bugzilla-daemon@bugzilla.kernel.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 201957] amdgpu: ring gfx timeout
Date: Sun, 28 Feb 2021 12:35:08 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Video(DRI - non Intel)
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: blocking
X-Bugzilla-Who: fice@inbox.ru
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: cc
Message-ID: <bug-201957-2300-2UzS8DeTOy@https.bugzilla.kernel.org/>
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

Fice (fice@inbox.ru) changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
                 CC|                            |fice@inbox.ru

--- Comment #46 from Fice (fice@inbox.ru) ---
(In reply to MajorGonzo from comment #44)
> Here's another thing I tried which also may have made a difference.  Gonna
> sound weird, but worth a try.  I had a 675VA UPS that my system was plugged
> into.  One time, it started shrieking (weird beepish sounds) as I was doing
> heavy gaming with lots of visual effects going on.  I looked it up, and it
> seems that if your UPS, or your power strip, can't deliver enough power, it
> can cause the issues with these GPU cards.  I mentioned Dec 10th as the date
> I made the change for my boot parameters, but it's also the date I plugged
> my system directly into the wall.  Responding yesterday reminded me I have a
> new, more powerful UPS and I plugged my system into that today.  I'll see if
> it changes anything.
> 
> P.S.  I know the argument...power is power...but it's not.  If the surge
> protector, or UPS has cheap, thin wiring, then that restricts the amount of
> amps that can flow though them.

I had an old PSU, which was repaired once, so I replaced it. That did not
resolve the issue. The PSU is connected directly to the wall socket.

Kernel 5.10.18-200.fc33
AMD Ryzen 3 2200G with Radeon Vega Graphics

The bug is most often triggered when using Firefox.

[42174.187004] amdgpu 0000:06:00.0: amdgpu: [gfxhub0] retry page fault
(src_id:0 ring:0 vmid:1 pasid:32772, for process firefox pid 21156 thread
firefox:cs0 pid 21244)
[42174.187007] amdgpu 0000:06:00.0: amdgpu:   in page starting at address
0x0000000000200000 from client 27
[42174.187008] amdgpu 0000:06:00.0: amdgpu:
VM_L2_PROTECTION_FAULT_STATUS:0x00100431
[42174.187009] amdgpu 0000:06:00.0: amdgpu:      Faulty UTCL2 client ID: IA
(0x2)
[42174.187010] amdgpu 0000:06:00.0: amdgpu:      MORE_FAULTS: 0x1
[42174.187010] amdgpu 0000:06:00.0: amdgpu:      WALKER_ERROR: 0x0
[42174.187011] amdgpu 0000:06:00.0: amdgpu:      PERMISSION_FAULTS: 0x3
[42174.187012] amdgpu 0000:06:00.0: amdgpu:      MAPPING_ERROR: 0x0
[42174.187012] amdgpu 0000:06:00.0: amdgpu:      RW: 0x0
... (the above messages are repeated many times)
[42184.187655] amdgpu 0000:06:00.0: amdgpu: [gfxhub0] retry page fault
(src_id:0 ring:0 vmid:1 pasid:32772, for process firefox pid 21156 thread
firefox:cs0 pid 21244)
[42184.187656] amdgpu 0000:06:00.0: amdgpu:   in page starting at address
0x0000000000200000 from client 27
[42184.187656] amdgpu 0000:06:00.0: amdgpu:
VM_L2_PROTECTION_FAULT_STATUS:0x00100431
[42184.187657] amdgpu 0000:06:00.0: amdgpu:      Faulty UTCL2 client ID: IA
(0x2)
[42184.187657] amdgpu 0000:06:00.0: amdgpu:      MORE_FAULTS: 0x1
[42184.187658] amdgpu 0000:06:00.0: amdgpu:      WALKER_ERROR: 0x0
[42184.187658] amdgpu 0000:06:00.0: amdgpu:      PERMISSION_FAULTS: 0x3
[42184.187659] amdgpu 0000:06:00.0: amdgpu:      MAPPING_ERROR: 0x0
[42184.187660] amdgpu 0000:06:00.0: amdgpu:      RW: 0x0
[42184.328388] [drm:amdgpu_job_timedout [amdgpu]] *ERROR* ring gfx timeout,
signaled seq=109568, emitted seq=109570
[42184.328538] [drm:amdgpu_job_timedout [amdgpu]] *ERROR* Process information:
process firefox pid 21156 thread firefox:cs0 pid 21244
[42184.328542] amdgpu 0000:06:00.0: amdgpu: GPU reset begin!
[42184.330868] amdgpu 0000:06:00.0: AMD-Vi: Event logged [IO_PAGE_FAULT
domain=0x0000 address=0x10cd079a0 flags=0x0070]
[42184.330878] amdgpu 0000:06:00.0: AMD-Vi: Event logged [IO_PAGE_FAULT
domain=0x0000 address=0x10cd079c0 flags=0x0070]
[42184.330894] amdgpu 0000:06:00.0: AMD-Vi: Event logged [IO_PAGE_FAULT
domain=0x0000 address=0x10cd40000 flags=0x0070]
[42184.330901] amdgpu 0000:06:00.0: AMD-Vi: Event logged [IO_PAGE_FAULT
domain=0x0000 address=0x10cd079e0 flags=0x0070]
[42184.330909] amdgpu 0000:06:00.0: AMD-Vi: Event logged [IO_PAGE_FAULT
domain=0x0000 address=0x10cd40000 flags=0x0070]
[42184.330917] amdgpu 0000:06:00.0: AMD-Vi: Event logged [IO_PAGE_FAULT
domain=0x0000 address=0x10cd07a00 flags=0x0070]
[42184.330924] amdgpu 0000:06:00.0: AMD-Vi: Event logged [IO_PAGE_FAULT
domain=0x0000 address=0x10cd40000 flags=0x0070]
[42184.330942] amdgpu 0000:06:00.0: AMD-Vi: Event logged [IO_PAGE_FAULT
domain=0x0000 address=0x10cd07a20 flags=0x0070]
[42184.330950] amdgpu 0000:06:00.0: AMD-Vi: Event logged [IO_PAGE_FAULT
domain=0x0000 address=0x10cd40000 flags=0x0070]
[42184.330966] amdgpu 0000:06:00.0: AMD-Vi: Event logged [IO_PAGE_FAULT
domain=0x0000 address=0x10cd07a40 flags=0x0070]
[42184.421882] [drm] free PSP TMR buffer
[42184.451954] amdgpu 0000:06:00.0: amdgpu: GPU reset succeeded, trying to
resume
[42184.452090] [drm] PCIE GART of 1024M enabled (table at 0x000000F400900000).
[42184.452275] [drm] PSP is resuming...
[42184.472305] [drm] reserve 0x400000 from 0xf47fc00000 for PSP TMR
[42184.537825] amdgpu 0000:06:00.0: amdgpu: RAS: optional ras ta ucode is not
available
[42184.546811] amdgpu 0000:06:00.0: amdgpu: RAP: optional rap ta ucode is not
available
[42184.759724] [drm] kiq ring mec 2 pipe 1 q 0
[42184.958535] amdgpu 0000:06:00.0: [drm:amdgpu_ring_test_helper [amdgpu]]
*ERROR* ring gfx test failed (-110)
[42184.958584] [drm:amdgpu_device_ip_resume_phase2 [amdgpu]] *ERROR* resume of
IP block <gfx_v9_0> failed -110
[42184.958597] amdgpu 0000:06:00.0: amdgpu: GPU reset(2) failed
[42184.958667] amdgpu 0000:06:00.0: amdgpu: GPU reset end with ret = -110
[42195.061025] [drm:amdgpu_job_timedout [amdgpu]] *ERROR* ring gfx timeout, but
soft recovered
[42205.292585] [drm:amdgpu_job_timedout [amdgpu]] *ERROR* ring gfx timeout, but
soft recovered
[42243.148200] [drm:amdgpu_job_timedout [amdgpu]] *ERROR* ring sdma0 timeout,
signaled seq=21546, emitted seq=21548
[42243.148346] [drm:amdgpu_job_timedout [amdgpu]] *ERROR* Process information:
process  pid 0 thread  pid 0
[42243.148351] amdgpu 0000:06:00.0: amdgpu: GPU reset begin!

-- 
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
