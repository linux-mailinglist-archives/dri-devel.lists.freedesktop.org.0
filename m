Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 65063BC603D
	for <lists+dri-devel@lfdr.de>; Wed, 08 Oct 2025 18:25:46 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BEAC310E863;
	Wed,  8 Oct 2025 16:25:44 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="ORyaZtDM";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C3B7510E86B
 for <dri-devel@lists.freedesktop.org>; Wed,  8 Oct 2025 16:25:43 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id 9D0606050B
 for <dri-devel@lists.freedesktop.org>; Wed,  8 Oct 2025 16:25:42 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 52790C4CEF5
 for <dri-devel@lists.freedesktop.org>; Wed,  8 Oct 2025 16:25:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1759940742;
 bh=bcUdfh2WosfZkF7F4P2dLQfZNmM1ULYqt8dY7NwX3K0=;
 h=From:To:Subject:Date:In-Reply-To:References:From;
 b=ORyaZtDMyLDlfDPaYe/Cxl7FgzXVvMcZhlq3/5eCKTqws68GvxvldQFInwamo1Wsp
 6TNzRK2d2U3UbfTiKr5Zd10bxW/SOgMVQnqwX/N1m15MUf3MWww81ARLXbyfV6HA0I
 88MBGUaaAa+Nc73+jmiVgd4Z2rikQ/QWj71PSxcBWmveXhHmgEwQ5Ym1W7ulnMsy8j
 tflmZ9LWHMkjFiNoqe1PGzpMrbFqJd+MnlLFll80am+YZE8o49zcVBhBaj2a5r4aiG
 qJ1l6M3+6XnsEnQj+TzQGePlfSLm8/te+RwQxpoFZJJOypX7za4dCRahofdpAjYV9v
 jVPOYv0aYpEBA==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix,
 from userid 48) id 47387C41612; Wed,  8 Oct 2025 16:25:42 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 220642] amdgpu: Vblank missed when playing video using GBM on
 AMD Ryzen APU
Date: Wed, 08 Oct 2025 16:25:42 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Video(DRI - non Intel)
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: eric@w-id.eu
X-Bugzilla-Status: RESOLVED
X-Bugzilla-Resolution: ANSWERED
X-Bugzilla-Priority: P3
X-Bugzilla-Assigned-To: drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-220642-2300-iuaRQa4T3A@https.bugzilla.kernel.org/>
In-Reply-To: <bug-220642-2300@https.bugzilla.kernel.org/>
References: <bug-220642-2300@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D220642

--- Comment #2 from Eric Prevoteau (eric@w-id.eu) ---
Done.

[https://gitlab.freedesktop.org/drm/amd/-/issues/4621](https://gitlab.freed=
esktop.org/drm/amd/-/issues/4621)

Thanks.

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
