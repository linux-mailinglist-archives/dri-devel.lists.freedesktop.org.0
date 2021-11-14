Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 8773B44F734
	for <lists+dri-devel@lfdr.de>; Sun, 14 Nov 2021 09:11:28 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D64116E3F0;
	Sun, 14 Nov 2021 08:11:23 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EC4FD6E3F0
 for <dri-devel@lists.freedesktop.org>; Sun, 14 Nov 2021 08:11:22 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPS id B31E060F70
 for <dri-devel@lists.freedesktop.org>; Sun, 14 Nov 2021 08:11:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1636877480;
 bh=CuwKVS071p2TaaiJHMpW3mw0tMcBIvP8qJFa44R+XlY=;
 h=From:To:Subject:Date:In-Reply-To:References:From;
 b=HPSobwMO2I6Msm/Bjtwwil6py4AA8DyifTYNpAHcP//l+1csZnM6HeoVAB6uxZAP2
 HAvbaNlMZnp9jYXfYGM8MZGuFtyLF0yOgvpaX/YgkgW+PwM5PO4kfF4TLt/+9qq2M7
 wZR+5XrGxanYq3iixu3IQSJY8ht4ggQQ7g5uzXKOO/D5mYQWAJnEMCvK0QE2nEM7l+
 stck28v28UtYuFtBZ3gjpNSrymAQuMKvQm3p1Fu/6PlNKzuFKiLkUlj10kmP6uKwG1
 IZjSNf37F+/fodc2UuEC8t6EkgbBTQM8PSlG2jumhWIYU/TOYOhVRwP0xgtX1oSO2H
 JyzwxdR40+JlA==
Received: by pdx-korg-bugzilla-2.web.codeaurora.org (Postfix, from userid 48)
 id A63AA60EBB; Sun, 14 Nov 2021 08:11:20 +0000 (UTC)
From: bugzilla-daemon@bugzilla.kernel.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 215003] apple_gmux fails to initialize and iGPU unclaimed on
 MacBook Pro 16" 2019
Date: Sun, 14 Nov 2021 08:11:20 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Video(DRI - non Intel)
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: dreifachstein@gmail.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-215003-2300-qkDSJWYUYd@https.bugzilla.kernel.org/>
In-Reply-To: <bug-215003-2300@https.bugzilla.kernel.org/>
References: <bug-215003-2300@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D215003

--- Comment #6 from Xiaolei Yu (dreifachstein@gmail.com) ---
(In reply to Lukas Wunner from comment #5)
> Hm, why are runtime services disabled? Are you using "noefi" or
> "efi=3Dnoruntime" on the command line or is this perhaps an RT kernel? Co=
uld
> you attach full dmesg output?
>=20

EFI runtime service is disabled after a firmware page fault during boot. I
pasted the trace in #4.

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
