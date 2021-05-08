Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C1BCD377379
	for <lists+dri-devel@lfdr.de>; Sat,  8 May 2021 19:49:11 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EBC566E0CA;
	Sat,  8 May 2021 17:49:07 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 39EA76E0CA
 for <dri-devel@lists.freedesktop.org>; Sat,  8 May 2021 17:49:07 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPS id E925E61424
 for <dri-devel@lists.freedesktop.org>; Sat,  8 May 2021 17:49:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1620496146;
 bh=MzObiDYjMDKt+MsN4WcedaRxt7hxomaxhx2Y26xhG8g=;
 h=From:To:Subject:Date:In-Reply-To:References:From;
 b=ghUh2kZQp1uz0Bhu3TPIfqP98mSwXAdBixEMNv2qGxDSgipck3+bvdJoR16b0n2Y0
 2X6AUrDdk0y52VyeoOoaAK5tSsNSyspg4BoJIxl/ADSr1fOu9+lhpt9224jOawqDSB
 ftvFg9mOVjTPbo/QvULMrFwRdwf24bk4vYwNhx1C/dqAuAbW5kQILgGjSY3uVWM5Cg
 Q5jx13YabtSBfKHiezsxCy1S+zQecLUpHnlDBX/uw7MRaDbuZ5tL5WnJ/yiseLjsP2
 wPH9cxn0BNz63Z6iT3E72Sgay3Oar9Oaq4oyXkVWE9zlO4f2gHAs+4jVqX4YZ6FAdN
 +bRruV1atdQmw==
Received: by pdx-korg-bugzilla-2.web.codeaurora.org (Postfix, from userid 48)
 id E5E0361056; Sat,  8 May 2021 17:49:06 +0000 (UTC)
From: bugzilla-daemon@bugzilla.kernel.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 51381] [drm:atom_op_jump] *ERROR* atombios stuck in loop for
 more than 5secs aborting, when disabled via vgaswitcheroo
Date: Sat, 08 May 2021 17:49:06 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Video(DRI - non Intel)
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: luminoso@gmail.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-51381-2300-iFlWKrc4c7@https.bugzilla.kernel.org/>
In-Reply-To: <bug-51381-2300@https.bugzilla.kernel.org/>
References: <bug-51381-2300@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D51381

--- Comment #57 from luminoso (luminoso@gmail.com) ---
For users still facing this issue, I workaround it with this:
https://github.com/aelveborn/vgaswitcheroo-systemd

Basically before suspending it restores the GPU powerstate and resumes it o=
nce
coming from a suspend state.

Never had problems again.

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
