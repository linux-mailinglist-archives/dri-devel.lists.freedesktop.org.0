Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BA50C93BF2F
	for <lists+dri-devel@lfdr.de>; Thu, 25 Jul 2024 11:39:06 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3A61A10E17C;
	Thu, 25 Jul 2024 09:39:04 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="R5AhvcPe";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 08A3010E0B8
 for <dri-devel@lists.freedesktop.org>; Thu, 25 Jul 2024 09:39:03 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 106116130C
 for <dri-devel@lists.freedesktop.org>; Thu, 25 Jul 2024 09:39:02 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id B6A4BC4AF0A
 for <dri-devel@lists.freedesktop.org>; Thu, 25 Jul 2024 09:39:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1721900341;
 bh=nkqGkOEDJGtMmckxzfydNTutIq1q5ImAoU664QdUQCY=;
 h=From:To:Subject:Date:In-Reply-To:References:From;
 b=R5AhvcPeJP6jqbkWgJLpSEZ5o9wKCKOaWm3EsQmi/CaSt8qfnF1yHGGj+DJhtDyOR
 peNeXYYCui3szyL3uUr8DWB7VkL0sQXt9h/fSZbuPGJOFzGUr6vXrJZaVVsjt4/FeY
 07ZjrOFibGvLLd96GH22W7J0D5k3XiJnkgs+guQZAGMQY51hjFcsdcaoCWvLpfi5ae
 4S4Ns7NUrMdD0EEW4q6fCqTvWzlZjhVCS6BnQSj6Q/njHK/cgCRRpUck1+psaIsjIu
 YzetMyk70QMcdUukrT+FtLQv1XbgLChAAwosmDXUOgv57q0RELZ7cbLv+jENBFExWm
 vvIb+wU/tWpBw==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix,
 from userid 48) id A3D1EC53BB8; Thu, 25 Jul 2024 09:39:01 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 219092] Problem with fill_dc_mst_payload_table_from_drm [amdgpu]
Date: Thu, 25 Jul 2024 09:39:01 +0000
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
X-Bugzilla-Resolution: ANSWERED
X-Bugzilla-Priority: P3
X-Bugzilla-Assigned-To: drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: bug_status resolution
Message-ID: <bug-219092-2300-jq6icq11Gj@https.bugzilla.kernel.org/>
In-Reply-To: <bug-219092-2300@https.bugzilla.kernel.org/>
References: <bug-219092-2300@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D219092

Artem S. Tashkinov (aros@gmx.com) changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
             Status|NEW                         |RESOLVED
         Resolution|---                         |ANSWERED

--- Comment #1 from Artem S. Tashkinov (aros@gmx.com) ---
Please report here instead: https://gitlab.freedesktop.org/drm/amd/-/issues

Before doing that make sure your bug is reproducible in 6.10.1 because vend=
or
kernels are not normally supported.

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
