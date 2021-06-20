Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7B5BA3ADE6E
	for <lists+dri-devel@lfdr.de>; Sun, 20 Jun 2021 15:02:14 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DC97389C68;
	Sun, 20 Jun 2021 13:02:09 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CFE2D89C68
 for <dri-devel@lists.freedesktop.org>; Sun, 20 Jun 2021 13:02:08 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPS id 8F26D61156
 for <dri-devel@lists.freedesktop.org>; Sun, 20 Jun 2021 13:02:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1624194128;
 bh=OqDDZWYC3edQVGGvF3URBbTFWqKUjbkok6A/8gyRd5o=;
 h=From:To:Subject:Date:In-Reply-To:References:From;
 b=Us8w34oXaFLI/Zd/OJ7vV02vYqDQGVm/PFM7kWjZiulZTE7W6oxuH42myM4g3yZLe
 kUpxyv515PHhHOVQnyVTF7+Zhf1PA+lP1HwQ6PhPsazR/6A4hS/XJn1ta9ctw4DFyT
 OKokpZJK8UStqLc5GMoN5bKe1FPTinQ1tu0Aj/Mkm0Ab2AfnIjtw0FNLMHFL2toIsw
 f2ybsPjmU0IUSjHAW70CbJ2Xp7LWMuicejDc7exNzcGU7TJGzQ3bC30H/spzfPu98f
 3JBizL4GhDVJTRRmp4hIEAzJbGbphQcD0m2Ls0VdODCX0CJf5p6irWgjoUfPraNW9Y
 TmCwlvj8CbOnQ==
Received: by pdx-korg-bugzilla-2.web.codeaurora.org (Postfix, from userid 48)
 id 8BDCE61261; Sun, 20 Jun 2021 13:02:08 +0000 (UTC)
From: bugzilla-daemon@bugzilla.kernel.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 213391] AMDGPU retries page fault with some specific processes
 amdgpu and sometimes followed [gfxhub0] retry page fault until *ERROR* ring
 gfx timeout, but soft recovered
Date: Sun, 20 Jun 2021 13:02:08 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Video(DRI - non Intel)
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: low
X-Bugzilla-Who: dominic.letz@berlin.de
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-213391-2300-sfecv6n7sC@https.bugzilla.kernel.org/>
In-Reply-To: <bug-213391-2300@https.bugzilla.kernel.org/>
References: <bug-213391-2300@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D213391

--- Comment #21 from Dominic Letz (dominic.letz@berlin.de) ---
So I'm running since 16th on 20210315 and it has been stable so far vs.
multiple freezes a day before.

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
