Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 5A9D4383C4B
	for <lists+dri-devel@lfdr.de>; Mon, 17 May 2021 20:31:38 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C708889B3B;
	Mon, 17 May 2021 18:31:34 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 97A8589B3B
 for <dri-devel@lists.freedesktop.org>; Mon, 17 May 2021 18:31:32 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPS id 35AD360FDA
 for <dri-devel@lists.freedesktop.org>; Mon, 17 May 2021 18:31:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1621276292;
 bh=BnhhI8yzDV+90XuOpsheNCijcY/dpSzCMqgWUeQbzVM=;
 h=From:To:Subject:Date:In-Reply-To:References:From;
 b=IIQMZYjB3PZLs5g0ZivLPg2Cvt915RxNBAl7KkPJ+e4oKHTjvyppf6qBbr45lvA7W
 Bq99ZzfyltJWsugAVvG3v02WVYy0tA9jxC8qeOWpiZVOiWoa/8vohNOM+NXbySkzxF
 qxpzUG++Amt1DN5y+mmutu/9/svxvY/0taJEGjujbT7kJPH2yri8Ctz5gzxLVZaRmT
 T/byd9YjOAmh2LadepGscQMYUzo3ghZfdNAo9V6nYF914oJ6Q1S26/3PU8c3mkXJ/m
 qffR2QEWImtWmRAF9ccRpmnO/neuMis/4jRjgS6Ef3yr/lt9QRV9lwWJKX3gSKiN7+
 Su3Yhxzamlh+Q==
Received: by pdx-korg-bugzilla-2.web.codeaurora.org (Postfix, from userid 48)
 id 29D4C611BE; Mon, 17 May 2021 18:31:32 +0000 (UTC)
From: bugzilla-daemon@bugzilla.kernel.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 212019] [drm:drm_atomic_helper_wait_for_flip_done
 [drm_kms_helper]] *ERROR* [CRTC:67:crtc-0] flip_done timed out
Date: Mon, 17 May 2021 18:31:31 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Video(DRI - non Intel)
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: bernie@codewiz.org
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: cc
Message-ID: <bug-212019-2300-IhXulIVZOW@https.bugzilla.kernel.org/>
In-Reply-To: <bug-212019-2300@https.bugzilla.kernel.org/>
References: <bug-212019-2300@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D212019

Bernie Innocenti (bernie@codewiz.org) changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
                 CC|                            |bernie@codewiz.org

--- Comment #2 from Bernie Innocenti (bernie@codewiz.org) ---
I'm seeing these also on i915 with kernel 5.11.20 (Fedora 34).

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
