Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D587D30C149
	for <lists+dri-devel@lfdr.de>; Tue,  2 Feb 2021 15:21:18 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D9F2C6E1B5;
	Tue,  2 Feb 2021 14:21:15 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EEF626E1B5
 for <dri-devel@lists.freedesktop.org>; Tue,  2 Feb 2021 14:21:13 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPS id C135464EAC
 for <dri-devel@lists.freedesktop.org>; Tue,  2 Feb 2021 14:21:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1612275673;
 bh=xenPjxZPO5OYzXsOOS+CdIlinLyJbQvEIbyYPkXpqdU=;
 h=From:To:Subject:Date:In-Reply-To:References:From;
 b=t8vUSoud5eOg1L3yiYHZu+3xkVvTmaHHL+4RfVe57h76UpkFXKOOZ4/bSgZ0I53nx
 51bmG52KYzJv6ziZJ8lMpaXzfn3mVydPPhnF+6ub1ecxdp/5zKW77qJfsI9sdTyTKZ
 5RN9d5lM1YjTYqJe0bdBzZoVnW3DGs+w/oHXA+LWeWtxL4CoVP9fw873lL+IJrRfsp
 2N1Rnn02jiJQgefrqCsbCvnOvNtBNlFBocJ1ikGlUzkyMdKBK9WG2bG/x4qAUXFGiL
 6T3cSPTjYhvC3eK3faNgn53xBsFVCkB3Lxl2RrzuCDwsnspMYlb8vaUrI8Cu9oP6aX
 hVVEPuM19d2oA==
Received: by pdx-korg-bugzilla-2.web.codeaurora.org (Postfix, from userid 48)
 id B1BCA6532E; Tue,  2 Feb 2021 14:21:13 +0000 (UTC)
From: bugzilla-daemon@bugzilla.kernel.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 207833] Brightness control not working on ASUS TUF FA506IU (AMD
 Ryzen 7 4800H / Nvidia GTX 1660 Ti)
Date: Tue, 02 Feb 2021 14:21:13 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Video(DRI - non Intel)
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: high
X-Bugzilla-Who: antonyjr000@gmail.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: cc
Message-ID: <bug-207833-2300-MuWqegqVCF@https.bugzilla.kernel.org/>
In-Reply-To: <bug-207833-2300@https.bugzilla.kernel.org/>
References: <bug-207833-2300@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=207833

Antony J.R (antonyjr000@gmail.com) changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
                 CC|                            |antonyjr000@gmail.com

--- Comment #4 from Antony J.R (antonyjr000@gmail.com) ---
(In reply to Alex Deucher from comment #3)
> Fixed with this patch:
> https://patchwork.freedesktop.org/patch/367486/

Does not work now in Linux kernel version 5.11-rc6(which is the latest mainline
kernel at the time of writing).

I got similar spec laptop(Lenovo Legion 5) with AMD Ryzen 7 4800H with Radeon
Grpahics and NVIDIA GTX 1650 Ti dGPU.

When using amdgpu kernel driver, the backlight is registered at
/sys/class/backlight/amdgpu_bl0

Now the problem is /sys/class/backlight/amdgpu_bl0/actual_brightness is stuck
at 311 and brightness control does not work at all.

I've tried a lot of workaround and even booted with the mainline kernel but
brightness control does not work. 

Only Fedora Workstation 32 with Linux kernel 5.6.6 has brightness control
working for AMD Ryzen 7 4800H APU which has the Renoir Graphics.

I have no idea why amd guys would break a already fixed issue in kernel 5.6.6,
I've tried all versions of the kernel but none works other than Fedora
Workstation 32 with Linux Kernel 5.6.6

-- 
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
