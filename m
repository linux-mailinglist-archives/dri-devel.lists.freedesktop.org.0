Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C45ED72ACB8
	for <lists+dri-devel@lfdr.de>; Sat, 10 Jun 2023 17:55:54 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 169C010E197;
	Sat, 10 Jun 2023 15:55:53 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DAE9110E197
 for <dri-devel@lists.freedesktop.org>; Sat, 10 Jun 2023 15:55:50 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 086F860C3D
 for <dri-devel@lists.freedesktop.org>; Sat, 10 Jun 2023 15:55:50 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 6A2E5C433D2
 for <dri-devel@lists.freedesktop.org>; Sat, 10 Jun 2023 15:55:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1686412549;
 bh=GGPvUJHjES/ztNGnVSJB4e3QSmMLYQEHNNxK0T4/yo0=;
 h=From:To:Subject:Date:In-Reply-To:References:From;
 b=Pu/wOydSYki0z+uB/Y3FGEjzPDfjhnrmMo51GqCnax6cBwtkI9giafm6bAFz6gZZB
 BFeqmL1QRW3N6XRwExjlp9iwMlnTG7wXJ/r2nIWbhHFkuyE8+G/zvLTzv805Q0hVH/
 FGHUjdZMAvyZ6iBz4vY3ssOpAbxiruFEURtmbTzxDgIyn+2a4Echu9TbAZHk/cswc9
 PU5RB9IpfuU/dMPwJxerijhPCjsSt6pRtVzYONP8NI1AcZeFBnY7emNDzSVQDWClTk
 SmFOOlpn1g3pkv02FByp55jIxbT/rm2+8k12xbkoDn0DjKdxhqEr+3nqxa/DXQSrVi
 nML8Gwygs9o3Q==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix,
 from userid 48) id 59071C43143; Sat, 10 Jun 2023 15:55:49 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 217537] [AMDGPU] RDNA Freesync problem with CVT-Reduced display
 profile
Date: Sat, 10 Jun 2023 15:55:49 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Video(DRI - non Intel)
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: contato-myghi63@protonmail.com
X-Bugzilla-Status: RESOLVED
X-Bugzilla-Resolution: ANSWERED
X-Bugzilla-Priority: P3
X-Bugzilla-Assigned-To: drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-217537-2300-0SPKe0RhWe@https.bugzilla.kernel.org/>
In-Reply-To: <bug-217537-2300@https.bugzilla.kernel.org/>
References: <bug-217537-2300@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D217537

--- Comment #2 from Paulo Marcos de Souza Arruda do Nascimento (contato-myg=
hi63@protonmail.com) ---
(In reply to Artem S. Tashkinov from comment #1)

Done! here's the one I've opened:
https://gitlab.freedesktop.org/drm/amd/-/issues/2617
And thanks, I didn't know there was a issue tracker for these ones.

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
