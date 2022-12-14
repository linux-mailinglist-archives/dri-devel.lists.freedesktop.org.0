Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 120F064C1A3
	for <lists+dri-devel@lfdr.de>; Wed, 14 Dec 2022 02:06:16 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9691C10E1CF;
	Wed, 14 Dec 2022 01:05:38 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from ams.source.kernel.org (ams.source.kernel.org
 [IPv6:2604:1380:4601:e00::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C542710E1CF
 for <dri-devel@lists.freedesktop.org>; Wed, 14 Dec 2022 01:05:35 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 53060B81615
 for <dri-devel@lists.freedesktop.org>; Wed, 14 Dec 2022 01:05:33 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 16D4EC433EF
 for <dri-devel@lists.freedesktop.org>; Wed, 14 Dec 2022 01:05:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1670979932;
 bh=twcWJRkpPmWF0qsbL2+gcR8S9VBGQ9GL76MDMZf/Pdk=;
 h=From:To:Subject:Date:In-Reply-To:References:From;
 b=JUrInKUj8QaELDWlrXQZsWZl0n1o0bdmfPe/4+W3k5xBMPB0ty6/CJbLnQzIPZeBN
 vCTvQdhdsZ5yIYsC+5NXZlm6aUpDmQYPydZ3N+6llI6kx6x8LlMjxbjrezHDU/1aQR
 NmlzhDY6cmNYjQ/VaSnZYm+ZNhNKblroD6L5wWVdZCUrelLIwjS59sEutocCTtIkDt
 QOuEfTYdc/jRqg0Jzbrk/kIOy+7wmjAmvSry7xAPBOLZfETnmw6qGt3pQGEIzmA1Hx
 AqmqKE9VIJrnujq6ev431PrpEH7C7NSmfvaqotnLxTHqBQ2eGF8FsUpmRoqOOBnBuo
 PS6mXPW3s9dYQ==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix,
 from userid 48) id 01527C43143; Wed, 14 Dec 2022 01:05:32 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 216805] external monitor not working since 6.1 (amdgpu:
 update_mst_stream_alloc_table, regression from 6.0))
Date: Wed, 14 Dec 2022 01:05:31 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Video(DRI - non Intel)
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: aros@gmx.com
X-Bugzilla-Status: RESOLVED
X-Bugzilla-Resolution: ANSWERED
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: bug_status resolution
Message-ID: <bug-216805-2300-KZg1TTsBl5@https.bugzilla.kernel.org/>
In-Reply-To: <bug-216805-2300@https.bugzilla.kernel.org/>
References: <bug-216805-2300@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D216805

Artem S. Tashkinov (aros@gmx.com) changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
             Status|NEW                         |RESOLVED
         Resolution|---                         |ANSWERED

--- Comment #1 from Artem S. Tashkinov (aros@gmx.com) ---
Please search for duplicates and file a new bug report if there's none:

https://gitlab.freedesktop.org/drm/amd/-/issues

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
