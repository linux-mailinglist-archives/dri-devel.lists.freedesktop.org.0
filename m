Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B0DEE444FC4
	for <lists+dri-devel@lfdr.de>; Thu,  4 Nov 2021 08:44:50 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 482B96EA34;
	Thu,  4 Nov 2021 07:44:47 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 68A846EA34
 for <dri-devel@lists.freedesktop.org>; Thu,  4 Nov 2021 07:44:46 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPS id 312D7611C4
 for <dri-devel@lists.freedesktop.org>; Thu,  4 Nov 2021 07:44:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1636011886;
 bh=1U9D2ypSks19t6fEbdFcHG5L0SuIhVO0hAc+fOPrG3M=;
 h=From:To:Subject:Date:In-Reply-To:References:From;
 b=kaossDqu73BlqJdljywaGKRVQpyOC33KOKENL9kAHpeIOJDTK3CupyaqfdrePHXA2
 7P13hT107LNTT9Um6eSiHnbkZB2M8pWI2eSIOxy7OYmQV0uMX5pD+XCk2kxfQ8MV+7
 pEwC9KnTy1RBbNHQ5C7gnga6DO70wjbqZab30FktTfbZrs5aZ2Sa0dCUZBUmNmEjoV
 QmDCTrUGgOpv6iFQkA8e1LYIRvThVEWinmeHUG7PF+N6igZIc1nLPvkD7Z3bfPX0C/
 JnaFTLWXNLZCt1DxIXPtmiSLTjDKE/4V1C/pQtHKySMVbBSfX22uS4A617GJipGzRB
 c/pa3QqYX0W3g==
Received: by pdx-korg-bugzilla-2.web.codeaurora.org (Postfix, from userid 48)
 id 2E21D60FF3; Thu,  4 Nov 2021 07:44:46 +0000 (UTC)
From: bugzilla-daemon@bugzilla.kernel.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 214029] [bisected] [amdgpu] Several memory leaks in amdgpu and
 ttm
Date: Thu, 04 Nov 2021 07:44:45 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Video(DRI - non Intel)
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: christian.koenig@amd.com
X-Bugzilla-Status: RESOLVED
X-Bugzilla-Resolution: CODE_FIX
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-214029-2300-OI3zekxR8i@https.bugzilla.kernel.org/>
In-Reply-To: <bug-214029-2300@https.bugzilla.kernel.org/>
References: <bug-214029-2300@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D214029

--- Comment #27 from Christian K=C3=B6nig (christian.koenig@amd.com) ---
I've just finished up reading my mails this morning and found a crash report
for this patch when it is back ported to 5.10.

So please do NOT apply this patch to 5.10!

The memory leak is potentially there as well, just much much less likely an=
d a
double free certainly crashes the kernel.

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
