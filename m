Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 3C2317F1BDB
	for <lists+dri-devel@lfdr.de>; Mon, 20 Nov 2023 19:01:10 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6A1DF10E0D1;
	Mon, 20 Nov 2023 18:01:05 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from ams.source.kernel.org (ams.source.kernel.org
 [IPv6:2604:1380:4601:e00::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E2A1C10E0D1
 for <dri-devel@lists.freedesktop.org>; Mon, 20 Nov 2023 18:01:02 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by ams.source.kernel.org (Postfix) with ESMTP id 37B73B81983
 for <dri-devel@lists.freedesktop.org>; Mon, 20 Nov 2023 18:01:01 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 92D79C433C7
 for <dri-devel@lists.freedesktop.org>; Mon, 20 Nov 2023 18:01:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1700503260;
 bh=LW3ol+zaRVYW/IJrJee4ZkY3G0g9XPJ6GBAQmNnQSw0=;
 h=From:To:Subject:Date:In-Reply-To:References:From;
 b=lljmyAiqAboAK4E0Y6Rolz5O8MmcPzhdO0pXP20e7+eu/LXYJzEUsoLecmUMvOlZM
 NN56s2opglaPEArQJE2R8XCYojylHHZ9UGQaSxI/xacCRXYt0aQsT5a03Hx76Rb5ny
 dh6gaZdSYRQy1w1Kf0meqpA1Tn58Ni4EAyLosO+itZuI+310fRifvrDRBbfucYKB+8
 U8CL569qDw6TqjfxEwrL4Xt7GSr6qVJEePUbKkeRfmbaEr27bYW3Bk1IlHyim/C+Ma
 9cM/ElpkNqnzJKSK7rpmUOdF3BJJaQigeE/THaT7CgbY0oq8Ydzt1QzInGpY6P5JLA
 4JPbxukXHemUg==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix,
 from userid 48) id 7A480C53BD0; Mon, 20 Nov 2023 18:01:00 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 218168] amdgpu: kfd_topology.c warning: the frame size of 1408
 bytes is larger than 1024 bytes
Date: Mon, 20 Nov 2023 18:01:00 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Video(DRI - non Intel)
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: aros@gmx.com
X-Bugzilla-Status: RESOLVED
X-Bugzilla-Resolution: ANSWERED
X-Bugzilla-Priority: P3
X-Bugzilla-Assigned-To: drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: bug_status resolution
Message-ID: <bug-218168-2300-vj3IohLNCT@https.bugzilla.kernel.org/>
In-Reply-To: <bug-218168-2300@https.bugzilla.kernel.org/>
References: <bug-218168-2300@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D218168

Artem S. Tashkinov (aros@gmx.com) changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
             Status|NEW                         |RESOLVED
         Resolution|---                         |ANSWERED

--- Comment #2 from Artem S. Tashkinov (aros@gmx.com) ---
Please report here:

https://gitlab.freedesktop.org/drm/amd/-/issues

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
