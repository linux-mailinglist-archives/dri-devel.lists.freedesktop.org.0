Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 8F90A3407B4
	for <lists+dri-devel@lfdr.de>; Thu, 18 Mar 2021 15:19:29 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 80F676E09A;
	Thu, 18 Mar 2021 14:19:24 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 575626E09A
 for <dri-devel@lists.freedesktop.org>; Thu, 18 Mar 2021 14:19:23 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPS id 23B9564EF9
 for <dri-devel@lists.freedesktop.org>; Thu, 18 Mar 2021 14:19:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1616077163;
 bh=ORAYm1+tAGVI2ERQa9bXh2O/1a1jiYVBa7y+dDguL5s=;
 h=From:To:Subject:Date:In-Reply-To:References:From;
 b=JFk5sWoQR6MQSrKfGWJQhbgqdSfBl4Eoufoca9KdrWbmAdqGrfg416Tg8PClJRlEo
 FqQa6U1JN7g6UKKJDk9FfrKVmMpk9gQA53qpDcbvo7MU+My/Dpg4o7kUALZF0POrpr
 5hqsKJMCXI3YhdPqkw5dkFbMZvPCr4GlBQAY7nS2IkRMvznu0jkK49IJ4JShUBrPp9
 cBJYooz5q5xR2Jj/8zERKnuPTj46GyF9SBWaGJskbsRMi3dKlM0lfX/WzLCrjSMLSz
 OgFB64lTYChLMtH2M/zLgF7APF4HUvx2sUgcMrgCfEfGtTLTFVxem4pAUjW0mKTdzr
 Wx1Rhik+ZY/0Q==
Received: by pdx-korg-bugzilla-2.web.codeaurora.org (Postfix, from userid 48)
 id 1B891653CB; Thu, 18 Mar 2021 14:19:23 +0000 (UTC)
From: bugzilla-daemon@bugzilla.kernel.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 212327] i915 / Kernel Mode Setting - Distorts Screen
Date: Thu, 18 Mar 2021 14:19:22 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Video(DRI - non Intel)
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: roshan@rkarim.xyz
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: attachments.created
Message-ID: <bug-212327-2300-HOzLlXHrAp@https.bugzilla.kernel.org/>
In-Reply-To: <bug-212327-2300@https.bugzilla.kernel.org/>
References: <bug-212327-2300@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=212327

--- Comment #1 from RK (roshan@rkarim.xyz) ---
Created attachment 295915
  --> https://bugzilla.kernel.org/attachment.cgi?id=295915&action=edit
image of screen issue

-- 
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
