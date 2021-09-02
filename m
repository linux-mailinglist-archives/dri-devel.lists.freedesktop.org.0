Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5B0853FF0B0
	for <lists+dri-devel@lfdr.de>; Thu,  2 Sep 2021 18:03:46 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0F7706E5C3;
	Thu,  2 Sep 2021 16:03:44 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AE4626E5C3
 for <dri-devel@lists.freedesktop.org>; Thu,  2 Sep 2021 16:03:42 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPS id 8986E610A2
 for <dri-devel@lists.freedesktop.org>; Thu,  2 Sep 2021 16:03:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1630598622;
 bh=GIdVw7G0CaQO8zFAM0iFI/7HvNLq9FqkEHhFc9N8D3c=;
 h=From:To:Subject:Date:In-Reply-To:References:From;
 b=bAHYjW+/MhuK4uV6JcIK+1DSU+Mi2mITQ4i5ZiJoCfFZoEOs49uSw7QBkV7vkNmP2
 pQZ1pLFI8k064Kfg4Tlb6Pj7KlPaFNpcZYBMeX6mwM+xSzlrO64YCxMQ5vsXNURMjm
 4UfYjBr46/0ZxGoVoCxobGawNJOuUz0n3X6QUm5cSm7a2jQLryPJ7eu4rzgGjJ4pVL
 0zyIDc+0lUKflEROZ8pfCit1nSP5xdV5791tA/5djYqjnSRH4xQEsLpsb483FR53xf
 Nz4tZxMFxSYMb9FZb24xUkVOlKEa4jjyMug5x6HEpPE6r/dxsScUK9VALkLeqeN6Wc
 D7xiUTrA067zQ==
Received: by pdx-korg-bugzilla-2.web.codeaurora.org (Postfix, from userid 48)
 id 82037610CD; Thu,  2 Sep 2021 16:03:42 +0000 (UTC)
From: bugzilla-daemon@bugzilla.kernel.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 214289] amdgpu Msg issuing pre-check failed and SMU may be not
 in the right state!
Date: Thu, 02 Sep 2021 16:03:42 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Video(DRI - non Intel)
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: alexdeucher@gmail.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: cc
Message-ID: <bug-214289-2300-Oy8n86FOkC@https.bugzilla.kernel.org/>
In-Reply-To: <bug-214289-2300@https.bugzilla.kernel.org/>
References: <bug-214289-2300@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D214289

Alex Deucher (alexdeucher@gmail.com) changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
                 CC|                            |alexdeucher@gmail.com

--- Comment #1 from Alex Deucher (alexdeucher@gmail.com) ---
Please include your full dmesg output.  Does the behavior change if you rem=
ove
all of the extra amdgpu module parameters you are applying?

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
