Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6173C36370A
	for <lists+dri-devel@lfdr.de>; Sun, 18 Apr 2021 19:40:59 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C91DD89FAD;
	Sun, 18 Apr 2021 17:40:54 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 94D5C89FAD
 for <dri-devel@lists.freedesktop.org>; Sun, 18 Apr 2021 17:40:53 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPS id C01946109F
 for <dri-devel@lists.freedesktop.org>; Sun, 18 Apr 2021 17:40:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1618767651;
 bh=6QZyG5lcXbvgIg5pV1mMAYULQk67STyZLHgTpxi6cNs=;
 h=From:To:Subject:Date:In-Reply-To:References:From;
 b=dUScqZo+nKNpQx5Woa0gwCvyJub/vi9qh64WPojKqSPqu9frm2SiinbR0xkWr/T47
 JJVig7Xs/giHyphONEk/jTpbFRd0SZGHjQ0axqAM+sgecjxyjY94U6g60kMJgaeDF8
 6ZbJ3MDz6rYt9OulWeJFT4LIQ9rAwds7rNnKB6SeGv0CtJ6s5g/pKJy5QUOqYxtog9
 P/Nu60Sjsz675kNfqgFEVW8ipHNjIV7UQyYJ7n+quoxDs/apT4TSDpLoNch6Y99lzd
 aHcBcqHsPp54CQFXTnKwJvjvgMeaZpi80y+/InHe/AiD5W/dihHqDLkC0SW6mryCSY
 D1suA4GkyW8SA==
Received: by pdx-korg-bugzilla-2.web.codeaurora.org (Postfix, from userid 48)
 id B4FD86120D; Sun, 18 Apr 2021 17:40:51 +0000 (UTC)
From: bugzilla-daemon@bugzilla.kernel.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 212369] AMDGPU: GPU hangs with '*ERROR* Couldn't update BO_VA
 (-12)' on MIPS64
Date: Sun, 18 Apr 2021 17:40:51 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Video(DRI - non Intel)
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: xry111@mengyan1223.wang
X-Bugzilla-Status: RESOLVED
X-Bugzilla-Resolution: CODE_FIX
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: bug_status resolution
Message-ID: <bug-212369-2300-lRfTfJjl0J@https.bugzilla.kernel.org/>
In-Reply-To: <bug-212369-2300@https.bugzilla.kernel.org/>
References: <bug-212369-2300@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=212369

Xi Ruoyao (xry111@mengyan1223.wang) changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
             Status|NEW                         |RESOLVED
         Resolution|---                         |CODE_FIX

--- Comment #3 from Xi Ruoyao (xry111@mengyan1223.wang) ---
Fixed at 566c6e25f957ebdb0b6e8073ee291049118f47fb.

-- 
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
