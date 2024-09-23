Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5967A97E5BB
	for <lists+dri-devel@lfdr.de>; Mon, 23 Sep 2024 07:50:16 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5EFFA10E025;
	Mon, 23 Sep 2024 05:50:13 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="rWCfi1Om";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from nyc.source.kernel.org (nyc.source.kernel.org [147.75.193.91])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3E18310E025
 for <dri-devel@lists.freedesktop.org>; Mon, 23 Sep 2024 05:50:11 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by nyc.source.kernel.org (Postfix) with ESMTP id 1D2F1A4164B
 for <dri-devel@lists.freedesktop.org>; Mon, 23 Sep 2024 05:50:02 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id F1375C4CEE0
 for <dri-devel@lists.freedesktop.org>; Mon, 23 Sep 2024 05:50:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1727070610;
 bh=uOj18HdTsCAR7Ej+gFt1Zd64FIkT8M75LmskMtI5ub0=;
 h=From:To:Subject:Date:In-Reply-To:References:From;
 b=rWCfi1OmJ2SyVJRX18CDe8nkGAWbPjSo87hfOs+2yhXm6zrFwTPm97hvimih5uSmK
 kF4fRZGRAD1tiXFafl6Gn6C/93oR5ier7O3CVgjZSD2X7pqBL62rOlkrBG5HSZdiFw
 RecbKqS/0JDhAz6oD/pB8J6pqtUbCmtUdMKGFYX7Wu1DXv5z1cJX7mVQDdt4sGDB1m
 GeFLR0pE1MPma5ORDLMbGCX2+b6tlip/vNhmDgwdIwJZbywHnYQiA34YQPyJ3I5Dgl
 XX4oEMfEfw7FNWRvZEAunu+9tyS2YtOC5bg1yOG45UkBiN3itaAvxhYx5DEdum4NAI
 AGLAkJTizQ0Sg==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix,
 from userid 48) id E977FC53BC8; Mon, 23 Sep 2024 05:50:09 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 204241] amdgpu fails to resume from suspend
Date: Mon, 23 Sep 2024 05:50:08 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Video(DRI - non Intel)
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: derFabi95@gmail.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: cc
Message-ID: <bug-204241-2300-AD0m759XAN@https.bugzilla.kernel.org/>
In-Reply-To: <bug-204241-2300@https.bugzilla.kernel.org/>
References: <bug-204241-2300@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D204241

John_H_Smith (derFabi95@gmail.com) changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
                 CC|                            |derFabi95@gmail.com

--- Comment #79 from John_H_Smith (derFabi95@gmail.com) ---
Are there any updates on the status of this bug as I cannot see anything si=
nce
1,5 Years?
The issue still exists.

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
