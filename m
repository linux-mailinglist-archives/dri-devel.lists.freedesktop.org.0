Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 8CCEF7D21A6
	for <lists+dri-devel@lfdr.de>; Sun, 22 Oct 2023 09:42:12 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 11C5510E053;
	Sun, 22 Oct 2023 07:42:10 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sin.source.kernel.org (sin.source.kernel.org [145.40.73.55])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 40B9510E053
 for <dri-devel@lists.freedesktop.org>; Sun, 22 Oct 2023 07:42:08 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sin.source.kernel.org (Postfix) with ESMTP id 578FFCE1A5C
 for <dri-devel@lists.freedesktop.org>; Sun, 22 Oct 2023 07:42:05 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 929C8C433CA
 for <dri-devel@lists.freedesktop.org>; Sun, 22 Oct 2023 07:42:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1697960524;
 bh=V0SywhnUiv4jjR3G5uQrfT87vu5Dsm7zJOwk8uswd00=;
 h=From:To:Subject:Date:In-Reply-To:References:From;
 b=CcwnyjjXkf+LmP/fQaLnWw2MRgsyvp/3t+ag/jDCTaH+Icz2LMmHU7GEsrHz0FvsU
 Nwapomq7KsQH4N8uSuSeZ0Bp/2zk+FbZ0w8uC54mIM6NqUjqYRPhFlyE6gHcWZjfjB
 VugZud4GPWiaTu1MBBqDrsMekoB1864QmEsfvC0xDHYbX7RxalIQYkUyO+TbU/ovVM
 G3NtR3tJs5cpASDoaY3Rr0+MNDY1kKyd6RYPrl3WWCKH6qzZ/lw5gwYVGeXIbhAiLP
 rywol5eRUSneikwy1b9tBlHo+w4Ivj+BAKDjtU5yyNh4q+MZNf3beeKszFJ6vKQMqs
 r1fttXyKAITPg==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix,
 from userid 48) id 83812C53BD3; Sun, 22 Oct 2023 07:42:04 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 218015] amdgpu powerplay: Spontaneous changes to
 power_dpm_force_performance_level
Date: Sun, 22 Oct 2023 07:42:04 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Video(DRI - non Intel)
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: high
X-Bugzilla-Who: roman.zilka@gmail.com
X-Bugzilla-Status: RESOLVED
X-Bugzilla-Resolution: ANSWERED
X-Bugzilla-Priority: P3
X-Bugzilla-Assigned-To: drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: bug_file_loc
Message-ID: <bug-218015-2300-KjzWnnEoS7@https.bugzilla.kernel.org/>
In-Reply-To: <bug-218015-2300@https.bugzilla.kernel.org/>
References: <bug-218015-2300@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D218015

Roman =C5=BDilka (roman.zilka@gmail.com) changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
                URL|                            |https://gitlab.freedesktop.
                   |                            |org/drm/amd/-/issues/2931

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
