Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A5FD531B2CB
	for <lists+dri-devel@lfdr.de>; Sun, 14 Feb 2021 22:35:37 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A89036E0C5;
	Sun, 14 Feb 2021 21:35:35 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CCA916E0C5
 for <dri-devel@lists.freedesktop.org>; Sun, 14 Feb 2021 21:35:34 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPS id AC30664DE0
 for <dri-devel@lists.freedesktop.org>; Sun, 14 Feb 2021 21:35:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1613338534;
 bh=tHoaySEuHfDGmetsMZ6mBDIkkotkv5QChdeUCRwAfFg=;
 h=From:To:Subject:Date:In-Reply-To:References:From;
 b=bTmGTFavt2qRNSFr+3BfR275FG266a0wIY0K34DUBrs9bpDJlVeChi1eQ+IGd7ckt
 0ejZZr1K41GzVjLsYkRyS8xLF1SzFdLAGyNlEEX/hYQ61Par1u5bqdUzVMtD1+EeUo
 lt1uvrOA7dY5Ojy4KUdsO7frUg6tDlo+IGoB+RXeB2vOF14XXRioXmrxH9keNqMaO0
 3Btqx/tC6FqXlB+35Ptzyq09cPK1BFp/CJFAw/e73zJYlQ+GSn9QiqIjCs5rqttW+q
 WdPDoYAdGXvdq1hF6wxBOSguxnXDM/R8EfDRIQz+ZMLpMqv5nrso6dGy/ZD4FDK+Lc
 sXhejDk2bmgZQ==
Received: by pdx-korg-bugzilla-2.web.codeaurora.org (Postfix, from userid 48)
 id A943F65374; Sun, 14 Feb 2021 21:35:34 +0000 (UTC)
From: bugzilla-daemon@bugzilla.kernel.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 211745] Latest 5.11 git doesn't boot.
Date: Sun, 14 Feb 2021 21:35:34 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Video(DRI - non Intel)
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: blocking
X-Bugzilla-Who: rmuncrief@humanavance.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: attachments.created
Message-ID: <bug-211745-2300-baagTIA4W0@https.bugzilla.kernel.org/>
In-Reply-To: <bug-211745-2300@https.bugzilla.kernel.org/>
References: <bug-211745-2300@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=211745

--- Comment #3 from Robert M. Muncrief (rmuncrief@humanavance.com) ---
Created attachment 295277
  --> https://bugzilla.kernel.org/attachment.cgi?id=295277&action=edit
Bad dmesg

-- 
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
