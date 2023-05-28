Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 5B1EC713A6A
	for <lists+dri-devel@lfdr.de>; Sun, 28 May 2023 17:51:40 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9B5AB10E0A6;
	Sun, 28 May 2023 15:51:34 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D737E10E0A6
 for <dri-devel@lists.freedesktop.org>; Sun, 28 May 2023 15:51:33 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id F2D3660EBF
 for <dri-devel@lists.freedesktop.org>; Sun, 28 May 2023 15:51:32 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 63A7FC4339B
 for <dri-devel@lists.freedesktop.org>; Sun, 28 May 2023 15:51:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1685289092;
 bh=LsPRcy+fb5ufJLfLLCaZAMHCLaNaRlFQj2k3thBGMQ0=;
 h=From:To:Subject:Date:In-Reply-To:References:From;
 b=iU3ddwreJyLlqs//O3/O1T1ATdY4+45Kvm+mTaLZNcQFEh3UK76BTdivhuD5GIXZT
 sIqLQwFXqRBTF2w5ec3ngIelqSwK5LPLzbiyJQrC3PYT11vk0s3uOY6l1qGkoFS8Bc
 bP3CLPPwxCp8wpAu29Kw+W7Au/nMm9t4UuaQHgCC7/oknNzTBMRI2v3Ayl4EUdKRsP
 xDV7Swj7sEbbhVXWbnHiS8gQneWGoH2q7rObnuArfEeGwWC63cdDOQFG20IMP3YpmS
 VQDPI9R/Zc7ldqHYhm4mIWenZp2Fou3fZeRdw+/t6qB71hv/TwmIj4rifAwcP6XJ7/
 5WxIdXF7T1Now==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix,
 from userid 48) id 51D35C43141; Sun, 28 May 2023 15:51:32 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 217499] NVIDIA drivers fail to install on 6.4.0-rc3-1-mainline
 kernel
Date: Sun, 28 May 2023 15:51:32 +0000
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
X-Bugzilla-Resolution: ANSWERED
X-Bugzilla-Priority: P3
X-Bugzilla-Assigned-To: drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: bug_status resolution
Message-ID: <bug-217499-2300-EQzwtSnNHX@https.bugzilla.kernel.org/>
In-Reply-To: <bug-217499-2300@https.bugzilla.kernel.org/>
References: <bug-217499-2300@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D217499

Artem S. Tashkinov (aros@gmx.com) changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
             Status|NEW                         |RESOLVED
         Resolution|---                         |ANSWERED

--- Comment #1 from Artem S. Tashkinov (aros@gmx.com) ---
Please report here https://github.com/NVIDIA/open-gpu-kernel-modules

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
