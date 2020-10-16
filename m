Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8C883290003
	for <lists+dri-devel@lfdr.de>; Fri, 16 Oct 2020 10:36:43 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 796A36E10C;
	Fri, 16 Oct 2020 08:36:39 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7DEBB6E10C
 for <dri-devel@lists.freedesktop.org>; Fri, 16 Oct 2020 08:36:38 +0000 (UTC)
From: bugzilla-daemon@bugzilla.kernel.org
Authentication-Results: mail.kernel.org;
 dkim=permerror (bad message/signature format)
To: dri-devel@lists.freedesktop.org
Subject: [Bug 208981] trace with B550I AORUS PRO AX and AMD Ryzen 5 PRO 4650G
Date: Fri, 16 Oct 2020 08:36:37 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Video(DRI - non Intel)
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: florian.laroche@googlemail.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-208981-2300-K0Dy4j79Qn@https.bugzilla.kernel.org/>
In-Reply-To: <bug-208981-2300@https.bugzilla.kernel.org/>
References: <bug-208981-2300@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=208981

--- Comment #9 from florian.laroche@googlemail.com ---
Hello,

Am Mi., 14. Okt. 2020 um 11:44 Uhr schrieb
<bugzilla-daemon@bugzilla.kernel.org>:
> - Kernel 5.8.14 and 5.9 with mostly Gentoo kernel config
> - AMD Ryzen 7 PRO 4750G CPU+iGPU
> - ASRock A520M-ITX/ac mainboard + ECC UDIMM memory
>
> The trace mentioned above disappeared when I updated BIOS (v. 1.20 from
> 2020/9/18, it contains AGESA 1.0.8.0). However, I'm still not able to run
> ROCm

I have updated my motherboard Gigabyte B550I AORUS PRO AX to
BIOS F10 from 09/18/2020 with AMD AGESA ComboV2 1.0.8.1.

The trace is still present, so this issue is still open for me.


> OpenCL (tried various versions, including 3.7 and 3.8), system either hangs,
> or
> (if the program is killed early) dmesg shows
>
>  Evicting PASID 0x8001 queues
>
> BTW, clinfo causes GPU resets, and leaves 99% GPU utilization, while dmesg
> shows something like
>
>  qcm fence wait loop timeout expired
>  The cp might be in an unrecoverable state due to an unsuccessful queues
>  preemption
>  amdgpu: Failed to evict process queues
>  amdgpu: Failed to quiesce KFD
>  amdgpu 0000:07:00.0: amdgpu: GPU reset begin!
>  [drm] free PSP TMP buffer
>  amdgpu 0000:07:00.0: amdgpu: GPU reset succeeded, trying to resume
> ...(and similarly for kernel 5.9.0)
>
> It is probably an off-topic, but it seems to be related to amdgpu driver, and
> I
> don't know how to move forward (and somebody reported that ROCk 3.7 driver
> works well with APU Renoir).


Seems this is all unrelated to my bug-report.

best regards,

Florian La Roche

-- 
You are receiving this mail because:
You are watching the assignee of the bug.
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
