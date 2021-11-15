Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 587E544FCC1
	for <lists+dri-devel@lfdr.de>; Mon, 15 Nov 2021 02:39:16 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CB6D689C7F;
	Mon, 15 Nov 2021 01:39:11 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 72FF489C7F
 for <dri-devel@lists.freedesktop.org>; Mon, 15 Nov 2021 01:39:10 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPS id 33520611AE
 for <dri-devel@lists.freedesktop.org>; Mon, 15 Nov 2021 01:39:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1636940350;
 bh=qfyy6R0pS/wYWGCJ1CkI4eMT2VTCuyD5ia/orK+cXAQ=;
 h=From:To:Subject:Date:In-Reply-To:References:From;
 b=YoYGd6DlqTK+jiPVdwjObVOs71kTYPwN0AGpmtQLKXcAgOMrgO0b+AOkXtdIFO9F6
 SRTIYHw01/NI9HRATTP9Suptf+YEzpnyVdF2QuJRnxbXSJuoKBDI2VTEXG3nRoYY89
 nhUGH1uCMnAEv6McsRSv1SOglEhioPGIQnInDlo6bGJoqroRjHtCwi7KX+nhrbLN9D
 PXN0ovx9PDJNQ2JuaLUzh0eIZ2yzEAK24imn5s4NgrW13b6jIw/uXhH0aeiWPZvb+t
 wX0kIfyBA8plLksDvBVp+bhO9G3ePUkNgE/BQbK7z1/1eHiLCvfaFd6nQWFo6jz6m0
 dBT0b83eAW3cw==
Received: by pdx-korg-bugzilla-2.web.codeaurora.org (Postfix, from userid 48)
 id 3055960F54; Mon, 15 Nov 2021 01:39:10 +0000 (UTC)
From: bugzilla-daemon@bugzilla.kernel.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 211277] sometimes crash at s2ram-wake (Ryzen 3500U): amdgpu,
 drm, commit_tail, amdgpu_dm_atomic_commit_tail
Date: Mon, 15 Nov 2021 01:39:09 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Video(DRI - non Intel)
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: kolAflash@kolahilft.de
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-211277-2300-tVD2zOSW4o@https.bugzilla.kernel.org/>
In-Reply-To: <bug-211277-2300@https.bugzilla.kernel.org/>
References: <bug-211277-2300@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D211277

--- Comment #73 from kolAflash (kolAflash@kolahilft.de) ---
(In reply to Jerome C from comment #72)
> Hi James,
>=20
> I noticed the patch that you asked us to try from comment 52 were also
> submitted to kernel 5.14.7
>=20
> tested it, all is good for now

Pleased to hear that :-)
I'm just compiling 5.15.2 to run a test myself.

@James
Will those patches be backported to the Linux-5.10 LTS kernel?

master and Linux-5.15
https://git.kernel.org/pub/scm/linux/kernel/git/stable/linux.git/commit/?id=
=3Df02abeb0779700c308e661a412451b38962b8a0b
https://git.kernel.org/pub/scm/linux/kernel/git/stable/linux.git/commit/?id=
=3D8066008482e533e91934bee49765bf8b4a7c40db
https://git.kernel.org/pub/scm/linux/kernel/git/stable/linux.git/commit/?id=
=3Dfefc01f042f44ede373ee66773b8238dd8fdcb55

Linux-5.14.7
https://git.kernel.org/pub/scm/linux/kernel/git/stable/linux.git/commit/?id=
=3Dfe232886fb710a4bf0532f61ebdb87463a780e7e
https://git.kernel.org/pub/scm/linux/kernel/git/stable/linux.git/commit/?id=
=3D413a8644966a9b4709b114bdb102f64f505d57ef
https://git.kernel.org/pub/scm/linux/kernel/git/stable/linux.git/commit/?id=
=3D64ca7170c9b17042dc63828b56681aaea88ca38e

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
