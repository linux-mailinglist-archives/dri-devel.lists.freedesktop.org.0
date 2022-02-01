Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3A0494A5AFA
	for <lists+dri-devel@lfdr.de>; Tue,  1 Feb 2022 12:15:51 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7F86D10E50A;
	Tue,  1 Feb 2022 11:15:49 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 09C5B10E50A
 for <dri-devel@lists.freedesktop.org>; Tue,  1 Feb 2022 11:15:48 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id E22ED60F66
 for <dri-devel@lists.freedesktop.org>; Tue,  1 Feb 2022 11:15:33 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id EAC6AC340ED
 for <dri-devel@lists.freedesktop.org>; Tue,  1 Feb 2022 11:15:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1643714132;
 bh=2LmZKSDe4aGmv0pJKCrZ9MKro6mqZByCXowZrodbw4c=;
 h=From:To:Subject:Date:From;
 b=ML+CodYixxeMQQlpyA+Q2V516xdEGpNAzKVcsOhxS9Q0sVQYndJktmfvxHxmrQ3yx
 gQ6UmvbWnwZGnOYt4IHktD5bf5JtHUazMCkGm899aP+Rkbrcm6n3UY/mplGKaljE6K
 0e2d5jOi7CsFh0S+hepx90AE0HPJvoFOTGIVxNSL07xvVRcQb4SbXpXLsJljkbdJQ5
 GFbmBnstkWlrD8iBOBYN9Zs9h9UC+YjdT0COnjesfaNbDQ/12GFs/c29AeK2TyzQ7o
 s/6UBgwD2HqparAlrw3D1a2bJdmiGNvbaGeGwD4AkKCRyFliK2Vls5cQ+dQuGDb6oi
 U7QtnMAoR+HYA==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix,
 from userid 48) id CD2CFC05FD5; Tue,  1 Feb 2022 11:15:31 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 215558] New: amdgpu driver sometimes crashes when playing games
Date: Tue, 01 Feb 2022 11:15:31 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: new
X-Bugzilla-Watch-Reason: AssignedTo drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Video(DRI - non Intel)
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: smoenig@uni-bremen.de
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: bug_id short_desc product version
 cf_kernel_version rep_platform op_sys cf_tree bug_status bug_severity
 priority component assigned_to reporter cf_regression attachments.created
Message-ID: <bug-215558-2300@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D215558

            Bug ID: 215558
           Summary: amdgpu driver sometimes crashes when playing games
           Product: Drivers
           Version: 2.5
    Kernel Version: 5.15
          Hardware: All
                OS: Linux
              Tree: Mainline
            Status: NEW
          Severity: normal
          Priority: P1
         Component: Video(DRI - non Intel)
          Assignee: drivers_video-dri@kernel-bugs.osdl.org
          Reporter: smoenig@uni-bremen.de
        Regression: No

Created attachment 300371
  --> https://bugzilla.kernel.org/attachment.cgi?id=3D300371&action=3Dedit
logs and pictures of screen output

Sometimes, when I play games like Counter Strike - Global Offensive (Native,
Steam), or League of Legends (via WINE), my system crashes, resulting in
distorted colour output, but the mouse cursor still moves, but I cannot
interact with any GUI-component or switch to TTY.

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
