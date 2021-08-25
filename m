Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 95E193F74B0
	for <lists+dri-devel@lfdr.de>; Wed, 25 Aug 2021 14:00:24 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 510DE6E1CF;
	Wed, 25 Aug 2021 12:00:22 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 589856E1CF
 for <dri-devel@lists.freedesktop.org>; Wed, 25 Aug 2021 12:00:21 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPS id 2D7C8611C9
 for <dri-devel@lists.freedesktop.org>; Wed, 25 Aug 2021 12:00:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1629892821;
 bh=FnPKFsoG9FG8Tm9JHM/a/qdvrqGvCWu43QLA8jd2xrg=;
 h=From:To:Subject:Date:In-Reply-To:References:From;
 b=ALZCZxaugSR6jx9r5l6kYcJFhMBxkkdMqv5fHP8LNYK6GkuCMlZMWAz6i8kBdgGeX
 yz7KWfsgD5PK2C8GEdL5iDOuEOp5F7xrGNTZBL466GCPIcqQ4KYTo2fodp5mbEdwgo
 PBLcaC4AMLll38NIdCJziCUWBa2PdZwSiw71u1JYrOMF6Xf6CpgPnEyPOUxzz1l4LT
 CU0ScnYNwWk3v9fxJmiaGEGCne4aGZeFWLzAtqvxQsMwmNnadY0auq5u7XulFdRPZV
 KiqfT/Fdpomypz1sq2zQtSIX9NwveF1aKy1RnMjPb5H4ik3aCPrFLnq73I7DCIUVxy
 BBGUsn/Qs8G7g==
Received: by pdx-korg-bugzilla-2.web.codeaurora.org (Postfix, from userid 48)
 id 2B17661001; Wed, 25 Aug 2021 12:00:21 +0000 (UTC)
From: bugzilla-daemon@bugzilla.kernel.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 211277] sometimes crash at s2ram-wake (Ryzen 3500U): amdgpu,
 drm, commit_tail, amdgpu_dm_atomic_commit_tail
Date: Wed, 25 Aug 2021 12:00:20 +0000
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
Message-ID: <bug-211277-2300-oXmTuVBlY4@https.bugzilla.kernel.org/>
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

--- Comment #37 from James Zhu (jamesz@amd.com) ---
HiJerome and kolAflash,=20
would you mind base on your original test configuration,and add pci=3Dnoats=
 in
boot parameter? for example:=20
linux   /boot/vmlinuz-5.4.0-54-generic
root=3DUUID=3D803844cc-7291-4056-bd04-f1b43b54ed97 ro  pci=3Dnoats
see if this helps.
Thanks!
James

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
