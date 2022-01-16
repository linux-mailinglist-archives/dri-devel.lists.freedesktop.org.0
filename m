Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 3C62348FEBF
	for <lists+dri-devel@lfdr.de>; Sun, 16 Jan 2022 21:09:11 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7F3C010E71F;
	Sun, 16 Jan 2022 20:09:06 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D76BA10E71F
 for <dri-devel@lists.freedesktop.org>; Sun, 16 Jan 2022 20:09:04 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 6DE9860FD1
 for <dri-devel@lists.freedesktop.org>; Sun, 16 Jan 2022 20:09:02 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id B670CC36AEC
 for <dri-devel@lists.freedesktop.org>; Sun, 16 Jan 2022 20:09:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1642363741;
 bh=dKIWJh+iB1L1St7UC7N6blVZz9ioeOmLiCMMZ5zFk0s=;
 h=From:To:Subject:Date:In-Reply-To:References:From;
 b=Hw2uBjUdv2uBZqRtHuaWys0dtFyXQSSsPT5/F1nUeDO0iMEhHSl7V9vWmAmhphbrd
 sNgniqj90lGOdrAtROWQUJgzUb0F1tMfz7VwJl+zYq+rDm/GcrsVrnF9eJ5XcLQUih
 6Owjg4x4j7CEBrLG3AfR81Qgbws15k6DhZKxyTC1dV6bRpfN+4C3A8MT17ykF/mE9m
 wQBs5P3n7y4VDtV5KeM8x7yYP0y1JZiexmYNzRHy9enpaV05ufsQi1GT9jnU3BWYoi
 Max46Y+4r7jqJcj0CoCTdB8qGRSSePSJBTemcYWWwEcqQuzP1qdHHZUsjKAL2Gr9Sc
 O62aKkl+HfNag==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix,
 from userid 48) id 92DF0CC13AF; Sun, 16 Jan 2022 20:09:01 +0000 (UTC)
From: bugzilla-daemon@bugzilla.kernel.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 215499] AMDGPU: Tahiti flagged as "[drm] Unsupported asic. 
 Remove me when IP discovery init is in place."
Date: Sun, 16 Jan 2022 20:09:01 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Video(DRI - non Intel)
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: alexandre.f.demers@gmail.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-215499-2300-xf6tNnenkW@https.bugzilla.kernel.org/>
In-Reply-To: <bug-215499-2300@https.bugzilla.kernel.org/>
References: <bug-215499-2300@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D215499

--- Comment #1 from Alexandre Demers (alexandre.f.demers@gmail.com) ---
Also, the kernel provided by ArchLinux is built with CONFIG_DRM_AMDGPU_SI=
=3Dy

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
