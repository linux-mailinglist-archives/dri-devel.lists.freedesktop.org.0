Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 359D83C7479
	for <lists+dri-devel@lfdr.de>; Tue, 13 Jul 2021 18:27:30 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C661E6E0F4;
	Tue, 13 Jul 2021 16:27:26 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6582C6E0F4
 for <dri-devel@lists.freedesktop.org>; Tue, 13 Jul 2021 16:27:25 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPS id 367A1610C7
 for <dri-devel@lists.freedesktop.org>; Tue, 13 Jul 2021 16:27:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1626193645;
 bh=9p2WrANAeYv4z3tnII89s6QnNxdyQNqu/M9/8NQgmXs=;
 h=From:To:Subject:Date:From;
 b=WbsEhLrFTER2FRHR1Rc9WNp2PU6I3/gMsGyPXSKqkodKqUFuI8wbryGe4iTMD65fy
 WfvniAEKmde/Gx6xPG+s9su+EUUpmCudckI9M1QbXG8CNXFLR4yR/zNBZ2PgCUOZC/
 mg0o5GGrYd7nt1vgoe5jRfyzq5wVdKE5ZJ8sAuvLk0kaNrRAlXcLQJjRS6r2CetLVm
 1AKuddUWbqqXDEI63zZBqt54FTjtCwY92Vr4oVfYmOmAknPE7a6ox6D04gDQBhaiRF
 EwRF6rypvvjpO3eoQhR7nsdwdFfzxqkUhVv+LptItzsNXcS5m9NogU6MmbeqnqjwZt
 R8400B6IJdBuw==
Received: by pdx-korg-bugzilla-2.web.codeaurora.org (Postfix, from userid 48)
 id 279786120B; Tue, 13 Jul 2021 16:27:25 +0000 (UTC)
From: bugzilla-daemon@bugzilla.kernel.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 213715] New: failed to change brightness of HDR panel on AMD
 GREEN_SARDINE through aux
Date: Tue, 13 Jul 2021 16:27:24 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: new
X-Bugzilla-Watch-Reason: AssignedTo drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Video(DRI - non Intel)
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: blocking
X-Bugzilla-Who: mapengyu@gmail.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: bug_id short_desc product version
 cf_kernel_version rep_platform op_sys cf_tree bug_status bug_severity
 priority component assigned_to reporter cf_regression attachments.created
Message-ID: <bug-213715-2300@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D213715

            Bug ID: 213715
           Summary: failed to change brightness of HDR panel on AMD
                    GREEN_SARDINE through aux
           Product: Drivers
           Version: 2.5
    Kernel Version: 5.14.0-rc1+
          Hardware: All
                OS: Linux
              Tree: Mainline
            Status: NEW
          Severity: blocking
          Priority: P1
         Component: Video(DRI - non Intel)
          Assignee: drivers_video-dri@kernel-bugs.osdl.org
          Reporter: mapengyu@gmail.com
        Regression: No

Created attachment 297819
  --> https://bugzilla.kernel.org/attachment.cgi?id=3D297819&action=3Dedit
dmesg

HW: ThinkPad P14s gen 2a
CPU: AMD Ryzen 7 PRO 5850U with Radeon Graphics
Panel: BOE 2434 and  CSO 5127

brightness can't be controlled through AUX.
It works with parameter "amdgpu.backlight=3D0"

dmesg attached.

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
