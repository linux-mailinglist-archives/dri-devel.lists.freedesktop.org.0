Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 2A6EA5EAFF6
	for <lists+dri-devel@lfdr.de>; Mon, 26 Sep 2022 20:33:26 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3950010E763;
	Mon, 26 Sep 2022 18:33:22 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sin.source.kernel.org (sin.source.kernel.org [145.40.73.55])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 453EE10E763
 for <dri-devel@lists.freedesktop.org>; Mon, 26 Sep 2022 18:33:19 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by sin.source.kernel.org (Postfix) with ESMTPS id E95D7CE12FD
 for <dri-devel@lists.freedesktop.org>; Mon, 26 Sep 2022 18:33:16 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 65BA5C433D7
 for <dri-devel@lists.freedesktop.org>; Mon, 26 Sep 2022 18:33:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1664217195;
 bh=d4eG2qigNY6iJYjbdo9TYqwINH1LwZX9spbDU8YdDsw=;
 h=From:To:Subject:Date:In-Reply-To:References:From;
 b=ZK5jT5vwCiRsEVGOmeJfnCus3reQgrRO0JHs0fMTuJvVLZ5E07hPQOAl1Lxpb8w7r
 /xmhHmrIrNI/wB1eulaCx36V1i2+SJ28EG66eMUUN3QGE2L2kKMx/M56Ct28/CQT83
 A6KtZ84QZVCXvBrfo5gx5bHvK4+3T4URror+XyKETWnGB4vjU5jpGQdmwMRZQkok+N
 AsQYNkmzlC3synhxrhtfWfCInzq45DyKQXKihHmdP32bjKhtyjq+D0IqvaekmSHSYV
 kzjChZNgzncuwOgpyMZEXvNn/n7xf40nmFpkg+Oeuvsmg/hKMKYknVneHHdVQ0nUFR
 L4CUD6//Cp5Zw==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix,
 from userid 48) id 4BFA5C433E7; Mon, 26 Sep 2022 18:33:15 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 216516] s2ram freezes screen (Ryzen-5650U incl. Radeon GPU)
Date: Mon, 26 Sep 2022 18:33:14 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Video(DRI - non Intel)
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: kolAflash@kolahilft.de
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: attachments.created
Message-ID: <bug-216516-2300-om4VnbttXN@https.bugzilla.kernel.org/>
In-Reply-To: <bug-216516-2300@https.bugzilla.kernel.org/>
References: <bug-216516-2300@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D216516

--- Comment #13 from kolAflash (kolAflash@kolahilft.de) ---
Created attachment 301872
  --> https://bugzilla.kernel.org/attachment.cgi?id=3D301872&action=3Dedit
kernel log for s2idle: v6.0-rc6 with debug options

@Mario

(In reply to Mario Limonciello (AMD) from comment #12)
> [...]
> For the next step in debugging, please do all of the following:
> 0) 6.0-rc6 kernel
> 1) Add to your kernel command line:
> acpi.dyndbg=3D'file drivers/acpi/x86/s2idle.c +p' amd_pmc.dyndbg=3D'+p'
> 2) set /sys/power/pm_print_times to 1.
> 3) set /sys/power/pm_debug_messages to 1
> [...]

Thanks!

Here's the requested log.


I woke the notebook by pressing the power button.

Before standby I'm always doing:
echo disabled > /sys/devices/platform/i8042/serio0/power/wakeup
echo disabled > /sys/devices/LNXSYSTM:00/LNXSYBUS:00/PNP0C0D:00/power/wakeup
echo XHC1 > /proc/acpi/wakeup
Else the notebook wakes on every keyboard, mouse, lid open and even lid clo=
se
action.


Can you tell if the power consumption is completely up to the kernel?
Or should I have a look at the userspace too?

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
