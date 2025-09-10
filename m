Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8F184B5203F
	for <lists+dri-devel@lfdr.de>; Wed, 10 Sep 2025 20:28:19 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7B45310E9B5;
	Wed, 10 Sep 2025 18:28:16 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="qCIGtMP9";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C35C310E9B5
 for <dri-devel@lists.freedesktop.org>; Wed, 10 Sep 2025 18:28:15 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id 8C702402E8
 for <dri-devel@lists.freedesktop.org>; Wed, 10 Sep 2025 18:28:15 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 69CA1C4CEEB
 for <dri-devel@lists.freedesktop.org>; Wed, 10 Sep 2025 18:28:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1757528895;
 bh=Zw5Rvdt0yqI6CUTA16lQX0yyOtc2k4yurtmXWKs1k28=;
 h=From:To:Subject:Date:In-Reply-To:References:From;
 b=qCIGtMP94ExhwIKLHn4WShh0on61STk9FlTMglzigzSKyEjP5rtdSHDL8wAEHYdxB
 sx7q7uWp2g/k+ndnL8odyF2d5YF4XiTC9NVnw9GJdy45LPrRb2RRoEzfohkHQWQFMj
 YDxt7P+AHyknwwxpq/XqMQ+eX5a3+XGyK1osiJ7KBs9wAyYZw8C5WZe2R3OS1Q4nJ9
 0iWtmfRGFNWKxLgrXubUS0jxzk6JISLHYJ1LyPGIzQ5E1k/geEl2N16vFhCEGQRIza
 brHH+2TEbp1Cd2TPtU5Zj4GBIr0+1TwIuhXmFXbFB9N+cpZkPxmeNGyQOfX5tImhkk
 GGqob9fCULe7g==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix,
 from userid 48) id 5BC8CC41614; Wed, 10 Sep 2025 18:28:15 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 220554] Display powers off after every update.
Date: Wed, 10 Sep 2025 18:28:15 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Video(DRI - non Intel)
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: aros@gmx.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P3
X-Bugzilla-Assigned-To: drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-220554-2300-Wmw0FUU0ka@https.bugzilla.kernel.org/>
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

--- Comment #3 from Artem S. Tashkinov (aros@gmx.com) ---
Please post your issue to LKML or/and the DRM mailing list (if it exists) a=
nd
CC Aradhya Bhatia <a-bhatia1@ti.com> and  Maxime Ripard <mripard@kernel.org>

This bug report will die here otherwise.

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
