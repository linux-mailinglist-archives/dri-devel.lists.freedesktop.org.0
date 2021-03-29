Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 73B9834D191
	for <lists+dri-devel@lfdr.de>; Mon, 29 Mar 2021 15:43:29 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2E99C6E19A;
	Mon, 29 Mar 2021 13:43:21 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DA41E6E19A
 for <dri-devel@lists.freedesktop.org>; Mon, 29 Mar 2021 13:43:19 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPS id 087E561554
 for <dri-devel@lists.freedesktop.org>; Mon, 29 Mar 2021 13:43:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1617025398;
 bh=K2bcQPzsNQWpooCvPAHZ4607CXdYlNdp68cYwP6uHdU=;
 h=From:To:Subject:Date:In-Reply-To:References:From;
 b=ideyixQt1WQxhAQH5q/aiVWuiOFdKKya6gU3Zt5S5sdsU2sJXJ6/88XcT1opBSoAR
 nbkWV312oTZsOO09jfQzf5zjv0vVHnWthaxNoZjMeCphSnB1pg3OdnZCgm/OlzpbsS
 G0BsBPaQxsBwZ4CdymZUENMss+C/d7RTe/UmjpH7GaGykH2fByntlogT23C3/8QTnV
 s1geyUg+9QvKnx+E3QBNOYNG5RdksmwkgY+8ZTHejLRKN6moQ9ZF5KtJXvCG1KT+2J
 aMM/w7v06c1v9cHBSlNACeACycTcOS7goLAwvVFylFzhqSWPSEptpOovkpSVPEGpxr
 xS3sRc1LsArbg==
Received: by pdx-korg-bugzilla-2.web.codeaurora.org (Postfix, from userid 48)
 id EDD1362AB1; Mon, 29 Mar 2021 13:43:17 +0000 (UTC)
From: bugzilla-daemon@bugzilla.kernel.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 212469] plymouth animation freezes during shutdown
Date: Mon, 29 Mar 2021 13:43:15 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Video(DRI - non Intel)
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: low
X-Bugzilla-Who: ascoli.minnocci@gmail.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: cc
Message-ID: <bug-212469-2300-wooldGVQ3V@https.bugzilla.kernel.org/>
In-Reply-To: <bug-212469-2300@https.bugzilla.kernel.org/>
References: <bug-212469-2300@https.bugzilla.kernel.org/>
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

https://bugzilla.kernel.org/show_bug.cgi?id=212469

Francesco Minnocci (ascoli.minnocci@gmail.com) changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
                 CC|                            |ascoli.minnocci@gmail.com

--- Comment #2 from Francesco Minnocci (ascoli.minnocci@gmail.com) ---
I can also reproduce the same behaviour, here are my system specifications:

Build Date & Hardware
- Kernel: 5.11.10-zen1-1-zen (but can also reproduce on `linux`
5.11.10.arch1-1)
- CPU: Intel i7-7500U
- GPU: Intel HD Graphics 620 (+ nvidia 940mx, but I don't use it)
- Video Drivers: Intel modesetting driver (+ I deactivated nouveau)
- WM: dwm
- plymouth version: 0.9.5-6 from official Arch repos

I didn't customize any xorg settings for the intel video drivers.

-- 
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
