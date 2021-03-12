Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 527E43395C5
	for <lists+dri-devel@lfdr.de>; Fri, 12 Mar 2021 19:02:24 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2761C6ECA4;
	Fri, 12 Mar 2021 18:02:19 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EF8506ECA4
 for <dri-devel@lists.freedesktop.org>; Fri, 12 Mar 2021 18:02:17 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPS id CE56D64F42
 for <dri-devel@lists.freedesktop.org>; Fri, 12 Mar 2021 18:02:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1615572137;
 bh=hHbQ3C/AHCtJAvDF/jIG77LGVEeuznB6XRH513d6/yg=;
 h=From:To:Subject:Date:In-Reply-To:References:From;
 b=i5fwjXQWMAzAEfHaaRJhkX+g6SdGGro6AdxA0wQu7kXWkQVWB/d06lrcW1u217ZGk
 1MCMqq15r2NlBqKeveckCjGPJE0CC6wF00BywacQjSJsXZvI6GFAuiqCVypNy42ynn
 ABgByN05hsH0HjzpEaT7RQKiDlAO7RwxExnFnPRDCFS2iyhTQq2h3fq2WjKo+B9gu9
 KDdztPY4t3Q4HYJECAA/30Zr9kY6z3JWS/zC+VAXxJhEsFoWXXy6T/atOMWlZV39fM
 5P4VMQ+HjMevvjtE9DT80zS6TOATs2gAtkk4EEbYOLxQaDrZNrftdIIpfUx9URdi/Z
 2DMXF/5HPJMsA==
Received: by pdx-korg-bugzilla-2.web.codeaurora.org (Postfix, from userid 48)
 id B7C4C65376; Fri, 12 Mar 2021 18:02:17 +0000 (UTC)
From: bugzilla-daemon@bugzilla.kernel.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 212255] WARNING: at arch/x86/kernel/fpu/core.c:129
 kernel_fpu_begin_mask
Date: Fri, 12 Mar 2021 18:02:17 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Video(DRI - non Intel)
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: alexdeucher@gmail.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: cc
Message-ID: <bug-212255-2300-j31jJUNwnf@https.bugzilla.kernel.org/>
In-Reply-To: <bug-212255-2300@https.bugzilla.kernel.org/>
References: <bug-212255-2300@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=212255

Alex Deucher (alexdeucher@gmail.com) changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
                 CC|                            |alexdeucher@gmail.com

--- Comment #1 from Alex Deucher (alexdeucher@gmail.com) ---
Possibly fixed with these patches?
https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?id=15e8b95d5f7509e0b09289be8c422c459c9f0412
https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?id=680174cfd1e1cea70a8f30ccb44d8fbdf996018e

-- 
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
