Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B8EF9A2A54E
	for <lists+dri-devel@lfdr.de>; Thu,  6 Feb 2025 10:59:26 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1DC4E10E7FC;
	Thu,  6 Feb 2025 09:58:56 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="dVeY5nFm";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from nyc.source.kernel.org (nyc.source.kernel.org [147.75.193.91])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9D37210E7FC
 for <dri-devel@lists.freedesktop.org>; Thu,  6 Feb 2025 09:58:54 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by nyc.source.kernel.org (Postfix) with ESMTP id 92EC7A44052
 for <dri-devel@lists.freedesktop.org>; Thu,  6 Feb 2025 09:57:07 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 43E0CC4CEE2
 for <dri-devel@lists.freedesktop.org>; Thu,  6 Feb 2025 09:58:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1738835933;
 bh=Z27B78ayFpimdYCVSpTMRJ0X7ZGD/+XC9p0knJ//HFA=;
 h=From:To:Subject:Date:From;
 b=dVeY5nFmzAAiwpPztLIn6h7WqkUg6Cw0I9bGyPji3xmmYCDeMAImac8dNxaCOSVg3
 jkcPa/S/FrMMy/b9tDPlASsXSVRc8t3nl6skLqOi2nbqrMXPdLxO/sUUAgdUFhwCXm
 oLpYgG2XxzeHHcanxcb86FpwQgw3XkfSyelB/JwwhqbNmYjWi43AAl1UVEcApKuqN8
 tecZBOQJ8Q+Ajq08Ytzv2Q5TPg+0aK8RuMoHuF+f5RLi6v88nYwG0tHsxFfn8rYQBd
 IGZDIe8rStVIqut1nbbk2jt7KL3+NUjZwvccGrdm9YHCh/dpYwW0RXAqYtPkgHuaBm
 pwE/GoUJ+wq5Q==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix,
 from userid 48) id 2E854C41606; Thu,  6 Feb 2025 09:58:53 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 219754] New: When screen blanks and resumes there will be an
 error: kernel: amdgpu 0000:0b:00.0: [drm] REG_WAIT timeout 1us * 100 tries -
 dcn32_program_compbuf_size line:138
Date: Thu, 06 Feb 2025 09:58:52 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: new
X-Bugzilla-Watch-Reason: AssignedTo drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Video(DRI - non Intel)
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: ollilein@unitybox.de
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P3
X-Bugzilla-Assigned-To: drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: bug_id short_desc product version rep_platform
 op_sys bug_status bug_severity priority component assigned_to reporter
 cf_regression
Message-ID: <bug-219754-2300@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D219754

            Bug ID: 219754
           Summary: When screen blanks and resumes there will be an error:
                    kernel: amdgpu 0000:0b:00.0: [drm] REG_WAIT timeout
                    1us * 100 tries - dcn32_program_compbuf_size line:138
           Product: Drivers
           Version: 2.5
          Hardware: All
                OS: Linux
            Status: NEW
          Severity: normal
          Priority: P3
         Component: Video(DRI - non Intel)
          Assignee: drivers_video-dri@kernel-bugs.osdl.org
          Reporter: ollilein@unitybox.de
        Regression: No

The bug appears since kernel 6.11.4. Everytime the screen blanks the follow=
ing
error will be displayed in the journalctl log:

kernel: amdgpu 0000:0b:00.0: [drm] REG_WAIT timeout 1us * 100 tries -
dcn32_program_compbuf_size line:138

When the screen resumes (Not from Standby only when resuming from screen
blanking)the following error appears:

kernel: amdgpu 0000:0b:00.0: [drm] REG_WAIT timeout 1us * 100 tries -
dcn32_program_compbuf_size line:139

I have bisected the Kernel versions and until 6.11.3 the bug doesn't happen,
first with 6.11.4 the bug appears.

I have no Problems with crashes or freezes, it is only this message in the
logs.

At the moment i use kernel 6.13.1 but ia have tested kernel 6.14.0-rc1 where
the bug also appears.

I use a PowerColor Radeon RX 7900 XT Hellhound OC for display.

If other Informations are needed i would happily provide it.

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
