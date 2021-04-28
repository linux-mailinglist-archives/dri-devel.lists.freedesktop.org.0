Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 45FAA36D80B
	for <lists+dri-devel@lfdr.de>; Wed, 28 Apr 2021 15:09:09 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4CF786EB33;
	Wed, 28 Apr 2021 13:09:07 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 65C306EB33
 for <dri-devel@lists.freedesktop.org>; Wed, 28 Apr 2021 13:09:05 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPS id 1123361419
 for <dri-devel@lists.freedesktop.org>; Wed, 28 Apr 2021 13:09:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1619615345;
 bh=pdakhA+0UozZQ0BnDGwD5CyfWR2hm8xfojp/DB4ZtOU=;
 h=From:To:Subject:Date:In-Reply-To:References:From;
 b=pEbqmyVnlZwAtrmCX2rc7BlhLxMAB/31kVHRST86MmDeT+t7iXhIrZ3cvC2NDn9PF
 F7kiwBLn4bx2qpl/WxQO32+sLQQb/A5mul4D3VhblUi5eOw074QBjY/Ld5A+Io9PPG
 UEYmFpfn3uEVItLC3AyRIJ7HVMG9Kh2r1EgKXGfncTyMInXoNsHq5gDs0IdOVXPCZ9
 fOVhMZReR040vB/g+r5JNvLV+TbH3UiKoE01lt2JmgSJu4tcAHLiSseh/XatNeV5G2
 It8N5BbDBxu+mI+DgEiJ3NQzagn/QG946lQOraGrRL44N3gL5+9VG1FkSOWYnLJbgz
 /9jvcZWgtRy4w==
Received: by pdx-korg-bugzilla-2.web.codeaurora.org (Postfix, from userid 48)
 id 0A45761287; Wed, 28 Apr 2021 13:09:05 +0000 (UTC)
From: bugzilla-daemon@bugzilla.kernel.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 212871] AMD Radeon Pro VEGA 20 (Aka Vega12) - Glitch and freeze
 on any kernel and/or distro.
Date: Wed, 28 Apr 2021 13:09:04 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Video(DRI - non Intel)
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: blocking
X-Bugzilla-Who: alexdeucher@gmail.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: cc
Message-ID: <bug-212871-2300-2OTvRcrS4C@https.bugzilla.kernel.org/>
In-Reply-To: <bug-212871-2300@https.bugzilla.kernel.org/>
References: <bug-212871-2300@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=212871

Alex Deucher (alexdeucher@gmail.com) changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
                 CC|                            |alexdeucher@gmail.com

--- Comment #1 from Alex Deucher (alexdeucher@gmail.com) ---
amdgpu pro uses the same driver as upstream, just packaged so that you can
install it on enterprise distros, so the code is the same.  What driver package
version did you use?  What upstream kernels have you tried?  Please include the
dmesg output from the working and non-working cases.

-- 
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
