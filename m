Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3D3886E15AA
	for <lists+dri-devel@lfdr.de>; Thu, 13 Apr 2023 22:11:30 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BE35310EC2B;
	Thu, 13 Apr 2023 20:11:25 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 71F0E10EC2B
 for <dri-devel@lists.freedesktop.org>; Thu, 13 Apr 2023 20:11:24 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 4ABA86418E
 for <dri-devel@lists.freedesktop.org>; Thu, 13 Apr 2023 20:11:22 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 67BF4C433D2
 for <dri-devel@lists.freedesktop.org>; Thu, 13 Apr 2023 20:11:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1681416681;
 bh=HF07nij8w3N7JOs53WHeJvig6gBkeJTTcnDc5s+CaoY=;
 h=From:To:Subject:Date:In-Reply-To:References:From;
 b=tmY/L633vrkJVGNudTwa8m1ECsHMcPh+QyKiynaNZmK87T94k5ceaprRmvd13woRJ
 0RACYWucuy/zyIE3+Na8HPGCGLgpUy/RoTIWtN+wQ1ZhYv1Z/0PDSAZ13/2F0OuSG/
 0Ct3oKfb7xEomKw2s+dbLdJe7wt7YmpD4PUoZBWKkQ6c7KDZCA3CLt8vob5bdgbob5
 45flRMYE4lvjptUgJPlPFE59FeSdaOuxM6YKVgpboSvarCo0hpILRRZVOgEhSA1zPW
 g1Bm6vk/I3X1ckY0SE6qxXs+Toj7mHdlSXtXtIn7Ag1RcrCj+gebS11Xc63qsSRKol
 ZY8e6vuVZsAvQ==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix,
 from userid 48) id 57321C43142; Thu, 13 Apr 2023 20:11:21 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 204241] amdgpu fails to resume from suspend
Date: Thu, 13 Apr 2023 20:11:20 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Video(DRI - non Intel)
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: tyrell.rutledge@icloud.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: cc
Message-ID: <bug-204241-2300-wSVAbJklHX@https.bugzilla.kernel.org/>
In-Reply-To: <bug-204241-2300@https.bugzilla.kernel.org/>
References: <bug-204241-2300@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D204241

TheRinger (tyrell.rutledge@icloud.com) changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
                 CC|                            |tyrell.rutledge@icloud.com

--- Comment #78 from TheRinger (tyrell.rutledge@icloud.com) ---
After this happened to me on Debian I started digging to find the source as=
 it
came with a payload which ultimately flashed my bios after flashing my wire=
less
card=E2=80=99s firmware. I found two files that were modified from the orig=
inal
installation which may have been injected as the source hash is different.
Researching further I=E2=80=99ve found some interesting comments about how =
this is done
by manipulating Systemd after resuming from hibernation, and pulling memory
back from the swap that was modified. The rabbit hole goes further as it th=
en
returns from sleeping after modifying the library=E2=80=99s that control fo=
nts and
their storage. You browse Google and your search=E2=80=99s contain websites=
 with web
fonts. In These fonts there is strange emojis and and symbols which at first
seem like poorly designed icons and graphic s but actually contain raw code
that is downloaded to your cache. At some point there is another part that =
goes
in and assembles these code blocks to copy your .home/user/.ssh files becau=
se
of weak user land file and directory attributes. Anyway this goes into on as
you can imagine how this only continues to work. When this happens or after=
 you
restart because the computer doesn=E2=80=99t return from sleep. You end up =
with
modifications to your bios, graphics, hard drive, firmware and anything else
that it can possibly find to stay present. Your gparted code will contain c=
ode
blocks that that swap out code from the end of your hard drive to the start.
You will need to start from scratch by clearing cmos then uploading new
firmware and zeroing out hard drives. It=E2=80=99s a huge headache. It may =
only get so
far and so you may never end up downloading the cached fonts or some other =
step
it needs and will think it=E2=80=99s just a glitch. Check your known hosts =
folder in
your ssh directory also compare hashes to original source code . I switched=
 to
Slackware despite enjoying the simplicity of package management years ago as
its appeal to me was it didn=E2=80=99t contain Systemd, recently I decided =
to try a
mainline distro again only to discover this gem.=20

The library files among others but notable only because the were in the
original initramfs were libfribidi.o and libgraphite2.so

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
