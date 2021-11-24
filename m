Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1B48145B228
	for <lists+dri-devel@lfdr.de>; Wed, 24 Nov 2021 03:44:33 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 27D3589FC9;
	Wed, 24 Nov 2021 02:44:31 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 50ED589FC9
 for <dri-devel@lists.freedesktop.org>; Wed, 24 Nov 2021 02:44:29 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPS id 26EB460FBF
 for <dri-devel@lists.freedesktop.org>; Wed, 24 Nov 2021 02:44:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1637721869;
 bh=F9O9iF6jk6rm2ecLNVa3xxcLr5tBAwNt6KInA/+zktU=;
 h=From:To:Subject:Date:In-Reply-To:References:From;
 b=K50BaD/O75awkQRqRkR+AA/U8882evHnUxrxsM+s6FEdawA0UXUBd0rV59o1OuZHy
 TDW9LN8pQ1nUCQIEKXXCagfu+KhqRsAAoowYWKQxBbHMRNn3wxVVeysFO/pjAQFW8N
 Q1OLN3pNU45rXmzvpEjcHQinv3ZMgCrtb+rPeS9r4ixV5iUXPiEyAp8UFhVp0frwOC
 mG92U8HymRIMONGE7GFKo7xq5YTuGPVsKc4sOCcNXU133vK1J91x9mMUCSrLpZu+W5
 biVEwilgdRnBXD3N0DTLFgfqCqytqiFTgA+CroINxTJrXpKxCz5vvqayr4ELyMxUN0
 tJEU1x4tbJwug==
Received: by pdx-korg-bugzilla-2.web.codeaurora.org (Postfix, from userid 48)
 id 2399160F44; Wed, 24 Nov 2021 02:44:29 +0000 (UTC)
From: bugzilla-daemon@bugzilla.kernel.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 203439] amdgpu: [REG 4.20 -> 5.0] Brightness minimum level is
 too high
Date: Wed, 24 Nov 2021 02:44:28 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Video(DRI - non Intel)
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: sapkotaanish000@gmail.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: cc
Message-ID: <bug-203439-2300-2FSfXT7YhQ@https.bugzilla.kernel.org/>
In-Reply-To: <bug-203439-2300@https.bugzilla.kernel.org/>
References: <bug-203439-2300@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D203439

Anish Sapkota (sapkotaanish000@gmail.com) changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
                 CC|                            |sapkotaanish000@gmail.com

--- Comment #6 from Anish Sapkota (sapkotaanish000@gmail.com) ---
I am still facing this problem in Acer Aspire 5.
Are there any updates to it?

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
