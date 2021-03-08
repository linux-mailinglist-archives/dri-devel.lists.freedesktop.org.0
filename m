Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 037E63319DC
	for <lists+dri-devel@lfdr.de>; Mon,  8 Mar 2021 22:59:26 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2E1996E892;
	Mon,  8 Mar 2021 21:59:24 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8B26C6E892
 for <dri-devel@lists.freedesktop.org>; Mon,  8 Mar 2021 21:59:23 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPS id 647D965253
 for <dri-devel@lists.freedesktop.org>; Mon,  8 Mar 2021 21:59:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1615240763;
 bh=HO5RIl4YsGJs5N6i4tS7mnuepailV4MhmunRYWFRXoE=;
 h=From:To:Subject:Date:In-Reply-To:References:From;
 b=WWRpH7zBDSA9Ys0JSOfOc9MEaYtrSc0W8iHeLNGi+dsle5PVFIgN7GGiYPZterJHv
 CW6r5XIx8iDg0Ys1e9VnGwW8CBx17PCa1/WGNnHfpGWRuitiSG/a11m7ACbbYcoYNn
 ZhLprEW4rfngvzs3FvP2QaQKkP7MFpgDnMPmHKjG8SzTOtiVLycPhlGRJmruV+785x
 tH4wTVAhd0k9dF4W/k+mNhE3j/6uNVMUQmKm2DIaznYURw8tGtCs8RqBoKeoB2JE42
 PYAioco8oydfOXWLrSDRmnaVdt6C15eFmjS5oUseTkwcN1WC3ieqd6vuH8UwCs0IHo
 YjAmn2MKqdo7Q==
Received: by pdx-korg-bugzilla-2.web.codeaurora.org (Postfix, from userid 48)
 id 5FB2365359; Mon,  8 Mar 2021 21:59:23 +0000 (UTC)
From: bugzilla-daemon@bugzilla.kernel.org
To: dri-devel@lists.freedesktop.org
Subject: =?UTF-8?B?W0J1ZyAyMTIxMDddIFRlbXBlcmF0dXJlIGluY3JlYXNlIGJ5IDE1?=
 =?UTF-8?B?wrBDIG9uIHJhZGVvbiBncHU=?=
Date: Mon, 08 Mar 2021 21:59:23 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Video(DRI - non Intel)
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: blocking
X-Bugzilla-Who: alexdeucher@gmail.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: cc
Message-ID: <bug-212107-2300-9paPTQdSMk@https.bugzilla.kernel.org/>
In-Reply-To: <bug-212107-2300@https.bugzilla.kernel.org/>
References: <bug-212107-2300@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=212107

Alex Deucher (alexdeucher@gmail.com) changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
                 CC|                            |alexdeucher@gmail.com

--- Comment #4 from Alex Deucher (alexdeucher@gmail.com) ---
The driver turns off the fans for acoustic reasons if the OEM enabled support
for the feature in the vbios.  They will still go on when the temperature gets
high enough.

-- 
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
