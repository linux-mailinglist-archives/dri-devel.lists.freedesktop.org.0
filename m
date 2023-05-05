Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 959986F7BA8
	for <lists+dri-devel@lfdr.de>; Fri,  5 May 2023 05:51:12 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A974F10E553;
	Fri,  5 May 2023 03:51:10 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A769310E550
 for <dri-devel@lists.freedesktop.org>; Fri,  5 May 2023 03:51:05 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id EFEC663989
 for <dri-devel@lists.freedesktop.org>; Fri,  5 May 2023 03:51:03 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 5D697C4339C
 for <dri-devel@lists.freedesktop.org>; Fri,  5 May 2023 03:51:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1683258663;
 bh=inZu7X6KsP23hbh3HU6/F8H5Er3hb87BzuI4aVTh5E0=;
 h=From:To:Subject:Date:In-Reply-To:References:From;
 b=oxZ1IM4c2KYvspSwSYABaxhI6ntqbHgyhLBlb4WX4uKFRytO+O5M4+ophf2c2GQwd
 g+duuFRdcM7wHDCDQ1nXm1pj6MkLY0WxzSw0Pf5L0idvay0d0IYMA7/bAki9H9uxBf
 9j7FkDRnYtYYOvcjdx6j4+N8R/EIpJPVINo0RcGgPLJ2pjF98ZKnNNLJb5LwtlF34V
 ZxGDqcfPfJ+Y0s265M5lfMqcSeM3gIuLoYgnknYiEpLocF62CKnZbG76NN8ClQ9Fu2
 iY7gY6jdLuRugPpVibJXwaomIn0qZwVnI1v4hELw3OgFsrxQIphftLt6P7j/PxpA25
 2/WGjuysMuVWQ==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix,
 from userid 48) id 4DB8FC43144; Fri,  5 May 2023 03:51:03 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 217398] amdgpu module loading breaks display output - no signal
Date: Fri, 05 May 2023 03:51:02 +0000
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
X-Bugzilla-Priority: P3
X-Bugzilla-Assigned-To: drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-217398-2300-O9PbV7yhd3@https.bugzilla.kernel.org/>
In-Reply-To: <bug-217398-2300@https.bugzilla.kernel.org/>
References: <bug-217398-2300@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D217398

--- Comment #3 from The Linux kernel's regression tracker (Thorsten Leemhui=
s) (regressions@leemhuis.info) ---
*** Bug 217397 has been marked as a duplicate of this bug. ***

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
