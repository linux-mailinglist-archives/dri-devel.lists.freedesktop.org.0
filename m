Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9A9623F6EC1
	for <lists+dri-devel@lfdr.de>; Wed, 25 Aug 2021 07:19:15 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0D7256E14B;
	Wed, 25 Aug 2021 05:19:04 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 215FC6E14B
 for <dri-devel@lists.freedesktop.org>; Wed, 25 Aug 2021 05:19:03 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPS id E8C5B6128A
 for <dri-devel@lists.freedesktop.org>; Wed, 25 Aug 2021 05:19:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1629868742;
 bh=PYKbGux6NVhGc8h8mdBeGQBqVvt31IZvhUh22sYO3GU=;
 h=From:To:Subject:Date:In-Reply-To:References:From;
 b=geLjg2sSe6k/bNOAMuYxOToxwu75KvcmqlyHi10t9gE1q+Po5L3k+ZwnjYY6wlcy3
 NcNpVazxL1PaJn/n+KjrrEXIh6bajh2N/3XnXJuQ9zqr/lJ95z5riVavt1ZYRZkozr
 mdCA/AiyvgDq2kn5X832yCxFZZIkCy2lvTCsU+S0PHpzBjCYUCpi8nY8K128hP0TSg
 R1Pcgsgyr25cy7BWeGrvItnGqjSEedhI8avGjlIltARoUint5fKes9g3R/4DZIPf5r
 32RlJRevZ9CTqy4cNrPs2fiyaPCnfrcbrJ6QQ9tDYa628LqAyJwaAa8A5zoVmfyq8g
 zRS+PCod72b7g==
Received: by pdx-korg-bugzilla-2.web.codeaurora.org (Postfix, from userid 48)
 id DFE0261003; Wed, 25 Aug 2021 05:19:02 +0000 (UTC)
From: bugzilla-daemon@bugzilla.kernel.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 208909] amdgpu Ryzen 7 4700U NULL pointer dereference multi
 monitor with rotation
Date: Wed, 25 Aug 2021 05:19:02 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Video(DRI - non Intel)
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: kernel@890.at
X-Bugzilla-Status: RESOLVED
X-Bugzilla-Resolution: CODE_FIX
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: bug_status resolution
Message-ID: <bug-208909-2300-Jud7oHQwof@https.bugzilla.kernel.org/>
In-Reply-To: <bug-208909-2300@https.bugzilla.kernel.org/>
References: <bug-208909-2300@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D208909

kernel@890.at changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
             Status|NEW                         |RESOLVED
         Resolution|---                         |CODE_FIX

--- Comment #13 from kernel@890.at ---
I have currently upgraded to 5.11.0-27-generic (hwe) and this problem seems=
 to
be fixed.

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
