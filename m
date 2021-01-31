Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id BD6F5309C4C
	for <lists+dri-devel@lfdr.de>; Sun, 31 Jan 2021 14:12:02 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3EDBF89BF0;
	Sun, 31 Jan 2021 13:11:58 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5E45A89BF0
 for <dri-devel@lists.freedesktop.org>; Sun, 31 Jan 2021 13:11:57 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPS id 2776D64D9E
 for <dri-devel@lists.freedesktop.org>; Sun, 31 Jan 2021 13:11:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1612098717;
 bh=Z7vl5mdS7sxLQkb1I6dFctFwiOxzyicAr6v/5hyGKVk=;
 h=From:To:Subject:Date:In-Reply-To:References:From;
 b=Wg7M6pH5KC3N646sdA2BMnI2pnAOFGk7dLgvYrL3yYOuqhffvbHsRvV3AwmsNRopf
 914F9wBTBsLmr4A6FlJShxu/zLz2IMqP9vljikVCWHkMulwJTFHY7bDvVgtv7fYP5E
 q13NIe4182h0WZsU0+1IESHZ03whTtQSKgpCXNdXREc1DPQrOSiMRhCS/b6JwD7q/o
 JqAVEbBZ6YN5t8Nj1u1GJAOjTys1mCXr5ULUxwq278/rEJF1122RYHz/Q+m3+L4j+N
 CmnwnJ+EX9r8iPpRwgb+c4hXgFKQpruFrIxG2iC/yDRRmngQKkMtnek/iO9xG3RUtm
 6ubo36DJIVvug==
Received: by pdx-korg-bugzilla-2.web.codeaurora.org (Postfix, from userid 48)
 id 1299B6531E; Sun, 31 Jan 2021 13:11:57 +0000 (UTC)
From: bugzilla-daemon@bugzilla.kernel.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 211277] sometimes crash at s2ram-wake (Ryzen 3500U): amdgpu,
 drm, commit_tail, amdgpu_dm_atomic_commit_tail
Date: Sun, 31 Jan 2021 13:11:56 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Video(DRI - non Intel)
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: me@jeromec.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-211277-2300-Ur79C3phiC@https.bugzilla.kernel.org/>
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

--- Comment #8 from Jerome C (me@jeromec.com) ---
I've tried kernel 5.11-rc5 and same issue occurs there.

For now I've downgraded kernel to 5.9.14 ( will update it to 5.9.16 ) until
this issue is fixed

What I've mentioned in comment 4 isn't really helping I think

Sometimes the issue happens frequently in a day but then other times it could
be a few days before it happens again

-- 
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
