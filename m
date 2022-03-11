Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 228644D6669
	for <lists+dri-devel@lfdr.de>; Fri, 11 Mar 2022 17:34:29 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4494D10E2DD;
	Fri, 11 Mar 2022 16:34:25 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 00D1510E243
 for <dri-devel@lists.freedesktop.org>; Fri, 11 Mar 2022 16:34:22 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 9BA76B80EA6
 for <dri-devel@lists.freedesktop.org>; Fri, 11 Mar 2022 16:34:21 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 4A266C340F4
 for <dri-devel@lists.freedesktop.org>; Fri, 11 Mar 2022 16:34:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1647016460;
 bh=CDfdyCjINHWg4GmgIOmL+OWy1Emf7xSG2iQSt1bU2uw=;
 h=From:To:Subject:Date:In-Reply-To:References:From;
 b=nfOW78WfH1PSEPqX3xbenlmJfn7ZxDUT/+aZXzTZHZ2mvbsJV+CHekq2O2GVMX1ey
 0Ldthwwrak4kqILVnMSwSrIoaUIdMm3btXtfcWpbzyBQw3QTmPDAFY94zV+FtNxjpD
 Wu0Z1q4/+FXvLAgEiTvoTk6RACMf0JpnA9ZxoJHB6BSox4rgGzX2rUGlWiNM4+6xGz
 tIid0ViGHrHJ5XHxALDiIPSeRr/r+Us/OThi7dLQX2qwIlbS5L07NdsvwOOOWdQUQc
 SshxxGG3oLuXNh6Zmfl+I0EQoH8BloKigpNu6pfg7tsiRe4fSNgO8DfZt7v2NECZDe
 9iQwUPwAXK9nQ==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix,
 from userid 48) id 233FBC05FF5; Fri, 11 Mar 2022 16:34:20 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 215648] amdgpu: Changing monitor configuration
 (plug/unplug/wake from DPMS) causes kernel panic
Date: Fri, 11 Mar 2022 16:34:19 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Video(DRI - non Intel)
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: pr_kernel@tum.fail
X-Bugzilla-Status: RESOLVED
X-Bugzilla-Resolution: UNREPRODUCIBLE
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: bug_status resolution
Message-ID: <bug-215648-2300-hdjEFDwr43@https.bugzilla.kernel.org/>
In-Reply-To: <bug-215648-2300@https.bugzilla.kernel.org/>
References: <bug-215648-2300@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D215648

Philipp Riederer (pr_kernel@tum.fail) changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
             Status|NEW                         |RESOLVED
         Resolution|---                         |UNREPRODUCIBLE

--- Comment #6 from Philipp Riederer (pr_kernel@tum.fail) ---
I can no longer reproduce this issue with 5.16.14.

Sorry for the noise.

Regards,
Philipp

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
