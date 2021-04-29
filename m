Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7C80B36EA9C
	for <lists+dri-devel@lfdr.de>; Thu, 29 Apr 2021 14:38:08 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8AC906EE94;
	Thu, 29 Apr 2021 12:38:06 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C4EF06EE94
 for <dri-devel@lists.freedesktop.org>; Thu, 29 Apr 2021 12:38:04 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPS id 7BBA3613F7
 for <dri-devel@lists.freedesktop.org>; Thu, 29 Apr 2021 12:38:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1619699884;
 bh=E3GMJnAqeFUy4YHKoi9Y624OXxItgBff2cmLJ5kbmzs=;
 h=From:To:Subject:Date:In-Reply-To:References:From;
 b=ZylpzhnVx1FVesFQ7+Pn8LuOm2TFWatr9/TLGwI6fsXPd+PODnq+7+MOX/qmVyFOx
 ynSpzJSehby8Hjkd7Sq8/nGsNA2KzwC7z3Hh8Ho5ZUX6zzebGUIGzwlHyR9N6b8nw+
 PPSB61ee1RncY3/OylLxX5lAFx+CuVhY3lVmH7QtgPzi31b+/T7up/SDQ0Ere3NdKX
 hd/6jvoQumG/3jFa7Dpb6aGSHbZ3BwiafZhB8YDRJAomdO5CasNNuaPH/I4ZfdGfI8
 dkXcLPB/TuEQbhTT45+VJUG23MsJimnSqt5a4HnDGZ7L8xWaQU7lm/RKxWw4g2Vf8i
 2J5q8UPlz/YfA==
Received: by pdx-korg-bugzilla-2.web.codeaurora.org (Postfix, from userid 48)
 id 793C161057; Thu, 29 Apr 2021 12:38:04 +0000 (UTC)
From: bugzilla-daemon@bugzilla.kernel.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 212881] nouveau: BUG: kernel NULL pointer dereference in
 nouveau_bo_sync_for_device
Date: Thu, 29 Apr 2021 12:38:04 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Video(DRI - non Intel)
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: dave.mueller@gmx.ch
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: cf_regression
Message-ID: <bug-212881-2300-qsLeCAK4Ll@https.bugzilla.kernel.org/>
In-Reply-To: <bug-212881-2300@https.bugzilla.kernel.org/>
References: <bug-212881-2300@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=212881

dave.mueller@gmx.ch changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
         Regression|No                          |Yes

-- 
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
