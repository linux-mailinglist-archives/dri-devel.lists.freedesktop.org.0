Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 197ACB2F2D9
	for <lists+dri-devel@lfdr.de>; Thu, 21 Aug 2025 10:52:43 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 71CB510E8A4;
	Thu, 21 Aug 2025 08:52:41 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="ZSwrzDVr";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 26ADE10E8A4
 for <dri-devel@lists.freedesktop.org>; Thu, 21 Aug 2025 08:52:40 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id 47DA361138
 for <dri-devel@lists.freedesktop.org>; Thu, 21 Aug 2025 08:52:39 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id F3D72C4CEEB
 for <dri-devel@lists.freedesktop.org>; Thu, 21 Aug 2025 08:52:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1755766359;
 bh=urcX9SPXOz2UVMG3mqDWxnU7OSy7AEEt3CAIMN1nfnI=;
 h=From:To:Subject:Date:In-Reply-To:References:From;
 b=ZSwrzDVreuo4VUv6+rhyKb0aNXNyqB8FQc54jNSv9MUgl/pJadLXktWTPRsmDmF7v
 D8AgHUCtdDmweb/c/iwpZlAxt7VrFRywblUBOjr0WuTT+N5dH8r1NuFDDxu114p9Eg
 5SmGCxc8YBIkVeoFIvS1r2SGpGRLyCeqfP8uPUkgRzAgQLQnIDrtJH0WeI/pQQ4q3C
 +eHYhZMVLtK+xVNoz0VS//DMov1xxytccNiZzyKSvuuj2JN/bZbrAPejZ869BbtwU2
 0mz3ikazMmzVZ+p0dvS6FZRv+3CSTdpmxSlfQJYdzDgXbCUs0gEWJOPFtW7nrk0Or2
 ZfV0jtkC7MABQ==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix,
 from userid 48) id E7DC8C53BC7; Thu, 21 Aug 2025 08:52:38 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 206309] Experimental amdgpu w/ Dell E6540 with HD 8790M (MARS
 XTX), massive performance improvement after ACPI suspend
Date: Thu, 21 Aug 2025 08:52:38 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Video(DRI - non Intel)
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: low
X-Bugzilla-Who: qfjyfq3e38@wyoxafp.com
X-Bugzilla-Status: RESOLVED
X-Bugzilla-Resolution: WILL_NOT_FIX
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: cc
Message-ID: <bug-206309-2300-UzovQkQtx5@https.bugzilla.kernel.org/>
In-Reply-To: <bug-206309-2300@https.bugzilla.kernel.org/>
References: <bug-206309-2300@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D206309

Gerald Boyle (qfjyfq3e38@wyoxafp.com) changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
                 CC|                            |qfjyfq3e38@wyoxafp.com

--- Comment #7 from Gerald Boyle (qfjyfq3e38@wyoxafp.com) ---
Wow, this sounds like a real nightmare! On Linux my AMD FirePro also drops
clocks to idle as soon as I unplug, even under load, while on Windows 8.1 it
works perfectly. Link:
https://patchwork.freedesktop.org/patch/msgid/20221024212634.27230-1-luben.=
tuikov@amd.com
https://geometrydashworld.net The only semi-reliable workaround I found is
booting plugged in, forcing high performance, then hoping it sticks after
unplugging, but it=E2=80=99s unreliable, heats up the laptop, and drains th=
e battery
fast. Definitely makes using the laptop for heavy GPU work a constant worry.

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
