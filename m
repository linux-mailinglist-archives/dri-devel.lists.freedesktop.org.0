Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 48358A95C89
	for <lists+dri-devel@lfdr.de>; Tue, 22 Apr 2025 05:14:34 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9C13910E044;
	Tue, 22 Apr 2025 03:14:31 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="Wim4GYVO";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from nyc.source.kernel.org (nyc.source.kernel.org [147.75.193.91])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0431910E044
 for <dri-devel@lists.freedesktop.org>; Tue, 22 Apr 2025 03:14:31 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by nyc.source.kernel.org (Postfix) with ESMTP id E709EA4B5F5
 for <dri-devel@lists.freedesktop.org>; Tue, 22 Apr 2025 03:09:01 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id AF333C4CEEC
 for <dri-devel@lists.freedesktop.org>; Tue, 22 Apr 2025 03:14:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1745291669;
 bh=9lda5TQ/dBynWxjRUahK2tulLMCN9FN8P6LA1vo3QCM=;
 h=From:To:Subject:Date:From;
 b=Wim4GYVOfTLT/5QEvAnwOd7qXztred7dPfXrY4epltyo5mtW8sLIGdcbJPt1KYLa+
 NuSFTHjnaVBJGF4v56E62cPerPBz/M7g4jQqp1k6NQkXlyFpnX3sLWT/hM0oy4rkBk
 P2Qs5pPcLh22XKVM5WAhFptjAaYQMnEFS7hLPlV+Iy8odUIU4P1K7KTiVsA+sKKEW+
 fj05y6fUZImz2ON6MYtpFOXZsdUUZI/+npkjIlJLdaWXI6BulWnDrDvpkVSxhdebMm
 jWZhr3ZMJDmdyIzaZFL/xr/jXLesON7f+tlQEWbAQgSz3lmskQEEyriXY4nTIi6hBs
 vNqcQsMgt8mBQ==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix,
 from userid 48) id 8FC69C4160E; Tue, 22 Apr 2025 03:14:29 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 220043] New: Geforce 210 video does not work with nouveau
 drivers in 6.14.0 and later.
Date: Tue, 22 Apr 2025 03:14:29 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: new
X-Bugzilla-Watch-Reason: AssignedTo drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Video(DRI - non Intel)
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: high
X-Bugzilla-Who: nanook@eskimo.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P3
X-Bugzilla-Assigned-To: drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: bug_id short_desc product version rep_platform
 op_sys bug_status bug_severity priority component assigned_to reporter
 cf_regression
Message-ID: <bug-220043-2300@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D220043

            Bug ID: 220043
           Summary: Geforce 210 video does not work with nouveau drivers
                    in 6.14.0 and later.
           Product: Drivers
           Version: 2.5
          Hardware: All
                OS: Linux
            Status: NEW
          Severity: high
          Priority: P3
         Component: Video(DRI - non Intel)
          Assignee: drivers_video-dri@kernel-bugs.osdl.org
          Reporter: nanook@eskimo.com
        Regression: No

One machine in which I have an old nVideo geforce 210 video card, upon
upgrading from 6.13.6, does not have video, other machines with different
nVidia cards and nouveau are working but thie Geforce 210 does not work,  It
does work on a 6.13.6 kernel.

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
