Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 23FBA387D25
	for <lists+dri-devel@lfdr.de>; Tue, 18 May 2021 18:13:42 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9228F6EC14;
	Tue, 18 May 2021 16:13:38 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BA84E6EC14
 for <dri-devel@lists.freedesktop.org>; Tue, 18 May 2021 16:13:36 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPS id 903026124C
 for <dri-devel@lists.freedesktop.org>; Tue, 18 May 2021 16:13:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1621354416;
 bh=Y9t7erUyVWYgszlHiCXZRWg3W2xR3SMliImxspixckg=;
 h=From:To:Subject:Date:In-Reply-To:References:From;
 b=g9aifnxrNDd4y2PeznolIjeS9H3yf5DNR5qP16YQ9HBM66lv6xPY0x7oz7+68LRkY
 P6t/G/O/Z6L/hiunKk/92P+HO21jiFo9prAAtNcI0rKSYZ5GwQKhcsh/TzRv7LRzuW
 NJ17KqgL2c/1SoXJqSYJd5RQqL/H0tSwe3NxS9Bc97x1yJ/fa4icMqYE/cYZKw/vuK
 fchnkx6k6IC5o9+ZtNUJ9LNvTw7IULdQnqNC8dxwfvHodjMLSHM/K5GcTCPIiKJL7r
 60PEAdfDzHjsfJyQDoSKKJLZGF1VhDHhYQugDLNNi5bTdq0JBd+q62+hdwh8FUWb+k
 WUsnrtf0FcEJw==
Received: by pdx-korg-bugzilla-2.web.codeaurora.org (Postfix, from userid 48)
 id 854626124C; Tue, 18 May 2021 16:13:36 +0000 (UTC)
From: bugzilla-daemon@bugzilla.kernel.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 211277] sometimes crash at s2ram-wake (Ryzen 3500U): amdgpu,
 drm, commit_tail, amdgpu_dm_atomic_commit_tail
Date: Tue, 18 May 2021 16:13:36 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Video(DRI - non Intel)
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: me@jeromec.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-211277-2300-ifimNdZTzN@https.bugzilla.kernel.org/>
In-Reply-To: <bug-211277-2300@https.bugzilla.kernel.org/>
References: <bug-211277-2300@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D211277

--- Comment #20 from Jerome C (me@jeromec.com) ---
(In reply to James Zhu from comment #19)
> Created attachment 296841 [details]
> to fix suspend/resume hung issue
>=20
> Hi @kolAflash and @jeromec, Can you help check if this patch can fix the
> issue? Since we can't reproduce at our side. Thanks! James

no, this doesn't work for me.

I'm curious to how your exactly to reproducing this

I start Xorg using the command "startx"

Xorg is running with LXQT

I start "Konsole" a gui terminal and execute the following

"for i in $(seq 1 150); do echo $i; sudo rtcwake -s 7 -m mem; done"

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
