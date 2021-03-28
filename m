Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B176E34BD63
	for <lists+dri-devel@lfdr.de>; Sun, 28 Mar 2021 18:59:48 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8496E6E139;
	Sun, 28 Mar 2021 16:59:44 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F31E66E139
 for <dri-devel@lists.freedesktop.org>; Sun, 28 Mar 2021 16:59:42 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPS id 3155F6196D
 for <dri-devel@lists.freedesktop.org>; Sun, 28 Mar 2021 16:59:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1616950781;
 bh=qaqgJm/xAYZ/gACzAK3hwOfk3wNm11TV9cp9wqPs8T0=;
 h=From:To:Subject:Date:In-Reply-To:References:From;
 b=UAKMiuMJELbhihMsPL/uNrVjp0cExBQdrh8G9jCVHrzeCVtHOhoslh+cQYlc/Md/c
 +ApLSRNdl+QN1A7FQHsZOLMqYJgP7WbwMA/v8iTvNGladeKnth8lFx+y++dXCf66MW
 CQDmwUVUSIpyl32B0u2fiC+U9YRkC+zCaUytB0fWJOUJ+KnDWj4fy7UCRTUochvVly
 dFur7LfRve3sumGFjU8UElvxnGYysp0ZyZdIJFvZQKLuLI2Da962RtZGdHoEDazXLI
 Pb+FmbT0JQtahQQBfvw8k6EfYZgXONydjiobS5o2e+V7PoyzOrGmezssH9bOd+IVcT
 /BAszZCDAz3oQ==
Received: by pdx-korg-bugzilla-2.web.codeaurora.org (Postfix, from userid 48)
 id 25FE362AD2; Sun, 28 Mar 2021 16:59:41 +0000 (UTC)
From: bugzilla-daemon@bugzilla.kernel.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 212467] AMDGPU -- amdgpu: Unsupported power profile mode 0 on
 RENOIR (AMD Ryzen 4600H, iGPU rev c7)
Date: Sun, 28 Mar 2021 16:59:40 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Video(DRI - non Intel)
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: alexdeucher@gmail.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: cc
Message-ID: <bug-212467-2300-TRprIMGvP8@https.bugzilla.kernel.org/>
In-Reply-To: <bug-212467-2300@https.bugzilla.kernel.org/>
References: <bug-212467-2300@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=212467

Alex Deucher (alexdeucher@gmail.com) changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
                 CC|                            |alexdeucher@gmail.com

--- Comment #3 from Alex Deucher (alexdeucher@gmail.com) ---
(In reply to Bogdan from comment #0)
> Created attachment 296121 [details]
> dmesg with amdgpu errors
> 
> I have errors in dmesg:
> 
> [   11.850726] UBSAN: shift-out-of-bounds in
> drivers/gpu/drm/amd/amdgpu/../amdkfd/kfd_device_queue_manager.c:1140:32
> [   11.850728] shift exponent 64 is too large for 64-bit type 'long long
> unsigned int'
> 


Fixed in: 
https://cgit.freedesktop.org/drm/drm/commit/?id=50e2fc36e72d4ad672032ebf646cecb48656efe0

> [   12.876987] amdgpu 0000:05:00.0: amdgpu: Unsupported power profile mode 0
> on RENOIR
> 

Harmless; fixed in:
https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?id=e3746696e78f2185633ae9b47c40fabf88bdcf99


> [   29.314776] UBSAN: shift-out-of-bounds in
> drivers/gpu/drm/amd/amdgpu/../display/dc/dml/dcn21/display_rq_dlg_calc_21.c:
> 288:38
> [   29.314782] shift exponent 4294966273 is too large for 32-bit type 'int'


Fixed in:
https://gitlab.freedesktop.org/agd5f/linux/-/commit/f773d381629efade8247a5b25ca1d00d77bc1c1b

-- 
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
