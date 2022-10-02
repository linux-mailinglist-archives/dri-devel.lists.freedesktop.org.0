Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B8E785F2456
	for <lists+dri-devel@lfdr.de>; Sun,  2 Oct 2022 19:42:39 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5667610E02F;
	Sun,  2 Oct 2022 17:42:29 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0F0AD10E02F
 for <dri-devel@lists.freedesktop.org>; Sun,  2 Oct 2022 17:42:27 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id B0EF2B80D22
 for <dri-devel@lists.freedesktop.org>; Sun,  2 Oct 2022 17:42:25 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 7C1FBC433B5
 for <dri-devel@lists.freedesktop.org>; Sun,  2 Oct 2022 17:42:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1664732544;
 bh=DPfWMxMYTV8DQuA++3iPri5+jBwpAo38WIF4dCMcZ+g=;
 h=From:To:Subject:Date:In-Reply-To:References:From;
 b=ru9SXTIv60+wzZDunqIrVk3nzYl6GqFzOewxzBCu/iVUbqrNzyzEv0cTQvjq4Uxce
 rHGL8G4NxEFu37xEUW8vYbsgkF9c+vudMIMdgV+boD8im26aA7IF7S4nr2wT1OU9TP
 oMP+2ZqR7sAC+M0XUxkWa83g57rbyRZsGM/SBWXmgu5wbMyG0bgeSfRf1umE+Eiwhg
 EB9ZJcvOjtolPuPGoeqOw4+OpGZZOD3C3oW8lue7jU1ZKOZsLajrVLulCv4rYI+Jye
 xH0Hfvet77nJ9j4TMH10SCYZIYqNxNF+tvZI4kD+ZpgTD3vhU0RuQRFR3I+zZ58x3f
 Fra8trT3m65jg==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix,
 from userid 48) id 60738C433E9; Sun,  2 Oct 2022 17:42:24 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 213823] Broken power management for amdgpu
Date: Sun, 02 Oct 2022 17:42:24 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Video(DRI - non Intel)
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: high
X-Bugzilla-Who: bruno.n.pagani@gmail.com
X-Bugzilla-Status: RESOLVED
X-Bugzilla-Resolution: OBSOLETE
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: bug_status resolution
Message-ID: <bug-213823-2300-Y90U38BwXw@https.bugzilla.kernel.org/>
In-Reply-To: <bug-213823-2300@https.bugzilla.kernel.org/>
References: <bug-213823-2300@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D213823

Bruno Pagani (bruno.n.pagani@gmail.com) changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
             Status|NEW                         |RESOLVED
         Resolution|---                         |OBSOLETE

--- Comment #7 from Bruno Pagani (bruno.n.pagani@gmail.com) ---
Closing this old bug, this seems gone now on newer kernels.

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
