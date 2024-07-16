Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8196C931EC8
	for <lists+dri-devel@lfdr.de>; Tue, 16 Jul 2024 04:23:05 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8DD4F10E0E4;
	Tue, 16 Jul 2024 02:23:02 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="nnYhkyGA";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sin.source.kernel.org (sin.source.kernel.org [145.40.73.55])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7AC7110E0E4
 for <dri-devel@lists.freedesktop.org>; Tue, 16 Jul 2024 02:23:01 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sin.source.kernel.org (Postfix) with ESMTP id 2A7FCCE108C
 for <dri-devel@lists.freedesktop.org>; Tue, 16 Jul 2024 02:22:59 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id D7036C4AF16
 for <dri-devel@lists.freedesktop.org>; Tue, 16 Jul 2024 02:22:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1721096577;
 bh=YSQxQy5qu7vNkr5u1mwRwWZRTvyyqx5v+3TCXg+Tqc0=;
 h=From:To:Subject:Date:In-Reply-To:References:From;
 b=nnYhkyGAhDLkSPCSv2e0EkSau6c13LD+kajIWq9i2yNJrhiPKKYeOOnQT/bzZ6IsA
 fLFjk92COp74W4t7qZSamWwEhQN9X32Blj1HmjGTdiFCka28lTC5i7VB0g+FqXR/vx
 0zqq7c+u1jRfjh9ppsxCWDs/CF7jGjvtz/wCo4YM4WVe22ihoJCwrw+Fv4HVyBscUJ
 UTyX182klLLbRvHvsjE8X1CH6tJxO79naikWmpN4plxCjIlsRqHyd5zjmJTHIaP26t
 Pl/v953ieMx9nzsMBEaBk7+OT9Ldc0bSf/OdQxJ//utH5OW6TjSdda2+K9rJ3N9r84
 CDEm6+CQHth9Q==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix,
 from userid 48) id D1C07C53BA7; Tue, 16 Jul 2024 02:22:57 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 201497] [amdgpu]: '*ERROR* No EDID read' is back in 4.19
Date: Tue, 16 Jul 2024 02:22:57 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Video(DRI - non Intel)
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: gabrielbarros+k@gmail.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: cc
Message-ID: <bug-201497-2300-agyBRWc66g@https.bugzilla.kernel.org/>
In-Reply-To: <bug-201497-2300@https.bugzilla.kernel.org/>
References: <bug-201497-2300@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D201497

gabriel barros (gabrielbarros+k@gmail.com) changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
                 CC|                            |gabrielbarros+k@gmail.com

--- Comment #29 from gabriel barros (gabrielbarros+k@gmail.com) ---
This bug doesn't have much trigger information. But i arrived here with a
completely different system than what is on the reports (6650U iGPU, with b=
oth
a DP monitor and a hdmi1.2 and 1.4 TVs). Reboot as mentioned in Comment 25
"solved" it.

The link on Comment 18 is dead, in case anyone want to share the kernel opt=
ions
here.

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
