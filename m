Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E0EAA3BC812
	for <lists+dri-devel@lfdr.de>; Tue,  6 Jul 2021 10:47:27 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C900589CF2;
	Tue,  6 Jul 2021 08:47:23 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5A82F89CF2
 for <dri-devel@lists.freedesktop.org>; Tue,  6 Jul 2021 08:47:22 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPS id 2DFC1619A8
 for <dri-devel@lists.freedesktop.org>; Tue,  6 Jul 2021 08:47:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1625561242;
 bh=LRu9cbOgaK6cwaMdrgkAsePxnAquDin7mX8pBlRxDAk=;
 h=From:To:Subject:Date:In-Reply-To:References:From;
 b=hRdeLaDNTRuv43CmJfiYNqVPUaU0rcCGzVqyqkvNOXBj8lZzC+A1AxvNd3ckK3abd
 nA2ZdQswlk8ONb7X2M6NE94wuq7QWWn/ZZrtC50yZqIxSgjbXA78KtPuhA+oxaGQ30
 kuSlnPdCm6CoOpvWKW+w8zHdaq6qn47xTOy6S71KaxOLKLTkUZO29uqbvdJBzWSPNY
 D4S8eiZKkUCL02FFBQvQS6dhvNSe3WAT0b9mNnMaijgC7SuQtTDpP0qLZmkyYasYbD
 VZzFqasIx2o0FN6xZA/YHJUebbvPO+bXPmJ608fFxHVTtYeNjAwbzLxT40f1+AfBpd
 srgd1OiPQtAPw==
Received: by pdx-korg-bugzilla-2.web.codeaurora.org (Postfix, from userid 48)
 id 2A9D36129E; Tue,  6 Jul 2021 08:47:22 +0000 (UTC)
From: bugzilla-daemon@bugzilla.kernel.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 207383] [Regression] 5.7 amdgpu/polaris11 gpf:
 amdgpu_atomic_commit_tail
Date: Tue, 06 Jul 2021 08:47:20 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Video(DRI - non Intel)
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: blocking
X-Bugzilla-Who: akanar@pm.me
X-Bugzilla-Status: RESOLVED
X-Bugzilla-Resolution: CODE_FIX
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: cc
Message-ID: <bug-207383-2300-h6GTTRc1I9@https.bugzilla.kernel.org/>
In-Reply-To: <bug-207383-2300@https.bugzilla.kernel.org/>
References: <bug-207383-2300@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D207383

akanar@pm.me changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
                 CC|                            |akanar@pm.me

--- Comment #121 from akanar@pm.me ---
Is the linked issue possibly related to the issue discussed in this thread?=
 If
it is you may at least have a 100% consistent and easy way to test.

https://github.com/prusa3d/PrusaSlicer/issues/6677

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
