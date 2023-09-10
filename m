Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CD1D2799DF4
	for <lists+dri-devel@lfdr.de>; Sun, 10 Sep 2023 13:58:08 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0DB7710E185;
	Sun, 10 Sep 2023 11:58:02 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from ams.source.kernel.org (ams.source.kernel.org
 [IPv6:2604:1380:4601:e00::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1896D10E185
 for <dri-devel@lists.freedesktop.org>; Sun, 10 Sep 2023 11:58:01 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 6F466B80A06
 for <dri-devel@lists.freedesktop.org>; Sun, 10 Sep 2023 11:57:59 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 1DAEDC433C8
 for <dri-devel@lists.freedesktop.org>; Sun, 10 Sep 2023 11:57:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1694347078;
 bh=8y1/pIIBbnLh/+eJNyKi+dqEL8nhT05jVtGt+K8Ozbg=;
 h=From:To:Subject:Date:In-Reply-To:References:From;
 b=lYTamPz7VeMVi1DfqKca04PTTgK5M4dnAZlrMM7bMlLoSwpP5QNb4IETLSh0dCF/e
 99m2xoVGFxQbfC9jKUki6hKqx3/7wv6r0Itya2++tcDDbHqnupu+4S4EC7zXIQ9zeo
 RFhwSZjNkPd8eWWTIq7wHyktBo5NqbKa2h9QCd3g5IkaBUYkjuD17C/kF6ZrZ4AWlc
 GhzizTSAkM6dfO6D+pSVtwCSYniqKHFXaMG2kkZMwOHfhHr2WBQmCqFDhxYaQ8hs6k
 2p+rc23VaicAVT57T5cLr0gWxVsJpZC2hpafWa7qTaeBtVdAsE1dtcU45MuUSLu0XF
 8+sEA7M0FsI8w==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix,
 from userid 48) id 0D53EC53BD0; Sun, 10 Sep 2023 11:57:58 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 217896] [drm:amdgpu_job_timedout [amdgpu]] *ERROR* Process
 information: process Xwayland pid 2985 thread Xwayland:cs0 pid 3129
Date: Sun, 10 Sep 2023 11:57:57 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Video(DRI - non Intel)
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: high
X-Bugzilla-Who: ionut_n2001@yahoo.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P3
X-Bugzilla-Assigned-To: drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: attachments.created
Message-ID: <bug-217896-2300-0R2SUgpnOj@https.bugzilla.kernel.org/>
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

--- Comment #2 from sander44 (ionut_n2001@yahoo.com) ---
Created attachment 305079
  --> https://bugzilla.kernel.org/attachment.cgi?id=3D305079&action=3Dedit
dmesg

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
