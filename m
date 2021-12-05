Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B5EB24693B2
	for <lists+dri-devel@lfdr.de>; Mon,  6 Dec 2021 11:27:28 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EB8EA73E6B;
	Mon,  6 Dec 2021 10:20:44 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3CB856E3F5
 for <dri-devel@lists.freedesktop.org>; Sun,  5 Dec 2021 18:29:32 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 898AD6111B
 for <dri-devel@lists.freedesktop.org>; Sun,  5 Dec 2021 18:29:31 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id EF79CC00446
 for <dri-devel@lists.freedesktop.org>; Sun,  5 Dec 2021 18:29:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1638728971;
 bh=hfRdGcCC0f/9beFBte8MTZvbBD64nDdi8ag9bPDRgUs=;
 h=From:To:Subject:Date:From;
 b=YKfh+Tt+neyo8F13t/5tY8QAVNWrNv9RnGJ7bVwyI62qm8rWYLBflxg9hFCOWWXat
 udMYTvOBl9C+B+hUj2lcW43NzkAMJxM3dTIUl8wYEXdNwvhV0FymSJK6RAvF27mfb0
 iEoXunn8tFFl+pSu4LdJqvF1dqF5CpeB5g18kWF/dMyOzT7DNWYq/aWsHgwVifeke1
 ZNx/SRFfh0ULnWp5QI5apE1gDv2ll0g3XxowSZfsw/W7Ys0Zgsg4vXRGXEqmYsmzsy
 RzDINDTvGfzwN+vIoUYlJXnLqllvEIhUjkm0/E9n+Vavjnzua/fMjZTItMAZU2HGi0
 c/xl6bjTqlQxA==
Received: by pdx-korg-bugzilla-2.web.codeaurora.org (Postfix, from userid 48)
 id DA21D60F4C; Sun,  5 Dec 2021 18:29:30 +0000 (UTC)
From: bugzilla-daemon@bugzilla.kernel.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 215223] New: AMDGPU Driver with Radeon RX 6700 sometimes can
 not find display
Date: Sun, 05 Dec 2021 18:29:30 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: new
X-Bugzilla-Watch-Reason: AssignedTo drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Video(DRI - non Intel)
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: reznov90210@gmail.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: bug_id short_desc product version
 cf_kernel_version rep_platform op_sys cf_tree bug_status bug_severity
 priority component assigned_to reporter cf_regression attachments.created
Message-ID: <bug-215223-2300@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D215223

            Bug ID: 215223
           Summary: AMDGPU Driver with Radeon RX 6700 sometimes can not
                    find display
           Product: Drivers
           Version: 2.5
    Kernel Version: 5.15.6
          Hardware: x86-64
                OS: Linux
              Tree: Mainline
            Status: NEW
          Severity: normal
          Priority: P1
         Component: Video(DRI - non Intel)
          Assignee: drivers_video-dri@kernel-bugs.osdl.org
          Reporter: reznov90210@gmail.com
        Regression: No

Created attachment 299899
  --> https://bugzilla.kernel.org/attachment.cgi?id=3D299899&action=3Dedit
Xorg log

I have a problem with RX6700 connected to monitor using display port. It
happens in 60% cases, while kernel booting i see some init messages and get
black screen without signal, so i need to reset my system.

As i understand, this happens because AMDGPU can not find current display,
connected to display port.

>(WW) AMDGPU(0): No outputs definitely connected, trying again...

If system is booting, i haven't got any problems. I can watch videos (with =
HW
acceleration) or playing games.=20

I have also tested on 5.13.x kernel with same result.=20

When i try to load Windows, i haven't got this problem.=20

What's more strange, that connecting to HDMI solves this problem and linux
kernel proper initialize my display.

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
