Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 934A2A4CF12
	for <lists+dri-devel@lfdr.de>; Tue,  4 Mar 2025 00:07:30 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E58FC10E24B;
	Mon,  3 Mar 2025 23:07:27 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="D0/F0suz";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0D61710E24B
 for <dri-devel@lists.freedesktop.org>; Mon,  3 Mar 2025 23:07:27 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id A17895C4A76
 for <dri-devel@lists.freedesktop.org>; Mon,  3 Mar 2025 23:05:09 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 2EA35C4CEE8
 for <dri-devel@lists.freedesktop.org>; Mon,  3 Mar 2025 23:07:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1741043246;
 bh=2pDj4DBabw65/e0oBwwONMcV1HNPyfKF70WgrzItEbA=;
 h=From:To:Subject:Date:From;
 b=D0/F0suzv6owdJq3AbCaFs5mSZOoUr6Ooa4jB+r1Xwxn72R/ZnX9SQGSIcu/o26H7
 shFYN5MD8Jl4DvG5fcM1UgnRNht4RYDhcoNc/aDSR2GWKxm82sKZfdv7UrpdwQ//4U
 1UozEPcPIJZ8ZWlDRagyIPade/mmkNu0fG2O6CtuMHyK2wp4VFsfcbBY27pYvW0yjz
 SUoPFLbg7wJ/Fa/zDIfPlEoAAAGOS/eUjlk8157gBlEj/CZSEh1xWw6EyL8YmyJJ2s
 07jLye1mbwP8uUjyIH+3WuSZxJ7XUaitE2Q1hEDhhTtYDJAYK9j4MiA55p/x+tK1hx
 v0tiV9+MVbm/A==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix,
 from userid 48) id 22279C41613; Mon,  3 Mar 2025 23:07:26 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 219835] New: amdgpu: kernel oops
 dc_dmub_srv_apply_idle_power_optimizations
Date: Mon, 03 Mar 2025 23:07:25 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: new
X-Bugzilla-Watch-Reason: AssignedTo drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Video(DRI - non Intel)
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: atiqcx@gmail.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P3
X-Bugzilla-Assigned-To: drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: bug_id short_desc product version rep_platform
 op_sys bug_status bug_severity priority component assigned_to reporter
 cf_regression attachments.created
Message-ID: <bug-219835-2300@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D219835

            Bug ID: 219835
           Summary: amdgpu: kernel oops
                    dc_dmub_srv_apply_idle_power_optimizations
           Product: Drivers
           Version: 2.5
          Hardware: All
                OS: Linux
            Status: NEW
          Severity: normal
          Priority: P3
         Component: Video(DRI - non Intel)
          Assignee: drivers_video-dri@kernel-bugs.osdl.org
          Reporter: atiqcx@gmail.com
        Regression: No

Created attachment 307735
  --> https://bugzilla.kernel.org/attachment.cgi?id=3D307735&action=3Dedit
amdgpu OOPS dc_dmub_srv_apply_idle_power_optimizations

On AMD Ryzen AI 9 HX 370 w/ Radeon 890M, seeing this oops on kernel-6.13.5,
fedora 41. Saw this OOPS many times in earlier kernel versions as well 6.13=
.4
and 6.12.X..

OOPS trace is attached.

Distro: fedora 41
Device: Asus P16 H7606WV
Desktop: gnome
Xorg or wayland: wayland
Kernel: 6.13.5



related:
https://github.com/torvalds/linux/blob/99fa936e8e4f117d62f229003c9799686f74=
cebc/drivers/gpu/drm/amd/display/dc/dc_dmub_srv.c#L1552

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
