Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A1AB378B7EA
	for <lists+dri-devel@lfdr.de>; Mon, 28 Aug 2023 21:13:13 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A6E9E10E095;
	Mon, 28 Aug 2023 19:13:08 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 042B210E095
 for <dri-devel@lists.freedesktop.org>; Mon, 28 Aug 2023 19:13:06 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 5ED8863403
 for <dri-devel@lists.freedesktop.org>; Mon, 28 Aug 2023 19:13:05 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id C6E8CC433CA
 for <dri-devel@lists.freedesktop.org>; Mon, 28 Aug 2023 19:13:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1693249984;
 bh=wCIwWPVdxc2DytkHTkIUYYVoNYnkJAMnmps58dBxfzU=;
 h=From:To:Subject:Date:In-Reply-To:References:From;
 b=gS5RrPC1tD//ti4tHiA1qXb2++JJTlhnhtdmLlFywDBicEfSqFmGhLgRHWuEKBTSs
 2wzrYgTYq3Y5fmBsEcykeJoUxbcZr60TZV34azmwV8/3xk4nRITGwlFwddeTfM7ta6
 iE0Ccq5jH5Un55tYrnGTn7uFe3hpSWQOPJuqQN59H1oe0acRFUcIiTfbKPJbDjojJg
 3g01CvhcPkxrYhrW1SWihtquV1sH8uIL+p0VqfBy5Dc2gsuI+iKWlzz9qMRON3KVD+
 7VsaQOT4DmrsfANsbQ+KPcMfHaXrN+BoI8Qu9Smf46Af0F9lvyzxQUx7Lr1emadqN0
 ghfSd75jewsEg==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix,
 from userid 48) id AF948C53BD4; Mon, 28 Aug 2023 19:13:04 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 217664] Laptop doesnt wake up from suspend mode.
Date: Mon, 28 Aug 2023 19:13:04 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Product: ACPI
X-Bugzilla-Component: Power-Sleep-Wake
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: high
X-Bugzilla-Who: mario.limonciello@amd.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P3
X-Bugzilla-Assigned-To: drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-217664-2300-OBXHZ3Zbr2@https.bugzilla.kernel.org/>
In-Reply-To: <bug-217664-2300@https.bugzilla.kernel.org/>
References: <bug-217664-2300@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D217664

--- Comment #41 from Mario Limonciello (AMD) (mario.limonciello@amd.com) ---
Was that NVME something you added to the system or it came with it?

I am suspecting that your platform or the NVME doesn't end up activating a
feature needed for s2idle to work properly called DevSlp at all or at the r=
ight
timing.

Can you please share to me an acpidump?  I want to check if you have some _=
DSD
properties set up appropriately.  You can see more about this in
7c5f641a5914 ("ata: libahci: Adjust behavior when StorageD3Enable _DSD is s=
et")

If it's a missing _DSD but the system and disk both support DevSlp we can
probably find a way to work around that in the kernel.

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
