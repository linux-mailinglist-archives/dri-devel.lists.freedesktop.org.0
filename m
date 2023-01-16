Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 732D766CA5F
	for <lists+dri-devel@lfdr.de>; Mon, 16 Jan 2023 18:02:46 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id ECE0310E2B9;
	Mon, 16 Jan 2023 17:02:41 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7345410E2B9
 for <dri-devel@lists.freedesktop.org>; Mon, 16 Jan 2023 17:02:40 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id DA49661085
 for <dri-devel@lists.freedesktop.org>; Mon, 16 Jan 2023 17:02:39 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 4F1C8C43392
 for <dri-devel@lists.freedesktop.org>; Mon, 16 Jan 2023 17:02:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1673888559;
 bh=JTs+U38KfRKS6sTmiW50gUR6ny1WHmruudHj32iOEEI=;
 h=From:To:Subject:Date:In-Reply-To:References:From;
 b=vAhs/8Or+YMtDD+j+mCPiXMnl5xv6w6pnvtp2Kw59SjXBAa+WLtlCqEZkgPux49VO
 eeqqdUAhafSzQf3OJAM3bGFrcsCd1O1DaacI7LyRvmaEbkb9DQo73+s8oq4qNLsLde
 P/8hctJwDHctJQ165MQdJhlUD20PsISMNR/zja3fQen+rr5Ll53aVhWRPpW7dySizo
 DcQQ5xKhkw575dQQS+HUEaNLSLc4eaLVkYaJXmsQVQcP8/UQw3962+zgdvJR8oN1VE
 UL930A7F0bMPa/G30qmLkm4Xm8RRyjRGswMkU7QZ15I8iucAheKByxpXel0GqEzCU0
 S8RNUljW47tLw==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix,
 from userid 48) id 39BBFC05FD6; Mon, 16 Jan 2023 17:02:39 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 216917] hibernation regression since 6.0.18 (Ryzen-5650U incl.
 Radeon GPU)
Date: Mon, 16 Jan 2023 17:02:38 +0000
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
Message-ID: <bug-216917-2300-Pr5wj2Z98T@https.bugzilla.kernel.org/>
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

--- Comment #18 from Rainer Fiebig (jrf@mailbox.org) ---
(In reply to Alex Deucher from comment #16)
> (In reply to Rainer Fiebig from comment #15)
> > (In reply to Mario Limonciello (AMD) from comment #13)
> > > Can we please confirm it's actually broken in 5.15.y before going thr=
ough
> > > that effort?
> >=20
> > I have tested this with 5.15.87/88. Error messages and symptoms were the
> > same as with 6.0.18. Spared me the bisecting this time, though.
>=20
> Can you verify that reverting the change in 5.15.y fixes it?

Alright, I do confirm that reverting commit
306df163069e78160e7a534b892c5cd6fefdd537 ("drm/amdgpu: make display pinning
more flexible (v2)") solves the problem with hibernate and resume in 5.15.8=
8.

To me it seems that this patch cannot be backported in an isolated fashion.

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
