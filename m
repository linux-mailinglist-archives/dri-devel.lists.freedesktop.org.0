Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 35A9A304572
	for <lists+dri-devel@lfdr.de>; Tue, 26 Jan 2021 18:37:09 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DE74C89BF4;
	Tue, 26 Jan 2021 17:37:05 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1C5EB89BF4
 for <dri-devel@lists.freedesktop.org>; Tue, 26 Jan 2021 17:37:05 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPS id EFEA52228A
 for <dri-devel@lists.freedesktop.org>; Tue, 26 Jan 2021 17:37:04 +0000 (UTC)
Received: by pdx-korg-bugzilla-2.web.codeaurora.org (Postfix, from userid 48)
 id EDCEE652CD; Tue, 26 Jan 2021 17:37:04 +0000 (UTC)
From: bugzilla-daemon@bugzilla.kernel.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 211349] IB test failed on sdma0 ! AMDGPU driver for Raven APU
 (ryzen 2400G) hangs!
Date: Tue, 26 Jan 2021 17:37:04 +0000
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
Message-ID: <bug-211349-2300-x8j3eKdM64@https.bugzilla.kernel.org/>
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

--- Comment #9 from bolando@163.com ---
(In reply to Alex Deucher from comment #8)
> (In reply to bolando from comment #7)
> > Yes,maybe Ubuntu kernel applyed some patch? Otherwise AMDGPU driver only
> > worked on X86_64 ? The radeon drivers worked well on 32bit kernel. I have
> > Caicos and Oland chipset radeon graphic cards,all be drived perfect on
> > LFS-10.0 i686 arch!
> 
> It should work in theory.  That said, we don't do regular validation of 32
> bit any more.

Thanks for you relay,depend on general-purpose of drivers development,AMDGPU
should work on 32bit arch.But I don't know what wrong with it.The AMDGPU driver
for me lack of kfd ,APU node topology and   amdgpudrmfb(fb0 interface),I want
to know how to fix it. The firmware and kernel is nearly newest ,but 5.10.9 do
more things on resetting the GPU, show more debug information than 5.8.0.

-- 
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
