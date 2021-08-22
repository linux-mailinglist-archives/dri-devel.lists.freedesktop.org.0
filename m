Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 6A08B3F415E
	for <lists+dri-devel@lfdr.de>; Sun, 22 Aug 2021 22:01:57 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 646BF89DB2;
	Sun, 22 Aug 2021 20:01:53 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A5E8F89DB2
 for <dri-devel@lists.freedesktop.org>; Sun, 22 Aug 2021 20:01:52 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPS id 6186B6137A
 for <dri-devel@lists.freedesktop.org>; Sun, 22 Aug 2021 20:01:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1629662512;
 bh=tdPg/yrmp4LTyG17BnImuDYv5qZ4hWRpemC7eJHD3Y0=;
 h=From:To:Subject:Date:In-Reply-To:References:From;
 b=jlJKu7O5W/1pMl7qQ9lw3Ks/WglfXQ7g3odSIf9ZrNKFYCLG05TWfFzq1uWcG/X5A
 S03NmGIablry2of1gCU6vW0aolULP/Xj9h4WCvm1vpu3BxVlkXI2eQSLLG7s22snzc
 umQdO42UMJibJxjBkjSVP9psiWuUHAOf2mhnxW/fsGIUdU+uU/fKHKyUl27kC98bW4
 bVCorH38CqO33s0IHhIHWh0XKge95ugf9aznZKwn2ljRlVf2l9+5/Oobdt+Gu4oZvx
 Y+89Ei857ku45nRRiMZJm80kLY0yRY0fSyb2H9bVuU8IFgUwCGiLd1KAqyO8UuBCHX
 z6zmWDmtgEbuQ==
Received: by pdx-korg-bugzilla-2.web.codeaurora.org (Postfix, from userid 48)
 id 58A4160F93; Sun, 22 Aug 2021 20:01:52 +0000 (UTC)
From: bugzilla-daemon@bugzilla.kernel.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 201957] amdgpu: ring gfx timeout
Date: Sun, 22 Aug 2021 20:01:50 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Video(DRI - non Intel)
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: blocking
X-Bugzilla-Who: i-am-not-a-robot@riseup.net
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-201957-2300-kRXn66exJW@https.bugzilla.kernel.org/>
In-Reply-To: <bug-201957-2300@https.bugzilla.kernel.org/>
References: <bug-201957-2300@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D201957

--- Comment #48 from i-am-not-a-robot@riseup.net ---
This seems to be a firmware(-related) problem. After downgrading to linux
firmware  2020-09-18, I'm running 6 days without a crash on the same work
loads. (I was getting multiple crashes per day before).

My GPU is Vega8 Mobile (ThinkPad A485). Currently running 5.13.11.

An extensive discussion of different firmware versions in the context of a
similar issue on Arch Forums:
https://bbs.archlinux.org/viewtopic.php?id=3D266358&p=3D5

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
