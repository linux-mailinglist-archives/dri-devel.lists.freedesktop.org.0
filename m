Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id F3D15A0AC1A
	for <lists+dri-devel@lfdr.de>; Sun, 12 Jan 2025 23:06:37 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 55E5F10E0BD;
	Sun, 12 Jan 2025 22:06:35 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="JRnQ8n4l";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from nyc.source.kernel.org (nyc.source.kernel.org
 [IPv6:2604:1380:45d1:ec00::3])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5721F10E0BD
 for <dri-devel@lists.freedesktop.org>; Sun, 12 Jan 2025 22:06:34 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by nyc.source.kernel.org (Postfix) with ESMTP id 548C8A409D9
 for <dri-devel@lists.freedesktop.org>; Sun, 12 Jan 2025 22:04:45 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 45EC3C4CEE1
 for <dri-devel@lists.freedesktop.org>; Sun, 12 Jan 2025 22:06:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1736719593;
 bh=iLgWT/1o8aatJGmzUtFcweXbD+wDU2NTKlx52ddXqvE=;
 h=From:To:Subject:Date:In-Reply-To:References:From;
 b=JRnQ8n4lYZhFudz+Cc+GjkL5vC0jEy9nQUv7yPmQunlYD15fFfPf8sK4PHlhlnEQj
 JIlXksjLCYKQPu0EbC2NQsHtWO05vmT9Qe6JZs2CWbPhuit4vPs8pbOeR4MCzPvCNQ
 P2s/j139i4xbX9NFhevC/G/slX2TkmJCiL8Qqr+aAcW2uVHw2CPmQK/VXY/kiI+/L3
 DazgXq93QHcCt3z7zz0OZxJKGNKJl5lOUtzTIdZBbBx6KcFLY/GpIQvxQp/k2OxdzE
 Cf8tHEqt3IQB9pFUB6qIuSmPFo2M6u1jRu+6qlGTfrfdYf2H8lNvfNMNGPCpH2y/lR
 X/Mm+MW8rTjVA==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix,
 from userid 48) id 36899C41606; Sun, 12 Jan 2025 22:06:33 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 219689] Kernel Logs Reveal Multiple AMD Driver Issues
Date: Sun, 12 Jan 2025 22:06:33 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo CC drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Video(DRI - non Intel)
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: blocking
X-Bugzilla-Who: dacia.mountable282@aleeas.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P3
X-Bugzilla-Assigned-To: drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: cc cf_kernel_version
Message-ID: <bug-219689-2300-WSmVc2Tfz3@https.bugzilla.kernel.org/>
In-Reply-To: <bug-219689-2300@https.bugzilla.kernel.org/>
References: <bug-219689-2300@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D219689

Dacia Mountable (dacia.mountable282@aleeas.com) changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
                 CC|                            |drivers_video-dri@kernel-bu
                   |                            |gs.osdl.org
     Kernel Version|                            |6.12.8-2

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.
You are watching someone on the CC list of the bug.=
