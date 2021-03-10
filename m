Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 9B353334911
	for <lists+dri-devel@lfdr.de>; Wed, 10 Mar 2021 21:44:40 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 74F116E2F2;
	Wed, 10 Mar 2021 20:44:36 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 03FCE6E2F2
 for <dri-devel@lists.freedesktop.org>; Wed, 10 Mar 2021 20:44:34 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPS id 0D9EB64EF6
 for <dri-devel@lists.freedesktop.org>; Wed, 10 Mar 2021 20:44:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1615409073;
 bh=cbwx0D5E+JlrKVb0tNfdaiaB49mYT/xv/GBMARqun+Y=;
 h=From:To:Subject:Date:In-Reply-To:References:From;
 b=XnkKmfHoKcFgRdiOhjGwNaQkPUQ7lFHjXEhgpEYzEm8PFOBGC+3lS3AVAMHFvVaM3
 Ke2o0kh1foZ4T6fyCfash/PXoV2pjRtb5mjlbeE0ddWF994OonUzHT5wEC+WpeX1NR
 DOP4zmcFs7pWQHqMovse6KAikIyrdbTtFk80dkleLgi9lIjRX7HfrXqDcGDcE8I6RI
 Z3uhmxGYy0t309pcvTB5TFwAyYddRK9uV0u0IhVJMYsj5TTBCnBw6HCyAOLV4T6HRW
 S9TQmN+Nx2vyvNmuGG3BwhHDhyc0CmMqEGQpQNBgliTA6vi7gN8/p2DOJkNXgqy85c
 2maMudosK3M6Q==
Received: by pdx-korg-bugzilla-2.web.codeaurora.org (Postfix, from userid 48)
 id 0422765381; Wed, 10 Mar 2021 20:44:33 +0000 (UTC)
From: bugzilla-daemon@bugzilla.kernel.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 212077] AMD GPU discrete card memory at highest frequency even
 while not in use
Date: Wed, 10 Mar 2021 20:44:32 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Video(DRI - non Intel)
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: high
X-Bugzilla-Who: bat_malin@abv.bg
X-Bugzilla-Status: REOPENED
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-212077-2300-BdZQmEK0Ku@https.bugzilla.kernel.org/>
In-Reply-To: <bug-212077-2300@https.bugzilla.kernel.org/>
References: <bug-212077-2300@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=212077

--- Comment #5 from Bat Malin (bat_malin@abv.bg) ---
Issue still present in 5.11.5
 1.335057] amdgpu: Clock is not in range of specified clock range for watermark
from DAL!  Using highest water mark set.

-- 
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
