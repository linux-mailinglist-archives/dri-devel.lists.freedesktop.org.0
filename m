Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 6F3F531C625
	for <lists+dri-devel@lfdr.de>; Tue, 16 Feb 2021 06:11:18 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CF63189DC7;
	Tue, 16 Feb 2021 05:11:12 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7C4EC89DC7
 for <dri-devel@lists.freedesktop.org>; Tue, 16 Feb 2021 05:11:11 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPS id 1EC5864E00
 for <dri-devel@lists.freedesktop.org>; Tue, 16 Feb 2021 05:11:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1613452271;
 bh=JfR0M997KwdfKbmfs+KnGzrl/qx7uvHqsQr9eKcwWCE=;
 h=From:To:Subject:Date:In-Reply-To:References:From;
 b=H6YwtHs91cxFZPE1mlrHxYr301Hhoyo0uYMhJA4CZiPtUNfwQg/hjedabdjAHy3Pi
 BMGCA9qBeZgfKsGT7hTKpI6mhLYN3DHcg9c16w5iRe3tvbBSKmPLWxo/0BByzI74OU
 K561GJpER+rFHkmdMjDhcMF527iJiHflcTxSE9PxBqbaJ6Oh86kjdx8YPBbXmaDDGL
 bPYJF/MmtS0pd0nrTeOkMpx9K2PRJepqVqtWwz278QnzQ1wWqO29ZOrOwbLFPt9+TK
 G7Z0JxxkYzv5o/XyfTbFqUibbyP46BgqYbmYIygGIxqmX4mbo/3ejFlu1KT1+m7j2B
 p3nVYs22gAQLg==
Received: by pdx-korg-bugzilla-2.web.codeaurora.org (Postfix, from userid 48)
 id 1AFEF653BC; Tue, 16 Feb 2021 05:11:11 +0000 (UTC)
From: bugzilla-daemon@bugzilla.kernel.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 197327] radeon 0000:01:00.0: failed VCE resume (-110).
Date: Tue, 16 Feb 2021 05:11:10 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Video(DRI - non Intel)
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: zeng.shixin@gmail.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: cc attachments.created
Message-ID: <bug-197327-2300-AasnNwCUbV@https.bugzilla.kernel.org/>
In-Reply-To: <bug-197327-2300@https.bugzilla.kernel.org/>
References: <bug-197327-2300@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=197327

Shixin Zeng (zeng.shixin@gmail.com) changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
                 CC|                            |zeng.shixin@gmail.com

--- Comment #11 from Shixin Zeng (zeng.shixin@gmail.com) ---
Created attachment 295309
  --> https://bugzilla.kernel.org/attachment.cgi?id=295309&action=edit
Skip VCE on R7-240

I am having the same issue with my card R7 240, and decided to do some research
on this and found out that this card didn't seem to have VCE at all
(https://en.wikipedia.org/wiki/Video_Coding_Engine), so it seems to be only a
cosmetic issue. Skipping it eliminated the error message for me, and is not
causing any other issues for me.

Other card ids can be added in the same way once this is tested and determined
to be the right way to fix it.

-- 
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
