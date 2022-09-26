Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AAED25EB07A
	for <lists+dri-devel@lfdr.de>; Mon, 26 Sep 2022 20:49:46 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 20EFF10E03D;
	Mon, 26 Sep 2022 18:49:39 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2B88610E03D
 for <dri-devel@lists.freedesktop.org>; Mon, 26 Sep 2022 18:49:35 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 7B9E9611FE
 for <dri-devel@lists.freedesktop.org>; Mon, 26 Sep 2022 18:49:34 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id DE03DC433D6
 for <dri-devel@lists.freedesktop.org>; Mon, 26 Sep 2022 18:49:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1664218173;
 bh=2rU3cYs81vNbj5zIe6ZbfP0fte0AVyVcsgzDfsQG7TY=;
 h=From:To:Subject:Date:In-Reply-To:References:From;
 b=BJGTqAYbbkIc8u9qkgUcNYIKy5CFqVKpDtJpdvxFRL12w3p89uW5rSg1CbCDGtOWA
 MYJLTE2JNRICOrJKBGF8IYXJ5hO+E3oqA6kqtT8TY76OshCqjMfGA5vFW2BoqpIdZg
 27e4cfnAnOcFiOXpwXQvcpvnG3V6FkeQg3l9bMSpFlTMHr0JQFA03wVztfWbaePjIm
 GLMP1VfvZm0Wxgq5zP4hsiMDQ9bbiDsbTXXG8KtYd4fVwVOgMRFmMoM54MH0cDsNVv
 87tqpoUN3E6ZhxYe7VbSKpmhvJCBelUZZsqCkqZbgJev9Ve1bdl6wr5y73fFCzl+gk
 SSVhcFDk/XW9Q==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix,
 from userid 48) id C89BBC433E7; Mon, 26 Sep 2022 18:49:33 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 216516] s2ram freezes screen (Ryzen-5650U incl. Radeon GPU)
Date: Mon, 26 Sep 2022 18:49:33 +0000
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
Message-ID: <bug-216516-2300-mgtlPwgGwb@https.bugzilla.kernel.org/>
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

--- Comment #14 from Mario Limonciello (AMD) (mario.limonciello@amd.com) ---
> Here's the requested log.

OK let me pull out a few pieces and explain what they mean.

> 2022-09-26T19:01:47.104247+02:00 myhost kernel: [ 2218.148069][    T0]
> Timekeeping suspended for 341.998 seconds
> 2022-09-26T19:01:47.104247+02:00 myhost kernel: [ 2218.148164][ T5798] AC=
PI:
> EC: ACPI EC GPE status set
> 2022-09-26T19:01:47.104247+02:00 myhost kernel: [ 2218.148190][ T5798] AC=
PI:
> EC: ACPI EC GPE dispatched
> 2022-09-26T19:01:47.104248+02:00 myhost kernel: [ 2218.148541][ T5798] AC=
PI:
> EC: ACPI EC work flushed
> 2022-09-26T19:01:47.104248+02:00 myhost kernel: [ 2218.149018][ T5798] AC=
PI:
> PM: Rearming ACPI SCI for wakeup
> 2022-09-26T19:01:47.104249+02:00 myhost kernel: [ 2568.100347][    T0]
> Timekeeping suspended for 349.998 seconds
> 2022-09-26T19:01:47.104249+02:00 myhost kernel: [ 2568.100442][ T5798] AC=
PI:
> EC: ACPI EC GPE status set
> 2022-09-26T19:01:47.104250+02:00 myhost kernel: [ 2568.100468][ T5798] AC=
PI:
> EC: ACPI EC GPE dispatched
> 2022-09-26T19:01:47.104250+02:00 myhost kernel: [ 2568.100817][ T5798] AC=
PI:
> EC: ACPI EC work flushed
> 2022-09-26T19:01:47.104251+02:00 myhost kernel: [ 2568.101326][ T5798] AC=
PI:
> PM: Rearming ACPI SCI for wakeup

The SOC was asleep for some number of seconds, and then it got woken up from
the EC GPE.  It may or may not have gone back to the deepest state during e=
ach
of these attempts (it's unclear with the way logging works in the kernel).

During the duration of these attempts you can see this happened a LOT of ti=
mes.

As an educated guess; it might have been that the EC was trying to update n=
ew
battery life values or it can be illustrative of another bug.  The easiest =
way
to determine the cause of these GPEs do the following.

1) Collect the output of=20
# grep -v foo /sys/firmware/acpi/interrupts/*
2) Run your suspend
3) Capture again the output of=20
# grep -v foo /sys/firmware/acpi/interrupts/*
4) Compare the two to see which incremented

> 2022-09-26T19:01:47.104625+02:00 myhost kernel: [ 4600.944320][ T5798]
> amd_pmc AMDI0005:00: Last suspend in deepest state for 16419799us

This means the SOC was only in the deepest state for a total of 16 seconds =
of
your last s2idle run.=20=20

> echo disabled > /sys/devices/platform/i8042/serio0/power/wakeup
> echo disabled > /sys/devices/LNXSYSTM:00/LNXSYBUS:00/PNP0C0D:00/power/wak=
eup
> echo XHC1 > /proc/acpi/wakeup

At least for experimentations sake, can you avoid making these changes in y=
our
next attempt?  Would like to confirm they weren't /part/ of this problem.

> Can you tell if the power consumption is completely up to the kernel?

From the logs you've shared, this is entirely influence by the kernel and
firmware code for your case.  I would not be worried about userspace at all.

If the issue persists even without those wakeup sources then I'll look thro=
ugh
your GPEs.

The next debugging step will be applying the following patches to 6.0-rc:

https://git.kernel.org/pub/scm/linux/kernel/git/pdx86/platform-drivers-x86.=
git/commit/?h=3Dreview-hans&id=3D811d59fdf56a17c66742578fe8be8a6a841af448

https://git.kernel.org/pub/scm/linux/kernel/git/pdx86/platform-drivers-x86.=
git/commit/?h=3Dreview-hans&id=3De24faabf5f368c031ad50f0d915a01e1b591f536

https://git.kernel.org/pub/scm/linux/kernel/git/pdx86/platform-drivers-x86.=
git/commit/?h=3Dreview-hans&id=3D90bec2855c566b6d07cc3e2bb47befb6266cf1ec

https://git.kernel.org/pub/scm/linux/kernel/git/pdx86/platform-drivers-x86.=
git/commit/?h=3Dreview-hans&id=3Ddb55fb8a06f241e168a4f275970f2701d52040c6

Then add this patch:

diff --git a/drivers/platform/x86/amd/pmc.c b/drivers/platform/x86/amd/pmc.c
index e47e54b095af..d3a3e0df6e77 100644
--- a/drivers/platform/x86/amd/pmc.c
+++ b/drivers/platform/x86/amd/pmc.c
@@ -750,6 +750,8 @@ static void amd_pmc_s2idle_check(void)
        struct amd_pmc_dev *pdev =3D &pmc;
        int rc;

+       usleep_range(10000, 20000);
+
        rc =3D amd_pmc_write_stb(pdev, AMD_PMC_STB_S2IDLE_CHECK);
        if (rc)
                dev_err(pdev->dev, "error writing to STB: %d\n", rc);

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
