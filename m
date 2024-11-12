Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C8FC39C4F40
	for <lists+dri-devel@lfdr.de>; Tue, 12 Nov 2024 08:16:53 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7BDD510E16E;
	Tue, 12 Nov 2024 07:16:49 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="G+RjeEjw";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6510B10E16E
 for <dri-devel@lists.freedesktop.org>; Tue, 12 Nov 2024 07:16:48 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 426785C4416
 for <dri-devel@lists.freedesktop.org>; Tue, 12 Nov 2024 07:16:03 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 567A1C4CECD
 for <dri-devel@lists.freedesktop.org>; Tue, 12 Nov 2024 07:16:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1731395807;
 bh=L2BKWjTjDVjJv6v1iQKXaymQRR+7oh00/eQd+3sDI5o=;
 h=From:To:Subject:Date:From;
 b=G+RjeEjw+/2TPhMcrSCHJ2l7dCghNxE6QRzZKyeSpwzw7tdJRsp1w8wbuyFNoVixE
 SXeuVZue0tttHzjS7fRH/pfxoJmLPvmbSeKA0ZKsPTIXBgCfzyQQN4CAJWFab4tZVF
 /SGVpf5fZwGeggl1bDHlJgf5qYbVlwOKtZrtbsasOQzcDIZY8I+BT1gL5ybL0Sc1dr
 6YdRnKx9JhlfRvTHTLX8drvH1jHiOXaH6+cTjEGOTlaLJ8tQy/ysGfdvg6oBni0kGx
 BxyHfPjs2220/cLGOWMSzoGR6HSa1sOiI1FzIJpE3l0UHbENJMdpRXlXEpSHzXWazY
 ci+YEHOHul65Q==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix,
 from userid 48) id 238DFC53BBF; Tue, 12 Nov 2024 07:16:47 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 219492] New: amdgpu: failed to write reg 28b4 wait reg 28c6 and
 amdgpu: failed to write reg 1a6f4 wait reg 1a706
Date: Tue, 12 Nov 2024 07:16:45 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: new
X-Bugzilla-Watch-Reason: AssignedTo drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Video(DRI - non Intel)
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: email2shubhra@gmail.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P3
X-Bugzilla-Assigned-To: drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: bug_id short_desc product version rep_platform
 op_sys bug_status bug_severity priority component assigned_to reporter
 cf_regression attachments.created
Message-ID: <bug-219492-2300@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D219492

            Bug ID: 219492
           Summary: amdgpu: failed to write reg 28b4 wait reg 28c6 and
                    amdgpu: failed to write reg 1a6f4 wait reg 1a706
           Product: Drivers
           Version: 2.5
          Hardware: AMD
                OS: Linux
            Status: NEW
          Severity: normal
          Priority: P3
         Component: Video(DRI - non Intel)
          Assignee: drivers_video-dri@kernel-bugs.osdl.org
          Reporter: email2shubhra@gmail.com
        Regression: No

Created attachment 307209
  --> https://bugzilla.kernel.org/attachment.cgi?id=3D307209&action=3Dedit
Kernel log for hardware

I get the below two kernel errors in log when I resume from hibernate and w=
hile
using DRI probably. I have latest amdgpu non-free firmware and mesa v24
installed.

amdgpu 0000:04:00.0: amdgpu: failed to write reg 28b4 wait reg 28c6
amdgpu 0000:04:00.0: amdgpu: failed to write reg 1a6f4 wait reg 1a706

I have the following kernel parameter set to try and mitigate the above iss=
ue
but still the issue happens.

iommu=3Dsoft

The above issue does not occur during s2idle sleep/wakeup but only after
resuming from hibernate.

Attaching some kernel log if that would be of any help.

I found this issue with kernel version 6.6.x and 6.10.x

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
