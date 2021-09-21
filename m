Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2FA9A413967
	for <lists+dri-devel@lfdr.de>; Tue, 21 Sep 2021 20:02:07 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 598E489F01;
	Tue, 21 Sep 2021 18:02:04 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1F95789F01
 for <dri-devel@lists.freedesktop.org>; Tue, 21 Sep 2021 18:02:03 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPS id E70AF61278
 for <dri-devel@lists.freedesktop.org>; Tue, 21 Sep 2021 18:02:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1632247322;
 bh=HFHksbVbqnYmITYAocyC3vZ1eemGDAntP+c2acpqA/c=;
 h=From:To:Subject:Date:In-Reply-To:References:From;
 b=RAlguJkrfv7DQPSh4xV5K6KqgA+Bq5sdSs7tU9s2OkvScxwxLMgXBrS8KuDEUS1Yj
 DdeeXNbouyeAkwoUzgVk0XIYI9PHb8W/4WCrjf9zVr9km+IKtPANScQNol2fstjMH9
 EwAH4rtF6k2SAkBnAfBkk7bg+0hhUgNwryGmvDKH0HeXX1rpRLqLnSFvadfd47y9tH
 bZBZ2kG0313+ghFFhnVbVaEEfZGTcZMfb9RRiau38pz7NF+CoMDRFYIckP+5Bo93VX
 DoENYQb9pLa+cqHClRBpiChfzHtK3FgXvwcRC7U5upm+N3jJzOxTNUNGmP52VEoRlY
 JAc/2Pl8jIQEg==
Received: by pdx-korg-bugzilla-2.web.codeaurora.org (Postfix, from userid 48)
 id E3AE760F53; Tue, 21 Sep 2021 18:02:02 +0000 (UTC)
From: bugzilla-daemon@bugzilla.kernel.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 211277] sometimes crash at s2ram-wake (Ryzen 3500U): amdgpu,
 drm, commit_tail, amdgpu_dm_atomic_commit_tail
Date: Tue, 21 Sep 2021 18:02:02 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Video(DRI - non Intel)
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: jamesz@amd.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-211277-2300-eYtblejAUh@https.bugzilla.kernel.org/>
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

--- Comment #70 from James Zhu (jamesz@amd.com) ---
My mistaake. Can you try add pci=3Dnoats in boot parameters?

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
