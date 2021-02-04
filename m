Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 3EB1830EB9D
	for <lists+dri-devel@lfdr.de>; Thu,  4 Feb 2021 05:49:25 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EF7306EC73;
	Thu,  4 Feb 2021 04:49:22 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C6BA46EC73
 for <dri-devel@lists.freedesktop.org>; Thu,  4 Feb 2021 04:49:21 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPS id 7A9EC64F53
 for <dri-devel@lists.freedesktop.org>; Thu,  4 Feb 2021 04:49:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1612414161;
 bh=mXSYWQzffh9J0MPCMoYOXIgGr7j4zXZ17nYHipy1hcU=;
 h=From:To:Subject:Date:In-Reply-To:References:From;
 b=nUo68S2poWe9y6BZmgmx/7j83fq8fs18sAMElxFMHgGPvbtaycpEKORzfgpkoqyNR
 gStxs3IRAZj2Hfx0aLOPt1pUlI/sOis9nYNKS3mAlptiDVMEEfxucvz8wtMfnpHZts
 wPNWMbHu8MItiiVJVWRdNHuDRhbdAMiDBzV4Coqg0PWQy4nEWp089VbFuEATMxKGPQ
 9Ro9jytXpGhqQcaocMmPLhcwQpw5GjuXtKBZZTYoJDxVUiCtVuwgQBQFqh0TZUa+sO
 oOerEmu5zSmUx1kcXlU9aJoXSdo/NYxNJUllcTQmPmNrUeq81bTHQU2WHd3P8okN5R
 U6dGQS2zaJWyw==
Received: by pdx-korg-bugzilla-2.web.codeaurora.org (Postfix, from userid 48)
 id 6FD916533C; Thu,  4 Feb 2021 04:49:21 +0000 (UTC)
From: bugzilla-daemon@bugzilla.kernel.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 211033] [bisected][regression] amdgpu: *ERROR* Restoring old
 state failed with -12
Date: Thu, 04 Feb 2021 04:49:20 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Video(DRI - non Intel)
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: shawn@anastas.io
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: attachments.created
Message-ID: <bug-211033-2300-2Lip7Gb6wj@https.bugzilla.kernel.org/>
In-Reply-To: <bug-211033-2300@https.bugzilla.kernel.org/>
References: <bug-211033-2300@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=211033

--- Comment #16 from Shawn Anastasio (shawn@anastas.io) ---
Created attachment 295063
  --> https://bugzilla.kernel.org/attachment.cgi?id=295063&action=edit
kernel log

I have encountered the same issue on 5.10.10 which contains the revert.
Attached is my kernel log after switching inputs through my KVM.

System specifications:

GPU: AMD Radeon WX 5100
CPU: IBM POWER9 8-core (x2)
Kernel: 5.10.10

-- 
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
