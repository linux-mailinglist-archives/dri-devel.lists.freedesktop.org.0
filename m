Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D7DB931491A
	for <lists+dri-devel@lfdr.de>; Tue,  9 Feb 2021 07:51:12 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BF55A6EAA3;
	Tue,  9 Feb 2021 06:51:08 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8DFDE6EAA3
 for <dri-devel@lists.freedesktop.org>; Tue,  9 Feb 2021 06:51:07 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPS id 3604464EB6
 for <dri-devel@lists.freedesktop.org>; Tue,  9 Feb 2021 06:51:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1612853467;
 bh=GZp74DYXdZltSpGw/gqMBpiFJm+TCh0CGOvR61dHS+Q=;
 h=From:To:Subject:Date:From;
 b=dda2BZs0+9C38xfm5lUpfEo7+FczmghTaQmtjXyw96Qo0fWILtl4ESXU6cRQykgMb
 gmY9w0Hh7joUlwe7sY9jlCboNQBboRMtGrDVujCr/4Ec736qgBFNmAoBSH2E14MHbR
 xUxeZEYCFURJqJvBdEo4Mdzf7dpSMOX27yDpXmiE471nKFKEPA3GaCgWMc7Tes6XVs
 efrCVPj7Ioc21WOFCUEWH+OexLBDhkwIV3tqo+wDM4gv3JqrxxFlSYYSwKmKqQ2FSF
 fIzpRUwt/d7PNJs+7cnIYTnIQfsUzViitEpA1213kTU1vNVN4d9WQTvOMgUYK1lMO9
 6snwV/06wB3QA==
Received: by pdx-korg-bugzilla-2.web.codeaurora.org (Postfix, from userid 48)
 id 21C4A6535B; Tue,  9 Feb 2021 06:51:07 +0000 (UTC)
From: bugzilla-daemon@bugzilla.kernel.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 211649] New: "drm/amd/display: reuse current context instead of
 recreating one" cause hdmi hotplug blackscreen on amdgpu
Date: Tue, 09 Feb 2021 06:51:06 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: new
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
X-Bugzilla-Changed-Fields: bug_id short_desc product version
 cf_kernel_version rep_platform op_sys cf_tree bug_status bug_severity
 priority component assigned_to reporter cf_regression
Message-ID: <bug-211649-2300@https.bugzilla.kernel.org/>
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

            Bug ID: 211649
           Summary: "drm/amd/display: reuse current context instead of
                    recreating one" cause hdmi hotplug blackscreen on
                    amdgpu
           Product: Drivers
           Version: 2.5
    Kernel Version: 5.11-rc7
          Hardware: All
                OS: Linux
              Tree: Mainline
            Status: NEW
          Severity: normal
          Priority: P1
         Component: Video(DRI - non Intel)
          Assignee: drivers_video-dri@kernel-bugs.osdl.org
          Reporter: youling257@gmail.com
        Regression: No

5.11-rc7 kernel,amdgpu 3400g, plug out hdmi, replug in hdmi, blackscreen.

the bad commit is 8866a67 drm/amd/display: reuse current context instead of
recreating one.

-- 
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
