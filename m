Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2A38C56C78C
	for <lists+dri-devel@lfdr.de>; Sat,  9 Jul 2022 08:29:32 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id ECD6410FAAB;
	Sat,  9 Jul 2022 06:29:29 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9D7AC10F92D
 for <dri-devel@lists.freedesktop.org>; Sat,  9 Jul 2022 06:29:28 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 44922B80CE6
 for <dri-devel@lists.freedesktop.org>; Sat,  9 Jul 2022 06:29:27 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id DE2D7C341CA
 for <dri-devel@lists.freedesktop.org>; Sat,  9 Jul 2022 06:29:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1657348165;
 bh=RgIOQ7R2mystF4fMeUiNx0mlQIhbS4zc2oDcJ9Rrcys=;
 h=From:To:Subject:Date:In-Reply-To:References:From;
 b=ItXJa9mfYphMbao6B6M2iYY7JSSFo7Y78s+J+zqkm3V1Ni4KZlA0JEmHR7bnFEWqn
 pchpOiEYAI2UnOLQNFG0E4B/0ZrikxOAeOq9QHJW9fW4mYSAYAU3F6bOi8OGYeA6Am
 sNWZ00r2WLJhsqZkHlG4rhVwnKiwYmylYZbybmmv6047Lrrtlbsqru4ZnXrvMsqGpL
 JxOEiP8p6adoQ66GR6gB0gQjQWsTT1dDEefXOaCnNO2ieGJyxuKnfaDpv6cW4J+kQa
 +iyLdNJXT8dh3x8vW8/g0j5lDXmmRbAaIwA597keMbch55AcVNnz3zvf0GO7fgosRc
 QLLD9LqZeGDUw==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix,
 from userid 48) id CB5A5CC13B6; Sat,  9 Jul 2022 06:29:25 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 216224] AMDGPU fails to reset RX 480 after Ring GFX timeout
Date: Sat, 09 Jul 2022 06:29:25 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Video(DRI - non Intel)
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: high
X-Bugzilla-Who: happysmash27@protonmail.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: attachments.created
Message-ID: <bug-216224-2300-xwldN2zXzS@https.bugzilla.kernel.org/>
In-Reply-To: <bug-216224-2300@https.bugzilla.kernel.org/>
References: <bug-216224-2300@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D216224

--- Comment #2 from happysmash27@protonmail.com ---
Created attachment 301376
  --> https://bugzilla.kernel.org/attachment.cgi?id=3D301376&action=3Dedit
SteamVR-induced crash 2022-05-26

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
