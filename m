Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3B42991A951
	for <lists+dri-devel@lfdr.de>; Thu, 27 Jun 2024 16:35:35 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5EC2B10E23E;
	Thu, 27 Jun 2024 14:35:31 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="UqBLWMr6";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A3FB610E233
 for <dri-devel@lists.freedesktop.org>; Thu, 27 Jun 2024 14:35:29 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id DEE2561ECC
 for <dri-devel@lists.freedesktop.org>; Thu, 27 Jun 2024 14:35:28 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 8B140C4AF09
 for <dri-devel@lists.freedesktop.org>; Thu, 27 Jun 2024 14:35:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1719498928;
 bh=4oTdPT6IaM0c8qomNXaxQf2up9fKT7B2cD6zMZVMJo8=;
 h=From:To:Subject:Date:In-Reply-To:References:From;
 b=UqBLWMr6biQl8MwirGu2DGuIn5RPD2+Gvs2nf0W9M3RBgq1+PNd1QQun02dYanZ0r
 Hcn8EhWpsksemDz2h8mZU+zEuqbUlLT/lqCYemI3g4uAoYB7Cnq5Qldp+9FbyMmBAv
 CQYkX6FWZ37KxMSS/Q/+V1rvnS5T8Wg13W4GBqUzq+dmROgSNnASwEOYm2EUCsUrfb
 yYKW50gjM+yy35rTRZ9uKt1j9K4GLTCWWoNIYY1ETdUzNPKLzHMzqnFqRH3rn2V9uW
 PSVV0K89b8SWd9f6trgpY4SKEmce4NxYc4Lg6UaztDZL5m0sXXosNUgRiWsiR9X4U6
 aWppcry3p2J+Q==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix,
 from userid 48) id 78738C53BB8; Thu, 27 Jun 2024 14:35:28 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 218993] SIGBUS with amdgpu on multi-GPU system on X server with
 DRI3/GBM
Date: Thu, 27 Jun 2024 14:35:28 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Video(DRI - non Intel)
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: aros@gmx.com
X-Bugzilla-Status: RESOLVED
X-Bugzilla-Resolution: MOVED
X-Bugzilla-Priority: P3
X-Bugzilla-Assigned-To: drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: bug_status resolution
Message-ID: <bug-218993-2300-pwCwotyjgu@https.bugzilla.kernel.org/>
In-Reply-To: <bug-218993-2300@https.bugzilla.kernel.org/>
References: <bug-218993-2300@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D218993

Artem S. Tashkinov (aros@gmx.com) changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
             Status|NEW                         |RESOLVED
         Resolution|---                         |MOVED

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
