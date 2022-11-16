Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C284662C0F2
	for <lists+dri-devel@lfdr.de>; Wed, 16 Nov 2022 15:33:29 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0B45710E4B1;
	Wed, 16 Nov 2022 14:33:22 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D149C10E4B1
 for <dri-devel@lists.freedesktop.org>; Wed, 16 Nov 2022 14:33:17 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 3163961E08
 for <dri-devel@lists.freedesktop.org>; Wed, 16 Nov 2022 14:33:17 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 99DDBC433C1
 for <dri-devel@lists.freedesktop.org>; Wed, 16 Nov 2022 14:33:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1668609196;
 bh=z19cOLOKy+4Q2qpExO6Q+5v8yBYfV1wueWKkl9eooHk=;
 h=From:To:Subject:Date:In-Reply-To:References:From;
 b=ZnzKMn5Jn96++3OOgUy3T4dcgrQkxgiYJmaclONSz7NZ+lwaIO5+OMX/NZ5inILJz
 Uque5e73lWhARHxE6rx+u9hCIx+aGw1o3v9iur7LHNf6aBwpnJsH/xg+2pzTteKyay
 yzQK4/FeX7kiQ706494bMwmwDQmYlqViyx/uSS5JiBWXa2skdaTMk3YaToDoPTGq0A
 7dNtO0d+KjQmWEWi28BonASm72OMffxN2XARmMzMZSsKbGVRs3BofPu+UQH9G52V10
 Va9/su+1HxBwk8v9zxJuQxLt2oXeUwLW/QT9GXhNACoI5NJQRLiQWLX7BDTmuj3saU
 UR8GcYE6kcMhg==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix,
 from userid 48) id 7FEADC433E9; Wed, 16 Nov 2022 14:33:16 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 216624] The system freezes when it reaches the screen to ask
 password for LUKS
Date: Wed, 16 Nov 2022 14:33:16 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Video(DRI - non Intel)
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: blocking
X-Bugzilla-Who: regressions@leemhuis.info
X-Bugzilla-Status: NEEDINFO
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-216624-2300-gCnGboKMdz@https.bugzilla.kernel.org/>
In-Reply-To: <bug-216624-2300@https.bugzilla.kernel.org/>
References: <bug-216624-2300@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D216624

--- Comment #13 from The Linux kernel's regression tracker (Thorsten Leemhu=
is) (regressions@leemhuis.info) ---
FWIW, the nouveau developers might not see this report here, they want bugs
filed here:
https://gitlab.freedesktop.org/drm/nouveau/-/issues

I'd suggest you file it there and make it obvious that's a regression betwe=
en
5.19.15 and 5.19.16 (it isn isn't it?) that continues to exist with 6.0

A bisection would be ideal to find the cause, but with a bit of luck the
nouveau developers have a idea what might be wrong.

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
