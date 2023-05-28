Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 6441C713A25
	for <lists+dri-devel@lfdr.de>; Sun, 28 May 2023 16:38:28 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4FC4488A27;
	Sun, 28 May 2023 14:38:26 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0A28210E18D
 for <dri-devel@lists.freedesktop.org>; Sun, 28 May 2023 14:38:23 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 671AF60A49
 for <dri-devel@lists.freedesktop.org>; Sun, 28 May 2023 14:38:23 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id C4CEAC4339B
 for <dri-devel@lists.freedesktop.org>; Sun, 28 May 2023 14:38:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1685284702;
 bh=nASGHhkySNjM8r3vnfG6AxhXdSmCKJkczmLLkZqsIcs=;
 h=From:To:Subject:Date:In-Reply-To:References:From;
 b=B3ONpbqlOXGUw/9vw6LxpQB6BMJ/WqFFlnmb0S+HeCjIUVw+ZaZjC/TRlZblrzF5M
 /fE0EjiwoBlfBQe+p5uSgE6PC4NQ7zLBxZOJICfmBRsLpUBfp/mxIeqXDjIey49nzQ
 q2dBnQDZb7s2Sjovzcg/d1E/5utkuFpvbKLOK0vhpk3QZxqkL3gxibPN8r2EifioiN
 LBRafWD6Sovr2NqBOGaXpQdV3i3OudfA/a6BzyUbjyLkLZnmg04qEW8rzkUiLzb2rz
 qkygi5M5x7KLyVpQhZP4xyPULoH0GG+vrsBX9YO+DTzasxVPOHIoPUkE8uB3darwMc
 rB/iZGJzHSdBg==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix,
 from userid 48) id B693AC43143; Sun, 28 May 2023 14:38:22 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 217499] NVIDIA drivers fail to install on 6.4.0-rc3-1-mainline
 kernel
Date: Sun, 28 May 2023 14:38:22 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Video(DRI - non Intel)
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: wessel.working+kernel@gmail.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P3
X-Bugzilla-Assigned-To: drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: cf_kernel_version
Message-ID: <bug-217499-2300-mSd9g6bQfj@https.bugzilla.kernel.org/>
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

Wessel (wessel.working+kernel@gmail.com) changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
     Kernel Version|                            |6.4.0-rc3-1-mainline

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
