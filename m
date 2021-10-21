Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id F36BD435D79
	for <lists+dri-devel@lfdr.de>; Thu, 21 Oct 2021 10:57:29 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B3CE76E41A;
	Thu, 21 Oct 2021 08:57:26 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 80D6E6E41A
 for <dri-devel@lists.freedesktop.org>; Thu, 21 Oct 2021 08:57:25 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPS id 5119361260
 for <dri-devel@lists.freedesktop.org>; Thu, 21 Oct 2021 08:57:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1634806645;
 bh=2vCvjM5LTbWT489squSOe7nH+8EoyDizfcos5rPzTcQ=;
 h=From:To:Subject:Date:In-Reply-To:References:From;
 b=e1b6BYDeMFpl/ZdnfvDXsR/E6sss7d97k3ls/lf9GZ3UOal0QvgrXODxAMjUQsLP8
 YFtahiRqvf/d+Fjf0w76N2TK5rmNKuP4DuT+1dnPw6w/RgJ2D2T7Sg0TMpRgcDQa18
 Xuz/vljwt50XqkkfhMIBkqEDoacK+v+8yCy3e5XZCRuMLn2lTy3AjcTJO/6ZpcfG7j
 LXdfkuQz4ko7+gM+wnjAU/fSyzA6oqNxNN73mEUy0cvn0WZuk6lnEdsaZTjt+KhPY8
 Y8FMNS5mAsXFup4oqJCQEEFCH1wycg3Qvo/fbZVQCe+D8oz0zQ+WYw5mTfgb3JWCW3
 n/Mxa5+2lAQHQ==
Received: by pdx-korg-bugzilla-2.web.codeaurora.org (Postfix, from userid 48)
 id 44D8E60F5D; Thu, 21 Oct 2021 08:57:25 +0000 (UTC)
From: bugzilla-daemon@bugzilla.kernel.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 214197] [Asus G713QY] RX6800M not usable after exiting Vulkan
 application
Date: Thu, 21 Oct 2021 08:57:24 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Video(DRI - non Intel)
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: velemas@gmail.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-214197-2300-HBxKII4U54@https.bugzilla.kernel.org/>
In-Reply-To: <bug-214197-2300@https.bugzilla.kernel.org/>
References: <bug-214197-2300@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D214197

--- Comment #7 from velemas@gmail.com ---
Kernel 5.14.14 already has it but it's not fixed. I got mostly the same dme=
sg
message but somewhat different:

[  367.167527] amdgpu 0000:03:00.0: amdgpu: RAS: optional ras ta ucode is n=
ot
available
[  367.183399] amdgpu 0000:03:00.0: amdgpu: SECUREDISPLAY: securedisplay ta
ucode is not available
[  367.183406] amdgpu 0000:03:00.0: amdgpu: SMU is resuming...
[  371.863082] amdgpu 0000:03:00.0: amdgpu: Failed to setup smc hw!
[  371.863085] [drm:amdgpu_device_ip_resume_phase2 [amdgpu]] *ERROR* resume=
 of
IP block <smu> failed -62
[  371.863147] amdgpu 0000:03:00.0: amdgpu: amdgpu_device_ip_resume failed
(-62).

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
