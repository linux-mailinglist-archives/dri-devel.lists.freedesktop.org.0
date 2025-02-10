Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B3833A2F81E
	for <lists+dri-devel@lfdr.de>; Mon, 10 Feb 2025 20:02:02 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 367A010E5F9;
	Mon, 10 Feb 2025 19:02:01 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="SivInr6T";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from nyc.source.kernel.org (nyc.source.kernel.org [147.75.193.91])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7F9B710E5F9
 for <dri-devel@lists.freedesktop.org>; Mon, 10 Feb 2025 19:01:59 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by nyc.source.kernel.org (Postfix) with ESMTP id 2347EA4205A
 for <dri-devel@lists.freedesktop.org>; Mon, 10 Feb 2025 19:00:13 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 614D8C4CEE9
 for <dri-devel@lists.freedesktop.org>; Mon, 10 Feb 2025 19:01:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1739214118;
 bh=zpRmHT1mEN1KeqYwZoXPXypczXq/4d5LvjBMrQomlic=;
 h=From:To:Subject:Date:In-Reply-To:References:From;
 b=SivInr6ToU088g5eThPQHo0YRlcP9HTpSUulVP3tbP3LlR9BsPkM3AYdac4oPdas0
 BZDmB2ddbjRVqJzxCeFTC+WXLsjBRqM0giv6NPiXie8wMXrqVYpNb7thFId1pl07U2
 uDoUHpz/33no5PQYm0RMrJkXI6eRZ6wFZWoP9L3Jk3cX9pymLMowduqpAzVLi3n22C
 eZ7mjdJe6YC6LmDosVfS7sLOHJvK5ni8yodZttprComPnZKaHlBWRTtS9bLPxts6sr
 5yGDGn3BSQVCaFtETSPTpNN/lc2uG0ce7X6wIOZMZBPSdHwQiZ1q9oJ1U6/AU/sKrx
 f+nfYJ+mP4nKQ==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix,
 from userid 48) id 50C1CC41614; Mon, 10 Feb 2025 19:01:58 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 219492] amdgpu: failed to write reg 28b4 wait reg 28c6 and
 amdgpu: failed to write reg 1a6f4 wait reg 1a706
Date: Mon, 10 Feb 2025 19:01:57 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Video(DRI - non Intel)
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: oyvinds@everdot.org
X-Bugzilla-Status: RESOLVED
X-Bugzilla-Resolution: ANSWERED
X-Bugzilla-Priority: P3
X-Bugzilla-Assigned-To: drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: cc
Message-ID: <bug-219492-2300-yZr9o2ez08@https.bugzilla.kernel.org/>
In-Reply-To: <bug-219492-2300@https.bugzilla.kernel.org/>
References: <bug-219492-2300@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D219492

oyvinds@everdot.org changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
                 CC|                            |oyvinds@everdot.org

--- Comment #2 from oyvinds@everdot.org ---
This still happens with 6.12.11 and a AMD Ryzen 5 PRO 4650U.

[174713.452341] amdgpu 0000:06:00.0: amdgpu: failed to write reg 1a6f4 wait=
 reg
1a706
[174721.488476] amdgpu 0000:06:00.0: amdgpu: failed to write reg 28b4 wait =
reg
28c6
[174721.494879] amdgpu 0000:06:00.0: amdgpu: failed to write reg 1a6f4 wait=
 reg
1a706
[174721.501252] amdgpu 0000:06:00.0: amdgpu: failed to write reg 28b4 wait =
reg
28c6
[174721.507537] amdgpu 0000:06:00.0: amdgpu: failed to write reg 1a6f4 wait=
 reg
1a706
[174780.330661] amdgpu 0000:06:00.0: amdgpu: failed to write reg 28b4 wait =
reg
28c6
[174780.337011] amdgpu 0000:06:00.0: amdgpu: failed to write reg 1a6f4 wait=
 reg
1a706
[174780.360568] amdgpu 0000:06:00.0: amdgpu: failed to write reg 28b4 wait =
reg
28c6
[174780.367548] amdgpu 0000:06:00.0: amdgpu: failed to write reg 1a6f4 wait=
 reg
1a706

It seems to be related to playing video with VAAPI in Firefox after
suspend/resume.

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
