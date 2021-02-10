Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id CA237317086
	for <lists+dri-devel@lfdr.de>; Wed, 10 Feb 2021 20:46:35 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CAFCB6ECC9;
	Wed, 10 Feb 2021 19:46:31 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 76AB66ECC9
 for <dri-devel@lists.freedesktop.org>; Wed, 10 Feb 2021 19:46:30 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPS id 4ECAC64E57
 for <dri-devel@lists.freedesktop.org>; Wed, 10 Feb 2021 19:46:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1612986390;
 bh=4t5qatiCQ/HUV83XT22fnE9QKWjQC5P7dUG1hGHCIN4=;
 h=From:To:Subject:Date:In-Reply-To:References:From;
 b=lEHSBOVOighOMBYWlicnSV4Mpl0dJw4g5DGYa1mbZklHlzrUYOgZt+4TNIscDxoPU
 0HaPple6vpIjERamF+O1hZy/GzLswGa1PuZ/JtqkI4gAUjGRirIvJjSW/P/xCDnv7g
 izm/9kuJtNAHIv00XZ5XzSNm43VrTEjofSpIpEy+jqr52BRhjZVc9KA2QOLU+fdLQG
 vl4rcABZbWIn2aKLXpE08j/O6DokNijcy7BgpZbKdEvvd78zgdYk25TFWYI89PxnKB
 mEaRyve6uT+jz+peL2dmFzVJHdWy+Onz1vSA76yjVUFY34uKhVa2UIRzI7cTJcz1/E
 XvABailmoSFgA==
Received: by pdx-korg-bugzilla-2.web.codeaurora.org (Postfix, from userid 48)
 id 3988865259; Wed, 10 Feb 2021 19:46:30 +0000 (UTC)
From: bugzilla-daemon@bugzilla.kernel.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 211649] "drm/amd/display: reuse current context instead of
 recreating one" cause hdmi hotplug blackscreen on amdgpu
Date: Wed, 10 Feb 2021 19:46:29 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Video(DRI - non Intel)
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: youling257@gmail.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: attachments.created
Message-ID: <bug-211649-2300-iySTUw0tpg@https.bugzilla.kernel.org/>
In-Reply-To: <bug-211649-2300@https.bugzilla.kernel.org/>
References: <bug-211649-2300@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=211649

--- Comment #9 from youling257@gmail.com ---
Created attachment 295197
  --> https://bugzilla.kernel.org/attachment.cgi?id=295197&action=edit
dmesg.txt

I delete "read -n 1", can output dmesg.txt and trace.txt.
trace.txt,
# tracer: function
#
# entries-in-buffer/entries-written: 0/0   #P:8
#
#                                _-----=> irqs-off
#                               / _----=> need-resched
#                              | / _---=> hardirq/softirq
#                              || / _--=> preempt-depth
#                              ||| /     delay
#           TASK-PID     CPU#  ||||   TIMESTAMP  FUNCTION
#              | |         |   ||||      |         |

-- 
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
