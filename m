Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 0BF8D44E68F
	for <lists+dri-devel@lfdr.de>; Fri, 12 Nov 2021 13:43:41 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3C8456EB83;
	Fri, 12 Nov 2021 12:43:38 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8850C6EB75
 for <dri-devel@lists.freedesktop.org>; Fri, 12 Nov 2021 12:43:36 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPS id 5696E60F70
 for <dri-devel@lists.freedesktop.org>; Fri, 12 Nov 2021 12:43:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1636721016;
 bh=uKsCoYQkiHvn8HclTHcuH5/O7kiZlgkoyCVnYa2bZ3M=;
 h=From:To:Subject:Date:In-Reply-To:References:From;
 b=cwopkW7uO7N6nKBQpuLsRpTb/bOAvw9spdVrlDkUo4GbVBBSRY2PR0PDiJwd3r5pN
 TaD+pZVoqwbtk+mG/7zKig3s3mTkMNICMa77xOhk6Y5BkLEwTZoDTUritqkp9owwTG
 q/PDdnb4/Bxd9FJYvo3OfUFzfkE1Y4oPqwhip5RGmxC2ao9sQwD3jZDOqmWunpH4Kn
 OqtfE6UrbaNsRiMh/pMws5yJEcttW2a1lKBsRehl5qbQEnPXePoW1yI9tjFACEz2cU
 sJeV3oRWtzO3kIGFEeUho8R6nTOYi5kEEmH6QFsSDUliCyVexFy+p55EwFr9ArcUJs
 8PmQTrPwio3mw==
Received: by pdx-korg-bugzilla-2.web.codeaurora.org (Postfix, from userid 48)
 id 5409E610F7; Fri, 12 Nov 2021 12:43:36 +0000 (UTC)
From: bugzilla-daemon@bugzilla.kernel.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 214621] WARNING: CPU: 3 PID: 521 at
 drivers/gpu/drm/ttm/ttm_bo.c:409 ttm_bo_release+0xb64/0xe40 [ttm]
Date: Fri, 12 Nov 2021 12:43:35 +0000
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
X-Bugzilla-Resolution: DUPLICATE
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-214621-2300-PoJCjzt7rQ@https.bugzilla.kernel.org/>
In-Reply-To: <bug-214621-2300@https.bugzilla.kernel.org/>
References: <bug-214621-2300@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D214621

--- Comment #20 from Christian K=C3=B6nig (christian.koenig@amd.com) ---
Nice work Lang, question is now only how to fix it?

We probably need to assign this bug to Harry and Nicholas.

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
