Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A5BBCA2DE98
	for <lists+dri-devel@lfdr.de>; Sun,  9 Feb 2025 15:41:54 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 76AE310E056;
	Sun,  9 Feb 2025 14:41:51 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="ZH9ylzx3";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7110F10E056
 for <dri-devel@lists.freedesktop.org>; Sun,  9 Feb 2025 14:41:49 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id AF6525C5E6D
 for <dri-devel@lists.freedesktop.org>; Sun,  9 Feb 2025 14:41:08 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id E4DFAC4CEDD
 for <dri-devel@lists.freedesktop.org>; Sun,  9 Feb 2025 14:41:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1739112107;
 bh=s0WtlmR8rEOF1Fy3eHujtqgFxD9XYhRVaRHLUMlxwuc=;
 h=From:To:Subject:Date:In-Reply-To:References:From;
 b=ZH9ylzx3mxvhVZr+KIjFY6OPy4/B2NBRulbw9n+jmniJeQTydH4Qo1eJK6aXF1Jdd
 TluelUmQCKsdZWYzjt7/cq5HsrVs2d7bujCrSyMh4iHXw24Yc7g1j0dRmwzu+KKXn0
 nl5/iTpzqRSvhU5W7zDu/j64b7DhHNcbgnPuo+tTDm0j1xM2oSQgFCWlud7HnQudxc
 n3lKz54l/t4zwmi2B560ueMXgGNTps5GWIGi6p8HVb9BVp+lmCEqQgoQ00BUlAIXzo
 8gGi9+2uF5IDghJyvh9nCzjztGJ1CdZq5GMfQsti39UV7uFtCpOmR3vj+be3PCsFP+
 MJsTHKw3H9fMw==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix,
 from userid 48) id DE921C41606; Sun,  9 Feb 2025 14:41:47 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 198387] nouveau + GTX 960: reproducible system freeze
Date: Sun, 09 Feb 2025 14:41:47 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Video(DRI - non Intel)
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: high
X-Bugzilla-Who: peter.eszlari@gmail.com
X-Bugzilla-Status: RESOLVED
X-Bugzilla-Resolution: CODE_FIX
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: bug_status resolution
Message-ID: <bug-198387-2300-jjXmyaMfc1@https.bugzilla.kernel.org/>
In-Reply-To: <bug-198387-2300@https.bugzilla.kernel.org/>
References: <bug-198387-2300@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D198387

peter.eszlari@gmail.com changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
             Status|NEW                         |RESOLVED
         Resolution|---                         |CODE_FIX

--- Comment #1 from peter.eszlari@gmail.com ---
No freezes for some time now, so I'm closing this.

I think the nouveau multithreading fixes solved it:
https://gitlab.freedesktop.org/mesa/mesa/-/merge_requests/10752

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
