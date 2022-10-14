Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 98BA75FE673
	for <lists+dri-devel@lfdr.de>; Fri, 14 Oct 2022 03:05:28 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BDB4C10E26D;
	Fri, 14 Oct 2022 01:05:20 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 737BE10E26D
 for <dri-devel@lists.freedesktop.org>; Fri, 14 Oct 2022 01:05:18 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 429866198A
 for <dri-devel@lists.freedesktop.org>; Fri, 14 Oct 2022 01:05:17 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id A2F5BC433D7
 for <dri-devel@lists.freedesktop.org>; Fri, 14 Oct 2022 01:05:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1665709516;
 bh=6o249YdZ6oGKU3QyQpM29Jn0oFcT+GtWs1SddTum0a0=;
 h=From:To:Subject:Date:From;
 b=hnxsm4UrAjntkfm65yUHWTRpJEa3n9fTvnGsmKqZK4oniRj4OX30bPY9UTP2HZEct
 NnK7BLWeE1s/3RtYvdSvNbwQI519giGygx8peeru32YvQRRI7ZcYV+55KHoQAUF/fp
 a40GeELiyc0Ulo9JN5bn6eu8AdU2TKWueiZ1dhsB4kA3plasXQk7CjPjdsWFikegjh
 ybGr4HaXebN5Ib/P/zIQD3tkUO+U+kwuiZoCEjMltG4DnOuIi96X0tCazfaJJUbfTn
 rGYBt71HX1pCH7SA5Zh8y3eCo7NGd9yl0GG7sH9GsiAfgT7nbTh+V89I14hJGHdnsE
 rRi7Si4NiPnnA==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix,
 from userid 48) id 869A8C433E7; Fri, 14 Oct 2022 01:05:16 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 216583] New: [AMDGPU] Black screen after resume + Failed to pin
 framebuffer -19
Date: Fri, 14 Oct 2022 01:05:16 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: new
X-Bugzilla-Watch-Reason: AssignedTo drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Video(DRI - non Intel)
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: contato-myghi63@protonmail.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: bug_id short_desc product version
 cf_kernel_version rep_platform op_sys cf_tree bug_status bug_severity
 priority component assigned_to reporter cf_regression attachments.created
Message-ID: <bug-216583-2300@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D216583

            Bug ID: 216583
           Summary: [AMDGPU] Black screen after resume + Failed to pin
                    framebuffer -19
           Product: Drivers
           Version: 2.5
    Kernel Version: 6.0.1
          Hardware: All
                OS: Linux
              Tree: Mainline
            Status: NEW
          Severity: normal
          Priority: P1
         Component: Video(DRI - non Intel)
          Assignee: drivers_video-dri@kernel-bugs.osdl.org
          Reporter: contato-myghi63@protonmail.com
        Regression: No

Created attachment 302996
  --> https://bugzilla.kernel.org/attachment.cgi?id=3D302996&action=3Dedit
System Log

After upgrading the kernel from 5.19.13 to 6.0.1, my screen goes black after
resuming the system. Switching the TTY to another one and going back "fixes"
the issue.
My GPU: RX 5500XT 8GB (desktop)
OS: Arch Linux

I also tried using the kernel argument amdgpu.dc=3D0 but this freezes the s=
creen
on early boot (radeon and amdgpu modules are stored on initial ramdisk)

On attachment, there's relevant errors from line 1320!

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
