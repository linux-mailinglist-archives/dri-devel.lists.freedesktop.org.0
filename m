Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C86CF330635
	for <lists+dri-devel@lfdr.de>; Mon,  8 Mar 2021 04:01:13 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EE0896E29D;
	Mon,  8 Mar 2021 03:01:11 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9C64C6E29D
 for <dri-devel@lists.freedesktop.org>; Mon,  8 Mar 2021 03:01:11 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPS id D67D7650E0
 for <dri-devel@lists.freedesktop.org>; Mon,  8 Mar 2021 03:01:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1615172469;
 bh=zmNrLWK+7mBDSRgIPGHUZObvShW551UD6V2LZ6kUyV0=;
 h=From:To:Subject:Date:In-Reply-To:References:From;
 b=Eccg5IxEs4gaQ8nDtVEaqq+Gt01jHwUXKExXWLTWSbiIawxm6bKpszzhJHVlwFZZB
 IXNooUNjxv8DMVhEEbvFmn/otMy9cOTQ/wjOzcnAGtxRA9yhehoWOs/yoIGhcUJHwa
 pzKFqRlc1TnbvxOvoM1L2g3v4erGOgvcZo1xO6rgvqx15rxLDQpKvewHhHEVg5X2n3
 oSCtWRnqQyD9bf0V4ysmq4QbFb6qCQk1kCVweDjCji+ATe0tBbMdCdU5TtdrK7QUOD
 fyr9hKxTc8izDOOIwqmn33udQyjLzAgfZ0pN6l5tKpCft2tQjxruEbTllY06nL4y5+
 68Eo5nsFlzsMQ==
Received: by pdx-korg-bugzilla-2.web.codeaurora.org (Postfix, from userid 48)
 id CDCFE6534A; Mon,  8 Mar 2021 03:01:09 +0000 (UTC)
From: bugzilla-daemon@bugzilla.kernel.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 210849] Black screen after resume from long suspend. Open/Close
 lid. AMDGPU
Date: Mon, 08 Mar 2021 03:01:09 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Video(DRI - non Intel)
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: blocking
X-Bugzilla-Who: jvdelisle@charter.net
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-210849-2300-etrNNmjKPt@https.bugzilla.kernel.org/>
In-Reply-To: <bug-210849-2300@https.bugzilla.kernel.org/>
References: <bug-210849-2300@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=210849

--- Comment #18 from JerryD (jvdelisle@charter.net) ---
(In reply to JerryD from comment #17)
> Possible fixed in this commit:
> 
> https://github.com/torvalds/linux/commit/
> a81bfdf8bf5396824d7d139560180854cb599b06

No noy fixed.  I ahve tried up to:

5.11.3-50.fc33.x86_64"

Exact same failure.  I have add to clear off a buncg of files to make room on
this laptop to start doing kernel builds in hopes of identifying the breakage.

-- 
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
