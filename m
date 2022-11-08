Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E913D621A4B
	for <lists+dri-devel@lfdr.de>; Tue,  8 Nov 2022 18:21:12 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 556BB10E4CE;
	Tue,  8 Nov 2022 17:21:08 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9E47E10E4CE
 for <dri-devel@lists.freedesktop.org>; Tue,  8 Nov 2022 17:21:05 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id E4BF6616B5
 for <dri-devel@lists.freedesktop.org>; Tue,  8 Nov 2022 17:21:04 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 526E8C433C1
 for <dri-devel@lists.freedesktop.org>; Tue,  8 Nov 2022 17:21:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1667928064;
 bh=OgjZyL/ifEGcV9paZgAbQ1c3FyhoheYeswv1nHDr/pU=;
 h=From:To:Subject:Date:From;
 b=uceMDYgFw/xGPhnsO+8oCQw3Phl772Ig3n+JFnne0sNa4CkgWCEfUyBdLVycoe1RN
 9fkPjHMxQuGWes+FUUQMJjWL/LTNRbNzSxD+50eSW402sd3qvaeuB6QTndS1n4yiEQ
 +93yssEw3U7TpVuPxvi0uwV0vv+bLD0yKJIk+Dq9BQFdvC2wsXgMRvPAxmqBGPx2RM
 5PXU2vw7eyG908+kQk/6rcSyldMiHnINt8si7NRxxFGisu07x0mSi2Ht35xHrpwjpp
 7pFaAr4gOuRgelAGGTgvyr6+1OOmK36FJz6VezZ0++ohhcvuukpZvAUSmnCVLmrx/w
 gR+KoZXIq9Fqw==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix,
 from userid 48) id 3EFCAC433E7; Tue,  8 Nov 2022 17:21:04 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 216673] New: Recurring amdgpu freeze on kernel 6.0.6 only
Date: Tue, 08 Nov 2022 17:21:03 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: new
X-Bugzilla-Watch-Reason: AssignedTo drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Video(DRI - non Intel)
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: high
X-Bugzilla-Who: stanislav.modrak@gmail.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: bug_id short_desc product version
 cf_kernel_version rep_platform op_sys cf_tree bug_status bug_severity
 priority component assigned_to reporter cf_regression attachments.created
Message-ID: <bug-216673-2300@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D216673

            Bug ID: 216673
           Summary: Recurring amdgpu freeze on kernel 6.0.6 only
           Product: Drivers
           Version: 2.5
    Kernel Version: 6.0.6-060006-generic
          Hardware: AMD
                OS: Linux
              Tree: Mainline
            Status: NEW
          Severity: high
          Priority: P1
         Component: Video(DRI - non Intel)
          Assignee: drivers_video-dri@kernel-bugs.osdl.org
          Reporter: stanislav.modrak@gmail.com
        Regression: No

Created attachment 303150
  --> https://bugzilla.kernel.org/attachment.cgi?id=3D303150&action=3Dedit
log messages

The monitor goes blank at 17:00:34 system time (the screen froze for a mome=
nt
before going blank completely, showing this timestamp) and no response from=
 the
system with keyboard commands is visible. Forced to hard reboot Recurring
issue, only on kernel 6.0.6.

Attaching the full log file here.

Identified the log at 17:00:34 exactly. There are multiple logs at this
timestamp, however, showing just one.

```
Time: 17:00:34
Message: amdgpu 0000:06:00.0: amdgpu: [mmhub0] no-retry page fault (src_id:0
ring:40 vmid:4 pasid:32777, for process todoist pid 26652 thread todoist:cs0
pid 26658)
Kernel Device: +pci:0000:06:00.0
Priority: 3
```

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
