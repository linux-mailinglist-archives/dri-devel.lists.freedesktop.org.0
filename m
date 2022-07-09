Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 38DDF56C95E
	for <lists+dri-devel@lfdr.de>; Sat,  9 Jul 2022 14:27:02 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 12A1D1131DF;
	Sat,  9 Jul 2022 12:26:58 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 400E11131DF
 for <dri-devel@lists.freedesktop.org>; Sat,  9 Jul 2022 12:26:57 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id B1B0F60F23
 for <dri-devel@lists.freedesktop.org>; Sat,  9 Jul 2022 12:26:56 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 17F58C3411C
 for <dri-devel@lists.freedesktop.org>; Sat,  9 Jul 2022 12:26:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1657369616;
 bh=GNdksOHkNz6OmZJkj0g/NtACVUOkuBbv5Pu4s0+Frhc=;
 h=From:To:Subject:Date:In-Reply-To:References:From;
 b=QCtGkeCuwmKZ+j/u1aHjN5F5rSw3U91KnJVZdAK4cYteCm5xIu+An5Mjs+pHKIboE
 s8TjVyWAsfmLoM+3iszy+QJwQMZHRtn6QUJIkI/cRUsVQAmxTNja0u4j5lTyp7oUxs
 DaGFmy59m6Rxj+lAtivGud0jB9xjAJxHgkXNlV3zOCUCpr2dLedXM4X2tTCXafb8S0
 nWJeqOoEXdLu0EHobgLK2mLxl0uZ0pbCcnLjc6u1Q28Lcxx3NZZHt7D9MQRL5XWDdI
 AqYQtIIgxGDVaiiM8u2F9zHcnMPDyEi/VftwQkiGMrhEEmqlG0RMdn3+FqdxWCyrSx
 ZtMOYDnX2E8Qg==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix,
 from userid 48) id F0053CC13B6; Sat,  9 Jul 2022 12:26:55 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 216226] [amdgpu] BUG: kernel NULL pointer dereference
Date: Sat, 09 Jul 2022 12:26:55 +0000
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
Message-ID: <bug-216226-2300-R5ytXO2src@https.bugzilla.kernel.org/>
In-Reply-To: <bug-216226-2300@https.bugzilla.kernel.org/>
References: <bug-216226-2300@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D216226

Artem S. Tashkinov (aros@gmx.com) changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
             Status|NEW                         |RESOLVED
         Resolution|---                         |ANSWERED

--- Comment #2 from Artem S. Tashkinov (aros@gmx.com) ---
PLease report to https://gitlab.freedesktop.org/drm/amd/-/issues

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
