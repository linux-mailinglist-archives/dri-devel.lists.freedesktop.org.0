Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C71D3B49B1D
	for <lists+dri-devel@lfdr.de>; Mon,  8 Sep 2025 22:32:31 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 249DD10E5CE;
	Mon,  8 Sep 2025 20:32:30 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="WWTssvmM";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A1FA010E5CE
 for <dri-devel@lists.freedesktop.org>; Mon,  8 Sep 2025 20:32:28 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id 904FC60051
 for <dri-devel@lists.freedesktop.org>; Mon,  8 Sep 2025 20:32:27 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 3F5C2C4CEF7
 for <dri-devel@lists.freedesktop.org>; Mon,  8 Sep 2025 20:32:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1757363547;
 bh=rkOn2dIZGwZCf9InNZJrjdEW0VLvsH0HqrJe6wnGwsg=;
 h=From:To:Subject:Date:In-Reply-To:References:From;
 b=WWTssvmMUsLI2ECnK+9z97SBnoDjEr+TGi87fpZDKKsxMs4PP78JgjS4ukfUtL2vY
 qqQk91l+ocWoA/O67AA28BiTxCd3WP7oIIGoPV6Nwih7UjZUL9Lz6FfUd0rkdHl8JD
 yiCX6xDZC1qXEqZwDgzFP4tqCOu0XwjBIYed3XQJqrWkb+uKzzNvXxTlkmL2wSU+E1
 dVW6+28ATjzvtHTt4I1AD795VwQaBKITituz9cFGk4qsAEm23wjkl7MO6VThSnGcqt
 uWFPHetWd/cLyxCs3mLTB2qgS3E7GTJEnci7V0jP0CcvFR7j5Lmgzpcj3llEQsTsup
 WEiHaLKcG4GBw==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix,
 from userid 48) id 3590AC41612; Mon,  8 Sep 2025 20:32:27 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 220553] Suspend to mem fails on rx5600xt (regression in 6.16.2)
Date: Mon, 08 Sep 2025 20:32:27 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Video(DRI - non Intel)
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: rbmccav@gmail.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P3
X-Bugzilla-Assigned-To: drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: cf_bisect_commit cf_kernel_version cf_regression
Message-ID: <bug-220553-2300-GYH6QrXFhU@https.bugzilla.kernel.org/>
In-Reply-To: <bug-220553-2300@https.bugzilla.kernel.org/>
References: <bug-220553-2300@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D220553

rbmccav@gmail.com changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
 Bisected commit-id|                            |8345a71fc54b
     Kernel Version|                            |6.16.2
         Regression|No                          |Yes

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
