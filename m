Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 87AE13B505F
	for <lists+dri-devel@lfdr.de>; Sun, 27 Jun 2021 00:38:47 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F3A116E0ED;
	Sat, 26 Jun 2021 22:38:42 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 277376E0ED
 for <dri-devel@lists.freedesktop.org>; Sat, 26 Jun 2021 22:38:42 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPS id C7D3361C4A
 for <dri-devel@lists.freedesktop.org>; Sat, 26 Jun 2021 22:38:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1624747121;
 bh=hV1XGj8XnBKRpaCfr9FPy0MRE50IogTbFgAEEjEZRnA=;
 h=From:To:Subject:Date:From;
 b=QxEUZHl8PqTCP/2i/JjPE8Lnd/OvFmLACrSSuTGdjTvwqi9Njyv4mskr/y/O2Gkcb
 MsDzwdWQbOelEjD3GUKHr3TjVPeUuqFUoa2OfCpQcEbTYRSkUnW2ts137ZYlzzJd+j
 0Gm600V/aqaaO3E+2QHRXidxT4MutFr3pVQh6RBzKsciUcfZgT9u8gx6VN+cOr/7r/
 5xgG0GEuUGcqKotSDK232TpmyUPjx5BUdHGMym5ANOFKhES4AmyfryvS68QpsmssoT
 jnxEXqtNJxqLlHS6gN0GO4wk8VPLG6hLiSreAbX8HR/RxRcEogD3cJaFYz9ipx7wd/
 J8N9t05lAw/Kg==
Received: by pdx-korg-bugzilla-2.web.codeaurora.org (Postfix, from userid 48)
 id BEBDC6115A; Sat, 26 Jun 2021 22:38:41 +0000 (UTC)
From: bugzilla-daemon@bugzilla.kernel.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 213599] New: amdgpu: navi RX 5500XT Very high idle power
 consumption (22 Watts)
Date: Sat, 26 Jun 2021 22:38:41 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: new
X-Bugzilla-Watch-Reason: AssignedTo drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Video(DRI - non Intel)
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: high
X-Bugzilla-Who: contato-myghi63@protonmail.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: bug_id short_desc product version
 cf_kernel_version rep_platform op_sys cf_tree bug_status bug_severity
 priority component assigned_to reporter cf_regression attachments.created
Message-ID: <bug-213599-2300@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D213599

            Bug ID: 213599
           Summary: amdgpu: navi RX 5500XT Very high idle power
                    consumption (22 Watts)
           Product: Drivers
           Version: 2.5
    Kernel Version: 5.10.46-1 and 5.12.13-1
          Hardware: x86-64
                OS: Linux
              Tree: Mainline
            Status: NEW
          Severity: high
          Priority: P1
         Component: Video(DRI - non Intel)
          Assignee: drivers_video-dri@kernel-bugs.osdl.org
          Reporter: contato-myghi63@protonmail.com
        Regression: No

Created attachment 297633
  --> https://bugzilla.kernel.org/attachment.cgi?id=3D297633&action=3Dedit
dmesg + corectrl screenshot

Overview:
I'm having Very high idle power consumption with the latest lts and mainstr=
eam
kernels. CoreCtrl Reports 99% of activity while doing nothing!
I'm attaching the dmesg output and a screen capture of this problem happeni=
ng.

Steps to reproduce:
Run any distro with the latest kernel on a hardware with a AMD Navi GPU

Expected results:
Low idle consumption (about 3 Watts)

Actual results:
High power consumption and temperatures while idling (22 Watts)

Operational System:
Arch Linux (latest packages avaliable from the repository)

Additional Information:
TLP related configuration:
RADEON_POWER_PROFILE_ON_AC=3Dhigh
RADEON_DPM_PERF_LEVEL_ON_AC=3Dauto
RADEON_DPM_STATE_ON_AC=3Dperformance

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
