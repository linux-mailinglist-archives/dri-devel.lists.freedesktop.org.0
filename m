Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 18FDEA636C7
	for <lists+dri-devel@lfdr.de>; Sun, 16 Mar 2025 18:23:10 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0545D10E1D7;
	Sun, 16 Mar 2025 17:23:07 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="cCRKs+lu";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (unknown [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AA88010E1D7
 for <dri-devel@lists.freedesktop.org>; Sun, 16 Mar 2025 17:23:00 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 631795C2725
 for <dri-devel@lists.freedesktop.org>; Sun, 16 Mar 2025 17:20:33 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id EA7E4C4CEDD
 for <dri-devel@lists.freedesktop.org>; Sun, 16 Mar 2025 17:22:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1742145770;
 bh=rRb+9oES2ZGnQNUb7YKYBo2FStBhRa32lknILrBhlLk=;
 h=From:To:Subject:Date:In-Reply-To:References:From;
 b=cCRKs+lud+bqRHvKiEc7KcWkPqsWnKlZCn6kgirz53cGA5PwqbXq4ckMniIcHb5IV
 9hxG1aP6gJl6/Yg7uUr/6XBcmPQzQTdKGXSZ1CvCVXAy1qhn3OvXASc9PXWN40VWw+
 Mzh5bZjpL21nAgOM1paTvPJrn4w6hxcUvFswjyjfvf2XN9GWuSXyupqpTcZxD22QOv
 fXlOfxrzN+tV+EjcaPSknwrEOmmab262ShejiCLGnJ6GvQWAP5Zry2nfygmR6wgJAP
 Cir+2kVvM1dfvwVQP/I7wyY9Orgk0O54W+K5zhkecN3Y+N0lgPc5Km/rWyjAGrSGp8
 JU1yLEvkR3fgw==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix,
 from userid 48) id DC725C53BC5; Sun, 16 Mar 2025 17:22:49 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 219888] amdgpu: Oops connecting HDMI/DVI/DP on HD 7850
 (Pitcairn) when connected as secondary GPU
Date: Sun, 16 Mar 2025 17:22:49 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Video(DRI - non Intel)
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: high
X-Bugzilla-Who: alexandre.f.demers@gmail.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P3
X-Bugzilla-Assigned-To: drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-219888-2300-krMeZ2DDwx@https.bugzilla.kernel.org/>
In-Reply-To: <bug-219888-2300@https.bugzilla.kernel.org/>
References: <bug-219888-2300@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D219888

--- Comment #4 from Alexandre Demers (alexandre.f.demers@gmail.com) ---
6.12.0 was already "Oopsing".

I hadn't checked if 6.11.0 was "oopsing" in the log though before testing
6.12.0, I'll have to check it out later.

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
