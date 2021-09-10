Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5B228406CE6
	for <lists+dri-devel@lfdr.de>; Fri, 10 Sep 2021 15:29:34 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8C5A06E9F8;
	Fri, 10 Sep 2021 13:29:30 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8FCFF6E9F8
 for <dri-devel@lists.freedesktop.org>; Fri, 10 Sep 2021 13:29:29 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPS id 5B56E61205
 for <dri-devel@lists.freedesktop.org>; Fri, 10 Sep 2021 13:29:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1631280569;
 bh=T65yypDmT7Nyksv5UutaJ+qMAjOdY1vbT9hKGd90+QM=;
 h=From:To:Subject:Date:In-Reply-To:References:From;
 b=BaoeT58GJ15f6Nvn8cH52FYvqJUnZpXO5YbVDk41cUWcJEX+bKwCAn/UUlf30Vn8E
 649x+Iv0xzM1FXN9SFmrkS2nRvi37JGSTFffPRw83BuY+1jL6SOr4wKEUlzP0+RQLD
 4VAtXQs2V3JvxFDc+KaHYi4UcmzZi92XVSrmUIjpUy/lRYh0S6V5AzOZUrXnwyUvuJ
 mNUrWw0x4GQy1qi5rIoHPjlpuHDV1ZcrkFJ/TAVTDTOkffaOlDrpfqo8+dFNBKuoob
 RnwjSs5AQWkRHPQGdbMGLYiy110SN7nyWDIyhcAgdrSkf6fljEPfyNqBoCfBfEhcpp
 dM0xADWoGYuIA==
Received: by pdx-korg-bugzilla-2.web.codeaurora.org (Postfix, from userid 48)
 id 5742F610D0; Fri, 10 Sep 2021 13:29:29 +0000 (UTC)
From: bugzilla-daemon@bugzilla.kernel.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 213391] AMDGPU retries page fault with some specific processes
 amdgpu and sometimes followed [gfxhub0] retry page fault until *ERROR* ring
 gfx timeout, but soft recovered
Date: Fri, 10 Sep 2021 13:29:28 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Video(DRI - non Intel)
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: low
X-Bugzilla-Who: michel@daenzer.net
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-213391-2300-1CTzyFsHUL@https.bugzilla.kernel.org/>
In-Reply-To: <bug-213391-2300@https.bugzilla.kernel.org/>
References: <bug-213391-2300@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D213391

--- Comment #37 from Michel D=C3=A4nzer (michel@daenzer.net) ---
(In reply to Lahfa Samy from comment #36)
> Did anyone test whether this has been fixed in newer firmware updates, or
> should we still stay on version 20210315.3568f96-3 ?

It's fixed in upstream linux-firmware 20210818.

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
