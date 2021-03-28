Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BCC7F34BF47
	for <lists+dri-devel@lfdr.de>; Sun, 28 Mar 2021 23:25:26 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 34C3D6E0CE;
	Sun, 28 Mar 2021 21:25:22 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BB6756E0CE
 for <dri-devel@lists.freedesktop.org>; Sun, 28 Mar 2021 21:25:20 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPS id AC47661953
 for <dri-devel@lists.freedesktop.org>; Sun, 28 Mar 2021 21:25:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1616966719;
 bh=IEQisCJ+hcI8LMvb/gDpSkUJSe2c0Zwr/HDEg3J2CNk=;
 h=From:To:Subject:Date:From;
 b=q67Uc/VGxvbH4WIT2mx5LgeaWsY583LiMswd3VGbosaRZAlTw+7XdrfAxSKdd5Jn5
 zA4zIA2OBy0YpZbONHB8Uu4YqRwIxRc+Kf8XyHWmXVt2X1DoO/djamAJQ4EBI1QFGq
 Wa1/sGjcljNXacsMrhUfgmeTq0IZv3x3+AbYsQFgBQFIbGE2bRSaR9WFpCErx9r/2m
 vnKpiBo/G02HLGN3yK06xPzFPNge6lpwpDOrdsuREqqDs5F/9K87aNHKCOzYdBX6Nk
 xpWAxCKD7u8Af2DH1/hr68aE/isyqi2iMmRHn49TdCdX+YfoY97TRGOCgvN3yUOQAJ
 qwhlLQEBLY0hw==
Received: by pdx-korg-bugzilla-2.web.codeaurora.org (Postfix, from userid 48)
 id 9CE6162AC4; Sun, 28 Mar 2021 21:25:19 +0000 (UTC)
From: bugzilla-daemon@bugzilla.kernel.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 212469] New: plymouth animation freezes during shutdown
Date: Sun, 28 Mar 2021 21:25:18 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: new
X-Bugzilla-Watch-Reason: AssignedTo drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Video(DRI - non Intel)
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: low
X-Bugzilla-Who: amirgi73@criptext.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: bug_id short_desc product version
 cf_kernel_version rep_platform op_sys cf_tree bug_status bug_severity
 priority component assigned_to reporter cf_regression attachments.created
Message-ID: <bug-212469-2300@https.bugzilla.kernel.org/>
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

https://bugzilla.kernel.org/show_bug.cgi?id=212469

            Bug ID: 212469
           Summary: plymouth animation freezes during shutdown
           Product: Drivers
           Version: 2.5
    Kernel Version: 5.11.6
          Hardware: Intel
                OS: Linux
              Tree: Mainline
            Status: NEW
          Severity: low
          Priority: P1
         Component: Video(DRI - non Intel)
          Assignee: drivers_video-dri@kernel-bugs.osdl.org
          Reporter: amirgi73@criptext.com
        Regression: No

Created attachment 296125
  --> https://bugzilla.kernel.org/attachment.cgi?id=296125&action=edit
plymouth animation freezes during shutdown

Overview:
    plymouth animation during shutdown freezes. the system would shutdown
without 
    any problem.

Steps to reproduce:
    with plymouth installed and lightdm-plymouth/sddm-plymouth.service enabled, 
    after pressing restart or shutdown button, plymouth animation appears 
    normally then the screen would turn off and then it turn on again, this 
    time it shows a frozen plymouth animation. after about 5sec the system 
    would shutdown/restart normally.

Expected Results:
    plymouth animation will work during shutdown and won't freeze.

Build Date & Hardware:
    archlinux-kernel 5.11.6 build 1
    CPU: intel i5 7200u
    GPU: Intel HD 620 + Nivida 940mx
    Video Driver: modsettings driver for Intel HD + Nvidia-proprietary 460.67 
    in prime render offloading mode
    DE: KDE Plasma 5.21.3
    plymouth: latest git build

Additional Builds and Platforms:
    this problem doesn't occur with kernel 5.10.16.

Additional Information:
    see attached video bellow

-- 
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
