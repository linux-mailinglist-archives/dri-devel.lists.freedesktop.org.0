Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E534648F0FA
	for <lists+dri-devel@lfdr.de>; Fri, 14 Jan 2022 21:29:52 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0C6CA10E1E1;
	Fri, 14 Jan 2022 20:29:49 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1952910E1B3
 for <dri-devel@lists.freedesktop.org>; Fri, 14 Jan 2022 20:29:48 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 7A18C61F25
 for <dri-devel@lists.freedesktop.org>; Fri, 14 Jan 2022 20:29:47 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id E5396C36AEC
 for <dri-devel@lists.freedesktop.org>; Fri, 14 Jan 2022 20:29:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1642192186;
 bh=KBP/UT5BsJfMfjI10zrMXOS0otTl6SMfw8nAur8uekE=;
 h=From:To:Subject:Date:In-Reply-To:References:From;
 b=HyzczagSPinMEGOwTZfTs9azdKp2DKf5cDNZjv2YexeGGF4NJU5N5ORM9Ny28aLlx
 9Y1Rp8adh9tUSEUkscdOiC9TzFeskHjvLK6+vqmEGmSDRASUxdIS4l1e+JoDvNR20J
 8KQNqBxtASRQvGMOLNwxjioYl1xHETyDEOUCvmz2BJIHwR2pAHVW8PMpvY8ddvntbp
 LBZ2hpIWRY/s7+ESLWzt7VOglgec7c+S9DJTE7w8dUSjeFdw+5Zlwn9o54JAxjV5kU
 nOiV9P0VtHA/vFwC2XWD/yDtChJS5HYiWPBrKCUzZ7Sybps8QISmmREwMyrMx8Bi1h
 spKSSQH94TdOg==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix,
 from userid 48) id C6049CC13AA; Fri, 14 Jan 2022 20:29:46 +0000 (UTC)
From: bugzilla-daemon@bugzilla.kernel.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 215494] [radeon, rv370] Running piglit
 shaders@glsl-vs-raytrace-bug26691 test causes hard lockup & reboot
Date: Fri, 14 Jan 2022 20:29:46 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Video(DRI - non Intel)
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: alexdeucher@gmail.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-215494-2300-r2xpnNA2An@https.bugzilla.kernel.org/>
In-Reply-To: <bug-215494-2300@https.bugzilla.kernel.org/>
References: <bug-215494-2300@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D215494

--- Comment #3 from Alex Deucher (alexdeucher@gmail.com) ---
This is more likely a mesa bug.  I'd suggest filing a bug there:
https://gitlab.freedesktop.org/groups/mesa/-/issues
and closing this one.

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
