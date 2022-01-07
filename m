Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EF38A4873C2
	for <lists+dri-devel@lfdr.de>; Fri,  7 Jan 2022 08:52:34 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CA71911A6C6;
	Fri,  7 Jan 2022 07:52:31 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1C1A011A6C6
 for <dri-devel@lists.freedesktop.org>; Fri,  7 Jan 2022 07:52:31 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 909B261F12
 for <dri-devel@lists.freedesktop.org>; Fri,  7 Jan 2022 07:52:26 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 00EA8C36AF3
 for <dri-devel@lists.freedesktop.org>; Fri,  7 Jan 2022 07:52:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1641541946;
 bh=QBw/zyYNUW2PXCOdhn41RV/t77j0ekhNbLKjv1Tavqs=;
 h=From:To:Subject:Date:In-Reply-To:References:From;
 b=H5rfYF85fW21VTSOqnUSQJb1QuHebLsa7ZGgFlPlI4j2ltvs771YuqrdESDR3jF9y
 MB2XIiH/JEsoH5icuLBhfpIYxxYb1vH1iqdmOaYWid2x1RHjfi6l+pnq+QKcetijXy
 8BqcrTnhDja9HQo/Bp/+DJQy+7L4zgluQwwoP1HOgqbbSL0KSqKS6lCcTq2ORN2IGj
 k26O71pwQI8yoXAsNv72X5IILTQ7NR5IxjOIj+L/J4vsJYLC6PgE26mgQgiBHWGzpP
 P0EmIUs3gCa66srtt748VuLEHLD/h0GkSllZO08Fefck/kptdRQiZ98W7DecnxpbNT
 hJDmEW2YixXnw==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix,
 from userid 48) id D89C9C05FF9; Fri,  7 Jan 2022 07:52:25 +0000 (UTC)
From: bugzilla-daemon@bugzilla.kernel.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 215001] Regression in 5.15, Firmware-initialized graphics
 console selects FB_VGA16, screen corruption
Date: Fri, 07 Jan 2022 07:52:25 +0000
X-Bugzilla-Reason: CC
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: None
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Video(Other)
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: bugs-a21@moonlit-rail.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_video-other@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-215001-2300-LmhReMYHDb@https.bugzilla.kernel.org/>
In-Reply-To: <bug-215001-2300@https.bugzilla.kernel.org/>
References: <bug-215001-2300@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D215001

--- Comment #7 from Kris Karas (bugs-a21@moonlit-rail.com) ---
Hi Javier - I tested the (updated) patch from comment 6 on three different
systems, two servers with a character-graphic BIOS (expected to use VGA16),=
 and
my development system with a graphical UEFI boot (expected to use EFIFB).  =
I am
happy to report that in all cases, the patch worked perfectly.

Thanks for having whipped up this patch!

Feel free to submit upstream to Linus, and also to Greg for inclusion in
5.15.y.
Tested-By: Kris Karas <bugs-a21@moonlit-rail.com>



In reply to Thorsten in comment 4, I did indeed test against 5.15.13 and
5.16-rc8 without success.  This makes me curious...

... I filed this bug nearly 2 months ago with the "Regression =3D Y" metada=
ta
clearly set; but the various kernel regression trackers haven't picked up on
that fact until just days ago.  Are automated regression trackers only look=
ing
at messages on LKML?  What's the best way to get a bugzilla report for a
regression tracked so that it doesn't get forgotten or lost in the shuffle?=
=20
For example, bug 199533 was filed back in 2018, with a proper bisect even, =
but
hasn't garnered even so much as a single comment.  (Probably ought to be cl=
osed
as I no longer have the hardware to test a fix :-)

Kris

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are on the CC list for the bug.=
