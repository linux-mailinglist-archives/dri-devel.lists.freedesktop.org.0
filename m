Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 6EBE74820FB
	for <lists+dri-devel@lfdr.de>; Fri, 31 Dec 2021 01:22:34 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4B81910EBCD;
	Fri, 31 Dec 2021 00:22:32 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7909D10EBCD
 for <dri-devel@lists.freedesktop.org>; Fri, 31 Dec 2021 00:22:31 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id E1C5461767
 for <dri-devel@lists.freedesktop.org>; Fri, 31 Dec 2021 00:22:30 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 5826CC36AE7
 for <dri-devel@lists.freedesktop.org>; Fri, 31 Dec 2021 00:22:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1640910150;
 bh=tah0gNmDcympPkvZ5zmdYyoKUzrQHdQOUb8c9x3UlkQ=;
 h=From:To:Subject:Date:In-Reply-To:References:From;
 b=MjUOHmJunV7NWa8Z6xYGkYNYAV8UnlGLtVrxupjphwUxb8OULaiXhkF+0jycxTZCj
 evCliOy6RNwojOqPrvfV1eLukjgjMOdHvNU5VVZVzaBIAqjBelH23nWi96Y/bFrPMC
 qMP04GBShb9w9aC9HWV0JWqx+GW88nRuAg2ZQcdE+dVUcGAOetzocdwZF3a/zduG0q
 M1ZN6D7qZTwKXAqhub2e1Idh0UeQG9dAh159Ed/OPGNrQfALapY5tHumBlRnCeZ6jA
 CPKjsffwo4dPO3hruARSSFn+iXE0VMpj7W9GlQsxRtmqH0yu59//cZSSZFZpfoco7Z
 ATN5734OflKQw==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix,
 from userid 48) id 3B108C05FC8; Fri, 31 Dec 2021 00:22:30 +0000 (UTC)
From: bugzilla-daemon@bugzilla.kernel.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 215436] admgpu: suspend and resuming from suspend don't work
Date: Fri, 31 Dec 2021 00:22:30 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Video(DRI - non Intel)
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: spasswolf@web.de
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-215436-2300-5GnJFsPNct@https.bugzilla.kernel.org/>
In-Reply-To: <bug-215436-2300@https.bugzilla.kernel.org/>
References: <bug-215436-2300@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D215436

--- Comment #7 from spasswolf@web.de ---
The
 [drm] Register(0) [mmUVD_POWER_STATUS] failed to reach value 0x00000001 !=
=3D
0x00000002
are still there, but they don't seem to be harmful, in fact they were there
even
 in linux.5.15.11 where suspend and resume seemed to work.

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
