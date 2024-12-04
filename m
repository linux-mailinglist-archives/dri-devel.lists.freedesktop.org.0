Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5A88B9E37B9
	for <lists+dri-devel@lfdr.de>; Wed,  4 Dec 2024 11:39:56 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A724910ECCD;
	Wed,  4 Dec 2024 10:39:54 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="h8K7VaeD";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 75D8110E1BC
 for <dri-devel@lists.freedesktop.org>; Wed,  4 Dec 2024 10:39:53 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id C3A535C4887
 for <dri-devel@lists.freedesktop.org>; Wed,  4 Dec 2024 10:39:09 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 642FEC4CED1
 for <dri-devel@lists.freedesktop.org>; Wed,  4 Dec 2024 10:39:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1733308792;
 bh=7sdXwPk+RNKgINiNZ5jhPDlr8IU2cWO4buHHlACFXwY=;
 h=From:To:Subject:Date:In-Reply-To:References:From;
 b=h8K7VaeDH7jDm+2jW/qjjO46K8xfzRR+aCJX/eNfc9EXOq63zmxtn9xZqHVgwRtci
 2JDU4LoeAbw0mUxNL312bPd3UrtAXYx9X+4Zrhzd/ISOLMNMwBeonPbkV6N6qE5eHp
 iPqn7uAf3o+7AT/PyrfUkbob9efytSYCNe9mN9huwT5ExE8RO/pSeR4u+eL4uZXzMZ
 i/CHLpa0EaUQjf5DwHW62RvvXxrSpvF5onXZC739XlvAcUrwmRNC0JmAvplwkWRT/W
 A0k9ynSlpTP/RuGghVn5TVLSQDzbfL3tB9BJdBrt9qq1KeUeahqxD2G7rqD1jKAJkZ
 YjDU1n5W4TSug==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix,
 from userid 48) id 530DBC41612; Wed,  4 Dec 2024 10:39:52 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 219556] AMDGPU monitoring is broken
Date: Wed, 04 Dec 2024 10:39:52 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Video(DRI - non Intel)
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: i.r.e.c.c.a.k.u.n+bugzilla.kernel.org@gmail.com
X-Bugzilla-Status: RESOLVED
X-Bugzilla-Resolution: ANSWERED
X-Bugzilla-Priority: P3
X-Bugzilla-Assigned-To: drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-219556-2300-NN5bihPIEP@https.bugzilla.kernel.org/>
In-Reply-To: <bug-219556-2300@https.bugzilla.kernel.org/>
References: <bug-219556-2300@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D219556

--- Comment #2 from Hanabishi (i.r.e.c.c.a.k.u.n+bugzilla.kernel.org@gmail.=
com) ---
https://gitlab.freedesktop.org/drm/amd/-/issues/3811

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
