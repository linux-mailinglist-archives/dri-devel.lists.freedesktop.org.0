Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 460B492B23B
	for <lists+dri-devel@lfdr.de>; Tue,  9 Jul 2024 10:38:03 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A607610E4B5;
	Tue,  9 Jul 2024 08:38:01 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="onoRpL/b";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CD42E10E4B5
 for <dri-devel@lists.freedesktop.org>; Tue,  9 Jul 2024 08:37:59 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 23D53611EC
 for <dri-devel@lists.freedesktop.org>; Tue,  9 Jul 2024 08:37:59 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id EBCB4C3277B
 for <dri-devel@lists.freedesktop.org>; Tue,  9 Jul 2024 08:37:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1720514279;
 bh=B6xrN18zDp6tf+X8xVEnxFVKHs9SIA/mOHOKvJUTRxs=;
 h=From:To:Subject:Date:In-Reply-To:References:From;
 b=onoRpL/bHTr0huulVF5hDdylHXvsXV3xQRjyu8Khyuu4bvIoHH0pkbB84eSAj2xSy
 YTc6Xq3Mqx+Ho4+NjqlS5lNUkWbAmG1woAaPBU73l/pDUbqGf0ydlVOem84qzaUJoH
 tbh74KNBkMOGv+BWa8cPGmzX7jU4wiZn2PTjbi59+OikA9zKMZlRBj8KUltAWecBIM
 uBnLKSXlenlssmMAVuuYNQedxCBSZ4H/r9kl26TaaGgWksfwI4Zlmm0UlKSZnBmoO8
 MK65CekQvkHM1o49v86ZqXru3fymySgJJFMJ8MUaQzjSd+2IFjDsLgLCAaoNTiSNRW
 tf+D34TKzn/9A==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix,
 from userid 48) id E2A1FC53BB8; Tue,  9 Jul 2024 08:37:57 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 219007] opening and closing /dev/dri/card0 in a QEMU KVM
 instance will shutdown system, 6.10.0-rc6+
Date: Tue, 09 Jul 2024 08:37:57 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Video(DRI - non Intel)
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: high
X-Bugzilla-Who: regressions@leemhuis.info
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P3
X-Bugzilla-Assigned-To: drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-219007-2300-tHnLzfTgqC@https.bugzilla.kernel.org/>
In-Reply-To: <bug-219007-2300@https.bugzilla.kernel.org/>
References: <bug-219007-2300@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D219007

--- Comment #3 from The Linux kernel's regression tracker (Thorsten Leemhui=
s) (regressions@leemhuis.info) ---
Forgot: I'll forward this report by mail, as it's a regression, so no need =
to
do anything for you. But it's not the first bug I see from you here, so I
thought a reminder might be wise.

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
