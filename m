Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 24E9AA94A88
	for <lists+dri-devel@lfdr.de>; Mon, 21 Apr 2025 03:47:32 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B574910E1A1;
	Mon, 21 Apr 2025 01:47:28 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="A9sbPhpq";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0163E10E1A1
 for <dri-devel@lists.freedesktop.org>; Mon, 21 Apr 2025 01:47:27 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id 51C224A541
 for <dri-devel@lists.freedesktop.org>; Mon, 21 Apr 2025 01:47:21 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 95F60C4CEE2
 for <dri-devel@lists.freedesktop.org>; Mon, 21 Apr 2025 01:47:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1745200042;
 bh=p+bEU+P7S1f9wt9RIR4bNp17KBDjxZ4D5U/yUpn19JE=;
 h=From:To:Subject:Date:From;
 b=A9sbPhpq0ErL6HpuXhQz/Kb1T9Eu7TO1S849kEBtf8eoDH0AJeBhfKT0bCQrlEfNl
 SvgPz+lPONSMFnAYQB2TjHXH1ZyTEFduxNOL+Eam0847jj2UBVCa33P82DRek5cmCd
 0cXQjGqCjBaO0IYYYm6b7KFJtPmTqCdR1hvX8H6LzIEG2UXH5kdMLZ8oSU6mDAdi1f
 79XYlVnHH4Y0gITQU/vtn2FQwoAUBy9wlciY/Eyb41wqEhTEsnCQF8CCG19EbgiVsi
 s+nDNHESueTzB1OA9tSfzK/Qscxb+0qH3+wtgPE+YVZrSB06WFYx1QTzgkALdOEhHF
 xyfLDr1qgcYJQ==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix,
 from userid 48) id 8FBFDC41612; Mon, 21 Apr 2025 01:47:22 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 220041] New: Frequent freezes in amdgpu with 6.14.3 kernel.
Date: Mon, 21 Apr 2025 01:47:22 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: new
X-Bugzilla-Watch-Reason: AssignedTo drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Video(DRI - non Intel)
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: arichter1337@gmail.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P3
X-Bugzilla-Assigned-To: drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: bug_id short_desc product version rep_platform
 op_sys bug_status bug_severity priority component assigned_to reporter
 cf_regression
Message-ID: <bug-220041-2300@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D220041

            Bug ID: 220041
           Summary: Frequent freezes in amdgpu with 6.14.3 kernel.
           Product: Drivers
           Version: 2.5
          Hardware: AMD
                OS: Linux
            Status: NEW
          Severity: normal
          Priority: P3
         Component: Video(DRI - non Intel)
          Assignee: drivers_video-dri@kernel-bugs.osdl.org
          Reporter: arichter1337@gmail.com
        Regression: No

While playing GOG DOOM 2016, the game has very frequent freezes when using =
the
6.14.3 kernel, 6.14.1 and 6.14.2 do not have this issue.=20=20

The message "[drm] Fence fallback timer expired on ring comp_1.1.1" appears
from "dmesg".=20=20

Kernel 6.14.3, mesa 25.0.4, firmware 20250311.  Distribution Mageia cauldro=
n.

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
