Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E84152FFBE7
	for <lists+dri-devel@lfdr.de>; Fri, 22 Jan 2021 05:42:54 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6D6FF6E99A;
	Fri, 22 Jan 2021 04:42:50 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EE99E6E99A
 for <dri-devel@lists.freedesktop.org>; Fri, 22 Jan 2021 04:42:48 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPS id B016C238D7
 for <dri-devel@lists.freedesktop.org>; Fri, 22 Jan 2021 04:42:48 +0000 (UTC)
Received: by pdx-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
 id A069C81649; Fri, 22 Jan 2021 04:42:48 +0000 (UTC)
From: bugzilla-daemon@bugzilla.kernel.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 211277] sometimes crash at s2ram-wake (Ryzen 3500U): amdgpu,
 drm, commit_tail, amdgpu_dm_atomic_commit_tail
Date: Fri, 22 Jan 2021 04:42:48 +0000
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
Message-ID: <bug-211277-2300-6A3KDm1tfa@https.bugzilla.kernel.org/>
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

--- Comment #3 from kolAflash (kolAflash@kolahilft.de) ---
I searched through my journalctl log.

I set up the whole system in May 2020 with Linux-5.6.7.
(journalctl has everything back to that date)



The bug appeared as following since October and Linux-5.8. So Linux-5.8 was
also affected (contradicting my original post).

I used the system nearly every day and always use s2ram (never shutting down,
only rebooting when needed for updates).
So this can be seen statistically.

- 2020-10-21 with Linux-5.8.14 (Debian 5.8.0-3, installed after 2020-09-26)
- 2020-12-11 with Linux-5.9.11 (Debian 5.9.0-4, installed 2020-12-04)
- 2020-12-25 with Linux-5.9.11
- 2021-01-13 with Linux-5.10.4 (Debian 5.10.0-1, installed 2021-01-10)
- 2021-01-16 with Linux-5.10.4
- 2021-01-19 with Linux-5.10.4

So the bug didn't appear with Linux <= 5.7.
And the bugs frequency increased with Linux-5.10.



In parallel I'm still trying to rule out other factors. (BIOS updates, other
software changes, ...)
Something significant might be, that Debian used GCC-9 for Linux-5.7. And
starting with Linux-5.8 GCC-10 was used.

-- 
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
