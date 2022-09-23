Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A86CE5E7A47
	for <lists+dri-devel@lfdr.de>; Fri, 23 Sep 2022 14:13:15 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6913F10E916;
	Fri, 23 Sep 2022 12:13:09 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from ams.source.kernel.org (ams.source.kernel.org
 [IPv6:2604:1380:4601:e00::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3A69B10E916
 for <dri-devel@lists.freedesktop.org>; Fri, 23 Sep 2022 12:13:07 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id A0196B80768
 for <dri-devel@lists.freedesktop.org>; Fri, 23 Sep 2022 12:13:05 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 4EDE1C433C1
 for <dri-devel@lists.freedesktop.org>; Fri, 23 Sep 2022 12:13:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1663935184;
 bh=mlpWXz+YRJW1uCNw0m7lWtK79tYu70k8onLQGq9gNDw=;
 h=From:To:Subject:Date:In-Reply-To:References:From;
 b=XmU63HjxwuAjh0HKoXez+v1bZLTAfsgvnufU9tDYPG5SfZPlQxbYbZTIGWp4u/Mw5
 GxwuK26yb0FcihjT3g6tJvxkD/FqJ08D5/otA0KjXs2fo1hNhAh45YRc2zVunXNSn+
 sVsv7mL+DUa3AmjylW9/dA7Woy75SK/o8t3oTyCIx913y9orDbd6QEKxvMiCFl7sf7
 sJqHDXgHBcJgO9IaYN724yLiGT0tio1DYrNI1ooJhfNDK7WAoh4CWDtJbfgM/VK9tw
 7JX2etDgxffM9VBs5aqlXBDDryH85qhqX01bGVaKn+sU4eWSrn3Iur8lchFZLyWe8v
 i+f667EMo8izQ==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix,
 from userid 48) id 2F05BC433E7; Fri, 23 Sep 2022 12:13:04 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 216516] s2ram freezes screen (Ryzen-5650U incl. Radeon GPU)
Date: Fri, 23 Sep 2022 12:13:03 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Video(DRI - non Intel)
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: mario.limonciello@amd.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-216516-2300-umWiYcAvqP@https.bugzilla.kernel.org/>
In-Reply-To: <bug-216516-2300@https.bugzilla.kernel.org/>
References: <bug-216516-2300@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D216516

--- Comment #4 from Mario Limonciello (AMD) (mario.limonciello@amd.com) ---
> This "stays awake" behaviour is probably a bug on it's own.
> (I may may open another bug report when this one is solved)

This is actually the root of the problem I suspect. This might actually be
fixed by b8c824a869f220c6b46df724f85794349bafbf23.

> Mario, what's your opinion on this?=20

So to further complicate things 7123d39dc24d went back to stable and is in
5.15.y and such.

I think we need to better understand the failure mode and actions associate=
d.=20
The workaround in daf8de0874ab5b specifically helped with "aborted suspends=
".=20
7123d39dc24d fixed the behavior that regression that happened on more syste=
ms
as a result of that.

> Is there anything I can do to track this down further?

Here's a few things that would at least help me understand the situation:
1) Does this still exist in a fully unpatched 6.0-rc6? What's the behavior?
2) What bisect points did you use to conclude that this problem on that
particular commit?  By chance do you have the bisect log?
3) Why don't you just use s2idle instead in BIOS setup?  It's very mature o=
n a
modern kernel. Most systems with AMD APUs shipped from OEMs don't offer a
toggle even, which is why I'm surprised you have one.

BTW - I wasn't aware that they offered a BIOS setting for s2ram on 845.  Are
you patching the BIOS somehow or just changing a setting?  If you change it
back to s2idle does all this go away?

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
