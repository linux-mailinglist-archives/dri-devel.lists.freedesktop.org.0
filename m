Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5F4C15035CB
	for <lists+dri-devel@lfdr.de>; Sat, 16 Apr 2022 11:39:30 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4C5F310E46C;
	Sat, 16 Apr 2022 09:39:28 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sin.source.kernel.org (sin.source.kernel.org [145.40.73.55])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BA20710E46C
 for <dri-devel@lists.freedesktop.org>; Sat, 16 Apr 2022 09:39:27 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by sin.source.kernel.org (Postfix) with ESMTPS id 41182CE320B
 for <dri-devel@lists.freedesktop.org>; Sat, 16 Apr 2022 09:39:25 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id A24E9C385A1
 for <dri-devel@lists.freedesktop.org>; Sat, 16 Apr 2022 09:39:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1650101963;
 bh=CnFYBTTbo0KWoCSaTGIFkxpsupexd0uThKPXvgCv+WE=;
 h=From:To:Subject:Date:In-Reply-To:References:From;
 b=j/JcN53+hTFfu0I+xRVR37egTvOBoKamYQo7XdH6LV5tZR4H3NI759UVrRFhdTz/x
 rECpxXKwsRR+OVumBHBRUOhSJvOyMwsZpCgrqDmGgHUhLm6oo27smtuDH+6DstGbZQ
 AcWUXa6zAL4mi6Zlhbgvt18DM0gN7bX1IgEbGURImhtnYfijlTVkwrDT9H1KWIrdmJ
 FPq2aoCPSy4l3vkSKMUkACTYnG3e2PGX4S+Nu8UiEIi3OOpheTuWKqIcXcxgar5vrh
 oA9ONvu137uRSJHvektNaG0xcf1M/fBlSbDmMBLj6wa8/fmTk8qvBClm2AjyWyx+M2
 yku32Qc8UIN3w==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix,
 from userid 48) id 91E94CAC6E2; Sat, 16 Apr 2022 09:39:23 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 215839] distorted video playback with hybrid GPU (DRI_PRIME=1,
 Radeon HD 6470M and Intel-GPU)
Date: Sat, 16 Apr 2022 09:39:23 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Video(DRI - non Intel)
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: aros@gmx.com
X-Bugzilla-Status: RESOLVED
X-Bugzilla-Resolution: ANSWERED
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: bug_status resolution
Message-ID: <bug-215839-2300-a7ny3j06tg@https.bugzilla.kernel.org/>
In-Reply-To: <bug-215839-2300@https.bugzilla.kernel.org/>
References: <bug-215839-2300@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D215839

Artem S. Tashkinov (aros@gmx.com) changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
             Status|NEW                         |RESOLVED
         Resolution|---                         |ANSWERED

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
