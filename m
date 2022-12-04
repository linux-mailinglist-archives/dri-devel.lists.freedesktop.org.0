Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B8B97642081
	for <lists+dri-devel@lfdr.de>; Mon,  5 Dec 2022 00:17:03 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E982710E02E;
	Sun,  4 Dec 2022 23:16:54 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F355C10E02E
 for <dri-devel@lists.freedesktop.org>; Sun,  4 Dec 2022 23:16:48 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 5C93660F0D
 for <dri-devel@lists.freedesktop.org>; Sun,  4 Dec 2022 23:16:48 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id C0EEDC433D7
 for <dri-devel@lists.freedesktop.org>; Sun,  4 Dec 2022 23:16:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1670195807;
 bh=8kP21hsGNBZwhNfuHi81RB/sKvpfEMtAe0BPIO2euJA=;
 h=From:To:Subject:Date:From;
 b=SdJUoU/ePT5PS8rxt93ipygPwquQQ9o2EUWD9x7xYFPCGa+Ax2ArkunVDuB8rTdIo
 QTQA4+hFfQQ5YJR8uNmsNrCxZteDEG40lNM3QTNxqQowu/z6nR9Y3ltE7TuAwhDxxD
 Y0y0DpCGEgEfuOEaWot2CXKpFskAZWob7ko1HF0GlgyGlYsxdGzTNWivtrBXU0D2rf
 saa3liYMOE+iIdsx1/2rHbw7xzBCBPnb+4CDMky0vHv6aIfbXRRovydmwt5haCYmbZ
 be7DqFsFnva6FOEjWD0g3tJWk7dIBEq8luhAD7y9KVm8SLBkoR9vCFX9TJTOYpA+SJ
 VFbuv4HIxWJ1g==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix,
 from userid 48) id AAAC9C433E7; Sun,  4 Dec 2022 23:16:47 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 216774] New: On amdgpu the drm subsystem lists additional modes
 beyond what EDID has available
Date: Sun, 04 Dec 2022 23:16:47 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: new
X-Bugzilla-Watch-Reason: AssignedTo drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Video(DRI - non Intel)
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: low
X-Bugzilla-Who: wolfwings@gmail.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: bug_id short_desc product version
 cf_kernel_version rep_platform op_sys cf_tree bug_status bug_severity
 priority component assigned_to reporter cf_regression attachments.created
Message-ID: <bug-216774-2300@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D216774

            Bug ID: 216774
           Summary: On amdgpu the drm subsystem lists additional modes
                    beyond what EDID has available
           Product: Drivers
           Version: 2.5
    Kernel Version: 5.15.81
          Hardware: All
                OS: Linux
              Tree: Mainline
            Status: NEW
          Severity: low
          Priority: P1
         Component: Video(DRI - non Intel)
          Assignee: drivers_video-dri@kernel-bugs.osdl.org
          Reporter: wolfwings@gmail.com
        Regression: No

Created attachment 303357
  --> https://bugzilla.kernel.org/attachment.cgi?id=3D303357&action=3Dedit
Single-resolution EDID (1080p120) that demonstrates the problem

The attached EDID is one I've used across multiple operating systems, howev=
er
on Linux it creates the following additional modes at the DRM level visible
with drm_info outside of X/Wayland from the CLI:

1680x1050@120.00
1280x1024@120.00
1440x900@120.00
1280x800@120.00
1280x720@120.00
1024x768@120.00
800x600@120.00
640x480@120.00

This EDID is being loaded via "drm.edid_firmware=3DeDP:edid.bin" and is pre=
sent
in the initramfs, and this happens both with the stock Ubuntu kernel and wh=
en I
compiled the latest 5.15.81 kernel from source, so I'm reporting it here.

This might be a misconfiguration or some additional option I need to pass to
the drm subsystem to disable some built-in mode-list it's adding by default=
, or
even fixed in later kernel versions and I was simply unaware, if so I apolo=
gize
for taking up your time!

This EDID is meant to only have a single mode available, 1080p120. Changing=
 the
EDID to use 1080p60 (only involves changing the pixel clock value for the
single mode and EDID checksum) still has the same problem, and looking at t=
he
modes it appears it's just replacing the visible-pixel values with the smal=
ler
values and retaining all the other timing details so these seem to be
auto-generated somewhere I can't find.

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
