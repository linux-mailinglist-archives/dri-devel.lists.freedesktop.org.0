Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 05756547184
	for <lists+dri-devel@lfdr.de>; Sat, 11 Jun 2022 05:10:04 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9E228113F2E;
	Sat, 11 Jun 2022 03:10:00 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4883F113F2D
 for <dri-devel@lists.freedesktop.org>; Sat, 11 Jun 2022 03:09:59 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 68428B83533
 for <dri-devel@lists.freedesktop.org>; Sat, 11 Jun 2022 03:09:55 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 39D44C341C0
 for <dri-devel@lists.freedesktop.org>; Sat, 11 Jun 2022 03:09:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1654916994;
 bh=9vU7KAtBxJlKMMBXBeLaJDV5RK2ptfn6LkpsFyifja0=;
 h=From:To:Subject:Date:In-Reply-To:References:From;
 b=PEf+CMSkUxANeGx5KkBbadO/wmq0EGhPtrIs44wsMJ8FQCfR/KCphroolmV+lcJ1K
 Z9gHvQb4yBe1IDX4KbDtd4y6HAfVDx35WLqcqNWv7Ir6Q6RwgpAPSxUTjfSSd8vxtQ
 tIJBjhjmAhy3gPv9/fw8OB3JRRkXVzsXgGQrAjy/wTpzwhBq4nazxshcuwOrCVqzUS
 BoIvlgiXNJmYtpa5Qmmhidey1xBTnH2qfKWhsg4fwTQ0nwIHOje0gP9UG70KQdG5x/
 K9oEZZhP+iD2umqRQf3+b3HWR2xSLj61F9l2jhHRyEowUKFe5fdJDDSPQPt8YOTBFB
 My0XmFThsT6NQ==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix,
 from userid 48) id 1FE0FCC13B1; Sat, 11 Jun 2022 03:09:54 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 210301] *ERROR* IB test failed on gfx (-110) on Ryzen 4750u
Date: Sat, 11 Jun 2022 03:09:53 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Video(DRI - non Intel)
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: me@ramast.me
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-210301-2300-HyyVkuaTDU@https.bugzilla.kernel.org/>
In-Reply-To: <bug-210301-2300@https.bugzilla.kernel.org/>
References: <bug-210301-2300@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D210301

--- Comment #4 from ramast (me@ramast.me) ---
After more log review it seems I had two problems:
One related to have two graphics card and that's the one resulting in the
"amdgpu_ib_ring_tests" error

https://pastebin.com/Eu7PF3en

Then after disabling the Dedicated graphics card, I got the error in my
previous comment. After removing iommu_v2 I am finally error free.

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
