Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 7143F495CC6
	for <lists+dri-devel@lfdr.de>; Fri, 21 Jan 2022 10:23:29 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5295010E9B9;
	Fri, 21 Jan 2022 09:23:27 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from ams.source.kernel.org (ams.source.kernel.org
 [IPv6:2604:1380:4601:e00::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E8B6810E9B9
 for <dri-devel@lists.freedesktop.org>; Fri, 21 Jan 2022 09:23:25 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id A4102B81ED4
 for <dri-devel@lists.freedesktop.org>; Fri, 21 Jan 2022 09:23:24 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 69F73C340E3
 for <dri-devel@lists.freedesktop.org>; Fri, 21 Jan 2022 09:23:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1642757003;
 bh=V6ULHUkIBOSCt7zLQs3xGHntJ4bnUpsuO/TtFVNkVFU=;
 h=From:To:Subject:Date:From;
 b=GND/+ZA6G/aGHcXKXSIJhmeyuZgPT2HRf3+6AWVZ2yN2CJgsrxnHMnfWRAYL+sb3i
 zPHSILyCvuoL5tEwXhoqW7aqnu3Omi946M3FVlnlqzzWcdEeWD3o3WGn3By1rEjqem
 EzyQy1EGxfR7aHb5+zjUG6KvTWFrWn8FYT65lw5nag7AUrB/E9evIZRchGFMBCnmRv
 sOHZC7UKrdSull5c9RbkNtG37VUVtAG0jX8pxm7qfQQPky/uanv3V3wIcxNCuFLnmw
 JETwWLiPvZJmne/USOI9H4En+xl+1FOXz9JYamUv807HniqTUzmjn8B2xEMrcaacIF
 voqjeLrsD0YTQ==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix,
 from userid 48) id 55EFBCC13AC; Fri, 21 Jan 2022 09:23:23 +0000 (UTC)
From: bugzilla-daemon@bugzilla.kernel.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 215511] New: Dual monitor with amd 5700 causes system to hang
 at startup.
Date: Fri, 21 Jan 2022 09:23:22 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: new
X-Bugzilla-Watch-Reason: AssignedTo drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Video(DRI - non Intel)
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: pmestre@gmail.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: bug_id short_desc product version
 cf_kernel_version rep_platform op_sys cf_tree bug_status bug_severity
 priority component assigned_to reporter cf_regression attachments.created
Message-ID: <bug-215511-2300@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D215511

            Bug ID: 215511
           Summary: Dual monitor with amd 5700 causes system to hang at
                    startup.
           Product: Drivers
           Version: 2.5
    Kernel Version: 5.16.1
          Hardware: All
                OS: Linux
              Tree: Mainline
            Status: NEW
          Severity: normal
          Priority: P1
         Component: Video(DRI - non Intel)
          Assignee: drivers_video-dri@kernel-bugs.osdl.org
          Reporter: pmestre@gmail.com
        Regression: No

Created attachment 300294
  --> https://bugzilla.kernel.org/attachment.cgi?id=3D300294&action=3Dedit
dual monitor boot crash with amdgpu card.

Hello, system mostly crashes (sometimes in different ways) when i start with
more than one monitor attached.

If i switch off one monitor then system boots correctly (i don't need to de=
tach
the displayport cable, just to switch off the monitor).


When both monitors are connected, most of the times it just crashes as the
attached log, sometimes it boots but screen is flickering and with artifact=
s.

This happened with kernel 5.10 and 5.11, it was fixed i don't remember exac=
tly
when, and is happening again. For me it worked with kernel 5.15.8 and failed
with 5.15.13.
It is still failing with 5.16.1.

Kind regards and many thanks for your work in the most crucial open-source
project.

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
