Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 358B86D8CC8
	for <lists+dri-devel@lfdr.de>; Thu,  6 Apr 2023 03:33:57 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 98AED10E2FD;
	Thu,  6 Apr 2023 01:33:54 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D8E8810E2FD
 for <dri-devel@lists.freedesktop.org>; Thu,  6 Apr 2023 01:33:52 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id B93A8642E0
 for <dri-devel@lists.freedesktop.org>; Thu,  6 Apr 2023 01:33:51 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 8BE37C4339B
 for <dri-devel@lists.freedesktop.org>; Thu,  6 Apr 2023 01:33:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1680744831;
 bh=h9moMCOvNzPQVd655pVG8z7iCllmmBzyU07YNdgbcnQ=;
 h=From:To:Subject:Date:In-Reply-To:References:From;
 b=fFEFsjWL24SIfoMW6lzCtL/7cSie0cy7+41jDDleE5U3+HwNEkklnRmyuHHxvpnI0
 E6Nq16C3CrpxP1nrRm/H4dlSrUty3wXsxs2HIRhx/eWd/B42kxyzcNhcHk2ED7swcH
 ihEDRQqF86+8z5f4i1vO1ahirQFvwPpkSQ8VoI1bQhLXHC8QRf/wEJnprT5S3jtrJx
 ThT6GlY4QJPlQvrK8iyRcgeUoa4l45vwbpxB4a5B7tM2uzE46ADd1Sw3TD3FK6x4j2
 eL/4eQcntzG3YDnk9iNYG/sbypaV2godg1ODO+t84mjfcWTLqrm/Ms8EDRXhZ5wqO9
 KAURg9BuZ0bLA==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix,
 from userid 48) id 6DA82C43141; Thu,  6 Apr 2023 01:33:51 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 215631] Some Desktop oriented mode setting drivers are missing
 DRM PRIME support
Date: Thu, 06 Apr 2023 01:33:51 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Video(DRI - non Intel)
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: bluescreen_avenger@verizon.net
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-215631-2300-TZNiOXurf4@https.bugzilla.kernel.org/>
In-Reply-To: <bug-215631-2300@https.bugzilla.kernel.org/>
References: <bug-215631-2300@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D215631

--- Comment #1 from bluescreen_avenger@verizon.net ---
I have been informed that 41068c8b28e16f1c2c26c854271520e1f3afaa22 in
drm-misc-next should fix it for all the mentioned drivers in the list, exce=
pt
for gma500, ...and I have tested it, and it does work for bochs (in a QEMU
card)

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
