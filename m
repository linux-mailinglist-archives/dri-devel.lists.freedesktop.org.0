Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BBA65B002DE
	for <lists+dri-devel@lfdr.de>; Thu, 10 Jul 2025 15:05:28 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2A10510E8D0;
	Thu, 10 Jul 2025 13:05:27 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="NSOxhWpF";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DC2A010E8D0
 for <dri-devel@lists.freedesktop.org>; Thu, 10 Jul 2025 13:05:25 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id 9B73F46BFB
 for <dri-devel@lists.freedesktop.org>; Thu, 10 Jul 2025 13:05:25 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 7B542C4CEE3
 for <dri-devel@lists.freedesktop.org>; Thu, 10 Jul 2025 13:05:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1752152725;
 bh=zNHCAQOR4e64ZJhzFwIDsrm3JMZb2Wkqcap2ilT1yvg=;
 h=From:To:Subject:Date:In-Reply-To:References:From;
 b=NSOxhWpF8qssCQChvW0B9Rw2z1msbIc1WjM+BhY2kUN5LjeHkTlcK6AaeSt5NUk0T
 6eutBJa7VVPCG6FS/jt07qL5mWYAj/p8OXJt/5n6Lym2GOuw0etxXqhX/OC76NAl3I
 JNPxEfaYR3JsQA4mhPQOV2lWLuYKjj7GTWLMLyQ/rOC4l5xiWofGNlq/Ru9aGy1RTQ
 As6Eb0fy59Ci0s3uQ1dsDsq6h/cRc70RdwzTyuEkPoNnUUal3CLgfgpFYXlJG7+lQY
 fpV3va/BWqjsEstSZ0Yb3ApQMlG90ATQtQ7IAbTs01nb+Qr8yJdAOH2MM4xBXmI5vb
 YAO4Io9J2jQiw==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix,
 from userid 48) id 73B13C3279F; Thu, 10 Jul 2025 13:05:25 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 220326] Mismatch between the meanings of brightness and
 actual_brightness
Date: Thu, 10 Jul 2025 13:05:25 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Video(DRI - non Intel)
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: kernvirt@gmail.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P3
X-Bugzilla-Assigned-To: drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-220326-2300-6v2rz8gvBI@https.bugzilla.kernel.org/>
In-Reply-To: <bug-220326-2300@https.bugzilla.kernel.org/>
References: <bug-220326-2300@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D220326

--- Comment #1 from Van (kernvirt@gmail.com) ---
Update: I'm tested debian trixie kernel 6.12 lts, and there they use amdgpu=
_bl0
instead bl1, and brightness =3D actual_brigtness, Fedora also uses amdgpu_b=
l1,
just like Arch, but the situation is better at the time of kernel 6.14
brightness 50 =3D actual_brightness 33, 103/73, but still I don't know how =
to get
normal behavior in Arch and Fedora on the upstream version of the kernel

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
