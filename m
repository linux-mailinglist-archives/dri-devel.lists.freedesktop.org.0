Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D50FD3B4360
	for <lists+dri-devel@lfdr.de>; Fri, 25 Jun 2021 14:34:57 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 23E876EDB3;
	Fri, 25 Jun 2021 12:34:55 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BDD656EDB3
 for <dri-devel@lists.freedesktop.org>; Fri, 25 Jun 2021 12:34:53 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPS id 8D16861922
 for <dri-devel@lists.freedesktop.org>; Fri, 25 Jun 2021 12:34:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1624624493;
 bh=AWNNKaGZ0q9lrCMWTUiKGjqdeJ71RdtVhijiMBuOZjM=;
 h=From:To:Subject:Date:In-Reply-To:References:From;
 b=XeawAITcTlnjon2h+TBlzCfp0Gts0eX1eOcN1jApLNQZLe+bhyrWu+JqubaBEF6bT
 bkgFyBqCaed6ijNPcrFSU9LrEVUb7JigapSw0Li8uxUFPReNO1BRkrhw2R2rl73L/w
 d99cIemo53fjqE3o9jqffAlPlMi7fQ3dcBz6tG/7nViFEBYYQmsrifSrNzXBvBGbaB
 UDj8Mzz6PR/EkbcKt7xhQt//kMevXh9H6Ljjj+rJ2IVvDaE1yK+Jn6lMbqwVhIruVI
 8QRU0UVS4cJW9we4PJRBxu5Xwz4FJTGs6ym6r6D6nA2gUjR4vFbGRqQXp+E986aRoV
 HV4fKfikWjjXQ==
Received: by pdx-korg-bugzilla-2.web.codeaurora.org (Postfix, from userid 48)
 id 839BB6113C; Fri, 25 Jun 2021 12:34:53 +0000 (UTC)
From: bugzilla-daemon@bugzilla.kernel.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 213569] Amdgpu temperature reaching dangerous levels
Date: Fri, 25 Jun 2021 12:34:53 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Video(DRI - non Intel)
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: blocking
X-Bugzilla-Who: martin.tk@gmx.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-213569-2300-B3pEOj3EDp@https.bugzilla.kernel.org/>
In-Reply-To: <bug-213569-2300@https.bugzilla.kernel.org/>
References: <bug-213569-2300@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D213569

--- Comment #2 from Martin (martin.tk@gmx.com) ---
In my case it was watching a video that made the gpu reach 70=C2=B0C

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
