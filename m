Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id ED0FB459F4C
	for <lists+dri-devel@lfdr.de>; Tue, 23 Nov 2021 10:31:51 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0477A6EBA7;
	Tue, 23 Nov 2021 09:31:49 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D5CEB6EBA6
 for <dri-devel@lists.freedesktop.org>; Tue, 23 Nov 2021 09:31:47 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPS id B227761078
 for <dri-devel@lists.freedesktop.org>; Tue, 23 Nov 2021 09:31:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1637659907;
 bh=EV5HUEDi2cIESA7klg85tkkSLmQqTMTzgwAWD8QOjnM=;
 h=From:To:Subject:Date:In-Reply-To:References:From;
 b=ee+sLCdB9PHB1hzMuwNaRf7Oj49qg38/31rsrjsjIzMGA0vrRk46MCyDqgIHDt/N5
 U6AADSxnfTy2WAEQV0Y2PimB/uVxNbrGSexF+WniSs/bPbrNO82Thgj6GgunkhbABa
 txWmaP27RqFSv5f4EfSOkkzqda9dTxJLoXC2mvazbtYy0rI53c5xXgMD/p9iaKt8s9
 llFKhc6rkPsw02mQDCNmum175AyphbhRTCnJVg3n5JuSFYX7JgCAJjtVEaScVOuN0o
 GvA4RpQWhryiKIdOh9hVVJK3Rdd/6zRQegKPm02zhRxu3U4VOqEgmHvcltudLHZLas
 uEfhOlHLvofhQ==
Received: by pdx-korg-bugzilla-2.web.codeaurora.org (Postfix, from userid 48)
 id AE92160F5B; Tue, 23 Nov 2021 09:31:47 +0000 (UTC)
From: bugzilla-daemon@bugzilla.kernel.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 211277] sometimes crash at s2ram-wake (Ryzen 3500U): amdgpu,
 drm, commit_tail, amdgpu_dm_atomic_commit_tail
Date: Tue, 23 Nov 2021 09:31:47 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Video(DRI - non Intel)
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: kolAflash@kolahilft.de
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-211277-2300-7d1ua0lOig@https.bugzilla.kernel.org/>
In-Reply-To: <bug-211277-2300@https.bugzilla.kernel.org/>
References: <bug-211277-2300@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D211277

--- Comment #74 from kolAflash (kolAflash@kolahilft.de) ---
@James Zhu

Tested 5.15.2 for over a week and more than 50 standby-wakeups.
No problems!
Thanks :-)

I would be happy about a patch for the 5.10 longterm kernel.
The bug became a problem with v5.10-rc3 (see comment 14), just before Debian
made 5.10-longterm the Debian-11 kernel. So it would be great if I and prob=
ably
other Debian-11 users could finally use that AMD GPU without workarounds.

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
