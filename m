Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 68432482F7F
	for <lists+dri-devel@lfdr.de>; Mon,  3 Jan 2022 10:36:07 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2625310E204;
	Mon,  3 Jan 2022 09:36:01 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from ams.source.kernel.org (ams.source.kernel.org
 [IPv6:2604:1380:4601:e00::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4B49510E1D8
 for <dri-devel@lists.freedesktop.org>; Mon,  3 Jan 2022 09:35:59 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 92F62B80E61
 for <dri-devel@lists.freedesktop.org>; Mon,  3 Jan 2022 09:35:57 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 66D14C36AEF
 for <dri-devel@lists.freedesktop.org>; Mon,  3 Jan 2022 09:35:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1641202556;
 bh=qvUteTM0ZpQ1g/FsgB7rn17A0aAi5RbfI1sZ5BpV6FU=;
 h=From:To:Subject:Date:In-Reply-To:References:From;
 b=UFQtKCLsfMLArVMaC2aatgVP2vd5Vb+ezB/882iByCm8hp+vaCcVkpexgU/8+pGI0
 0R7neXku77p2/qN7eVlSWvbMz7sn5aRwYvlZum0xjzYVY8eFvEubtBhU1Mz93PiOJY
 VTQsu7xFdJ/M6LQL25Ih0Co54eq4DIHd1CZad59ttu+6EZDnvQY2E5tVtHi2oIYKg+
 nVs2hcFT6qD9Ub2soigixW6kKjhKQIBxeWeqsVgCLTmIBWbUDO5EhIM9SELAMnIhJj
 2GqnrVXWpKlQGZ1aJyfBtEdZACXQAVSu8Fmob8z3Eq/FQf+wIOGit6Fb6ntKBTuVmc
 hUfkK2w3JDyZQ==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix,
 from userid 48) id 4DF40C05FD8; Mon,  3 Jan 2022 09:35:56 +0000 (UTC)
From: bugzilla-daemon@bugzilla.kernel.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 215436] admgpu: suspend and resuming from suspend don't work
Date: Mon, 03 Jan 2022 09:35:56 +0000
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
Message-ID: <bug-215436-2300-bSClCJChWs@https.bugzilla.kernel.org/>
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

--- Comment #12 from spasswolf@web.de ---
Suspend works again if I ignore hpd_state in rn_update_clocks.
        // if (display_count =3D=3D 0 && !hpd_state) {
        if (display_count =3D=3D 0) {

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
