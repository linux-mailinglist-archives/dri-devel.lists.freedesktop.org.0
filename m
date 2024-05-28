Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 023AB8D20AF
	for <lists+dri-devel@lfdr.de>; Tue, 28 May 2024 17:45:46 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F281F10E128;
	Tue, 28 May 2024 15:45:40 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="b2RwX8O9";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sin.source.kernel.org (sin.source.kernel.org [145.40.73.55])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5512210E128
 for <dri-devel@lists.freedesktop.org>; Tue, 28 May 2024 15:45:39 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sin.source.kernel.org (Postfix) with ESMTP id 4790DCE115E
 for <dri-devel@lists.freedesktop.org>; Tue, 28 May 2024 15:45:37 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 626A9C32789
 for <dri-devel@lists.freedesktop.org>; Tue, 28 May 2024 15:45:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1716911136;
 bh=h0ePprL/meyEothTUM7brEtrj40MdeV0M9xezJ+7Mrk=;
 h=From:To:Subject:Date:In-Reply-To:References:From;
 b=b2RwX8O9SiJWgI8zk4Bw5WQxd08GRy584wP126Kn9y25FRwXoMYtLdHhb8KCsE8bf
 enUZyESPlBsSlhfSnznfzJLYgVfCNlukPtlGUHt9dU9oHMYoQbvLsAdxpCfMXY/x16
 YoYGlZ2aQP2lSZKAXyBP+I3qXW2sPtdT9XXRD7gSwgS+ZzTS0RYAZcM34A/1GTa1ZE
 k10UrFDPwFPuAkVdX2bAV0S7mLfBUsfla/AMb3S2636IW8E5qMvgcm6G6+HYLG/S76
 /WVj2rNXjtAW5oyJdR5nYP/skEWDm8UtQdak48CLPweLkna6nyElZaKSSAezpKwdoh
 mlG/G0b0kTfVw==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix,
 from userid 48) id 53943C53BB8; Tue, 28 May 2024 15:45:36 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 218900] amdgpu: Fatal error during GPU init
Date: Tue, 28 May 2024 15:45:36 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Video(DRI - non Intel)
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: blocking
X-Bugzilla-Who: jean-christophe@guillain.net
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P3
X-Bugzilla-Assigned-To: drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: cf_bisect_commit
Message-ID: <bug-218900-2300-OoOGtjdjTj@https.bugzilla.kernel.org/>
In-Reply-To: <bug-218900-2300@https.bugzilla.kernel.org/>
References: <bug-218900-2300@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D218900

Jean-Christophe Guillain (jean-christophe@guillain.net) changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
 Bisected commit-id|db5d28c0bfe566908719bec8e25 |
                   |443aabecbb802               |

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
