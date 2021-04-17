Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E63DF363066
	for <lists+dri-devel@lfdr.de>; Sat, 17 Apr 2021 15:39:42 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0F25A6E0C8;
	Sat, 17 Apr 2021 13:39:39 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5930B6E0C8
 for <dri-devel@lists.freedesktop.org>; Sat, 17 Apr 2021 13:39:37 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPS id 6436C6120C
 for <dri-devel@lists.freedesktop.org>; Sat, 17 Apr 2021 13:39:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1618666776;
 bh=Koq9dkT4rWBta6UAp15GXaN5J5ZmcMZqWXXYV5C40iA=;
 h=From:To:Subject:Date:In-Reply-To:References:From;
 b=EUZFW/SYfzyd4ML2KQUG6XM3inusRKwUAZJn65qYd4DYvKtlmR+NfV0fy1NbN8ONv
 //vOCho8cE2LZ2SAYcPUQZdsnSGA8lh4xiPlegpADZSn00c8FNjHocii2N2mzYThKN
 I5XfisWGfbQIaTp2qw3onBmU+0L8l2ciSWWk9hukaIOShEULePbLXYwkZL+FR3qK9A
 TCNGySeesIAO0w+jN2C+NI/c5JA+nGyj/BMfvhLKymgODStJrwSkX7HsyWbXNqrljD
 UbTb3H5wGnFvtnwanzOraVLqfJXsoG8+UC99eIlAMCy2jN94g0XK/FozZ/1JtBNGqD
 qgp08NxfDugYQ==
Received: by pdx-korg-bugzilla-2.web.codeaurora.org (Postfix, from userid 48)
 id 58B07611C9; Sat, 17 Apr 2021 13:39:36 +0000 (UTC)
From: bugzilla-daemon@bugzilla.kernel.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 212469] plymouth animation freezes during shutdown
Date: Sat, 17 Apr 2021 13:39:36 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Video(DRI - non Intel)
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: low
X-Bugzilla-Who: arnasz616@gmail.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: cc
Message-ID: <bug-212469-2300-vrxulTSYgP@https.bugzilla.kernel.org/>
In-Reply-To: <bug-212469-2300@https.bugzilla.kernel.org/>
References: <bug-212469-2300@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=212469

Arnas (arnasz616@gmail.com) changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
                 CC|                            |arnasz616@gmail.com

--- Comment #3 from Arnas (arnasz616@gmail.com) ---
I also have this same issue on my system. When I hit shutdown, the aniamtioj
plays, then screen goes black, then turns back on and shows frozen animation,
then finally shuts down.

Here is my system - 

Kernel - 5.11.14.arch1-1
CPU - Intel Core i5-1035G1
GPU - Intel UHD G1 Graphics, modesetting driver
DE - KDE Plasma 5.21.4
Plymouth - plymouth AUR package (non-git)

I can also confirm that the issue is only present from 5.11.x. The issue does
not exist with kernel 5.10.16.

-- 
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
