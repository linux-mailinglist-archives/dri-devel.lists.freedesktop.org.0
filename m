Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5BF9D6593D2
	for <lists+dri-devel@lfdr.de>; Fri, 30 Dec 2022 01:29:05 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D7FDB10E037;
	Fri, 30 Dec 2022 00:28:59 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5B60E10E037
 for <dri-devel@lists.freedesktop.org>; Fri, 30 Dec 2022 00:28:57 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 9FD73619D2
 for <dri-devel@lists.freedesktop.org>; Fri, 30 Dec 2022 00:28:56 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 07030C433F0
 for <dri-devel@lists.freedesktop.org>; Fri, 30 Dec 2022 00:28:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1672360136;
 bh=P+RcgNcOM9DYo0ZRIvl+nMZPZWQe+eZnLROw6DlYdJA=;
 h=From:To:Subject:Date:In-Reply-To:References:From;
 b=rh4IeCLRokyNsKC9DBHLxDv/nJFf3QE9NCHmoEg58M4DoyL5DiTot0FtbW6gqWNhD
 TW+1dS4zYjgxjz/M9UAdyCAxWma92r8fBTQrh8CG+RU47ZZGbA3TMOWnX04PgHNXmc
 11NYJgx8L3Ukz5NQAlAT++Z0iaZwQHZbIKzfwu/J+FybArrkE1clOX4O+XCzhquRq+
 R52vxQxaNZVCRpFileEXb0R1E91clpHb4Y/M2cwnXOA0Ecdl/S6opAQ6JwdT8dC9Yi
 VGnLhXAbPAz1mKMyqvOC0Ihy6ZnYM6TqQdm0ueLmcBPNXcbqI3c7QASOfmjoZehNN4
 9tX+8e6bMLWaw==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix,
 from userid 48) id DFB07C43144; Fri, 30 Dec 2022 00:28:55 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 216840] AMDGPU trace message at boot
Date: Fri, 30 Dec 2022 00:28:55 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Video(DRI - non Intel)
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: low
X-Bugzilla-Who: carlosalvatore@gmail.com
X-Bugzilla-Status: RESOLVED
X-Bugzilla-Resolution: ANSWERED
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-216840-2300-EzSxjI6LoG@https.bugzilla.kernel.org/>
In-Reply-To: <bug-216840-2300@https.bugzilla.kernel.org/>
References: <bug-216840-2300@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D216840

--- Comment #3 from Salvador P=C3=A9rez (carlosalvatore@gmail.com) ---
Hi, Alex,=20

I am afraid that not setting amdgpu.vm_update_mode=3D3 is not an option. If=
 I try
to play Cities Skylines (linux native version), the game goes 1 fps and the
system is extremely sluggish. I need to switch to vt1 in order to regain
control and be able to reboot.

As far as I know, amdgpu.dpm=3D-1 (auto) is the default. However, I don't
remember why I set to 1 manually, I have to test.

HDMI port seems to be dead (or disabled), I cannot even see the BIOS screen=
, so
it is not a kernel issue.

Regards.

--
CarloSalvatore

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
