Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 816AC3BDC5E
	for <lists+dri-devel@lfdr.de>; Tue,  6 Jul 2021 19:35:12 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7C4146E03C;
	Tue,  6 Jul 2021 17:35:08 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BDF7F6E03C
 for <dri-devel@lists.freedesktop.org>; Tue,  6 Jul 2021 17:35:07 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPS id 8796B61C5C
 for <dri-devel@lists.freedesktop.org>; Tue,  6 Jul 2021 17:35:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1625592907;
 bh=EnARXp9Yd20ye7T2eMo+LaNX8jJy/ZaUtrFYIhoil7U=;
 h=From:To:Subject:Date:In-Reply-To:References:From;
 b=XpRQCwNeRD9bq5IFIsrk3N5sA4+ciNFxmx519duOQ7C4eo6xSIwknBta6c1XvI3fa
 XTh96KS0CiPkJi/5DpFV9pOjTK7Eya4wZI8oxFkDOsoZpucqsFMcJbz/Ys3OC6tM0V
 LMG/lXX7inox8wU2zIPikKidkY/bL+z//PTmREdAhLiLKT4qxYNlgh/JTLeZOPHzAE
 rXJ5kluk810YI522evf4SJDIUA5JO3FB1a78Z47r+HIQyK/BM+obVGupJBC51berAZ
 G4NGfJQwjvPoWl9EXNHCwU2WP0hDx5d6Uij2ItS8MOHVL9iJFFK8ewEy+95CcJCySf
 eGa5jO2mkL7TQ==
Received: by pdx-korg-bugzilla-2.web.codeaurora.org (Postfix, from userid 48)
 id 845736109F; Tue,  6 Jul 2021 17:35:07 +0000 (UTC)
From: bugzilla-daemon@bugzilla.kernel.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 213391] AMDGPU retries page fault with some specific processes
 amdgpu and sometimes followed [gfxhub0] retry page fault until *ERROR* ring
 gfx timeout, but soft recovered
Date: Tue, 06 Jul 2021 17:35:07 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Video(DRI - non Intel)
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: low
X-Bugzilla-Who: lsrzj@yahoo.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-213391-2300-1tqT44PGc4@https.bugzilla.kernel.org/>
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

--- Comment #30 from Leandro Jacques (lsrzj@yahoo.com) ---
(In reply to Dominic Letz from comment #21)
I made what you suggested, no issues anymore. It was a linux-firmware packa=
ge
problem, not a kernel driver problem.

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
