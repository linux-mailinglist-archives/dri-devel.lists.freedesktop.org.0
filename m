Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B049033704E
	for <lists+dri-devel@lfdr.de>; Thu, 11 Mar 2021 11:43:41 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C383D6EB8A;
	Thu, 11 Mar 2021 10:43:39 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BD4086EB8A
 for <dri-devel@lists.freedesktop.org>; Thu, 11 Mar 2021 10:43:38 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPS id 70A8E64F94
 for <dri-devel@lists.freedesktop.org>; Thu, 11 Mar 2021 10:43:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1615459418;
 bh=0CK3ANkyogDZQzw969IlZ78rFWAYAbQsfl0dSTSXIpA=;
 h=From:To:Subject:Date:In-Reply-To:References:From;
 b=SvK0CZZEZnAdQ9fb5kV7tDTM9haTZZOuxC/SxK6NHWwJhVEK6eGhcyYe+A1LgPsgP
 SeZPnh8o8Qwcd8wqYe/HkEnWrl+4xj1lC2Z9ulAUtl0/AlCVsQD0TR2jIqUSSwCwB2
 DrG0AJnSfZALRBDrgb7b8BQqqimpoQ7DKEWwEr+Ue09n32pJE23oBILg49gxdW6BRV
 iuM67H4hKzjlxWe5dqNPH++jX4IEWsefm9/TdaKtREyXXT0XwVyAEFiXGLWoq9hQnQ
 a4oVp3L8tOlbv+reWZFbgopV5WjZpLIFHnBTm1A7Xiq8zvLxJeKgfxApVsp6KE+JSi
 uutWXA7pOANBA==
Received: by pdx-korg-bugzilla-2.web.codeaurora.org (Postfix, from userid 48)
 id 6D167653BD; Thu, 11 Mar 2021 10:43:38 +0000 (UTC)
From: bugzilla-daemon@bugzilla.kernel.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 212229] STM32F469: vblank wait timed out on output to
 /sys/class/graphics/fb0/pan
Date: Thu, 11 Mar 2021 10:43:38 +0000
X-Bugzilla-Reason: CC
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: None
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Console/Framebuffers
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: high
X-Bugzilla-Who: eugentoo@gmail.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: jsimmons@infradead.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: attachments.created
Message-ID: <bug-212229-2300-YcYIdrWqwe@https.bugzilla.kernel.org/>
In-Reply-To: <bug-212229-2300@https.bugzilla.kernel.org/>
References: <bug-212229-2300@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=212229

--- Comment #2 from Yauheni Saldatsenka (eugentoo@gmail.com) ---
Created attachment 295801
  --> https://bugzilla.kernel.org/attachment.cgi?id=295801&action=edit
Dmesg

-- 
You may reply to this email to add a comment.

You are receiving this mail because:
You are on the CC list for the bug.
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
