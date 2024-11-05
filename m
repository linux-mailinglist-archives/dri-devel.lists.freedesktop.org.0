Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3CF389BCA66
	for <lists+dri-devel@lfdr.de>; Tue,  5 Nov 2024 11:24:49 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A691A10E2CC;
	Tue,  5 Nov 2024 10:24:47 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="ONdOzrfB";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5F2D310E2CC
 for <dri-devel@lists.freedesktop.org>; Tue,  5 Nov 2024 10:24:46 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 17A0E5C2DF4
 for <dri-devel@lists.freedesktop.org>; Tue,  5 Nov 2024 10:24:01 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 8C288C4CED1
 for <dri-devel@lists.freedesktop.org>; Tue,  5 Nov 2024 10:24:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1730802285;
 bh=AJBC6FlJ7kGJiAuTmlBQt7p88YbSTE/z+RSrrofDqF0=;
 h=From:To:Subject:Date:In-Reply-To:References:From;
 b=ONdOzrfB4NycO148d1C9AhnbXLZlKY/azRKFyYEy6PRwaUWxkO6lzYbDi1rIufbmz
 /8Rbpfxak4HIqJwld9DMY28W4HNefANOFdjrXWH8z1omrih98fSs3h5aPWXMAEznip
 TwUrjjWHwU8GBxBpIJk3NmLYAg15wwEWL9osUCL8Xup/GaWroHaQ+6zOOiYbJl7tcV
 JmJZVPauSA9gv7Z0cupembW0kYM3aNpjm5Hmz0gLMPo+r/qlf6KlNP6H9AXyLKLKcz
 /oXYgxmXrszjfAg6N6Z9F0OIO1rwHwDOGio4JD/ejeaqFfmkBt7mwOVy1Na3L2ePqq
 9jn33heKai+ug==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix,
 from userid 48) id 845F8C53BC5; Tue,  5 Nov 2024 10:24:45 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 219468] Screen flickering on Radeon 680M - 6.12
Date: Tue, 05 Nov 2024 10:24:45 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Video(DRI - non Intel)
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: low
X-Bugzilla-Who: leejm516@gmail.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P3
X-Bugzilla-Assigned-To: drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: attachments.created
Message-ID: <bug-219468-2300-Ij2IEUG9Fi@https.bugzilla.kernel.org/>
In-Reply-To: <bug-219468-2300@https.bugzilla.kernel.org/>
References: <bug-219468-2300@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D219468

--- Comment #1 from Joungmin Lee (leejm516@gmail.com) ---
Created attachment 307142
  --> https://bugzilla.kernel.org/attachment.cgi?id=3D307142&action=3Dedit
kernel configuration

kernel config

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
