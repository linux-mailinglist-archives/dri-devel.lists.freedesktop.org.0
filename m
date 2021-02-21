Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 63EF93207CB
	for <lists+dri-devel@lfdr.de>; Sun, 21 Feb 2021 01:17:19 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8865B6E8DF;
	Sun, 21 Feb 2021 00:17:15 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B42E76E8DF
 for <dri-devel@lists.freedesktop.org>; Sun, 21 Feb 2021 00:17:14 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPS id 7AEDC64EE6
 for <dri-devel@lists.freedesktop.org>; Sun, 21 Feb 2021 00:17:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1613866634;
 bh=WODcKQ+7+16FS/AsKpVT5lMMyBIbEvC8scNxaXkEqwM=;
 h=From:To:Subject:Date:In-Reply-To:References:From;
 b=I/YCUAu369qIzXwupErCvZwe8zo8buOK3TlgL7mubP2WkXYgHt19PG/OgN3DPzOYT
 KbDs0tCg8nF1eCLlJdOc/vH+BieERKqilCZIpvqM/fgudNYsi/PCXPd9B0HmaYnfWP
 u5jJ4RbeWhvtMZgNupFYCOIFA54DYGiZNYygeR6HBQRHwOD9BCL106sVTlzdidcVOt
 jPMUcTsD2sYfIRGhTqM4yW9e7SMV7g6kxgIjMNQbYtLQtLrNDSP3WjztGbJTzuOqjD
 AV/Ejm9OkJPTzsi21F6D3GnpAgmGzb1x1m43uH0MmDyKE0Ui94RXU892oo4704/mIT
 on53uaa6OgRJA==
Received: by pdx-korg-bugzilla-2.web.codeaurora.org (Postfix, from userid 48)
 id 6BF4365351; Sun, 21 Feb 2021 00:17:14 +0000 (UTC)
From: bugzilla-daemon@bugzilla.kernel.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 211277] sometimes crash at s2ram-wake (Ryzen 3500U): amdgpu,
 drm, commit_tail, amdgpu_dm_atomic_commit_tail
Date: Sun, 21 Feb 2021 00:17:14 +0000
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
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-211277-2300-18sLkDWz5P@https.bugzilla.kernel.org/>
In-Reply-To: <bug-211277-2300@https.bugzilla.kernel.org/>
References: <bug-211277-2300@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=211277

--- Comment #9 from kolAflash (kolAflash@kolahilft.de) ---
I'm on Linux-5.7 now since 2021-01-26.
And I woke up the notebook at least once a day since then.
So it's clearly a regression in the kernel somewhere between 5.7 and 5.10 and
probably between 5.7 and 5.8.

And it's definitely not a BIOS issue, because I changed anything about the BIOS
since the problem appeared last time with Kernel-5.10.

Regards,
kolAflash

-- 
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
