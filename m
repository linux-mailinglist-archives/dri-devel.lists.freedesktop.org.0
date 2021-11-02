Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A71BB442B60
	for <lists+dri-devel@lfdr.de>; Tue,  2 Nov 2021 11:08:39 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 44A1D6E4DE;
	Tue,  2 Nov 2021 10:08:37 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5E0C76E2B8
 for <dri-devel@lists.freedesktop.org>; Tue,  2 Nov 2021 10:08:35 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPS id 382186023F
 for <dri-devel@lists.freedesktop.org>; Tue,  2 Nov 2021 10:08:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1635847715;
 bh=flqY5bMTGCZGWq++oceE/E4xlLtA8dQABz7u4LhjLHk=;
 h=From:To:Subject:Date:In-Reply-To:References:From;
 b=tbDZRiNrGVTC6wiC2xliAuVn/V+Pg8nZU3R5doN46KZr+CGrl6jODPnrrxRZEu73k
 esQiBLJy+SILDga3reOQ0qXn4Z3ipvRcNG4WecjfM50Ssd6Yr5f7FFpO/Yj/AyyHtX
 EzjXQh6qqN0Of991rwFWcIPBJ+taU3BP9FhMB2JxgkgvrhrL/zqopK04bSWvKZS7J9
 yXUWDmZXLoXCxSJoDguY83dHFgnPIayq71I7YC3n9oxY7XcNOJY/CFduwm4/rPa7cY
 exk4kqj2sVSYitgJoBu3oXw1CGNBcQbaEKdMxXl3taFq2bBHg8zJrdkx294V8P6DFQ
 fK6aWkGl0j9NQ==
Received: by pdx-korg-bugzilla-2.web.codeaurora.org (Postfix, from userid 48)
 id 2BF2B60F48; Tue,  2 Nov 2021 10:08:35 +0000 (UTC)
From: bugzilla-daemon@bugzilla.kernel.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 214901] amdgpu freezes HP laptop at start up
Date: Tue, 02 Nov 2021 10:08:34 +0000
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
Message-ID: <bug-214901-2300-Y1FjmIbld9@https.bugzilla.kernel.org/>
In-Reply-To: <bug-214901-2300@https.bugzilla.kernel.org/>
References: <bug-214901-2300@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D214901

--- Comment #5 from spasswolf@web.de ---
This commit leads to a freeze when starting
https://git.kernel.org/pub/scm/linux/kernel/git/stable/linux.git/commit/dri=
vers/gpu/drm/amd/amdgpu?id=3D714d9e4574d54596973ee3b0624ee4a16264d700
After reverting it the kernel 5.15 boots normally

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
