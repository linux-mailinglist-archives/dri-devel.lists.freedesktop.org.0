Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C1284404419
	for <lists+dri-devel@lfdr.de>; Thu,  9 Sep 2021 05:56:25 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A7AD96E433;
	Thu,  9 Sep 2021 03:56:20 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4FB2E6E433
 for <dri-devel@lists.freedesktop.org>; Thu,  9 Sep 2021 03:56:18 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPS id 381A561178
 for <dri-devel@lists.freedesktop.org>; Thu,  9 Sep 2021 03:56:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1631159778;
 bh=GNQZoStqD7fHmcEa0JLq2qfHiyfzzewnW1su72feCk4=;
 h=From:To:Subject:Date:In-Reply-To:References:From;
 b=BhtCbA+18m3zJtRZdhGerGKZXlJnK/UZ4huo1mV1N1Z4BO1jDl4NygGMjAAlSE164
 Unn5mpXOOx0szKX6yqDLB7oqlJ7jrXspShxiRXp4Smq2b4D9d4zGBAVketKPuSQFa9
 jWdoSJE/W8ZdDd7zj605+v026nNcJcTuvYM4Hz2QlS3FJcYUD1AUOalfSIGMLn+Ffu
 Xe31ZxCEtx71OE2BRks644ox28yJTqY8UzYj5g1N1FBmo5buk21mfqGv46+LWdBMbg
 toSVZjYacoVZE24shYoPc4i1Lb+1/6PewvAug0TpQjGtUAXW3+sY4mtUgD/Nt9fMvD
 fi8QBWNzuJzOw==
Received: by pdx-korg-bugzilla-2.web.codeaurora.org (Postfix, from userid 48)
 id 2DD58610C9; Thu,  9 Sep 2021 03:56:18 +0000 (UTC)
From: bugzilla-daemon@bugzilla.kernel.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 213917] Screen starts flickering when laptop(amdgpu) wakes up
 after suspend.
Date: Thu, 09 Sep 2021 03:56:17 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Video(DRI - non Intel)
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: samuel-kbugs@sieb.net
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: cc
Message-ID: <bug-213917-2300-JTpdA57FCx@https.bugzilla.kernel.org/>
In-Reply-To: <bug-213917-2300@https.bugzilla.kernel.org/>
References: <bug-213917-2300@https.bugzilla.kernel.org/>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

https://bugzilla.kernel.org/show_bug.cgi?id=3D213917

Samuel Sieb (samuel-kbugs@sieb.net) changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
                 CC|                            |samuel-kbugs@sieb.net

--- Comment #1 from Samuel Sieb (samuel-kbugs@sieb.net) ---
I've just run into this as well.  I upgraded the laptop to 5.13.12 and the
display doesn't resume properly as described.  The cpu is "AMD A10-9600P RA=
DEON
R5".  The only relevant messages in the journal are 4 lines like:=20
amdgpu 0000:00:01.0: AMD-Vi: Event logged [IO_PAGE_FAULT domain=3D0x0000
address=3D0x10aa25720 flags=3D0x0070]
with a different value for address in each one.

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
