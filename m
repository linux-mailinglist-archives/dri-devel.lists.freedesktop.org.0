Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 3CD3F799EC6
	for <lists+dri-devel@lfdr.de>; Sun, 10 Sep 2023 17:15:48 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2D4DA10E169;
	Sun, 10 Sep 2023 15:15:44 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B615810E169
 for <dri-devel@lists.freedesktop.org>; Sun, 10 Sep 2023 15:15:41 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 064BDB80AB9
 for <dri-devel@lists.freedesktop.org>; Sun, 10 Sep 2023 15:15:40 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id BE3F3C433CA
 for <dri-devel@lists.freedesktop.org>; Sun, 10 Sep 2023 15:15:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1694358938;
 bh=D1lx3t1yo+KyEMn/UX24T6jqA5t2FZ6jnlolK+OdABo=;
 h=From:To:Subject:Date:In-Reply-To:References:From;
 b=khZiSVsWsbNnMHKXm6HX2gcL4SmVyFiydlpnDJoqF4rvxGTOHbRTUnTSYW1lQqjxI
 8zwuMb1H+WiHZYVpVxhwoiNpcuBz2MZJiY/aY5pCHSuB2nlNNP2cRsJzRZ2nopMB4J
 dtIF79peysQ2Yd3Rb8GkqbhSR7L3Au9NeQ/ESGXvrsc6Rqpis/e8Tzv1sPyQEd+1Yw
 QnNsywmrq27giXQa2NQZSktgjUkXBhVbC0atw5Za+bjkK9dJMmzkzoc++FtOgL40LB
 EQq0VzXmTeYEkRLkvnDQuv8x36E/2abp6eRoEoUS5HO7K193IMBUbTiITxrHmOmhBS
 bCF57w4ez6m3A==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix,
 from userid 48) id A711CC53BD0; Sun, 10 Sep 2023 15:15:38 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 217896] [drm:amdgpu_job_timedout [amdgpu]] *ERROR* Process
 information: process Xwayland pid 2985 thread Xwayland:cs0 pid 3129
Date: Sun, 10 Sep 2023 15:15:38 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Video(DRI - non Intel)
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: high
X-Bugzilla-Who: aros@gmx.com
X-Bugzilla-Status: RESOLVED
X-Bugzilla-Resolution: ANSWERED
X-Bugzilla-Priority: P3
X-Bugzilla-Assigned-To: drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: bug_status resolution
Message-ID: <bug-217896-2300-8UXAauzM1B@https.bugzilla.kernel.org/>
In-Reply-To: <bug-217896-2300@https.bugzilla.kernel.org/>
References: <bug-217896-2300@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D217896

Artem S. Tashkinov (aros@gmx.com) changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
             Status|NEW                         |RESOLVED
         Resolution|---                         |ANSWERED

--- Comment #3 from Artem S. Tashkinov (aros@gmx.com) ---
Please repost your bug report here:

https://gitlab.freedesktop.org/drm/amd/-/issues

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
