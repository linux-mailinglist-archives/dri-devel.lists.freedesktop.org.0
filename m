Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 6E542826035
	for <lists+dri-devel@lfdr.de>; Sat,  6 Jan 2024 16:35:34 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CD3B010E041;
	Sat,  6 Jan 2024 15:35:23 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 06E3010E041
 for <dri-devel@lists.freedesktop.org>; Sat,  6 Jan 2024 15:35:22 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by ams.source.kernel.org (Postfix) with ESMTP id A98AEB81E93
 for <dri-devel@lists.freedesktop.org>; Sat,  6 Jan 2024 15:35:20 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id C6E5FC433C7
 for <dri-devel@lists.freedesktop.org>; Sat,  6 Jan 2024 15:35:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1704555319;
 bh=P9ODGWUywVuFOeEBPirVVAOo5jTMBI8MBuAL7bd4h/c=;
 h=From:To:Subject:Date:In-Reply-To:References:From;
 b=btmQIYWxxl2s0tccc6Ym/o0hV7DzoSpqKlBMZA1HswIPWZS0Rr1po9spErRM9sZOk
 T1Go/KruPSDHAELlyC9Sg0gPL3qSmXzK+nzHtzw37GfIxTGU2MZYz0HCCRJncohzVc
 J9mO3UkiPOmNVSGl5hlZeYdIthI46A7yzj7LUMx8cVhL7Pk3G3hwAqsbe3VJwzqIne
 U0L4zo8Q0uabCibEMcrFGq1YBYOVQZsPwMRgFMQGnMuJP39sTIUY/6xG+4cvZkgKC2
 39/SwRuJWDn2EXHhUfTTgTOHDyH3OHkj7sdD6j6ghHw1IVWjzZF4+X/YbeuhMrqY0J
 PWZ75msYr9avQ==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix,
 from userid 48) id ABB6AC53BD2; Sat,  6 Jan 2024 15:35:19 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 218347] Crash. amdgpu : drm:amdgpu_cs_ioctl : Failed to
 initialize parser -125
Date: Sat, 06 Jan 2024 15:35:19 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Video(DRI - non Intel)
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: blocking
X-Bugzilla-Who: aros@gmx.com
X-Bugzilla-Status: RESOLVED
X-Bugzilla-Resolution: ANSWERED
X-Bugzilla-Priority: P3
X-Bugzilla-Assigned-To: drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: bug_status resolution
Message-ID: <bug-218347-2300-1mnyX2SfJ5@https.bugzilla.kernel.org/>
In-Reply-To: <bug-218347-2300@https.bugzilla.kernel.org/>
References: <bug-218347-2300@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D218347

Artem S. Tashkinov (aros@gmx.com) changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
             Status|NEW                         |RESOLVED
         Resolution|---                         |ANSWERED

--- Comment #2 from Artem S. Tashkinov (aros@gmx.com) ---
Please report here instead:

https://gitlab.freedesktop.org/drm/amd/-/issues

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
