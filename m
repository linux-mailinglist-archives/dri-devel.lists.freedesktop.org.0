Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 055A0A63BC5
	for <lists+dri-devel@lfdr.de>; Mon, 17 Mar 2025 03:33:48 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C851F10E038;
	Mon, 17 Mar 2025 02:33:42 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="bE0F8fGd";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from nyc.source.kernel.org (nyc.source.kernel.org [147.75.193.91])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7ECD110E038
 for <dri-devel@lists.freedesktop.org>; Mon, 17 Mar 2025 02:33:36 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by nyc.source.kernel.org (Postfix) with ESMTP id 47A0FA48CFB
 for <dri-devel@lists.freedesktop.org>; Mon, 17 Mar 2025 02:28:06 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 9A3DAC4CEEF
 for <dri-devel@lists.freedesktop.org>; Mon, 17 Mar 2025 02:33:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1742178815;
 bh=W02jj5zZThQC4NJOloJnhunp2SBvIgyoaGFwGHDNrIM=;
 h=From:To:Subject:Date:In-Reply-To:References:From;
 b=bE0F8fGdo0mWRJouSpBRUPSAVxglAoFsMhZUYpig5OdbF0tf2OWjxpyyL3Em0uVT7
 TNsdCIcPw8AUhh/7KAiBak8z9w8zMjaezllkFR6QBuYXjTgmT77wxBl4A0q0DcExij
 WTK67tngbXvuFdinR6Q/FrxYrBJ9VRS4KoT+k24w7oMTwyBQkoRPODs+mYHUwzB25q
 UQL+BJ0wHr3slc1C9l1s8noj2oJ2NakZkp+rpKduVjO9vDfxnXjPuHyrLhUPjmhbM0
 CMVlnv+2qwCm5QxdIhyqrYedsYpGaJdiDwuZ8wlgKKTtcuAwucDbvXgoc6u2Q6WnMc
 QSllBcN3xAFbA==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix,
 from userid 48) id 8A6CBC53BC7; Mon, 17 Mar 2025 02:33:35 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 219888] amdgpu: Oops connecting HDMI/DVI/DP on HD 7850 (Pitcairn)
Date: Mon, 17 Mar 2025 02:33:35 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Video(DRI - non Intel)
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: high
X-Bugzilla-Who: alexandre.f.demers@gmail.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P3
X-Bugzilla-Assigned-To: drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-219888-2300-UWHqEmCEAb@https.bugzilla.kernel.org/>
In-Reply-To: <bug-219888-2300@https.bugzilla.kernel.org/>
References: <bug-219888-2300@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D219888

--- Comment #6 from Alexandre Demers (alexandre.f.demers@gmail.com) ---
Looking at the commit, this bug probably affects a wider range of GPUs since
DCE12.0 and DCE8.0 rely on the change applied to DCE11.0

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
