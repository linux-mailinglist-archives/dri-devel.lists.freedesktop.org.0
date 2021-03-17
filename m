Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 272C433F8D3
	for <lists+dri-devel@lfdr.de>; Wed, 17 Mar 2021 20:11:42 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 00912899DB;
	Wed, 17 Mar 2021 19:11:38 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8DD1F899DB
 for <dri-devel@lists.freedesktop.org>; Wed, 17 Mar 2021 19:11:36 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPS id 9D2B864F55
 for <dri-devel@lists.freedesktop.org>; Wed, 17 Mar 2021 19:11:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1616008294;
 bh=MA65inSiiEOa3bIbPPD2wz375XYcEo+VPwqzAhSbqRs=;
 h=From:To:Subject:Date:In-Reply-To:References:From;
 b=qdk60SUGNsTDj3xfRpgliPArANJled6DMzcjtp6G5/ewd51WrKLi0cIWNo3NjDSfN
 mbjXlfB7IQtpiXh/KorPbR6B8MR9cvmdiV8eTSkYWQsZG1tJ+1RwBUsHBS1BZKXtLE
 o6gnNHfjgb1u+/JECR7POIJFh31k5MckoazZQC2RbVa/rjLPfKuzDFvMj4yo10HYNi
 PvK3YKhmvvB60mK9x0p2/N3onuuRpN79oRnQsLxGdbRqcfXWumos0uE1du2PuYfRff
 YbY2DGt8KDBPQ5NI4TwJFt8XWnzfIwFyGqVP0XxExksDvNxvF7MDZBS0wAUsqa7ogU
 yUJUcQFfwTDCg==
Received: by pdx-korg-bugzilla-2.web.codeaurora.org (Postfix, from userid 48)
 id 8C719653C7; Wed, 17 Mar 2021 19:11:34 +0000 (UTC)
From: bugzilla-daemon@bugzilla.kernel.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 212077] AMD GPU discrete card memory at highest frequency even
 while not in use
Date: Wed, 17 Mar 2021 19:11:34 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Video(DRI - non Intel)
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: high
X-Bugzilla-Who: bat_malin@abv.bg
X-Bugzilla-Status: RESOLVED
X-Bugzilla-Resolution: CODE_FIX
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: bug_status resolution
Message-ID: <bug-212077-2300-p7xQ44HK34@https.bugzilla.kernel.org/>
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
             Status|REOPENED                    |RESOLVED
         Resolution|---                         |CODE_FIX

--- Comment #8 from Bat Malin (bat_malin@abv.bg) ---
Code fixed in 5.11.7
Thank you!

-- 
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
