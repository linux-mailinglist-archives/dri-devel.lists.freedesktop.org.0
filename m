Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 03A42574C5E
	for <lists+dri-devel@lfdr.de>; Thu, 14 Jul 2022 13:42:58 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 96E0A10E081;
	Thu, 14 Jul 2022 11:42:44 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 660E210E081
 for <dri-devel@lists.freedesktop.org>; Thu, 14 Jul 2022 11:42:43 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id DE3F461D7E
 for <dri-devel@lists.freedesktop.org>; Thu, 14 Jul 2022 11:42:42 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 4C665C34114
 for <dri-devel@lists.freedesktop.org>; Thu, 14 Jul 2022 11:42:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1657798962;
 bh=P5czlpbRVr1+YcUZxT0GjIZX9U/XSop1OM77zbOAMUI=;
 h=From:To:Subject:Date:In-Reply-To:References:From;
 b=I7qfOwhrFE8RldL0iExjeurgHXTVrwsPNQhGNOPyFVuQIDFibBO0Y4pOOjR3X00pY
 0+JV1DcBt9S/om828Zd25Gbfj7FYvxApCpUlell3lE9MoUkN8BGCitxUdNnLsGPplV
 29g/dFdfI8PSqmHjO4b4FXiLM08zZ2ofCQ+Jy6ccjxPpXuIYtCGg1FmfSUqCNXPksw
 48j87dOjJHxbIYUooAssP688Q0OaifPeAPiL51C+8jt2nA50FWzGcLn54ZzT2165lH
 g2Ienl6agDgoFLzpO7UW0Su/VN2cB4S14VypmZRnnrD3Ou7xPCZxt9ZQlkyVkQLOHi
 Ab1PbVLndojEA==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix,
 from userid 48) id 38EB6CC13AD; Thu, 14 Jul 2022 11:42:42 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 216120] [BISECTED][REGRESSION] drm/amdgpu:  add drm buddy
 support to amdgpu
Date: Thu, 14 Jul 2022 11:42:42 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Video(DRI - non Intel)
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: mat200300h@gmail.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-216120-2300-UQ1Er92zhw@https.bugzilla.kernel.org/>
In-Reply-To: <bug-216120-2300@https.bugzilla.kernel.org/>
References: <bug-216120-2300@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D216120

--- Comment #4 from mat200300h@gmail.com ---
this patch:

https://gitlab.freedesktop.org/drm/amd/uploads/564b2cc2b5ea87357f39e45c3a1a=
44e2/0001-drm-amdgpu-Fix-for-drm-buddy-memory-corruption.patch

on top of 5.19.0-rc6 seems to fix the problem

tested:

5.19.0-rc6: NOT OK

5.19.0-rc6+0001-drm-amdgpu-Fix-for-drm-buddy-memory-corruption.patch: OK

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
