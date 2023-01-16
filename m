Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 2B89766D098
	for <lists+dri-devel@lfdr.de>; Mon, 16 Jan 2023 21:59:36 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 18AB310E4D4;
	Mon, 16 Jan 2023 20:59:34 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 76C7610E4D4
 for <dri-devel@lists.freedesktop.org>; Mon, 16 Jan 2023 20:59:32 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id E5C1361139
 for <dri-devel@lists.freedesktop.org>; Mon, 16 Jan 2023 20:59:31 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 55AD9C433F2
 for <dri-devel@lists.freedesktop.org>; Mon, 16 Jan 2023 20:59:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1673902771;
 bh=9q8K4XWB0ZxVQCynGjkVk7RrIB+rCttwcuFWpxTQTLQ=;
 h=From:To:Subject:Date:In-Reply-To:References:From;
 b=aoTxW6zMTE3FqtfwHxmp3lE6GvH+a1FikRkJERBsxdgOZkvr2cSGVt9OqirlP9clv
 nclVsZqsIWTXK5l/iW1mRNjeh07Tjr64MErzPsOpCGBdJdN5ygGgrwwWFSE7+qzG1n
 2D9AY7PUUvgADqLmPCVkoxKgw4HtS1X+Nldy5CIbRAZv8jq7IgR4LZSuRfKf+hUGm+
 9YJ1fRXSOUWO0fKySgc14S+z45l4hp0gmTNTdpuQ7pxrs8S1OzjFG3t1hyvDGUVysu
 sZaGDBdxgIJZZktNHQzvuzJGg/R1DrEzFRn1q7N1HsDSuMCxjSgEExx8gJ6Dwon+vd
 sH9+xPzzlYgYw==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix,
 from userid 48) id 33142C43143; Mon, 16 Jan 2023 20:59:31 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 216917] hibernation regression since 6.0.18 (Ryzen-5650U incl.
 Radeon GPU)
Date: Mon, 16 Jan 2023 20:59:30 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Video(DRI - non Intel)
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: jrf@mailbox.org
X-Bugzilla-Status: NEEDINFO
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-216917-2300-P7FlJNUdkV@https.bugzilla.kernel.org/>
In-Reply-To: <bug-216917-2300@https.bugzilla.kernel.org/>
References: <bug-216917-2300@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D216917

--- Comment #21 from Rainer Fiebig (jrf@mailbox.org) ---
(In reply to Mario Limonciello (AMD) from comment #19)
> Assuming it's within amdgpu and not DRM helpers it's still ~800 commits to
> sift through. Even though 6.0.y is EOL now, I think it would be easier to
> check the missing commit(s) from there to backport.  We can worry about
> 5.15.y after that.
>=20
> Can you see if this series from 6.1 on top of 6.0.19 helps?
>=20
> https://patchwork.freedesktop.org/series/106027/

No, those patches didn't help. Hibernate was always fine but resume always
failed in the same way as described in my original mail to "stable".

Note that I'm not going to test 800 commits in this manner. ;)

So long!

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
