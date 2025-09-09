Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 741B6B50863
	for <lists+dri-devel@lfdr.de>; Tue,  9 Sep 2025 23:47:53 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4ECA510E086;
	Tue,  9 Sep 2025 21:47:50 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="HrL4c1e1";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EE56510E086
 for <dri-devel@lists.freedesktop.org>; Tue,  9 Sep 2025 21:47:49 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id 87F13440FF
 for <dri-devel@lists.freedesktop.org>; Tue,  9 Sep 2025 21:47:49 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 651B1C4CEF4
 for <dri-devel@lists.freedesktop.org>; Tue,  9 Sep 2025 21:47:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1757454469;
 bh=L3EzYflbSKeP116Cjj4UFrUckUZmNN/VEqjQBjHAUHU=;
 h=From:To:Subject:Date:In-Reply-To:References:From;
 b=HrL4c1e1XdIek2hxVOwAYFP5/WTHv9M3Ukg7AhhbCKlxAh6XFbClXuA6JhWpbOYOC
 qINpRRKgSxTk3s4MqdjnWymdtpDDkSph1qy0mTZ5ao71iw7p3AiGjH8PgN5fslmc6d
 rReXJht6lkmC50HEpvslUiGEZXApElTB1sz7oKgYOJa3YkJXexCU8PqpDMo23dNPZs
 7VHnVjHv9kflbI9yOZBzTaJ7fuj1Srkl6s3DIVl0PmEUQlfxVNIJyi+HZ4Z87rvqsv
 yWGXFmjNX0oW/UyAF1jKnL+H7J6qcTz1RCNlFFR3N0hjDCHviqem8UACdzQhhxc234
 3BDYjTVnCn5rA==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix,
 from userid 48) id 5BD30C41612; Tue,  9 Sep 2025 21:47:49 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 220554] Display powers off after every update.
Date: Tue, 09 Sep 2025 21:47:49 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Video(DRI - non Intel)
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: vicencb@gmail.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P3
X-Bugzilla-Assigned-To: drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-220554-2300-Ni82gJjMGE@https.bugzilla.kernel.org/>
In-Reply-To: <bug-220554-2300@https.bugzilla.kernel.org/>
References: <bug-220554-2300@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D220554

--- Comment #2 from vicencb@gmail.com ---
Bisection done. It took the whole day doing building kernels on an RK3399...

c9b1150a68d9362a0827609fc0dc1664c0d8bfe1

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
