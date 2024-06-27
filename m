Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8FB7D91A456
	for <lists+dri-devel@lfdr.de>; Thu, 27 Jun 2024 12:52:48 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 936A310E1A4;
	Thu, 27 Jun 2024 10:52:46 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="Tu7eTFfq";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sin.source.kernel.org (sin.source.kernel.org [145.40.73.55])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F200010E1A4
 for <dri-devel@lists.freedesktop.org>; Thu, 27 Jun 2024 10:52:44 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sin.source.kernel.org (Postfix) with ESMTP id 04374CE2DD3
 for <dri-devel@lists.freedesktop.org>; Thu, 27 Jun 2024 10:52:43 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 33E87C2BBFC
 for <dri-devel@lists.freedesktop.org>; Thu, 27 Jun 2024 10:52:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1719485562;
 bh=C80Lmlz2+9N6t+eXLsIXD13IZngtRxJLJbeExPvqyIk=;
 h=From:To:Subject:Date:In-Reply-To:References:From;
 b=Tu7eTFfqHOGS9gINCtHi6JDRkL9laDW4RqFy1TdympGDQIrCnNQRQisk1VQUkshdV
 QC1MwXf0Jf+/8IBEq0vek9hwURTghlwAEAXTMfxNseWAxVqBhm7wMm9YTlGPjEtjdq
 Brx5iAcH6JeP/srGfAWwlTrD9jVeZtko/PFLkEyF+lIulbVndiAXOCULydkowzGEmG
 Wi7NvWmIzxzfwJgfeDqWlki6w/xmW6f8cUW92VO8lhJENoXnq7bGh34TTpkkulZNak
 KrNXg8fID/J9e+/sZd6V6YG1F6B4JIZTSomLvEPsZRAQsP/3Jq96L2qAIOqWm7vQ4Y
 xok/8EFifx6Dg==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix,
 from userid 48) id 2AD5CC53B50; Thu, 27 Jun 2024 10:52:42 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 218993] SIGBUS with amdgpu on multi-GPU system on X server with
 DRI3/GBM
Date: Thu, 27 Jun 2024 10:52:41 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Video(DRI - non Intel)
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: adaha@cendio.se
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P3
X-Bugzilla-Assigned-To: drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: cf_kernel_version
Message-ID: <bug-218993-2300-iv7qW2axRl@https.bugzilla.kernel.org/>
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

adaha@cendio.se changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
     Kernel Version|                            |6.9.5-200.fc40.x86_64

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
