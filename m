Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id BEC0D788F2E
	for <lists+dri-devel@lfdr.de>; Fri, 25 Aug 2023 21:07:41 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1A8AB10E088;
	Fri, 25 Aug 2023 19:07:38 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1EDCF10E088
 for <dri-devel@lists.freedesktop.org>; Fri, 25 Aug 2023 19:07:36 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 82E836790B
 for <dri-devel@lists.freedesktop.org>; Fri, 25 Aug 2023 19:07:35 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id E85F1C433C8
 for <dri-devel@lists.freedesktop.org>; Fri, 25 Aug 2023 19:07:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1692990454;
 bh=81fX81vCWMSP/1LcbMG65sP6wMGydQHHfcRbjgl6BI0=;
 h=From:To:Subject:Date:In-Reply-To:References:From;
 b=d3Yqd2ciwmFHLJRfhfL83cOx/Tj0f9tmwvAKnMRjzWBy9JkA/C6n/pwY+feD458Eh
 H47r3oj+nzXLN6Nhab6IEyL7/FW2PrSPvolICmGhRx5f7LihUHGfHbRj9BDazo/rfS
 EUwLDeWtg0ZxAeecgXTAwqC5WwLi1aw7NE8YFOWdks+iP7VfnbtCqd6cwQZOEFEgjf
 rzHC1LcYxQrNxcltb3XQxabtG+M+sa8hPRIIWgKdBydgrmVwcz8f4Aiu/DV5ahxNOw
 hSqLIoSA+QcV0WuSnxZT6694ZLlVZFhJC00cc3+j5UVdt5Ul+On9ry9bBVregqh8aF
 GOsgibPn2dsYw==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix,
 from userid 48) id D8468C53BC6; Fri, 25 Aug 2023 19:07:34 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 217664] Laptop doesnt wake up from suspend mode.
Date: Fri, 25 Aug 2023 19:07:34 +0000
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
Message-ID: <bug-217664-2300-7rey4qFNj2@https.bugzilla.kernel.org/>
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

--- Comment #35 from Mario Limonciello (AMD) (mario.limonciello@amd.com) ---
>         Kernel modules: nvidiafb, nouveau
> Kernel command line: BOOT_IMAGE=3D/boot/vmlinuz-6.4.11-060411-generic
> root=3DUUID=3D218238de-a398-4391-b329-f9e1a095db36 ro quiet splash vt.han=
doff=3D7
202

I don't see nouveau blocked.  Furthmore I see problems with nouveau changing
power states.

> 2023-08-24T10:25:01.981451+01:00 Crawler-E25 kernel: [   25.196621] nouve=
au
> 0000:01:00.0: Unable to change power state from D3cold to D0, device
> inaccessible
> 2023-08-24T10:25:02.041542+01:00 Crawler-E25 kernel: [   25.257667] nouve=
au
> 0000:01:00.0: Unable to change power state from D3cold to D0, device
> inaccessible
> 2023-08-24T10:25:02.041554+01:00 Crawler-E25 kernel: [   25.257703] nouve=
au
> 0000:01:00.0: Unable to change power state from D3cold to D0, device
> inaccessible
> 2023-08-24T10:25:02.041557+01:00 Crawler-E25 kernel: [   25.257811] nouve=
au
> 0000:01:00.0: timer: stalled at ffffffffffffffff

It seems like the card might be in a bad state to me.  I suggest blacklisti=
ng
ALL the relevant drivers for it (nvidia, nouveau, nvidiafb) on your kernel
command line so we can remove it from the equation for suspend.

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
