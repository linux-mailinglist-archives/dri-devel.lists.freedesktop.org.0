Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 2814140985F
	for <lists+dri-devel@lfdr.de>; Mon, 13 Sep 2021 18:07:14 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A48CB6E0E6;
	Mon, 13 Sep 2021 16:07:11 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B86996E0E6
 for <dri-devel@lists.freedesktop.org>; Mon, 13 Sep 2021 16:07:10 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPS id 8D2A960F9B
 for <dri-devel@lists.freedesktop.org>; Mon, 13 Sep 2021 16:07:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1631549230;
 bh=PdDY9PfYNVdw0XuW0I9DqO32lIzXkL4iNSyMJBgz9Os=;
 h=From:To:Subject:Date:In-Reply-To:References:From;
 b=GTkcBH0arZndrKb4dLm4J/xfwMMuCVU4pcdgn0wafGIYo1D4/0JqxJhAejBF9UqDU
 P+tGZe2H+xMs6aYP7wtXR/NLR8Q8aJdIEbccghJsUefJEERuapN+6te/JT5B6Ophk2
 tfWu/dQmzm8ajXVLbR+urDRRl/By7ez6BFfXt2WlnNh/DcC1hcHH09H6vFkNThKOCL
 /4tbfi5DogYpk4njifl7m2983vMb35f31iHK20eRkolg/XO3YNYcIUvDow/BGYfFMe
 EUsvyyOjWekApfoM+JS/cCqqTwM1DqcWPvkrTENr2fOSuRP/bQTe9wDOjm9IjFXiLU
 +al7PDsDhkbyw==
Received: by pdx-korg-bugzilla-2.web.codeaurora.org (Postfix, from userid 48)
 id 8578760F59; Mon, 13 Sep 2021 16:07:10 +0000 (UTC)
From: bugzilla-daemon@bugzilla.kernel.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 211425] [drm:atom_op_jump] *ERROR* atombios stuck in loop for
 more than 20secs aborting
Date: Mon, 13 Sep 2021 16:07:10 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Video(DRI - non Intel)
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: icedragon.aw@web.de
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: cf_kernel_version bug_severity
Message-ID: <bug-211425-2300-1djMq75cqh@https.bugzilla.kernel.org/>
In-Reply-To: <bug-211425-2300@https.bugzilla.kernel.org/>
References: <bug-211425-2300@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D211425

Andreas (icedragon.aw@web.de) changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
     Kernel Version|5.13.13                     |5.14.3
           Severity|high                        |normal

--- Comment #20 from Andreas (icedragon.aw@web.de) ---
With 5.14.x the issue in general still persists, but I was not able again to
observe the hard crash without recovering (good) -- the screen keeps black =
for
only 2x20 sec with the typical error messages (e.g. above in comment 16) and
recovers. So I changed back the importance state in the header back to norm=
al.

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
