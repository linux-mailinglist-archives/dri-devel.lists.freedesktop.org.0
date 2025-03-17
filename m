Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3CF45A6400B
	for <lists+dri-devel@lfdr.de>; Mon, 17 Mar 2025 06:44:06 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3C59B10E03B;
	Mon, 17 Mar 2025 05:44:03 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="jhtM++aQ";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E30B910E03B
 for <dri-devel@lists.freedesktop.org>; Mon, 17 Mar 2025 05:44:01 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 1DC7B5C4D9D
 for <dri-devel@lists.freedesktop.org>; Mon, 17 Mar 2025 05:41:41 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id A4E44C4CEEE
 for <dri-devel@lists.freedesktop.org>; Mon, 17 Mar 2025 05:43:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1742190237;
 bh=UfAYoE0To7yzhaiwO6fqT0sJIQoggN/qMq651t44dZ8=;
 h=From:To:Subject:Date:In-Reply-To:References:From;
 b=jhtM++aQs95kMaMC/htdO1HUu0w8H0lh2QQvC58Wl08QJCaO8gJmo1FCZ4IliIfPm
 AbXftSAgMGw4fqgGcTj5JdPQS+MUCfTdWHOOzaiNmIPJUOacHNGYp5/wtIBgV7+ZkW
 aI/5u4+zqdHpVvFNFiQ6XZu266l41zF67GssyaETwzB9ID60++dD19jDU/AqNvvKtG
 YONlUCx8J9+OT+2XzcIQvsGv/VG5OlVpFopUnS+zJqBpi63DyAPKlBG2iy6hv9GDwh
 9EN2IqpMx1G22VmS1XedNrngWtXc0D8UUScs5xru2O7G+C1yVq7lGwLOlwaJcX5pNc
 LCqo7G6B5nV7g==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix,
 from userid 48) id 989F3C433E1; Mon, 17 Mar 2025 05:43:57 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 219888] amdgpu: Oops connecting HDMI/DVI/DP on HD 7850 (Pitcairn)
Date: Mon, 17 Mar 2025 05:43:57 +0000
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
Message-ID: <bug-219888-2300-Bp5i3EooUC@https.bugzilla.kernel.org/>
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

--- Comment #7 from Alexandre Demers (alexandre.f.demers@gmail.com) ---
DCE6's dce60_tg_funcs structure is missing .is_two_pixels_per_container =3D
dce110_is_two_pixels_per_container

It seems the fix is already in 6.14-rc7.

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
