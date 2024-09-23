Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E52BA97E635
	for <lists+dri-devel@lfdr.de>; Mon, 23 Sep 2024 08:53:40 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F1C4C10E1F5;
	Mon, 23 Sep 2024 06:53:37 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="ieITzHY4";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7038A10E1F5
 for <dri-devel@lists.freedesktop.org>; Mon, 23 Sep 2024 06:53:36 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id CD20B5C5594
 for <dri-devel@lists.freedesktop.org>; Mon, 23 Sep 2024 06:53:31 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 63AABC4CECF
 for <dri-devel@lists.freedesktop.org>; Mon, 23 Sep 2024 06:53:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1727074415;
 bh=RQmm+8aqltJL6x34vzEmlq3NsH1t+9sIIZICl2SijU0=;
 h=From:To:Subject:Date:In-Reply-To:References:From;
 b=ieITzHY4JAaYaMMbAqiDJbKyBKFLX4krBUZTw6N/r2blPATuHE5QlJiiOjkyGYQ8K
 bu97+3PkIohB79xALQWhMJ2JtuuVeCz4l8Cp8dh8EseHoyWU8LLTwSdIymkVaSQcCG
 h0pcTDiuyrljPO/CFyl7T0Jd0oINIqYOEqhr/Lm1wIKe2o2bDFlABIt3IJtzdyn6Kf
 Rv8oMGXqMFa6LTbP20iHpVHHCzjpv1vKTxda4WVkY58ir1Sahz5OQ0pYXmx04hYzYZ
 rUE62QZbhLnPymgkurXoU38EfXMGphwsEpmGaP4OXvEzX4jlIb7pC3aHBmbDJyH1om
 ENKTIpl3hAdTw==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix,
 from userid 48) id 577A2C53BC7; Mon, 23 Sep 2024 06:53:35 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 209939] radeontop causes kernel panic
Date: Mon, 23 Sep 2024 06:53:35 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Video(DRI - non Intel)
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: janpieter.sollie@edpnet.be
X-Bugzilla-Status: RESOLVED
X-Bugzilla-Resolution: OBSOLETE
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: bug_status resolution
Message-ID: <bug-209939-2300-OfbGRErbqY@https.bugzilla.kernel.org/>
In-Reply-To: <bug-209939-2300@https.bugzilla.kernel.org/>
References: <bug-209939-2300@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D209939

Janpieter Sollie (janpieter.sollie@edpnet.be) changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
             Status|NEW                         |RESOLVED
         Resolution|---                         |OBSOLETE

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
