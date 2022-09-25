Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 23B015E91E3
	for <lists+dri-devel@lfdr.de>; Sun, 25 Sep 2022 11:30:05 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 03E8A10E0BB;
	Sun, 25 Sep 2022 09:29:48 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A9A7110E0BB
 for <dri-devel@lists.freedesktop.org>; Sun, 25 Sep 2022 09:29:44 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id C5D70B80A3A
 for <dri-devel@lists.freedesktop.org>; Sun, 25 Sep 2022 09:29:42 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 7565BC433D7
 for <dri-devel@lists.freedesktop.org>; Sun, 25 Sep 2022 09:29:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1664098181;
 bh=LxhB7PuDAhaXWPHELzVXZ1vDF2CWFI035kIQJTwrYa4=;
 h=From:To:Subject:Date:In-Reply-To:References:From;
 b=L4sVZBBQswDgwAE1GGWlp5sYEKpIFcxzxB3yOfoSmEre18ezOHGzl0noKzbQbezdN
 FbOC0qOZlR6R4oePy6VH+qW/TyflXMVsuSDVOLW1YxlHYAc7ZNzKy3UlarAAEyR5IO
 hJGRE0EAslM28hzxDyV4zIZRtQlBw2KJPZa51UdRDdK2b5TX1C9GLFwe5RK9+I6Rmg
 /eqMi9xruO1rK7OMgXJODERjqw9utoitu8owFj7+KcEqPEaWHtK75kIjQqnXfa8C3E
 9EZTP9+5oM8lJ9PfyBoGwtiuprB85uDKljnh9QzGfsAvEzfW+UrpqtMiiyhogJ+Fkx
 1xQVgmFbqjEEA==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix,
 from userid 48) id 44160C433E7; Sun, 25 Sep 2022 09:29:41 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 216516] s2ram freezes screen (Ryzen-5650U incl. Radeon GPU)
Date: Sun, 25 Sep 2022 09:29:40 +0000
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
Message-ID: <bug-216516-2300-B4dmqaDHNo@https.bugzilla.kernel.org/>
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

--- Comment #10 from kolAflash (kolAflash@kolahilft.de) ---
Created attachment 301870
  --> https://bugzilla.kernel.org/attachment.cgi?id=3D301870&action=3Dedit
kernel log for s2idle: v6.0-rc6 with CONFIG_AMD_PMC enabled

(In reply to Mario Limonciello (AMD) from comment #9)
> You're missing CONFIG_AMD_PMC.

Compiled with CONFIG_AMD_PMC.

Going to s2idle two times.
(first time just for a few seconds)


The good news:
With CONFIG_AMD_PMC in s2idle the screen doesn't freeze.

The bad news:
After less than 8 hours in s2idle the battery went from 60 % to 0 % !!!
That's why there's no second wakeup.
(system was down because battery was drained)

With S3 the battery will loose less than 5 % charge in the same time.
And the notebook is brand new. So there should be no battery degradation.


... just did another s2idle test and battery went from 67 % to 58 % in one
hour.



(In reply to Mario Limonciello (AMD) from comment #6)
> [...]
> As you're patching the firmware this is not a regression.  It takes more =
to
> properly enable S3 in Pre-OS code than changing a variable evaluated by t=
he
> Linux kernel's ACPI interpreter..
>=20
> Thorsten - this is not a regression, patching the BIOS like this is
> completely off the beating path.  We can't possibly support S3 in Linux if
> the OEM doesn't offer it in their BIOS.

I think you exaggerate a little.
I'm just enabling existing OEM code!

Also I wouldn't say this is patching the firmware, because it's just the AC=
PI
data, not the BIOS software.
Just changing the existing "if" statement.
See: comment #5
I'm pretty sure there's a way to enable this OEM code without recompiling t=
he
ACPI data. Probably by setting the MSCE variable with a hidden BIOS option =
or
something else I haven't found yet.

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
