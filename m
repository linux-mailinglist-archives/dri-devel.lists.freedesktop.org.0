Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 718225E7ED0
	for <lists+dri-devel@lfdr.de>; Fri, 23 Sep 2022 17:46:22 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 55A1410E500;
	Fri, 23 Sep 2022 15:46:17 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1133010E500
 for <dri-devel@lists.freedesktop.org>; Fri, 23 Sep 2022 15:46:12 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 47BD0624DA
 for <dri-devel@lists.freedesktop.org>; Fri, 23 Sep 2022 15:46:12 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id AD050C433C1
 for <dri-devel@lists.freedesktop.org>; Fri, 23 Sep 2022 15:46:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1663947971;
 bh=OILYFlys0m2N5eRcA8QF1zeG62cfhHcLHMr/qrtpUgA=;
 h=From:To:Subject:Date:In-Reply-To:References:From;
 b=OyeeOQQAFaBZ8rnsmbTY3/8weL1m7dic2wDkL6gsUq0dKFmjypWvYKsFQ0kMBNOfP
 RT6bfmYxcPpnAqlIDy7BNjnBaTfeJoS3mGDSmmEEQFE0ne+9wvFOq7qvUMNeajT0NG
 Hf9RgGdaGqICmjJXdJxMIiUD4HaYXm//GuZLCirYhTJpk8Gby5Oc7g6n1d9Yez6XTK
 eE9hOR9amC6uNL2yNRwwC5L+hH3VDNTR9te51Pf8WExN/fDVOY6kjwzyGJK+XQcR2c
 yUgoUtwr2ahd+/Ob00l7RZa+YLS2zcmKPqWE2UA2nIWaYsm8zLwkmipeEJela2aUAi
 29aeZmjT1YBKA==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix,
 from userid 48) id 8DD90C433E7; Fri, 23 Sep 2022 15:46:11 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 216516] s2ram freezes screen (Ryzen-5650U incl. Radeon GPU)
Date: Fri, 23 Sep 2022 15:46:11 +0000
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
Message-ID: <bug-216516-2300-Y6OzQMe8PM@https.bugzilla.kernel.org/>
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

--- Comment #5 from kolAflash (kolAflash@kolahilft.de) ---
Created attachment 301854
  --> https://bugzilla.kernel.org/attachment.cgi?id=3D301854&action=3Dedit
kernel log: v6.0-rc6 and v6.0-rc6 with 7123d39dc reverted

@Mario


(In reply to Mario Limonciello (AMD) from comment #4)
> [...]
> 1) Does this still exist in a fully unpatched 6.0-rc6? What's the behavio=
r?

Yes.
That's why I've set the bugs kernel version to 6.0-rc6 ;-)

I've attached kernel logs for v6.0-rc6 and for v6.0-rc6 with 7123d39dc
reverted.
Reverting 7123d39dc on v6.0-rc6 makes the bug disappear.



> 2) What bisect points did you use to conclude that this problem on that
> particular commit?  By chance do you have the bisect log?

Sorry, no bisect log saved.
But I've explicitly tested 7123d39dc and it's predecessor 7123d39dc^, which=
 is
v5.18-rc7.
And 7123d39dc is definitely broken and v5.18-rc7 is working fine.



> 3) Why don't you just use s2idle instead in BIOS setup?  It's very mature=
 on
> a modern kernel. Most systems with AMD APUs shipped from OEMs don't offer=
 a
> toggle even, which is why I'm surprised you have one.

Tested s2idle with the openSUSE-15.4 stock kernel v5.14 and it consumed
MASSIVELY more power than S3.
I may give s2idle it another try with linux-6.0.

QUESTION:
Is "echo s2idle > /sys/power/mem_sleep" equivalent to enabling s2idle via A=
CPI?
So I wouldn't need to reboot to change ACPI for testing s2idle.

I also thought about using s2disk. But my employer requires me to use a very
long LUKS password. So I prefer not to enter the LUKS password every time I
wake my notebook.



> BTW - I wasn't aware that they offered a BIOS setting for s2ram on 845.  =
Are
> you patching the BIOS somehow or just changing a setting?  If you change =
it
> back to s2idle does all this go away?

Actually S3 is very well hidden. I don't know a way to enable it directly in
the BIOS. But it's in the ACPI tables.

cat /sys/firmware/acpi/tables/DSDT > dsdt.dat
iasl -d dsdt.dat
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
[...]
    If (!MSCE)
    {
        Name (_S3, Package (0x04)  // _S3_: S3 System State
        {
            0x03,=20
            0x03,=20
            Zero,=20
            Zero
        })
    }
[...]
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
I changed that "if" statement, recompiled and put the ACPI table into the
initrd for the kernel to load.=20
See here for details:
https://www.reddit.com/r/AMDLaptops/comments/lg0knl/comment/ikpwpb8/

Side note:
If you have an idea how to set that MSCE variable to false without recompil=
ing
the kernel, I'd be quite happy :-)

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
