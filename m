Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 11E633259A6
	for <lists+dri-devel@lfdr.de>; Thu, 25 Feb 2021 23:28:34 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C5B4988C90;
	Thu, 25 Feb 2021 22:28:30 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7ED5988C90
 for <dri-devel@lists.freedesktop.org>; Thu, 25 Feb 2021 22:28:29 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPS id 3782C64EB7
 for <dri-devel@lists.freedesktop.org>; Thu, 25 Feb 2021 22:28:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1614292109;
 bh=X1jHO345Ru0WO7+2LOL+SwwKE9XtgHEYkkqYXVqvFbI=;
 h=From:To:Subject:Date:In-Reply-To:References:From;
 b=TSePoq7+p7CdV9AXNjvfqSA9wX4hufOP4h36httHWK5Hl0kN3je9mozoWMSVx/wSA
 sO21q1ZT2ejt0V4RKEtchg6GOjzbWXYuC7pQlLq/Hrcir7PGN4PDI2CoYlkt99atfY
 DeWsde5v13U8aYZEcz8+PB/bbL3Q8Pr6Wq88bO7vroebtsPqo7KGmjo2AvAiPhufL8
 wON+tK1Yl2amwpiel8fL2e1sORGwiMmEg6UNsFGybUxHNC7C4ggTzmqrggASgekBH3
 f7j03x9XHbMGgM6BJC3FwUw4N05YpDcyIPD0y6S8Go4Qp8twEPPXpwpiiURjzsL44E
 gssU6cGA9tLww==
Received: by pdx-korg-bugzilla-2.web.codeaurora.org (Postfix, from userid 48)
 id 1F224653CF; Thu, 25 Feb 2021 22:28:29 +0000 (UTC)
From: bugzilla-daemon@bugzilla.kernel.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 211277] sometimes crash at s2ram-wake (Ryzen 3500U): amdgpu,
 drm, commit_tail, amdgpu_dm_atomic_commit_tail
Date: Thu, 25 Feb 2021 22:28:28 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Video(DRI - non Intel)
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: kolAflash@kolahilft.de
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-211277-2300-jycycraKFB@https.bugzilla.kernel.org/>
In-Reply-To: <bug-211277-2300@https.bugzilla.kernel.org/>
References: <bug-211277-2300@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=211277

--- Comment #11 from kolAflash (kolAflash@kolahilft.de) ---
(In reply to Alex Deucher from comment #10)
> Can you bisect? 
> https://www.kernel.org/doc/html/latest/admin-guide/bug-bisect.html

I will try to.

But it will definitely need some time and may not be possible at all. Because
the bug cannot be reproduced completely deterministically.

-- 
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
