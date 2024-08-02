Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 88EE5945A9E
	for <lists+dri-devel@lfdr.de>; Fri,  2 Aug 2024 11:15:45 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C7EEE10E9C5;
	Fri,  2 Aug 2024 09:15:42 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="PPR5JwOi";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3A88910E9C5
 for <dri-devel@lists.freedesktop.org>; Fri,  2 Aug 2024 09:15:41 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 82208629AC
 for <dri-devel@lists.freedesktop.org>; Fri,  2 Aug 2024 09:15:40 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 3940AC4AF0B
 for <dri-devel@lists.freedesktop.org>; Fri,  2 Aug 2024 09:15:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1722590140;
 bh=bZH6FMDmR0F5ICZCD3xAX3adhEIPEOsLyXIvPOeE2tI=;
 h=From:To:Subject:Date:In-Reply-To:References:From;
 b=PPR5JwOi1jAPXWngRNEmP3sFSy8YhMdgenNez/zhD04idPumcCvuPvUguekocQ70x
 4hnS+eBT0oqis/LlMr69KItXteJxCpGaNfoPcKwU5EGLvKAu8o3IMwn+EmAr+3Iuj7
 QC5oVbY19uVMA0QhJKq4WJFtKUqya+blo/BrNQ96TsEp05kr24+JNN2kr4Ctj6Z0T5
 9iuir8026uzD4H4Vcz1pMdL66tP1djK9ST/FasuRONneCrx3souSxlxx05TAHpPy+T
 qEbFb2cjG1dYsBHUCU9D33MSuucDLX2cprbxJh0+MClC8TkralagM6vVgegKyHTw2Z
 BJYajcKYUrFtA==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix,
 from userid 48) id 28C86C53B73; Fri,  2 Aug 2024 09:15:40 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 219117] amdgpu: amdgpu_device_ip_init failed
Date: Fri, 02 Aug 2024 09:15:39 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Video(DRI - non Intel)
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: blocking
X-Bugzilla-Who: jean-christophe@guillain.net
X-Bugzilla-Status: RESOLVED
X-Bugzilla-Resolution: CODE_FIX
X-Bugzilla-Priority: P3
X-Bugzilla-Assigned-To: drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: resolution
Message-ID: <bug-219117-2300-3AXqMFcOpN@https.bugzilla.kernel.org/>
In-Reply-To: <bug-219117-2300@https.bugzilla.kernel.org/>
References: <bug-219117-2300@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D219117

Jean-Christophe Guillain (jean-christophe@guillain.net) changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
         Resolution|ANSWERED                    |CODE_FIX

--- Comment #3 from Jean-Christophe Guillain (jean-christophe@guillain.net)=
 ---
Hello Tim !

I confirm that your patch fixed the issue.

Thank you very much,
jC

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
