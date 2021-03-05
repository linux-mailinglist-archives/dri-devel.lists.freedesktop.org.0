Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0FB4032F43E
	for <lists+dri-devel@lfdr.de>; Fri,  5 Mar 2021 20:50:19 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7E7C76EC37;
	Fri,  5 Mar 2021 19:50:15 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7E4E86EC37
 for <dri-devel@lists.freedesktop.org>; Fri,  5 Mar 2021 19:50:13 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPS id 3FDDF65018
 for <dri-devel@lists.freedesktop.org>; Fri,  5 Mar 2021 19:50:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1614973813;
 bh=Qh10UzHVp38naRqDwDaza74lYWpLdqFjMks9Mxfcu2w=;
 h=From:To:Subject:Date:In-Reply-To:References:From;
 b=O+KYWGHhpda2975rZoSJ+N11iGp4iCNQEh/7fqUhL98f42Hw2EpPJSUwlSeXXKi5E
 mmGy4kcA9Oh7F5KPqQJtpYqUdFkZSz66/7qyOUpN2bjS/M83idqIB3OehwSQWBj6dU
 67uPNKApKb0sdWcrTPa7LKBGI8YAfL8PCL+VhXUJDXFa8ClEcODBWDpG/iZWYMLfkf
 lSIQcK0rFJnDaOMnoPQTnePAgepTy7RdcN38nxdWPMakgoLbKfDofr8cucLTyAbs3F
 kKGQRfkPJQSRuaZ6SDuTpDaFOm+ArKOdchLeH3uzgwisbUaPM5xrHy2EwB/nIrq8q2
 +lPV+30Nx0z6w==
Received: by pdx-korg-bugzilla-2.web.codeaurora.org (Postfix, from userid 48)
 id 3065565307; Fri,  5 Mar 2021 19:50:13 +0000 (UTC)
From: bugzilla-daemon@bugzilla.kernel.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 212077] AMD GPU discrete card memory at highest frequency even
 while not in use
Date: Fri, 05 Mar 2021 19:50:12 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Video(DRI - non Intel)
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: high
X-Bugzilla-Who: bat_malin@abv.bg
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: attachments.created
Message-ID: <bug-212077-2300-tYDnSRcyVS@https.bugzilla.kernel.org/>
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

--- Comment #1 from Bat Malin (bat_malin@abv.bg) ---
Created attachment 295679
  --> https://bugzilla.kernel.org/attachment.cgi?id=295679&action=edit
Picture of memory status

-- 
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
