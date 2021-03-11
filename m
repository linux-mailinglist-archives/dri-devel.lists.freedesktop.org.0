Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4A8A83374BF
	for <lists+dri-devel@lfdr.de>; Thu, 11 Mar 2021 14:55:16 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 786246ECEE;
	Thu, 11 Mar 2021 13:55:12 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DEF9C6ECEE
 for <dri-devel@lists.freedesktop.org>; Thu, 11 Mar 2021 13:55:10 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPS id E88C664FA6
 for <dri-devel@lists.freedesktop.org>; Thu, 11 Mar 2021 13:55:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1615470908;
 bh=xDc6wJU4NjYUxdACm4wRUu6KUNxNDyC1h6hR36k/HEg=;
 h=From:To:Subject:Date:In-Reply-To:References:From;
 b=prdgSU6SbNljQQIxaXOYLfrh70LZf+GKsfiVknKwDhyzHvNtV7cLCNG/4WScj5Vbh
 RFuVagg4gNqJVAbEUHjvHD81OrhAPz9LrzdRvtJ5H4Koo04Ql0m7+tpwfliIx5g8Qv
 /eOFB1VWSCuBDK2fzQ7XL7M8k4SgknS5xmKZkAb4NEvox8PIw7+0T+MzjUY35IXmr4
 pSfxzwbGV8k5Lxz3tiLj9Ddh1CI7ctkcIt+oCq2snZTrg2Wrr6Nk7JCnP1JbvLmePW
 9Q7gb3T5Xv+WFqLx8JtkqCP7Ha3YP6JXS6tCmg5VbPJBlx6dklMzXpbGKw7JBnCD80
 b63TDPPdIvzpw==
Received: by pdx-korg-bugzilla-2.web.codeaurora.org (Postfix, from userid 48)
 id DADED653BF; Thu, 11 Mar 2021 13:55:08 +0000 (UTC)
From: bugzilla-daemon@bugzilla.kernel.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 211277] sometimes crash at s2ram-wake (Ryzen 3500U): amdgpu,
 drm, commit_tail, amdgpu_dm_atomic_commit_tail
Date: Thu, 11 Mar 2021 13:55:08 +0000
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
Message-ID: <bug-211277-2300-l3Jvi9IOpi@https.bugzilla.kernel.org/>
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

--- Comment #15 from kolAflash (kolAflash@kolahilft.de) ---
(In reply to Alex Deucher from comment #10)
> Can you bisect? 
> https://www.kernel.org/doc/html/latest/admin-guide/bug-bisect.html

I've done several s2ram-wakeup cycles (100 automatic and about three manual
wakeups/day) with the kernel I compiled on 2021-03-07.

It's based on 5.10.21 with c6d2b0fbb reverted. (as suggested by Jerome)
Result: No crashes.
This looks very prosiming!

@Alex
Can I help with anything else to solve this?




I also compiled 5.10.21 without reverting c6d2b0fbb, tested it for a few hours
and got three wakeup-crashes.

-- 
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
