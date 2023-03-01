Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 875836A698D
	for <lists+dri-devel@lfdr.de>; Wed,  1 Mar 2023 10:12:49 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C066E10E216;
	Wed,  1 Mar 2023 09:12:46 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 976D510E216
 for <dri-devel@lists.freedesktop.org>; Wed,  1 Mar 2023 09:12:44 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 1C1EBB80F62
 for <dri-devel@lists.freedesktop.org>; Wed,  1 Mar 2023 09:12:43 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id B85C9C433A1
 for <dri-devel@lists.freedesktop.org>; Wed,  1 Mar 2023 09:12:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1677661961;
 bh=T7RtkFPxP5e9oQ3IocBVzRb0IqRrqyta+ppYK1NYv6o=;
 h=From:To:Subject:Date:In-Reply-To:References:From;
 b=s/C7fCWBRuumuE/4vQi86RpXjcnvviIEldjb/FxgX/ia9IEYdek7x2v5bjaTx84di
 r1cq2xhxdm01FApH8eLOskU6QmXfdN6Nv91HyRtRmvnu9QWrJX42gjqzlzwK7CrKUm
 ur6PQ1aCDl8DEfKQOX4SnXT5HXeT6bCmagYroMUMtal272T1f+gugHd6W4PBjNlEdy
 78FBQ3mznOO2KmB9oP3D8gfYRqv1ssAqXxxRi/45vSgv72KHGf48AOk6sQffPKUnob
 /k8u0oFNmov7QrFIcmXmD8HTgdQHxA1Riy0xb5R7scOG3GzAF/YeMIB8hpQ4itz9Ig
 J/KtBgzhfsvxQ==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix,
 from userid 48) id 85D27C43144; Wed,  1 Mar 2023 09:12:41 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 217099] amdgpu driver errors after disconnecting a Lenovo T14
 (Gen1 AMD) from dock when the laptop is sleeping
Date: Wed, 01 Mar 2023 09:12:41 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Video(DRI - non Intel)
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: regressions@leemhuis.info
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: cc
Message-ID: <bug-217099-2300-qlLc8Ru3I0@https.bugzilla.kernel.org/>
In-Reply-To: <bug-217099-2300@https.bugzilla.kernel.org/>
References: <bug-217099-2300@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D217099

The Linux kernel's regression tracker (Thorsten Leemhuis) (regressions@leem=
huis.info) changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
                 CC|                            |regressions@leemhuis.info

--- Comment #1 from The Linux kernel's regression tracker (Thorsten Leemhui=
s) (regressions@leemhuis.info) ---
Sorry for causing you trouble, but the amdgpu developers (just like many ot=
her
kernel developers) don't really look in this bug tracker; you want to report
the issue here instead, as that's where they expect issues to be reported:
https://gitlab.freedesktop.org/drm/amd/-/issues

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
