Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4ED87815CF3
	for <lists+dri-devel@lfdr.de>; Sun, 17 Dec 2023 02:11:51 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CE1D610E382;
	Sun, 17 Dec 2023 01:11:47 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2D15E10E382
 for <dri-devel@lists.freedesktop.org>; Sun, 17 Dec 2023 01:11:45 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by ams.source.kernel.org (Postfix) with ESMTP id 01B61B8074E
 for <dri-devel@lists.freedesktop.org>; Sat, 16 Dec 2023 22:43:56 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 470F0C433C9
 for <dri-devel@lists.freedesktop.org>; Sat, 16 Dec 2023 22:43:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1702766635;
 bh=4mDdu3pl4lPL7HBK9OR5AJPYzxN83qSGLIoB4HY744g=;
 h=From:To:Subject:Date:In-Reply-To:References:From;
 b=KyznNS/OP3vsDjjaTjF3VeolcuKqrJ88laZbfIVY/c6CnKGFDxTzMxZk2+jsMIRsm
 p473vaqLLDy+qhB3vUfYPeOZScmDRfNtoPF1qNVnPPc5qavprx77a1Oz1Krj3EUhOJ
 1XX3het7TFqW4yO+5bLzu2oJXpqvCV/j4mCFNoFmKzDhvmQxYhQuFd0Zm4XSJ1ghkj
 nJ5g+hOkdT/fELEgTdQ3MZAv6yCVsPg5utldGed180J92z7uoCfLAXof670iUfw6g0
 y7TKS49rFQruU9zCEpiEEcckK1tUdFGRnBQ+l0aBVStTdw3C7MBygvgTSS6lH+q/Bm
 0AX9Q0WDzUqSw==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix,
 from userid 48) id 3186AC53BCD; Sat, 16 Dec 2023 22:43:55 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 218274] AMD r9 m380, 2015,27 imac - amdgpu wont work
Date: Sat, 16 Dec 2023 22:43:54 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Video(DRI - non Intel)
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: high
X-Bugzilla-Who: pukurasa@gmail.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P3
X-Bugzilla-Assigned-To: drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: cf_kernel_version
Message-ID: <bug-218274-2300-d6afSI7KA2@https.bugzilla.kernel.org/>
In-Reply-To: <bug-218274-2300@https.bugzilla.kernel.org/>
References: <bug-218274-2300@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D218274

Pukurasa (pukurasa@gmail.com) changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
     Kernel Version|                            |6.6.6

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
