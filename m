Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 49F1F88188D
	for <lists+dri-devel@lfdr.de>; Wed, 20 Mar 2024 21:24:41 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5C5B110EDAC;
	Wed, 20 Mar 2024 20:24:38 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="m6lRMwg2";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sin.source.kernel.org (sin.source.kernel.org [145.40.73.55])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0343A10EDAC
 for <dri-devel@lists.freedesktop.org>; Wed, 20 Mar 2024 20:24:36 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sin.source.kernel.org (Postfix) with ESMTP id 57598CE1254
 for <dri-devel@lists.freedesktop.org>; Wed, 20 Mar 2024 20:24:34 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 847A2C43399
 for <dri-devel@lists.freedesktop.org>; Wed, 20 Mar 2024 20:24:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1710966273;
 bh=PeULRUShTlbxCPeWe+nk0qr3GJmW9RXfeQwgkDbXnDQ=;
 h=From:To:Subject:Date:In-Reply-To:References:From;
 b=m6lRMwg2Pf6t9ppq/w1V544ePb+Q4QPEMec89jF7qtEfnYsSXK2RXr1XQ6cEcjg61
 NA8DgmTYRFtVWPs8pOvU2WqnckXWCsvmWjBoTdhiGyL3ydYXPHSuuH1lxS9BS4epxQ
 HZVxTtglESC7Djiukwkby4ndVylzOgH+96ezNuVjhANKiMhje7/Q3S6cFLQhOuh+hT
 GIcExDHChy/zMBS2E+k899II0TTHu8E/RYmuTR4kQse+8nDJS5dTZ2utxUR4q1w5B3
 MjcjNlEekcbDPq4jxw2Vmg2g7Ek32Jbvd7WXoWn2Y1mT7txdRjZACuVRzpu2hy782M
 J/gzE0Di1OecA==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix,
 from userid 48) id 7A7A6C53BD4; Wed, 20 Mar 2024 20:24:33 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 218617] Linux Kernel Bug Report: "Scheduling while atomic"
 Kernel Panic and System Freeze on NVIDIA RTX 2000 Ada Generation Laptop GPU
Date: Wed, 20 Mar 2024 20:24:33 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Video(DRI - non Intel)
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: blocking
X-Bugzilla-Who: aros@gmx.com
X-Bugzilla-Status: RESOLVED
X-Bugzilla-Resolution: WILL_NOT_FIX
X-Bugzilla-Priority: P3
X-Bugzilla-Assigned-To: drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: bug_status resolution
Message-ID: <bug-218617-2300-8CsEEbrc7l@https.bugzilla.kernel.org/>
In-Reply-To: <bug-218617-2300@https.bugzilla.kernel.org/>
References: <bug-218617-2300@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D218617

Artem S. Tashkinov (aros@gmx.com) changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
             Status|NEW                         |RESOLVED
         Resolution|---                         |WILL_NOT_FIX

--- Comment #1 from Artem S. Tashkinov (aros@gmx.com) ---
If it's an open source NVIDIA module, you report your bug here:
https://github.com/NVIDIA/open-gpu-kernel-modules/issues

If it's a closed source NVIDIA driver, you report your bug here:
https://forums.developer.nvidia.com/c/gpu-graphics/linux/148

Unfortunately kernel developer can't and won't help you with out of tree
modules.

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
