Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4CB4A33177A
	for <lists+dri-devel@lfdr.de>; Mon,  8 Mar 2021 20:43:14 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5F08089E15;
	Mon,  8 Mar 2021 19:43:10 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 55A0889E15
 for <dri-devel@lists.freedesktop.org>; Mon,  8 Mar 2021 19:43:08 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPS id 340A1652B4
 for <dri-devel@lists.freedesktop.org>; Mon,  8 Mar 2021 19:43:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1615232588;
 bh=TXTxnpyOaBe5tLn5qPEePvS7WvucLBNo9k2Cek/NWHo=;
 h=From:To:Subject:Date:In-Reply-To:References:From;
 b=ce/bXqtTN2RsotCDF7TK5nzUaC+rbvMUxn3PSptm4KhmEmya7szFunlECXDBk2stE
 z23zj75t17BmMBbEcSj/mC3iITG8wjoFeKVl970vqrQP83L0B4+NWN8SJbLCcCNV44
 EXepQeC6SamuAzgklHrIvy9gTin6hHyjF0wZjFHiVFDzElvH3kv+W8/xAL/PtP8OIP
 /wtzacWghfXVambzgJLVJ5TW57AEDTVgxyspMwqnKVuzqMh4QGfvqfRbfZ7nDgU/yT
 xDm/bzLjF0HZUDuJIDUNPw0eL6k1+FSkGoj7NWql/ICHR7OmvvZtRR3flAm4ladObQ
 oHp0nfTiyfqAA==
Received: by pdx-korg-bugzilla-2.web.codeaurora.org (Postfix, from userid 48)
 id 2495D6529D; Mon,  8 Mar 2021 19:43:08 +0000 (UTC)
From: bugzilla-daemon@bugzilla.kernel.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 212077] AMD GPU discrete card memory at highest frequency even
 while not in use
Date: Mon, 08 Mar 2021 19:43:07 +0000
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
X-Bugzilla-Changed-Fields: bug_status resolution
Message-ID: <bug-212077-2300-fYV1vYNVS0@https.bugzilla.kernel.org/>
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

Bat Malin (bat_malin@abv.bg) changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
             Status|RESOLVED                    |REOPENED
         Resolution|PATCH_ALREADY_AVAILABLE     |---

--- Comment #4 from Bat Malin (bat_malin@abv.bg) ---
Issue not fixed in kernel 5.11.4

-- 
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
