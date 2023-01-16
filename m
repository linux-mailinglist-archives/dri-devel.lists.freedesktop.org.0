Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D3D4066C690
	for <lists+dri-devel@lfdr.de>; Mon, 16 Jan 2023 17:21:33 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1D72710E2AB;
	Mon, 16 Jan 2023 16:21:32 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3E2F510E455
 for <dri-devel@lists.freedesktop.org>; Mon, 16 Jan 2023 16:21:29 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 9A9B9B80DC7
 for <dri-devel@lists.freedesktop.org>; Mon, 16 Jan 2023 16:21:27 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 4C278C433F0
 for <dri-devel@lists.freedesktop.org>; Mon, 16 Jan 2023 16:21:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1673886087;
 bh=IIDnylvEfApyaSGZvWXdz0rLBCtOoimGb8A2J6IuU4w=;
 h=From:To:Subject:Date:In-Reply-To:References:From;
 b=o2ArHrMjPbCYR2kEfRx6rWWP89jylA7ZI3rr8oZmvgA0MgtRtdqpTwiHcAMevOUPs
 aD0YE/HDqIFJKYoBk7pXb9VuVcd1sE/0E2GaV7spJt7nqHWRGzrCe//4YgeLbR/g5r
 G1S1JJqztJkQgnrM7c9jXSg2XGfJol5nhfik0nNk/1F3URIAk6rwsuou5xKLUa0Myj
 yK5xhAvKB/5Vjhh3FVxOH9PYVyiN96fxviP1PpQ5U/jTml9GG6uus5is6VD27ZQYU7
 r7hKBOPPN1u/ddNSW8jzzKOWt/kxZGYE0KlOTwxbmq+gv85dfu0PAPuxPBdA3jUvh8
 NWok2D/7OMt/Q==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix,
 from userid 48) id 3CC00C43142; Mon, 16 Jan 2023 16:21:27 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 216917] hibernation regression since 6.0.18 (Ryzen-5650U incl.
 Radeon GPU)
Date: Mon, 16 Jan 2023 16:21:26 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Video(DRI - non Intel)
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: alexdeucher@gmail.com
X-Bugzilla-Status: NEEDINFO
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-216917-2300-1nJryKOCIi@https.bugzilla.kernel.org/>
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

--- Comment #16 from Alex Deucher (alexdeucher@gmail.com) ---
(In reply to Rainer Fiebig from comment #15)
> (In reply to Mario Limonciello (AMD) from comment #13)
> > Can we please confirm it's actually broken in 5.15.y before going throu=
gh
> > that effort?
>=20
> I have tested this with 5.15.87/88. Error messages and symptoms were the
> same as with 6.0.18. Spared me the bisecting this time, though.

Can you verify that reverting the change in 5.15.y fixes it?

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
