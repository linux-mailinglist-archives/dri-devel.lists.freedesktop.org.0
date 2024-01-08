Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A0E0F827A58
	for <lists+dri-devel@lfdr.de>; Mon,  8 Jan 2024 22:43:28 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2E45C10E314;
	Mon,  8 Jan 2024 21:43:25 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1A74A10E314
 for <dri-devel@lists.freedesktop.org>; Mon,  8 Jan 2024 21:43:24 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by ams.source.kernel.org (Postfix) with ESMTP id 735E7B8188F
 for <dri-devel@lists.freedesktop.org>; Mon,  8 Jan 2024 21:43:22 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id C6086C43394
 for <dri-devel@lists.freedesktop.org>; Mon,  8 Jan 2024 21:43:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1704750201;
 bh=EPpY33XcKl2zf8MSh5K05cwD024QTjWcwlr38TW8qMA=;
 h=From:To:Subject:Date:In-Reply-To:References:From;
 b=BRfcZJ1i7z7j2yQFjWvUGWN97JAsqsRxss7rVEOA5Dvmp23W1NgViAxpBK7ofVLt+
 OK5x+vcLZorPv6RDvIZDwMgghwQCHhbLiR5F3rW+R/ZytYgIoG6TkevEvO7Mwkmc7K
 jBkLSRktdQrBtRRFyCw9NorflkFWmATda1X2UJgBdWiRXdSyUqD+LHyMqC5Bdbpcpm
 6og64BQXi5W0UwMhTmFnQ7NIS0vy/ICe5dsOGgiQugfq2EaNG7M9YUtg/RUl9W/eAS
 xdVoyXrgBvHmUS80lzzDRS2Q3RXnLNVfYT33BxEZ/MEFGIi8DREQeLyk5g6LKLUPOa
 pnn5ZuKirPJzQ==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix,
 from userid 48) id ADC38C53BD2; Mon,  8 Jan 2024 21:43:21 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 218347] Crash. amdgpu : drm:amdgpu_cs_ioctl : Failed to
 initialize parser -125
Date: Mon, 08 Jan 2024 21:43:21 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Video(DRI - non Intel)
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: blocking
X-Bugzilla-Who: alexdeucher@gmail.com
X-Bugzilla-Status: RESOLVED
X-Bugzilla-Resolution: ANSWERED
X-Bugzilla-Priority: P3
X-Bugzilla-Assigned-To: drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: cc
Message-ID: <bug-218347-2300-H3nLbuchIJ@https.bugzilla.kernel.org/>
In-Reply-To: <bug-218347-2300@https.bugzilla.kernel.org/>
References: <bug-218347-2300@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D218347

Alex Deucher (alexdeucher@gmail.com) changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
                 CC|                            |alexdeucher@gmail.com

--- Comment #4 from Alex Deucher (alexdeucher@gmail.com) ---
(In reply to Rik from comment #3)
> Are you sure? Because in the help I read:

Yes, per:
https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/MAI=
NTAINERS#n18009

RADEON and AMDGPU DRM DRIVERS
M:      Alex Deucher <alexander.deucher@amd.com>
M:      Christian K=C3=B6nig <christian.koenig@amd.com>
M:      Pan, Xinhui <Xinhui.Pan@amd.com>
L:      amd-gfx@lists.freedesktop.org
S:      Supported
B:      https://gitlab.freedesktop.org/drm/amd/-/issues
C:      irc://irc.oftc.net/radeon
T:      git https://gitlab.freedesktop.org/agd5f/linux.git
F:      Documentation/gpu/amdgpu/
F:      drivers/gpu/drm/amd/
F:      drivers/gpu/drm/ci/xfails/amd*
F:      drivers/gpu/drm/radeon/
F:      include/uapi/drm/amdgpu_drm.h
F:      include/uapi/drm/radeon_drm.h

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
