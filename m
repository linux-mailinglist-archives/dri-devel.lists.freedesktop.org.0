Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 2056C35A995
	for <lists+dri-devel@lfdr.de>; Sat, 10 Apr 2021 02:39:29 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5BE4C6EC6E;
	Sat, 10 Apr 2021 00:39:27 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 55C376EC6F
 for <dri-devel@lists.freedesktop.org>; Sat, 10 Apr 2021 00:39:26 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPS id 1729E61029
 for <dri-devel@lists.freedesktop.org>; Sat, 10 Apr 2021 00:39:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1618015166;
 bh=3ddXfGsNUtwldodwS7NOSTjSeyeZAH5nrXoRsXSZqYY=;
 h=From:To:Subject:Date:In-Reply-To:References:From;
 b=IMvH/utG7d60apx2XSQpyNOx6P8d3LeyIi4rxwDJoxOO9sK+PapzJLY7FdjSgu59g
 UehuJPvK6q2A/czFjQnQCVoTy6MaDcIxJKpmuBxRKLBqYVmBREBZIvLDr6zRAAw8HM
 mcYFirJTUnCCg8O/42jI7u6TJ6gxWG54Q4o+UO29uemXOqJ2R//SUsadmX8nO0Wzki
 TmFz5CKax2fye3VZFPScIgLSXDOPACOORCUVBu1qW/DECIkY7vXLZULZiB9sZkO9Sc
 GpEiNUDdE6IU+OvyY9Cs8X3sL6s5b6iplYCJDl/K5WKkMF42BY0aI/ucixHYR+Dv/H
 49+Ap3vXGhh6A==
Received: by pdx-korg-bugzilla-2.web.codeaurora.org (Postfix, from userid 48)
 id 1074361151; Sat, 10 Apr 2021 00:39:26 +0000 (UTC)
From: bugzilla-daemon@bugzilla.kernel.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 212635] nouveau 0000:04:00.0: fifo: fault 00 [READ] at
 0000000000380000 engine 00 [GR] client 14 [HUB/SCC] reason 02 [PTE] on
 channel 5 [007fabf000 X[570]]
Date: Sat, 10 Apr 2021 00:39:25 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Video(DRI - non Intel)
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: erhard_f@mailbox.org
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: attachments.created
Message-ID: <bug-212635-2300-UCLS1pz8dC@https.bugzilla.kernel.org/>
In-Reply-To: <bug-212635-2300@https.bugzilla.kernel.org/>
References: <bug-212635-2300@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=212635

--- Comment #1 from Erhard F. (erhard_f@mailbox.org) ---
Created attachment 296317
  --> https://bugzilla.kernel.org/attachment.cgi?id=296317&action=edit
kernel .config (kernel 5.11.12)

-- 
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
