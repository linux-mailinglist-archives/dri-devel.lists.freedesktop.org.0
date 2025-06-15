Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EBCBFADA22E
	for <lists+dri-devel@lfdr.de>; Sun, 15 Jun 2025 16:55:24 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 24C9210E0F8;
	Sun, 15 Jun 2025 14:55:22 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="KNSKpVh+";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1F9FB10E0F8
 for <dri-devel@lists.freedesktop.org>; Sun, 15 Jun 2025 14:55:21 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id 2270F60007
 for <dri-devel@lists.freedesktop.org>; Sun, 15 Jun 2025 14:55:16 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id CD8C2C4CEEF
 for <dri-devel@lists.freedesktop.org>; Sun, 15 Jun 2025 14:55:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1749999315;
 bh=Xf3KGmvmpPHtCtaYYNwxMc9foMi1YMLi9dooQj7z2zI=;
 h=From:To:Subject:Date:In-Reply-To:References:From;
 b=KNSKpVh+Z/nwP/o9XWyhaplduTqhXwWWZ3ZWkjEhRNLm8dirJ5wemkr//VTX8pl0l
 r2zV9u/mee+uybEHdzN/pwY2mxB2IQjjY11PDKsO0BK6H5PJUPmmIzz9tB1PRHyyWH
 JHC/7RVU98pYGrjEqGCGbIPvy+ghbGjhBTUf44q3n6KokSqjFnsHyIIEc3Crn+8sOg
 /pddw1wNlFf+61sei1e9brKHjzODvwdwAu0ZHxDygjYxcwOZKfmApwOF/7vjJ58OaF
 6xZmS1TKOlh2eO2FGGo1gu/6sCEhCCUqDRx3HGY9r3QR3VOTqsk+mzcqfML2ErwtR/
 l1b0J5f5ck6JA==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix,
 from userid 48) id B979FC41614; Sun, 15 Jun 2025 14:55:15 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 220232] Title: RX 7900 XT/XTX DPM states incorrectly ordered -
 idle state in wrong position
Date: Sun, 15 Jun 2025 14:55:15 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Video(DRI - non Intel)
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: high
X-Bugzilla-Who: aros@gmx.com
X-Bugzilla-Status: RESOLVED
X-Bugzilla-Resolution: ANSWERED
X-Bugzilla-Priority: P3
X-Bugzilla-Assigned-To: drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: bug_status bug_file_loc resolution
Message-ID: <bug-220232-2300-Eo3vM4J2Rl@https.bugzilla.kernel.org/>
In-Reply-To: <bug-220232-2300@https.bugzilla.kernel.org/>
References: <bug-220232-2300@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D220232

Artem S. Tashkinov (aros@gmx.com) changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
             Status|NEW                         |RESOLVED
                URL|                            |https://gitlab.freedesktop.
                   |                            |org/drm/amd/-/issues/4328
         Resolution|---                         |ANSWERED

--- Comment #1 from Artem S. Tashkinov (aros@gmx.com) ---
https://gitlab.freedesktop.org/drm/amd/-/issues/4328

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
