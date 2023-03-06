Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 8FA306AB8DE
	for <lists+dri-devel@lfdr.de>; Mon,  6 Mar 2023 09:55:26 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 630A710E19D;
	Mon,  6 Mar 2023 08:55:24 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8C0A810E19D
 for <dri-devel@lists.freedesktop.org>; Mon,  6 Mar 2023 08:55:21 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id D9111B80D21
 for <dri-devel@lists.freedesktop.org>; Mon,  6 Mar 2023 08:55:19 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 8ECBCC4339B
 for <dri-devel@lists.freedesktop.org>; Mon,  6 Mar 2023 08:55:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1678092918;
 bh=A9+ojiqiHn7OfVUyHxZkqtvG13z1cJyETo8jPQWHfuw=;
 h=From:To:Subject:Date:In-Reply-To:References:From;
 b=JPfbxDmf9PSsEmvyO53qPsunvy7aBvw2qG7rCyJP4JaH77jFg1vxjZ4bw/NA8Ouv2
 x5nOQLgSCtwpXh3H19uMBFufSbF76ZVFhj0Wr0EHJnwyD+MQzI6Q+NlIMMWAJuBpkA
 XQKyfY+vc8/LIw7bBRK7Z3HFvJPc/jL1Nt3zSkkOAE4VJVFZnZou3FhbHqlAEHOX0Y
 jXpqGc0+utmEPpv5+vRQjl1mUIRPdjlq6V4UC11KSxK42pywpDQdwKAcnlY98ojWAJ
 ImzmzfuSNv8FdNem12QmsgMmRXRvhZxWXaMdw5X9xAUtd0/FSGXeTg/kWfJy/yJDaZ
 tL/VhzfzPhY6w==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix,
 from userid 48) id 70A0DC43144; Mon,  6 Mar 2023 08:55:18 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 217141] [amdgpu] ring gfx_0.0.0 timeout steam deck AMD APU
Date: Mon, 06 Mar 2023 08:55:18 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Video(DRI - non Intel)
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: high
X-Bugzilla-Who: regressions@leemhuis.info
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: cc
Message-ID: <bug-217141-2300-9fCUprXKGr@https.bugzilla.kernel.org/>
In-Reply-To: <bug-217141-2300@https.bugzilla.kernel.org/>
References: <bug-217141-2300@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D217141

The Linux kernel's regression tracker (Thorsten Leemhuis) (regressions@leem=
huis.info) changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
                 CC|                            |regressions@leemhuis.info

--- Comment #1 from The Linux kernel's regression tracker (Thorsten Leemhui=
s) (regressions@leemhuis.info) ---
Sorry for causing you trouble (note: I'm just the messenger here), but most=
 of
the core graphic driver developers (just like many other kernel developers)
don't really look in this bug tracker; you want to report the issue to the
following place instead, as that's where the developers of the driver in
question expect issues to be reported:
https://gitlab.freedesktop.org/drm/amd/-/issues

If you do so, it would be great if you could afterwards share the link to y=
our
report here.

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
