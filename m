Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 16B62843BED
	for <lists+dri-devel@lfdr.de>; Wed, 31 Jan 2024 11:12:53 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 490E910F415;
	Wed, 31 Jan 2024 10:12:21 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sin.source.kernel.org (sin.source.kernel.org [145.40.73.55])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A361710F415
 for <dri-devel@lists.freedesktop.org>; Wed, 31 Jan 2024 10:12:20 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sin.source.kernel.org (Postfix) with ESMTP id 4DB88CE1EAE
 for <dri-devel@lists.freedesktop.org>; Wed, 31 Jan 2024 10:11:45 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 8C5E2C433F1
 for <dri-devel@lists.freedesktop.org>; Wed, 31 Jan 2024 10:11:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1706695904;
 bh=mJyYhJNysrMfJUFOam5GBvkv/DRfncDBPkUA0m1Pxnw=;
 h=From:To:Subject:Date:In-Reply-To:References:From;
 b=P3Ug9QMdTJfEbGmxCn1k25k6TIW8RMYw6c12tvI51L1fHEoUQW8A8VAAkQXDUM2DL
 odTpdfIUGTrWtY233PNm7aZvCQOqy27Uu9TcRzrCZ/9Xnx2eMkorJyNyixaeu07KTx
 KgEL9o9TSxDlssMwu2CJk1YD8DbL5YHjvNo97Z7C3r8bQo94lSyjMsZqj24Kiws8ay
 Xc+ExxWDRuagOPl/dLpR2LHmXFpQcFCO36zdZMhbofEiAh50kKjk77y1i0exO2bFoZ
 sT5WyjxtkVwq4JHKPX0/GqOCfegPQdv+N5+UuGDgXORnIc7izpwdOzRxKC9QXOP0fC
 b20I6rt1VoRJA==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix,
 from userid 48) id 75790C53BD2; Wed, 31 Jan 2024 10:11:44 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 218435] UBSAN: array-index-out-of-bounds in
 radeon_atombios.c:2620:43
Date: Wed, 31 Jan 2024 10:11:44 +0000
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
X-Bugzilla-Resolution: WILL_NOT_FIX
X-Bugzilla-Priority: P3
X-Bugzilla-Assigned-To: drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: bug_status cf_kernel_version resolution
Message-ID: <bug-218435-2300-lAlXHV8SyF@https.bugzilla.kernel.org/>
In-Reply-To: <bug-218435-2300@https.bugzilla.kernel.org/>
References: <bug-218435-2300@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D218435

Artem S. Tashkinov (aros@gmx.com) changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
             Status|NEW                         |RESOLVED
     Kernel Version|                            |6.5.0-15-generic
                   |                            |#15~22.04.1-Ubuntu
         Resolution|---                         |WILL_NOT_FIX

--- Comment #2 from Artem S. Tashkinov (aros@gmx.com) ---
This kernel release is no longer supported.

Take it to your vendor: https://bugs.launchpad.net/ubuntu

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
