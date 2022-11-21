Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2494B631A7F
	for <lists+dri-devel@lfdr.de>; Mon, 21 Nov 2022 08:43:12 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6BE6F10E012;
	Mon, 21 Nov 2022 07:43:03 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0D11910E012
 for <dri-devel@lists.freedesktop.org>; Mon, 21 Nov 2022 07:43:01 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 764A160EF3
 for <dri-devel@lists.freedesktop.org>; Mon, 21 Nov 2022 07:43:00 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 4C1C7C433D7
 for <dri-devel@lists.freedesktop.org>; Mon, 21 Nov 2022 07:42:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1669016579;
 bh=4SJWsV05IX6Fu/z/H7J4KRraUUrt6y/B8yucFFy3UWA=;
 h=From:To:Subject:Date:From;
 b=d09K5EHuUVeLUd++OVEJzWOfN+ZlBqbUwHDbVr52hYXxQ+mCDp32YuLUp+Z2kaxZm
 W5ZIOFX8iKHBwVIoX7BsOHvU2tBMh/7pQeYWpvS4Du92D3CfrJH0gNT6gIin8O/yKB
 /WUoY52gzM1yY+a6uCR2RWg0VJV4E5zcSPwdHHkOZZeR7wUlyiGIolrv6H8qqgoFOA
 QDNl73GusoWC+ML13t74G8Jpsd5maNM3lHfeTtvJxJiy4tqorF2CKLJ59P5yW4EYBz
 jKKfMEL91Mos1pqiGNkKrcfi55//Sm6yVjW9Bu3983fMMR20f3jPddEgJ143144+21
 QU4F9SlZnEkXg==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix,
 from userid 48) id 3CDDAC433E7; Mon, 21 Nov 2022 07:42:59 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 216716] New: [drm:psp_resume [amdgpu]] *ERROR* PSP resume
 failed on r9 7950x igpu
Date: Mon, 21 Nov 2022 07:42:58 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: new
X-Bugzilla-Watch-Reason: AssignedTo drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Video(DRI - non Intel)
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: kernel@januszmk.pl
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: bug_id short_desc product version
 cf_kernel_version rep_platform op_sys cf_tree bug_status bug_severity
 priority component assigned_to reporter cf_regression attachments.created
Message-ID: <bug-216716-2300@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D216716

            Bug ID: 216716
           Summary: [drm:psp_resume [amdgpu]] *ERROR* PSP resume failed on
                    r9 7950x igpu
           Product: Drivers
           Version: 2.5
    Kernel Version: 6.0.9
          Hardware: All
                OS: Linux
              Tree: Mainline
            Status: NEW
          Severity: normal
          Priority: P1
         Component: Video(DRI - non Intel)
          Assignee: drivers_video-dri@kernel-bugs.osdl.org
          Reporter: kernel@januszmk.pl
        Regression: No

Created attachment 303246
  --> https://bugzilla.kernel.org/attachment.cgi?id=3D303246&action=3Dedit
dmesg

Sometimes when I put my pc to sleep through "echo mem > /sys/power/state",
resuming fails. I am able to ssh into machine. Attaching dmesg, on this ses=
sion
I was able to sleep/resume properly once, and after putting it to sleep for=
 the
night, it didn't resume.
I had this problem on 6.0.5, 6.0.7 and 6.0.9.
Its integrated gpu on r9 7950x.

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
