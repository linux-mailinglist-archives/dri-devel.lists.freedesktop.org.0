Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 64EC645E444
	for <lists+dri-devel@lfdr.de>; Fri, 26 Nov 2021 03:09:34 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9363A6E3EF;
	Fri, 26 Nov 2021 02:09:29 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C26A96E3EF
 for <dri-devel@lists.freedesktop.org>; Fri, 26 Nov 2021 02:09:28 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPS id 83EEA61165
 for <dri-devel@lists.freedesktop.org>; Fri, 26 Nov 2021 02:09:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1637892568;
 bh=aKOWWvTZQQHVT0n3+Xg7de2NkG9LrlAhJ/BBq9H+Tek=;
 h=From:To:Subject:Date:In-Reply-To:References:From;
 b=g7av9Wf6Ir9aK/OXRZuYdGiBqwXW69V8qtuTXttGuNL+esoyTDP/DAdexyHF/mJqx
 jTseCFQjeUsdog1kL8H1knfpdJ97TyGSMOkez22KdUc+7QMzgD2z2MGo/G509KwUpi
 o3fu1hcfTpIkDDogKFoa22DocNxUP5/0CgjTY3yczL90V+GebMrk5S8eqSJjgh3jzY
 Y0J3VjUkQtxkBrxGit6qfrnTyOmEPLa02dUqb7LzBbmqQSf9/lwTRTnCiv+4LuSe89
 qBoA24X9Q2Pvwb3C+z2Fc9x2501PWfbVzDFegJRXkJN3zKcWxxZkWCEvDylnxMqrZP
 XUo+Lv+1xvQNA==
Received: by pdx-korg-bugzilla-2.web.codeaurora.org (Postfix, from userid 48)
 id 8135D60F39; Fri, 26 Nov 2021 02:09:28 +0000 (UTC)
From: bugzilla-daemon@bugzilla.kernel.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 201957] amdgpu: ring gfx timeout
Date: Fri, 26 Nov 2021 02:09:26 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Video(DRI - non Intel)
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: blocking
X-Bugzilla-Who: aussir@tutanota.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: cc
Message-ID: <bug-201957-2300-J6IdjXmBJM@https.bugzilla.kernel.org/>
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

T. Noah (aussir@tutanota.com) changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
                 CC|                            |aussir@tutanota.com

--- Comment #50 from T. Noah (aussir@tutanota.com) ---
(In reply to i-am-not-a-robot from comment #48)
> This seems to be a firmware(-related) problem. After downgrading to linux
> firmware  2020-09-18, I'm running 6 days without a crash on the same work
> loads. (I was getting multiple crashes per day before).

Did you test any other versions? Was 09-18 the last working release?

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
