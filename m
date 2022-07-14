Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9D76457543C
	for <lists+dri-devel@lfdr.de>; Thu, 14 Jul 2022 19:47:22 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 37FED10F6F9;
	Thu, 14 Jul 2022 17:47:18 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6604810FA6A
 for <dri-devel@lists.freedesktop.org>; Thu, 14 Jul 2022 17:47:16 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 5A5C4620FD
 for <dri-devel@lists.freedesktop.org>; Thu, 14 Jul 2022 17:47:12 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id ADF45C34114
 for <dri-devel@lists.freedesktop.org>; Thu, 14 Jul 2022 17:47:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1657820831;
 bh=RGvYB0sC+dGQSXipWWEJqz0Y72NGy1B/hgCZsTSSdNU=;
 h=From:To:Subject:Date:In-Reply-To:References:From;
 b=SS2FStvGpbb/j15hkGdCoJ1LUKXnSHLwf7zj7zj4BgGKkDVkxxfU7/yLKaqHDX6vg
 9Y7SXU1J31Xgc3ewYSQ6p2AXUulmpE6/QhJYPIZYi8Jpa+hAoTFE8myeDNll5LN1/p
 YSzQsoaVDhJjoD6Uev2LLT3w7IPTTwJqHbMlq1IHTS5IoXKHuGpz/ALVBIH3KZveLw
 l7ZiTVBcyhSrYNLxdHoO/9rNoXpYw0I15vaOAPKHCv8p4vc2dd69oXJsjUGUOp3GOL
 bWzdzgMW+xBK36rrB0ikUQv+EcRVzKD2R4Q5LydOr7WH1sINnwcL+DStF+vB/6BhH3
 tfmj+IkYPV37g==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix,
 from userid 48) id 99535CC13B5; Thu, 14 Jul 2022 17:47:11 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 216120] [BISECTED][REGRESSION] drm/amdgpu:  add drm buddy
 support to amdgpu
Date: Thu, 14 Jul 2022 17:47:11 +0000
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
Message-ID: <bug-216120-2300-Ez9BqkId2O@https.bugzilla.kernel.org/>
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

--- Comment #6 from mat200300h@gmail.com ---
not quite there yet, after some hours of working with latest
linus+0001-drm-amdgpu-Fix-for-drm-buddy-memory-corruption.patch (latest com=
mit
"vf/remap: return the amount of bytes actually deduplicated") display stopp=
ed
working, keyboard was working so I could reboot blindly. Part of journal
attached in comment 5. Maybe different bug.

I could perhaps bisect adding the patch to relevant steps but now I have had
too many gin&tonics and seem to be talking to myself anyway.

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
