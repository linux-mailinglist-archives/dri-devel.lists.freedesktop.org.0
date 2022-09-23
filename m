Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 041B15E7EFB
	for <lists+dri-devel@lfdr.de>; Fri, 23 Sep 2022 17:52:45 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B457A10E595;
	Fri, 23 Sep 2022 15:52:36 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5742910E595
 for <dri-devel@lists.freedesktop.org>; Fri, 23 Sep 2022 15:52:33 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id D273660FC6
 for <dri-devel@lists.freedesktop.org>; Fri, 23 Sep 2022 15:52:32 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 404D1C433D6
 for <dri-devel@lists.freedesktop.org>; Fri, 23 Sep 2022 15:52:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1663948352;
 bh=FaXd7vz/M81BLOcNmqbvevQekGHyiLvFdmIcwChKO7A=;
 h=From:To:Subject:Date:In-Reply-To:References:From;
 b=QwjZb1/VVuIQiamsIe/1IkKX4ChkTN3Gm6W7FT2o+fbGtuBVLxLmTpDGok44Dpfyu
 8gdbaFo2PO2wu+Qp+HxaTGsS52XibvRidUZxv8QqfrFzHQmvxlLcTTpoFoMUMZp0ii
 xgnAnX99rG/uYUDTQlnFPuiKUDkCLQf8ksLrFYrHee03FpLFf/P6wgn0Lwmx+Atb2h
 QaO06xSC6LgIr8choFYWN5h1BguM6St/uNfrLYJl4X8myytY/VH2faxrbOGlHZHZzc
 GIsoi/tx+eEeC89aiFc5Vv3hjrzqaihl10aqhpnCI5/QzZvEFVefR9EWOB0buGd81K
 48Jv5v24O4syg==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix,
 from userid 48) id 2C678C433E7; Fri, 23 Sep 2022 15:52:32 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 216516] s2ram freezes screen (Ryzen-5650U incl. Radeon GPU)
Date: Fri, 23 Sep 2022 15:52:31 +0000
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
Message-ID: <bug-216516-2300-471SLrdy9R@https.bugzilla.kernel.org/>
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

--- Comment #6 from Mario Limonciello (AMD) (mario.limonciello@amd.com) ---
> Tested s2idle with the openSUSE-15.4 stock kernel v5.14 and it consumed
> MASSIVELY more power than S3.

TONS and TONS of fixes have landed for s2idle since then.  5.15.y is the fi=
rst
kernel that you should be confident to use it.

Please re-test with s2idle using 6.0-rc6.  If that doesn't work let's fix i=
t.

> Is "echo s2idle > /sys/power/mem_sleep" equivalent to enabling s2idle via
> ACPI?
So I wouldn't need to reboot to change ACPI for testing s2idle.

No, on AMD systems there are Pre-OS changes that occur when you use modern
standby/s2idle.  If you use s2idle when the firmware is configured for S3 y=
ou
will never get into the proper power state.


> Actually S3 is very well hidden. I don't know a way to enable it directly=
 in
> the BIOS. But it's in the ACPI tables.

As you're patching the firmware this is not a regression.  It takes more to
properly enable S3 in Pre-OS code than changing a variable evaluated by the
Linux kernel's ACPI interpreter..

Thorsten - this is not a regression, patching the BIOS like this is complet=
ely
off the beating path.  We can't possibly support S3 in Linux if the OEM doe=
sn't
offer it in their BIOS.

kolAflash - Let's focus on fixing s2idle for your system.  With 6.0-rc6 and=
 an
"unpatched" BIOS let's see if you have any remaining problems with it.

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
