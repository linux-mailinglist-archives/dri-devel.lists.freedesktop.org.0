Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CB42A5E96C7
	for <lists+dri-devel@lfdr.de>; Mon, 26 Sep 2022 01:03:02 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 24CF410E2A7;
	Sun, 25 Sep 2022 23:02:52 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sin.source.kernel.org (sin.source.kernel.org [145.40.73.55])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6584710E2A7
 for <dri-devel@lists.freedesktop.org>; Sun, 25 Sep 2022 23:02:48 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by sin.source.kernel.org (Postfix) with ESMTPS id 93FE4CE0FAD
 for <dri-devel@lists.freedesktop.org>; Sun, 25 Sep 2022 23:02:45 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id D25A1C433D7
 for <dri-devel@lists.freedesktop.org>; Sun, 25 Sep 2022 23:02:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1664146963;
 bh=Qudu582L2Bu0FHgM1f254xM5AibJR9Qnh36o/Jt7DsE=;
 h=From:To:Subject:Date:In-Reply-To:References:From;
 b=s9eQLHd4BWgDflFXjRzTDrZ4z0IVEj6w9tQyGLp2/xzH2VX5JcgBCF9PbKYFFOFTL
 EczGsM/avYsOy8FmaVWpT3Ff4EyLWqHREPcecAHJ+UTaq6uis1eyLoj0sWUK0Xpwsv
 OloHrB0AKxKzcC8YaIaMzl9/19x6Nhn62bORYHoPltJXKMXggnLRdBrGVdW9MZMx4L
 sQx5FsDXL+n9SgOpXY3Sh+yOVkjJmowFiyMyc9Hp11RHrXc50fwqifd1nhZIIhRuv6
 Ryhk+d82qFi3HShPFBNyUbuTFXM8geSVFj56+GgSz0kBtAGsF5JEvwtaHTTVeovwAZ
 kNdcxTFqmdgRw==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix,
 from userid 48) id 9DAB1C433E7; Sun, 25 Sep 2022 23:02:43 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 216516] s2ram freezes screen (Ryzen-5650U incl. Radeon GPU)
Date: Sun, 25 Sep 2022 23:02:42 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Video(DRI - non Intel)
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: mario.limonciello@amd.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-216516-2300-GQNw9KfOb8@https.bugzilla.kernel.org/>
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

--- Comment #12 from Mario Limonciello (AMD) (mario.limonciello@amd.com) ---
> Compiled with CONFIG_AMD_PMC.
> Going to s2idle two times.
> (first time just for a few seconds)

It looks better to me now.

> After less than 8 hours in s2idle the battery went from 60 % to 0 % !!!
> That's why there's no second wakeup.
> (system was down because battery was drained)

I suspect one of two things happened:
1) A spurious event actually woke up the SOC the second time but it never
re-entered.
2) You entered back to back and didn't get into the deepest state due to a
timing issue.

I know of a potential patch I can offer you for this, but we need to confirm
the root cause before I write it up.

> With S3 the battery will loose less than 5 % charge in the same time.
> And the notebook is brand new. So there should be no battery degradation.
> ... just did another s2idle test and battery went from 67 % to 58 % in one
> hour.

It's up to the OEM's design how quickly it will lose battery over Modern
Standby/s2idle, it has a lot of factors involved.  I'll describe some
additional debugging tactics later in this response.

> I think you exaggerate a little.
> I'm just enabling existing OEM code!

> Also I wouldn't say this is patching the firmware, because it's just the =
ACPI=20
> data, not the BIOS software.
> Just changing the existing "if" statement.
> See: comment #5
> I'm pretty sure there's a way to enable this OEM code without recompiling=
 the=20
> ACPI data. Probably by setting the MSCE variable with a hidden BIOS optio=
n or
> something else I haven't found yet.

What you're seeing in there is a remnant of AGESA reference code.  I see the
same thing in AMD's reference designs and in other OEM designs.

There is definitely OEM effort involved with enabling S3, and like I said t=
here
are lots of other firmware components involved that are invisible to the OS=
.=20

The other thing I want to point out - if they use Modern Standby in Windows,
this is the path that has gotten lots of validation.  A non-validated path =
is
likely to have unique bugs.

> s2idle just should be more energy efficient.
> S3 is using less than 1 % battery per hour. So if there's a way to get s2=
idle=20
> down to 2 % per hour that would be a good solution.

For most mobile designs the power consumption is better for s2idle than S3.
I suspect you're hitting a bug with wakeups, or s2idle re-entries.

For the next step in debugging, please do all of the following:
0) 6.0-rc6 kernel
1) Add to your kernel command line:
acpi.dyndbg=3D'file drivers/acpi/x86/s2idle.c +p' amd_pmc.dyndbg=3D'+p'
2) set /sys/power/pm_print_times to 1.
3) set /sys/power/pm_debug_messages to 1=20

With all those debugging things put in place, run a sample where you put it=
 to
sleep for a short period of time (say 10 minutes), and then wakeup and share
the log.  Please note how you woke up the system.  Hopefully based upon that
log it will be clearer what is causing your increased power consumption.

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
