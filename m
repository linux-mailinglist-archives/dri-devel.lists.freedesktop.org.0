Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BA3313AD9EF
	for <lists+dri-devel@lfdr.de>; Sat, 19 Jun 2021 14:15:57 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 550D96EAD9;
	Sat, 19 Jun 2021 12:15:53 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 569EE6EAD9
 for <dri-devel@lists.freedesktop.org>; Sat, 19 Jun 2021 12:15:52 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPS id 0B19C611ED
 for <dri-devel@lists.freedesktop.org>; Sat, 19 Jun 2021 12:15:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1624104952;
 bh=jwYBj2j/8wRb3ORQPk774oAgQmx8uVgWwfoxxF0pbxg=;
 h=From:To:Subject:Date:In-Reply-To:References:From;
 b=Gjs4o8t2BLvfNxN2utLXhpWs38QvW2TAdREvgOICfzocNujg7M0OFi6OS9b2BsYNe
 A4inhgNPhnSZLiNmvZTzeWQjzTVsy0rGmmt7qstwqJSaPAY1408yWFiDbUIw6SVhSL
 LEHhUWxvRYEcAm2V0fE4LZRtWrCAVG773fE73dIDjgR3JG8YYM91tlMuJ6hBNwXq9i
 c4tvQVbxQMwYGKzTfZ3lnGYaLCZflAAcr8FCbDXyf2ba9An76m5I1aLGLNQ2N8RYSq
 ZBOWR0E0szf83ouqK6aYm4DJl/x8hRO3/2DDO0sIZxMZUD756Ew5q7M17LyvGXYNO/
 R/fNsLSmH7zZw==
Received: by pdx-korg-bugzilla-2.web.codeaurora.org (Postfix, from userid 48)
 id 07CD7611CB; Sat, 19 Jun 2021 12:15:52 +0000 (UTC)
From: bugzilla-daemon@bugzilla.kernel.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 213391] AMDGPU retries page fault with some specific processes
 amdgpu and sometimes followed [gfxhub0] retry page fault until *ERROR* ring
 gfx timeout, but soft recovered
Date: Sat, 19 Jun 2021 12:15:51 +0000
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
Message-ID: <bug-213391-2300-S093VePU4q@https.bugzilla.kernel.org/>
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

--- Comment #20 from Michel D=C3=A4nzer (michel@daenzer.net) ---
(In reply to dimitris from comment #19)
> Question, don't I also need to update the initrd?

Yes you do, if it didn't happen automatically.

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
