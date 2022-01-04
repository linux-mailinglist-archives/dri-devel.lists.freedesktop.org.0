Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C856F48431E
	for <lists+dri-devel@lfdr.de>; Tue,  4 Jan 2022 15:14:27 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2EE2F10E545;
	Tue,  4 Jan 2022 14:14:24 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9C7A489B3B
 for <dri-devel@lists.freedesktop.org>; Tue,  4 Jan 2022 14:14:22 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 0CC10B81616
 for <dri-devel@lists.freedesktop.org>; Tue,  4 Jan 2022 14:14:16 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id D8922C36AF2
 for <dri-devel@lists.freedesktop.org>; Tue,  4 Jan 2022 14:14:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1641305654;
 bh=/NBqqtoKn8JonVrNh3soRZN4vGmg1nxDNRyxegWqWi0=;
 h=From:To:Subject:Date:In-Reply-To:References:From;
 b=KvyohXbC6JZ/lD80SYuYHSKWaggHegQM6g8kvVWpvwFjyeBX1ghA11BTazDfLIwko
 XCohO5TEr9yyrNFNcibhOaavgtqVCdLE2nSO75SRR4ix67lvDGuiuoEHc3j7F4MrXp
 eAt0VrBJqDpEf/W2zYJ22uyogsnMY7wPgCuw1VPdahIhSXyREBiFGZBCNNSPqAJnQO
 cH6BEuKSQ/3Miz8eNa4auvirHamKC6tlq/3Po8cCsuHf0ePbOrrPcRuQ7HRxeSry25
 S5TfsClhsPT0mFt4+HucXGvlVJhpn+wq0SNMXjGFzll0K+othoOLFQdl5+D1mZAF0T
 f0adJz+DoNRcA==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix,
 from userid 48) id C3064C05FCE; Tue,  4 Jan 2022 14:14:14 +0000 (UTC)
From: bugzilla-daemon@bugzilla.kernel.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 215436] admgpu: suspend and resuming from suspend don't work
Date: Tue, 04 Jan 2022 14:14:14 +0000
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
Message-ID: <bug-215436-2300-2gbixlN8KS@https.bugzilla.kernel.org/>
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

--- Comment #23 from mario.limonciello@amd.com ---
Did you try out my patch?  It should have given an extra explicit call in t=
he
suspend path.

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
