Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D14794E478A
	for <lists+dri-devel@lfdr.de>; Tue, 22 Mar 2022 21:30:28 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 127E910E21D;
	Tue, 22 Mar 2022 20:30:26 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E4C3C10E21D
 for <dri-devel@lists.freedesktop.org>; Tue, 22 Mar 2022 20:30:23 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id A750A616B2
 for <dri-devel@lists.freedesktop.org>; Tue, 22 Mar 2022 20:30:19 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 16F76C340F0
 for <dri-devel@lists.freedesktop.org>; Tue, 22 Mar 2022 20:30:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1647981019;
 bh=nELZnAA37KjSHVkgxH+tCumfH5u9YyU3EHY/4c39GKE=;
 h=From:To:Subject:Date:From;
 b=WkD2S9nXyLiyRlKPfYMq99VLLvNP0QW7MZ3hme3s3lDYaCe5NXShXAQiPX5LBNGJK
 yHY+Mq4WXbNjw4mlDJS2GUc7rk0HhkKA5+WY2PqSn4Q3yMo+pLY2cMkiTOMxwdkN7J
 LxFpUDBQCuxQwxQxzW/t7xFmiq7MAvI6xB2wMn8p8/CrMgTWQRVux5jdgnUpG3ilsN
 UsgQp/Sx18hPz895qgFqeHdQKHE8YvIuQg7dvrxco8EHOApOFs0lZEOeCqeC07XbOg
 rLYLFuXsR57l0w8stwwfoUsULW3S58GCeCjEyksVLZha29ByHH5LrFW6W5tXA2SZzX
 TNyR1OX/VWy7w==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix,
 from userid 48) id EEE42C05FD6; Tue, 22 Mar 2022 20:30:18 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 215727] New: drm:amdgpu_job_timedout [amdgpu]] *ERROR* ring
 gfx_0.0.0 timeout when using firefox, chrome or icaclient
Date: Tue, 22 Mar 2022 20:30:18 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: new
X-Bugzilla-Watch-Reason: AssignedTo drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Video(DRI - non Intel)
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: high
X-Bugzilla-Who: scallar@poczta.fm
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: bug_id short_desc product version
 cf_kernel_version rep_platform op_sys cf_tree bug_status bug_severity
 priority component assigned_to reporter cf_regression attachments.created
Message-ID: <bug-215727-2300@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D215727

            Bug ID: 215727
           Summary: drm:amdgpu_job_timedout [amdgpu]] *ERROR* ring
                    gfx_0.0.0 timeout when using firefox, chrome or
                    icaclient
           Product: Drivers
           Version: 2.5
    Kernel Version: 5.16.15-arch1-1
          Hardware: Intel
                OS: Linux
              Tree: Mainline
            Status: NEW
          Severity: high
          Priority: P1
         Component: Video(DRI - non Intel)
          Assignee: drivers_video-dri@kernel-bugs.osdl.org
          Reporter: scallar@poczta.fm
        Regression: No

Created attachment 300599
  --> https://bugzilla.kernel.org/attachment.cgi?id=3D300599&action=3Dedit
Dmesg

Hi,

Symptoms:
I have installed an AMD Radeon RX 6700-XT card and started having following
random crashes when using a browser or icaclient (Citrix client):
[   85.861734] [drm:amdgpu_job_timedout [amdgpu]] *ERROR* ring gfx_0.0.0
timeout, signaled seq=3D13365, emitted seq=3D13367
[   85.862162] [drm:amdgpu_job_timedout [amdgpu]] *ERROR* Process informati=
on:
process kwin_x11 pid 819 thread kwin_x11:cs0 pid 838
Display hangs/ becomes glitched.

Steps to reproduce:
Happens randomly when using a browser (tested firefox and chrome-based) or
icaclient.
I get this error several times every day.
Happens in Xorg, also in Wayland.
Process mentioned in the error is not always window manager (kwin_x11).
Sometimes it's Xorg (or Xwayland), sometimes app (i.e. firefox).
System: Archlinux (linux-firmware 20220309.cd01f85-1)
DE: KDE 5.24.3 / mesa 21.3.7

Logs:
In this case of attached dmesg I was using kwin on Xorg and just started
firefox (hardware acceleration was on). Same thing happens when using icacl=
ient
(very frequent crashes, but hard to reproduce on demand).
Afterwards, i have also tried collecting gfx_0.0.0 data with umr:
umr -R gfx_0.0.0

This also resulted with crash:
[  171.047397] BUG: unable to handle page fault for address: ffffb34e820fff=
fc

(full log at the end of attached dmesg).

If you need additional data I can reproduce this error.

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
