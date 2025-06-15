Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E4F77ADA22F
	for <lists+dri-devel@lfdr.de>; Sun, 15 Jun 2025 16:55:44 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 520B410E10B;
	Sun, 15 Jun 2025 14:55:43 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="ZNzmtwNN";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5AEBD10E10B
 for <dri-devel@lists.freedesktop.org>; Sun, 15 Jun 2025 14:55:42 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id D0B1060007
 for <dri-devel@lists.freedesktop.org>; Sun, 15 Jun 2025 14:55:41 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 879C2C4CEF1
 for <dri-devel@lists.freedesktop.org>; Sun, 15 Jun 2025 14:55:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1749999341;
 bh=ZNI6ainggTNTldg+AE98/K9xdD7NBjqeNjQoPKIAVXo=;
 h=From:To:Subject:Date:In-Reply-To:References:From;
 b=ZNzmtwNN9YcF3g83z5hJKLGGJohIle8aJWeHmTgaZCX68Tq5pOOzOGD+tKqabHBK+
 bZRG4veqRfLlvzvTMaAFKcrEqbCJoSXM4t9Ja3kdIfVPTy1GfvfTnEjpULrCzOu6Mz
 CY7aQT23Ch7LUgcyk1eS298jqW4m+RsJopAOxnpnP/EUuxBmdlM9itlVcyT5Wh/SMl
 dRnKM0HdvE/DHGLIPmJ4U2Qry4j9tV62mIzSpONwzhiaGUnBAFImAkSuBMh29kOq2x
 b2kP9LIGEMzUE/grF+X4BpaUk9eUnLADsmF842p3a2ZdXIMFoNohnzvz+5nlypCQXr
 zOQu9OZnGQC9Q==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix,
 from userid 48) id 7A037C4160E; Sun, 15 Jun 2025 14:55:41 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 220230] linux-firmware 20250613 breaks AMD iGPU
Date: Sun, 15 Jun 2025 14:55:41 +0000
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
X-Bugzilla-Changed-Fields: bug_status resolution
Message-ID: <bug-220230-2300-s0ZmUUxfOI@https.bugzilla.kernel.org/>
In-Reply-To: <bug-220230-2300@https.bugzilla.kernel.org/>
References: <bug-220230-2300@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D220230

Artem S. Tashkinov (aros@gmx.com) changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
             Status|NEW                         |RESOLVED
         Resolution|---                         |ANSWERED

--- Comment #2 from Artem S. Tashkinov (aros@gmx.com) ---
Please report here:

https://gitlab.freedesktop.org/drm/amd/-/issues

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
