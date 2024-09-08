Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 961CA9704FF
	for <lists+dri-devel@lfdr.de>; Sun,  8 Sep 2024 05:54:12 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5B2F810E032;
	Sun,  8 Sep 2024 03:54:09 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="bPuvZMVz";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 87D3510E032
 for <dri-devel@lists.freedesktop.org>; Sun,  8 Sep 2024 03:54:07 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 0E6015C10B1
 for <dri-devel@lists.freedesktop.org>; Sun,  8 Sep 2024 03:54:03 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id D5408C4CEC5
 for <dri-devel@lists.freedesktop.org>; Sun,  8 Sep 2024 03:54:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1725767645;
 bh=p6CU/JhShSjz3Vqw+DTJOV5Pz43pHnFyQ/SCqGGzUbQ=;
 h=From:To:Subject:Date:In-Reply-To:References:From;
 b=bPuvZMVzdD2yBTzEBTJt4nWBGmVYZ6NsNhZjVFtTEkc0u99YJVqx3s4do8oGU2U8r
 LWF7N0nxhFJ6QC3yvlJcyI6/sNdMsGuU8SPuoGAjIkvtPmYWS7uzkEH32ahayVhsJw
 NCOANOiZdeOt4SHkqFrnL+Z+2zt9Z1i7NpGzDYwyIp9G5ADWbp750+z6e+a/3m0oKC
 wZt4JToo/LPHNK396E66FwAEMtZCeoIyrlKSVj+cE00XkQ1IrbSZ76cdNKPUvPtiAP
 UP66guGFJwkSS9dHOgPuhF6IJkTuYaMETljMWeLkpOdI7bpu0BOO/f7z2RKJSkFpoq
 1BxCutiabKoqA==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix,
 from userid 48) id C4A37C53BC3; Sun,  8 Sep 2024 03:54:05 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 206309] Experimental amdgpu w/ Dell E6540 with HD 8790M (MARS
 XTX), massive performance improvement after ACPI suspend
Date: Sun, 08 Sep 2024 03:54:05 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Video(DRI - non Intel)
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: low
X-Bugzilla-Who: jerbear3.14159@gmail.com
X-Bugzilla-Status: RESOLVED
X-Bugzilla-Resolution: WILL_NOT_FIX
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-206309-2300-oubUHq1n4q@https.bugzilla.kernel.org/>
In-Reply-To: <bug-206309-2300@https.bugzilla.kernel.org/>
References: <bug-206309-2300@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D206309

--- Comment #5 from jerbear3.14159@gmail.com ---
It's a Linux bug!

I finally set aside a day to waste on Windows installation to check whether=
 it
behaves the same way. Windows 10 repeatedly crashed and bricked itself beca=
use
of course it did. It works perfectly on Windows 8.1 with the official graph=
ics
driver on Dell's website.
https://dl.dell.com/FOLDER02868143M/5/AMD-FirePro-Graphics-Driver_CWRN6_WIN=
_14.502.1005_A02_02.EXE

Memory Clock (MHz)/Shader Clock (MHz):
Idle: 150/300
Battery: 600/400
AC: 1000/900

On Xubuntu 23.10 it's more like:
Idle: 150/300
Battery: 150/300
AC: 1000/900 (but it drops down to 150/300 after unplugging, and requires a
reboot to bring it back up)

I've gone through 2 official 130W Dell chargers and 2 90W Targus universal
chargers. Linux exhibits the power management bug regardless. I have never
tried a docking station.

uname -a gives:
Linux 6.5.0-44-generic #44-Ubuntu SMP PREEMPT_DYNAMIC Fri Jun  7 15:10:09 U=
TC
2024 x86_64 x86_64 x86_64 GNU/Linux

The only reprieve I've found is to follow these steps:
1. Boot with the laptop plugged in. If using a 90W charger and this is a co=
ld
start (as opposed to a reboot), need to reboot as soon as it finishes booti=
ng.
2. echo -n high > /sys/class/drm/card1/device/power_dpm_force_performance_l=
evel
3. Pray
4. Unplug
5. Now for some reason, there's a small chance that the clock speeds stick =
high
and don't drop. If not, start over from step 1. If yes, then typically (but=
 not
always) I can repeatedly unplug+plug safely up until it's time to shut down.

Problems I've encountered with this method include:
- Low success rate
- Runs hotter/harms battery life
- If I'm working unplugged, I need to manually lower the clock speeds down =
to
600/400. If I forget and leave it at 1000/900 and try to do anything
graphically intense, the battery can't provide enough power and the entire
laptop shuts down immediately. You can see that Windows does this automatic=
ally
when unplugged.

All in all, this is a nightmare for a game developer who needs maximum GPU
performance. I live in constant fear of bumping the power cord out or needi=
ng
to switch rooms. I'm happy to provide any additional information, but glanc=
ing
at the amdgpu source code it seems a little over my head!

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
