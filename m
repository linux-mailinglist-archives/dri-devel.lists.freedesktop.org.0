Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 1CC5E306C78
	for <lists+dri-devel@lfdr.de>; Thu, 28 Jan 2021 05:51:17 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id ECE9F6E8C4;
	Thu, 28 Jan 2021 04:51:13 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 009346E8C4
 for <dri-devel@lists.freedesktop.org>; Thu, 28 Jan 2021 04:51:12 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPS id AEF0160235
 for <dri-devel@lists.freedesktop.org>; Thu, 28 Jan 2021 04:51:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1611809472;
 bh=MdVf4+Um6SRxfkb9PU3mzSnsjiCUoXTFdEfLe0BAwuM=;
 h=From:To:Subject:Date:In-Reply-To:References:From;
 b=Fx2v+IVyYrO5eX962js9zv1ebdIFUvZ+nMclTOSV3/ETt0PLKqCH7mweJ9dldT+d2
 uAUtEkxMIma4BfWYKqeFjc/3SupHek/zYa5219/KUYQLkB6aEdQD57orseGrym6SC4
 b5jN1HQrNEZ8pyGDBGjAj3EaT492jUMNGA6ybGAfoQFn7Pk+1lPaI76M3uJ9D//p56
 jXEV1nZj2ClsEPhubcJ2zNtqIWxXkddidVM4A7+5xDPWZuyrS4BVVe9uNoA7itQl5Q
 erP8iLw/MeApSQukjstsA7ZXCPgwUxHr1qVn9iQuYm6uUJS2GeTw9jbVyYVT3N+Fx0
 FQGs1+RHNfteQ==
Received: by pdx-korg-bugzilla-2.web.codeaurora.org (Postfix, from userid 48)
 id A2E87652FB; Thu, 28 Jan 2021 04:51:12 +0000 (UTC)
From: bugzilla-daemon@bugzilla.kernel.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 211349] IB test failed on sdma0 ! AMDGPU driver for Raven APU
 (ryzen 2400G) hangs!
Date: Thu, 28 Jan 2021 04:51:12 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Video(DRI - non Intel)
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: bolando@163.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-211349-2300-BbKx8dQ1KJ@https.bugzilla.kernel.org/>
In-Reply-To: <bug-211349-2300@https.bugzilla.kernel.org/>
References: <bug-211349-2300@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=211349

--- Comment #20 from bolando@163.com ---
  Everything is OK!I recompiled the 5.10.8 X64 kernel,AMDGPU is successful load
!It seems the 32bit kernel is not supported now .I think the AMDGPU drivers
need IOMMU and HSPA support,the 32bit kernel haven't supported them.
  Thanks for all people who replied and helped me ! Thanks a lot !

-- 
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
