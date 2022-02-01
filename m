Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 6CF034A5965
	for <lists+dri-devel@lfdr.de>; Tue,  1 Feb 2022 10:42:46 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A2D6A10E5D0;
	Tue,  1 Feb 2022 09:42:44 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DB95210E5D0
 for <dri-devel@lists.freedesktop.org>; Tue,  1 Feb 2022 09:42:42 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 9E834B82D3A
 for <dri-devel@lists.freedesktop.org>; Tue,  1 Feb 2022 09:42:41 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 563A0C340F0
 for <dri-devel@lists.freedesktop.org>; Tue,  1 Feb 2022 09:42:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1643708560;
 bh=tkxBeNSHl7t+hzQW0gGChoB6myjbcLdGW2ZSB1bh96w=;
 h=From:To:Subject:Date:In-Reply-To:References:From;
 b=Q9uf9TNd50Gfi727sUucuVAzucoVQu+ohtoqZWD2VKCBOVMqLT2j4NIhHe+y5ek1f
 Ic31Cie0h6el0KlHwQG4t2hBgKo1hJYYOnBLxCxrysVUoDGWeoz1CA/qqY/K0kHte1
 0BdwJoksiJNtmEGqe+hV0BODDAu3EcrDXa304cFDzL1LlZenObyqKvkNunGNE1XcX9
 hDzwFXj650OK+mQJ8Ruqb7bXNcN4tFj87weq6aj5AoEx5TQ9NTJprZ5rr0i4en+Dab
 iLy9wI3aIqWzHM3iozwthxSBDqyyn61Ec8plwihpsPVLCkehlVhnfngbdYBKOdvvY3
 4+sygTIo5pMhA==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix,
 from userid 48) id 40C59C05FCE; Tue,  1 Feb 2022 09:42:40 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 215511] Dual monitor with amd 5700 causes system to hang at
 startup.
Date: Tue, 01 Feb 2022 09:42:40 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Video(DRI - non Intel)
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: pmestre@gmail.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-215511-2300-LNRx7qr9EB@https.bugzilla.kernel.org/>
In-Reply-To: <bug-215511-2300@https.bugzilla.kernel.org/>
References: <bug-215511-2300@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D215511

--- Comment #2 from Jose Mestre (pmestre@gmail.com) ---
Hello. I've been unable to compile a specific kernel commit (i did not have=
 too
much time to find the docs about how to do it) and i don't know C.

I've tried releases for archlinux and i can confirm that linux 5.15.12 work=
ed
ok, and 5.15.13 was the first release that make kernel crash with the two
monitors switched on.

If you can point me how to do it i can bisect, compile and try the kernels.

Kind regards.

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
