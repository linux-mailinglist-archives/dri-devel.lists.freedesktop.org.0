Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 279B89F0191
	for <lists+dri-devel@lfdr.de>; Fri, 13 Dec 2024 02:07:03 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9BA8A10E42B;
	Fri, 13 Dec 2024 01:07:01 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="UwX+kNeh";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3364210E42B
 for <dri-devel@lists.freedesktop.org>; Fri, 13 Dec 2024 01:07:00 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 54CD15C6AC2
 for <dri-devel@lists.freedesktop.org>; Fri, 13 Dec 2024 01:06:16 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 81962C4CEE1
 for <dri-devel@lists.freedesktop.org>; Fri, 13 Dec 2024 01:06:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1734052018;
 bh=c9ol9Nt53iDP1gAHTy/13Jg1oYhjnNGzMLxi8kOAQjc=;
 h=From:To:Subject:Date:In-Reply-To:References:From;
 b=UwX+kNeh8IKKGOVjKuz8Y0MEr5rIviC9LMTqQbbbmQGe/nepiI3+hjahofeOyPqoZ
 cG+tp/t4jrbSrLAXarnCUQnuZg+uBd+dmihk/uTLSTGlXcNFPfPktINhKkdXCAbiS1
 qIAC5a2+h83kj24GmCpHUBAhRicyDzc8qO/ahiBwBZquygMYhIlXmbR2KM4jxB6eUP
 FIY8lJYYpqnG+vdxOEgMSKw8w3Qa4T6N1XeSndtrqAxgHNZclJly2Lcr5ojL80Qiaa
 Obj9SBg0Ax5o+2iT33a9zBsiSClganoExKyI+Z+3Aw6qhaZ1NdKJrZ3wA8TqvRkU+/
 qLy7/GFlAMIuQ==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix,
 from userid 48) id 7C872C41606; Fri, 13 Dec 2024 01:06:58 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 205089] amdgpu : drm:amdgpu_cs_ioctl : Failed to initialize
 parser -125
Date: Fri, 13 Dec 2024 01:06:57 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Video(DRI - non Intel)
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: ww107587@gmail.com
X-Bugzilla-Status: RESOLVED
X-Bugzilla-Resolution: CODE_FIX
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: cc
Message-ID: <bug-205089-2300-u67wioTqqD@https.bugzilla.kernel.org/>
In-Reply-To: <bug-205089-2300@https.bugzilla.kernel.org/>
References: <bug-205089-2300@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D205089

Wenjie (ww107587@gmail.com) changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
                 CC|                            |ww107587@gmail.com

--- Comment #62 from Wenjie (ww107587@gmail.com) ---
I am seeing this on Linux-Mint 22, the desktop frozen and go black and then=
 the
user logout or the desktop recover. I also seeing this on Windows on the sa=
me
hardware. My cpu is AMD7950X. A brother encountered the same problem, he
returned the CPU to the factory for overhaul, and determined that the
integrated graphics card was except for the problem.

Every time this problem occurs on linux, I performing a dmesg view will get
this error message for =E2=80=9Camdgpu : drm:amdgpu_cs_ioctl : Failed to in=
itialize
parser=E2=80=9D

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
