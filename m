Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 407FB311EB0
	for <lists+dri-devel@lfdr.de>; Sat,  6 Feb 2021 17:37:19 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 009DD6E459;
	Sat,  6 Feb 2021 16:37:16 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5DF0A6E459
 for <dri-devel@lists.freedesktop.org>; Sat,  6 Feb 2021 16:37:15 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPS id 29FDA64E41
 for <dri-devel@lists.freedesktop.org>; Sat,  6 Feb 2021 16:37:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1612629435;
 bh=i8jiRkLGfNysVU17StZSrVXmmeq9+8nRlA0W8pTE0oY=;
 h=From:To:Subject:Date:In-Reply-To:References:From;
 b=vDFRjl0XZcbhfBDbkN8byGiQ/toJN4w1DyH3kshIJHFg15dXJQLsaQaJ1vkexvHSf
 AuiPr+6KGZHT3P1jvXSMfy7iVtmrpvR+N/M3+I0YqIJyK+X27Askh2rQ82naXQGjyv
 R2rHiR2mY/6Jt/73J8615QPeK/t8fmfmuMIPGJgjkfckIdj9HH2BsnIBWDWGn8QEWY
 KOQS228BIFo8zhedRQzqiYhZG0daELnHgYtqidpVEysDjSyZZEGmePbMTCs+HI4OVR
 UuVger68dptncQ/GlUU2Sqwu2yKw3uVw5ROWcPfJkIijlGhEbB5SyX6SxfUO6G3t5T
 xxaNwtVd0mg2A==
Received: by pdx-korg-bugzilla-2.web.codeaurora.org (Postfix, from userid 48)
 id 1D75E65346; Sat,  6 Feb 2021 16:37:15 +0000 (UTC)
From: bugzilla-daemon@bugzilla.kernel.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 207763] Noisy Screen in Linux with kernel 5
Date: Sat, 06 Feb 2021 16:37:14 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Video(DRI - non Intel)
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: xunilarium@gmail.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-207763-2300-JmoXzdYKiD@https.bugzilla.kernel.org/>
In-Reply-To: <bug-207763-2300@https.bugzilla.kernel.org/>
References: <bug-207763-2300@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=207763

--- Comment #8 from Mohammad Naeim (xunilarium@gmail.com) ---
(In reply to Alex Deucher from comment #6)
> Another thing to try, does setting radeon.agpmode=-1 fix the issue?

I add it to grub but the issue still exists.

-- 
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
