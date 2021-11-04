Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 4880C445000
	for <lists+dri-devel@lfdr.de>; Thu,  4 Nov 2021 09:16:02 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8DE8B6EBAA;
	Thu,  4 Nov 2021 08:15:57 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 79C496EBAA
 for <dri-devel@lists.freedesktop.org>; Thu,  4 Nov 2021 08:15:56 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPS id 4B3916109F
 for <dri-devel@lists.freedesktop.org>; Thu,  4 Nov 2021 08:15:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1636013756;
 bh=wW2QES5OWESjvrpvwj2hBQr38rmKbIxRHePkAwixS7s=;
 h=From:To:Subject:Date:In-Reply-To:References:From;
 b=fTR21JpLM1Xby8i1ymSionaODt5P+SeUph19RxBbPs+1ZnVnl0tBWBIIiSUsYQSrb
 f+7Te/m4UT/2lbijGa6alyQk9hGvfdLonpTEwZX7RajQ35l5s05dvxoMP8zHGJFZji
 iEr65H0CcG+7v2nrdEKb1u6WzkeLLZ77TNvdJfaPnVMbGMPcnsV9HdZm8+EZqLuwnc
 Kbrhw6/tUS8C+6rnTw1rgYHYiOuUGQ1zIrmD+jKbsy05U+aZp1qcthQij1rqMS5DfN
 CARrqlhDP4yDtX+hh8oEL97OGyg9tjFwU8U57CYryLNxvjMISvdUDFajRAU7cLWBpS
 RoymXNwV3TIxA==
Received: by pdx-korg-bugzilla-2.web.codeaurora.org (Postfix, from userid 48)
 id 4805660F25; Thu,  4 Nov 2021 08:15:56 +0000 (UTC)
From: bugzilla-daemon@bugzilla.kernel.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 214921] amdgpu hangs HP Laptop on shutdown
Date: Thu, 04 Nov 2021 08:15:56 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Video(DRI - non Intel)
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: spasswolf@web.de
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: cf_regression
Message-ID: <bug-214921-2300-kznc6aeYhq@https.bugzilla.kernel.org/>
In-Reply-To: <bug-214921-2300@https.bugzilla.kernel.org/>
References: <bug-214921-2300@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D214921

spasswolf@web.de changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
         Regression|No                          |Yes

--- Comment #1 from spasswolf@web.de ---
It turns out that ressuming from suspend has been broken a long time on the
above hardware. The last Kernel where it works is 5.12.
The first commit where resuming from suspend leads to screen corruption is
4588f7b7dd5f09e70b6e223490a0d054c3d64071

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
