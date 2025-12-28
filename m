Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 859A2CE5741
	for <lists+dri-devel@lfdr.de>; Sun, 28 Dec 2025 21:42:14 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C30A410E994;
	Sun, 28 Dec 2025 20:41:55 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="TobQflCj";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AF0A110E994
 for <dri-devel@lists.freedesktop.org>; Sun, 28 Dec 2025 20:41:54 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id 1E89342A64
 for <dri-devel@lists.freedesktop.org>; Sun, 28 Dec 2025 20:41:54 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id F0FB0C116D0
 for <dri-devel@lists.freedesktop.org>; Sun, 28 Dec 2025 20:41:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1766954514;
 bh=Dtn3wP4LB2NLL3DPnAO/A4TZWqD5bxaVVWXuwwQvIrk=;
 h=From:To:Subject:Date:In-Reply-To:References:From;
 b=TobQflCjvJm+cqkXogShigLfTaDYNg0mUfkqOsR7PBkoBL1603BjWzP6fEHtseTqC
 dTAW7yG8UAfcDcDJfg+9aB3Ial0Jjbq2agtS+P4byploF5VzKMeBw99i5xIljrMPOV
 PJO1kE4scL+v3un19ig3rMy+IR412iqK/zEYPaIBFw6R6Pry+V+SPva/M6kw9/T8bi
 CMp0nMxF2zpQMgx9/hvLkIlCG4gGvtTqV9FRN8dy9jyS+bm7GH9YQbyWPf5+yP8Y0p
 TLqOwU8Pw871vXuz5hyHNzzKi1RjfvATSwyd2DKiz+lNDVYH1OMCGxwC0nPSaVBgLa
 RDLDLwS4SK1Zw==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix,
 from userid 48) id E2760C53BBF; Sun, 28 Dec 2025 20:41:53 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 220906] Regression: 4K display output fails on ThinkPad
 Thunderbolt 4 Dock with AMD GPU (Worked in 6.17.1, broken in 6.17.11)
Date: Sun, 28 Dec 2025 20:41:53 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: PCI
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: danandrei@gmail.com
X-Bugzilla-Status: REOPENED
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P3
X-Bugzilla-Assigned-To: drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-220906-2300-xtaNmAZLfh@https.bugzilla.kernel.org/>
In-Reply-To: <bug-220906-2300@https.bugzilla.kernel.org/>
References: <bug-220906-2300@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D220906

--- Comment #9 from Andrei (danandrei@gmail.com) ---
Thanks, I attempted a bisection, but it appears that the 6.17.6 I built from
source doesn't exhibit the bug, whereas the build I got from Fedora's Koji
does.

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
