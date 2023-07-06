Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9232F74987D
	for <lists+dri-devel@lfdr.de>; Thu,  6 Jul 2023 11:30:45 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B8C6C10E4B6;
	Thu,  6 Jul 2023 09:30:43 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 64CCE10E4B6
 for <dri-devel@lists.freedesktop.org>; Thu,  6 Jul 2023 09:30:41 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id B782C618AF
 for <dri-devel@lists.freedesktop.org>; Thu,  6 Jul 2023 09:30:40 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 25FD2C433C8
 for <dri-devel@lists.freedesktop.org>; Thu,  6 Jul 2023 09:30:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1688635840;
 bh=s+t4GFkhDX2493apWlGnk1n5TkmR1KuMoobtlhiov4M=;
 h=From:To:Subject:Date:In-Reply-To:References:From;
 b=FxGb/XrzXl0I1KmVOlDjvTneX2SMJfI4T4dJCG6Qr88g0WcDJysIqpK11vNcZcVM+
 /L+pFsrBH9GNmsNqs7//E+ZM0En87O46U03Jwou5t0u64z5KYBoHL49369HZOE7IGF
 3TwkvIq1FrTnbBV8GcCMPCHdi245ZLkO5ef+WKo+l4SWvKztwOmlLAxvmS3YDKjiL2
 ud1UdCsjkZxCsrFclJnxDKfTsiwfq0AWsrtshp0KTWcoz4ADw1ns09PFYdOoVfnw1k
 uVmq5dsHkyvoYM613f4w8o2G/29yq3MIRH//cdgrkmOiUsKL44ZazDiZmMsuMQj2PF
 8GneVzgndLMYA==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix,
 from userid 48) id 09AB7C53BD1; Thu,  6 Jul 2023 09:30:40 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 217636] Commit edcfed8671 disables previously supported video
 resolutions (on AMD Rembrandt)
Date: Thu, 06 Jul 2023 09:30:39 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Video(DRI - non Intel)
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: aros@gmx.com
X-Bugzilla-Status: RESOLVED
X-Bugzilla-Resolution: PATCH_ALREADY_AVAILABLE
X-Bugzilla-Priority: P3
X-Bugzilla-Assigned-To: drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: cf_bisect_commit bug_status cf_kernel_version
 resolution cf_regression
Message-ID: <bug-217636-2300-JDk4q9buvY@https.bugzilla.kernel.org/>
In-Reply-To: <bug-217636-2300@https.bugzilla.kernel.org/>
References: <bug-217636-2300@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D217636

Artem S. Tashkinov (aros@gmx.com) changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
 Bisected commit-id|                            |aa9704d5127f06c9ffedb0480d2
                   |                            |788b87fecedfb
             Status|NEW                         |RESOLVED
     Kernel Version|                            |6.3.9
         Resolution|---                         |PATCH_ALREADY_AVAILABLE
         Regression|No                          |Yes

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
