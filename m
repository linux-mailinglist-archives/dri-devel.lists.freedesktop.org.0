Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C8C7B37785A
	for <lists+dri-devel@lfdr.de>; Sun,  9 May 2021 22:01:49 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E3E286E239;
	Sun,  9 May 2021 20:01:46 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 19AF56E239
 for <dri-devel@lists.freedesktop.org>; Sun,  9 May 2021 20:01:46 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPS id BA65960FF2
 for <dri-devel@lists.freedesktop.org>; Sun,  9 May 2021 20:01:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1620590505;
 bh=8Mp9QAAuGCYDodcneDGG6vuJu4jrx27DQnXGl4YbfMM=;
 h=From:To:Subject:Date:From;
 b=EzICYJCSGnfiFSPEbEboT6F8A6Rf99dgKt+d6ncZ/8QkFRDXmetN2ijdQI6onHfEe
 2bVT/BA0ayXOuW7AyZM0wGGaQ/w8iigQvkraPrOtN17gxgz/XDYXbyTqYEoQcmQale
 pAg9phIiPAB2By+9nNJuXClZstinvGDS89kt8A7vXI5u/b/Gopkszs9IF5NjMW3Sm6
 Hf40fNenx2fkRKUjnoVBwJPwHSfRK5i0+/KXMeROs3+KgQ4y4jQZ3fLN+/YPHm2TAi
 VVbMHFo6VdWXWANun6v2aIkpYcGm4HnAg9ualw6W6tVQLKTI4dFtLLzCvWaudONhI7
 ampnztKMX1Oig==
Received: by pdx-korg-bugzilla-2.web.codeaurora.org (Postfix, from userid 48)
 id ABC8E610E6; Sun,  9 May 2021 20:01:45 +0000 (UTC)
From: bugzilla-daemon@bugzilla.kernel.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 213007] New: [drm:amdgpu_job_run [amdgpu]] *ERROR* Error
 scheduling IBs (-22)
Date: Sun, 09 May 2021 20:01:45 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: new
X-Bugzilla-Watch-Reason: AssignedTo drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Video(DRI - non Intel)
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: naterussell83@gmail.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: bug_id short_desc product version
 cf_kernel_version rep_platform op_sys cf_tree bug_status bug_severity
 priority component assigned_to reporter cf_regression attachments.created
Message-ID: <bug-213007-2300@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D213007

            Bug ID: 213007
           Summary: [drm:amdgpu_job_run [amdgpu]] *ERROR* Error scheduling
                    IBs (-22)
           Product: Drivers
           Version: 2.5
    Kernel Version: 5.10.33
          Hardware: All
                OS: Linux
              Tree: Mainline
            Status: NEW
          Severity: normal
          Priority: P1
         Component: Video(DRI - non Intel)
          Assignee: drivers_video-dri@kernel-bugs.osdl.org
          Reporter: naterussell83@gmail.com
        Regression: No

Created attachment 296699
  --> https://bugzilla.kernel.org/attachment.cgi?id=3D296699&action=3Dedit
[drm:amdgpu_job_run [amdgpu]] *ERROR* Error scheduling IBs (-22)

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
