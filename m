Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 471C0399A94
	for <lists+dri-devel@lfdr.de>; Thu,  3 Jun 2021 08:22:52 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E53E46E512;
	Thu,  3 Jun 2021 06:22:49 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 21A976E512
 for <dri-devel@lists.freedesktop.org>; Thu,  3 Jun 2021 06:22:48 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPS id EABFD613E6
 for <dri-devel@lists.freedesktop.org>; Thu,  3 Jun 2021 06:22:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1622701368;
 bh=f3RvVziYaawk1su64dJ14hE9cUPLpSFEbYw2SukNDeA=;
 h=From:To:Subject:Date:From;
 b=JF4rphV6pQ8mg71R3Ccrezc5puoNAIQhl9ch3U2kJZpasNHXNtsJUKisRbKxAVxKA
 j8DFyNnxquoiMJNs/4T6X5zL38USnf5/mUs6Q0M0sQR7+gwgDrXoQjMiPC4/27AI8p
 x8Zk3lYwZvzRVy0AjiqLiqFQQ+FYRLxgD/Wq7K78bzS94K57XinnShrMxKUmTo3tvA
 fXoUr2gQMdL5XRbDAcoSFhAwvAeLat3r4c/ps/ai8V1bo8Yqr5+1b41Xv+hKdtJS6i
 Y3eff7BRxmgEWMKrHsMecrVkPbxNTyC0cdhIB6s/NcifUaEc2JlqV5CvQ7Qw0+Qi23
 KU5K8JE2UvZwQ==
Received: by pdx-korg-bugzilla-2.web.codeaurora.org (Postfix, from userid 48)
 id E14A261206; Thu,  3 Jun 2021 06:22:47 +0000 (UTC)
From: bugzilla-daemon@bugzilla.kernel.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 213321] New: Laptop not waking from sleep
Date: Thu, 03 Jun 2021 06:22:47 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: new
X-Bugzilla-Watch-Reason: AssignedTo drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Video(DRI - non Intel)
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: high
X-Bugzilla-Who: sujay1844@protonmail.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: bug_id short_desc product version
 cf_kernel_version rep_platform op_sys cf_tree bug_status bug_severity
 priority component assigned_to reporter cf_regression attachments.created
Message-ID: <bug-213321-2300@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D213321

            Bug ID: 213321
           Summary: Laptop not waking from sleep
           Product: Drivers
           Version: 2.5
    Kernel Version: 5.12.8-arch1-1
          Hardware: All
                OS: Linux
              Tree: Mainline
            Status: NEW
          Severity: high
          Priority: P1
         Component: Video(DRI - non Intel)
          Assignee: drivers_video-dri@kernel-bugs.osdl.org
          Reporter: sujay1844@protonmail.com
        Regression: No

Created attachment 297123
  --> https://bugzilla.kernel.org/attachment.cgi?id=3D297123&action=3Dedit
System information

My laptop doesn't wake up from sleep. Interestingly, it wakes up once. The =
next
time I close and open it, I get a black screen. I have no other choice but =
to
restart the computer. I have uploaded logs of dmesg, journalctl and my syst=
em
information. The log is filled with the following line.
> amdgpu: Msg issuing pre-check failed and SMU may be not in the right stat=
e!
I run Arch linux. Kernel version 5.12.8-arch1-1.

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
