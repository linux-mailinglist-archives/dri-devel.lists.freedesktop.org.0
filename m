Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B6B50400C46
	for <lists+dri-devel@lfdr.de>; Sat,  4 Sep 2021 19:41:10 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D673089D39;
	Sat,  4 Sep 2021 17:41:05 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4333889D39
 for <dri-devel@lists.freedesktop.org>; Sat,  4 Sep 2021 17:41:04 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPS id 0BDBC60F92
 for <dri-devel@lists.freedesktop.org>; Sat,  4 Sep 2021 17:41:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1630777264;
 bh=/tTVH0xqDmWhb4Smt0PnrSDH8zns0S1pd2DKC+b+S9I=;
 h=From:To:Subject:Date:In-Reply-To:References:From;
 b=MPNQui2Nb7K/Sm590+PQxzHv1ZJtb0SVExUqru87miDFs7IBz8OGnZzsCLEoO3hkv
 7m9d5AQE0hKQVcbuXEUm2LvksDgDIEUw+6PAPJnLVU++EabUFhb9EvC0UMIEv67lnb
 xMPUwH4krR32C6dtNqNEUFORQ8hA+6UH19Asc4Ov7z3ftEx0prVltHgt9/kV7nzbel
 7hOyR/uaz4pDztRFHsaVVpoaNS8yv+HpKdoDmuHyvQqQ3BiuyGy3AWnZkCFQMdvmNj
 MmAHRv5LesfkwZAxMSjh+Cfkti6CHGtHPjbLsjevotRnjlZFb4GoTDRqS6jADulPpJ
 mFuQsQux+R9FQ==
Received: by pdx-korg-bugzilla-2.web.codeaurora.org (Postfix, from userid 48)
 id 08C3A60E4B; Sat,  4 Sep 2021 17:41:04 +0000 (UTC)
From: bugzilla-daemon@bugzilla.kernel.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 211277] sometimes crash at s2ram-wake (Ryzen 3500U): amdgpu,
 drm, commit_tail, amdgpu_dm_atomic_commit_tail
Date: Sat, 04 Sep 2021 17:41:03 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Video(DRI - non Intel)
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: arhamjain@gmail.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: cc
Message-ID: <bug-211277-2300-xyESwRkCaf@https.bugzilla.kernel.org/>
In-Reply-To: <bug-211277-2300@https.bugzilla.kernel.org/>
References: <bug-211277-2300@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D211277

Arham Jain (arhamjain@gmail.com) changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
                 CC|                            |arhamjain@gmail.com

--- Comment #51 from Arham Jain (arhamjain@gmail.com) ---
I can confirm that the issue I was having after trying to wake after suspend
(Ryzen 3500u, Linux 5.14 RC7) has vanished after adding pci=3Dnoats to my b=
oot
parameters a few days ago. I've had this issue on every kernel since 5.10 (=
5.4
and 5.9 were fine for me for several months each, not sure what I used in
between). Thank you so much James for posting this (and trying to fix it)!

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
