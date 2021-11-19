Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DCDFB456F97
	for <lists+dri-devel@lfdr.de>; Fri, 19 Nov 2021 14:28:28 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 69AE16EA4E;
	Fri, 19 Nov 2021 13:28:25 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0E7976EA4E
 for <dri-devel@lists.freedesktop.org>; Fri, 19 Nov 2021 13:28:24 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPS id D712461AEC
 for <dri-devel@lists.freedesktop.org>; Fri, 19 Nov 2021 13:28:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1637328503;
 bh=D04vkLgkPfgWAnmpyEyygO3ZuAIw0UKpr+B3JfgqdEY=;
 h=From:To:Subject:Date:In-Reply-To:References:From;
 b=vJnVjNpiYES0ZLB88Qnj5BH9JZToC5MKZcwzcz2AP3BIOtaFY6vrXKmWPKDHUbqW+
 ekyoko8b1CpjiKxPFkNUZ4/u+JFVYHgXOQgjKPsle8gRnqbR1F5Pd1f+1qiZ+EAkOA
 mvP9Uro6hRiRJbRjD2Bx3Qj1egMVcwtT0AdwZJHZs1/XrV30oQl03rUSYhnzbScVba
 oaOGXZMnQ+boGBiOy+RsSxRcJvHF7+7tn7iGv/psv1MrvQXoayt8oesx2QCGvnu7+I
 /vx4JXC92fmDTh9RaYc7rpj4VZsy2ixJHus8Siz+ayBZUo3Xxc6Y9T1oKGbZAwfswf
 VOY84GIDqFaYQ==
Received: by pdx-korg-bugzilla-2.web.codeaurora.org (Postfix, from userid 48)
 id CEBE961004; Fri, 19 Nov 2021 13:28:23 +0000 (UTC)
From: bugzilla-daemon@bugzilla.kernel.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 213391] AMDGPU retries page fault with some specific processes
 amdgpu and sometimes followed [gfxhub0] retry page fault until *ERROR* ring
 gfx timeout, but soft recovered
Date: Fri, 19 Nov 2021 13:28:23 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Video(DRI - non Intel)
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: low
X-Bugzilla-Who: samy@lahfa.xyz
X-Bugzilla-Status: RESOLVED
X-Bugzilla-Resolution: UNREPRODUCIBLE
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: bug_status resolution
Message-ID: <bug-213391-2300-HqGJFnMTJ5@https.bugzilla.kernel.org/>
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

Lahfa Samy (samy@lahfa.xyz) changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
             Status|NEW                         |RESOLVED
         Resolution|---                         |UNREPRODUCIBLE

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
