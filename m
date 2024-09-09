Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 83DC39721BF
	for <lists+dri-devel@lfdr.de>; Mon,  9 Sep 2024 20:17:40 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5F74B10E62E;
	Mon,  9 Sep 2024 18:17:37 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="BfV+mgql";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from nyc.source.kernel.org (nyc.source.kernel.org [147.75.193.91])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AFD3510E62E
 for <dri-devel@lists.freedesktop.org>; Mon,  9 Sep 2024 18:17:35 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by nyc.source.kernel.org (Postfix) with ESMTP id 2E2F1A410FB
 for <dri-devel@lists.freedesktop.org>; Mon,  9 Sep 2024 18:17:27 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 2975CC4CED0
 for <dri-devel@lists.freedesktop.org>; Mon,  9 Sep 2024 18:17:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1725905854;
 bh=XVlTWXXUj6AGrC8fSdyCEFknbp1Fvs79cX0XJq9GorM=;
 h=From:To:Subject:Date:In-Reply-To:References:From;
 b=BfV+mgqlqWYftvEWAyMfYs0fFdZW3kHzFvjt6cK7mMyZieIUQoWIRRR51KEBYvc8N
 52H/l7Nqk8jIKz9LleRyxhY+Zovg1333TfPn6FGzrazu5K79iEHp0KNmx4q91IWvg5
 8d+ooL0XIMf1Vxwdmf8GmLIJ3wc5PlAC1JClWvKmsuhw3czTAFDwfw9T1RLR18xOQR
 rQFuEzbfvPfNPAyVhalEXDuxNiCq34UF1yNzEfNmz6QmGxwmGTWhonO/ToAEIpqF9L
 aHfDz7YgP5++LxegfyYcbrB/ti3jhNIqp4XxC44zVxF+rxLcXbBkDdlNMlOlp/A5gc
 wbmiAX4JtPNrA==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix,
 from userid 48) id 23A8DC53BB8; Mon,  9 Sep 2024 18:17:34 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 195159] nouveau incorrect ACPI usgage results in ACPI Error :
 AE_AML_PACKAGE_LIMIT
Date: Mon, 09 Sep 2024 18:17:33 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Video(DRI - non Intel)
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: pooh@aikipooh.name
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: cc
Message-ID: <bug-195159-2300-mydxUbBFxs@https.bugzilla.kernel.org/>
In-Reply-To: <bug-195159-2300@https.bugzilla.kernel.org/>
References: <bug-195159-2300@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D195159

Yury Puchalski (pooh@aikipooh.name) changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
                 CC|                            |pooh@aikipooh.name

--- Comment #13 from Yury Puchalski (pooh@aikipooh.name) ---
I think it's the right place to discuss:)
Using gentoo, kernel 6.6.38, and 5.15.41 had it the same.

It's Dell Precision M4800, integrated intel card, and additional nvidia. I'm
using nouveau driver, nvidia setup as primaryGPU for X.

The usual line is there.
[    4.295646] ACPI Warning: \_SB.PCI0.PEG0.PEGP._DSM: Argument #4 type
mismatch - Found [Buffer], ACPI requires [Package] (20230628/nsarguments-61)

But then, what's very bad, I get temporary freezes regularly. Sometimes it's
every 10-15 seconds, sometimes it doesn't happen for prolonged time.

Sep  9 20:00:05 dell kernel: ACPI: \x5c_SB_.PCI0.PEG0.PEGP: failed to evalu=
ate
_DSM
Sep  9 20:00:40 dell kernel: ACPI: \x5c_SB_.PCI0.PEG0.PEGP: failed to evalu=
ate
_DSM
Sep  9 20:01:10 dell kernel: ACPI: \x5c_SB_.PCI0.PEG0.PEGP: failed to evalu=
ate
_DSM
Sep  9 20:01:32 dell kernel: ACPI: \x5c_SB_.PCI0.PEG0.PEGP: failed to evalu=
ate
_DSM
Sep  9 20:03:52 dell kernel: ACPI: \x5c_SB_.PCI0.PEG0.PEGP: failed to evalu=
ate
_DSM
Sep  9 20:04:22 dell kernel: ACPI: \x5c_SB_.PCI0.PEG0.PEGP: failed to evalu=
ate
_DSM
Sep  9 20:04:56 dell kernel: ACPI: \x5c_SB_.PCI0.PEG0.PEGP: failed to evalu=
ate
_DSM
Sep  9 20:06:35 dell kernel: ACPI: \x5c_SB_.PCI0.PEG0.PEGP: failed to evalu=
ate
_DSM
Sep  9 20:09:55 dell kernel: ACPI: \x5c_SB_.PCI0.PEG0.PEGP: failed to evalu=
ate
_DSM
Sep  9 20:10:34 dell kernel: ACPI: \x5c_SB_.PCI0.PEG0.PEGP: failed to evalu=
ate
_DSM

Every such message is followed by:
Sep  9 20:12:43 dell kernel: nouveau 0000:01:00.0: Enabling HDA controller

These freezes result in music hiccups, mouse pointer not moving for 2-3
seconds. What can I do to sweep them under the carpet? acpi=3Doff?

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
