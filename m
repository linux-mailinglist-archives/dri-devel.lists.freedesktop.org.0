Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 590113763D4
	for <lists+dri-devel@lfdr.de>; Fri,  7 May 2021 12:32:27 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7E9476EE1A;
	Fri,  7 May 2021 10:32:23 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 981E26EE1A
 for <dri-devel@lists.freedesktop.org>; Fri,  7 May 2021 10:32:21 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPS id 421F561463
 for <dri-devel@lists.freedesktop.org>; Fri,  7 May 2021 10:32:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1620383541;
 bh=vrYxSweM8gKNjWhvpDKyv47Pq9zIr7ixnuAh3SVUjy4=;
 h=From:To:Subject:Date:In-Reply-To:References:From;
 b=FcADE8aMMFdGrgnCWjhfm8pzmNipH8Ml294mXAj05H2Um6QIT0/faGU0AhL7Dz7W4
 1SLyYr60eYlcDVawnZaWIopnszaMo/j8g82DbXu2AXFyjIVTONJKX5SVBhvcSk3Hlw
 /AnOIiP8wTZvSvKs5GrvJsa78eQZ87+WtrRXvRWnGk96b17OIKvdPYQBD9lNDjSMW0
 WCAh1G/68RQLS5NKYizaL6GFhUTyWsdYZWfmatRNCk/gL6puRgAapeIJVi7i8a1xSK
 M4liPjmhXn3KeAp7ewKXWRVG/YTyH0RUcrrhlG1ugQP8hrfNgElz4utVNgDD7MbiHn
 RvZhiykvcZtIA==
Received: by pdx-korg-bugzilla-2.web.codeaurora.org (Postfix, from userid 48)
 id 3E98F60282; Fri,  7 May 2021 10:32:21 +0000 (UTC)
From: bugzilla-daemon@bugzilla.kernel.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 51381] [drm:atom_op_jump] *ERROR* atombios stuck in loop for
 more than 5secs aborting, when disabled via vgaswitcheroo
Date: Fri, 07 May 2021 10:32:20 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Video(DRI - non Intel)
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: luca.trombin@gmail.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-51381-2300-PvMx1ZekXN@https.bugzilla.kernel.org/>
In-Reply-To: <bug-51381-2300@https.bugzilla.kernel.org/>
References: <bug-51381-2300@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D51381

--- Comment #55 from Luca T. (luca.trombin@gmail.com) ---
Dear all,

to fix this issue permanently so that I can quickly switch between multiple
accounts and I'm also able to resume from suspend my laptop I added the
following options into:

 - added radeon.dpm=3D0 radeon.runpm=3D0 to grub so that kernel will load=20
   radeon without enabling the power management features

 - created file /etc/modprobe.d/radeon-pm.conf with the following content:
      options radeon runpm=3D0
      options radeon dpm=3D0

   *this will make kernel driver to read the same options after resume=20
    from suspend

Regards,

Luca

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
