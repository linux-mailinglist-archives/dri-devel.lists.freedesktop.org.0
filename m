Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id CD34C39BFF9
	for <lists+dri-devel@lfdr.de>; Fri,  4 Jun 2021 20:56:49 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3CB936F8A9;
	Fri,  4 Jun 2021 18:56:46 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2AEF06F8A9
 for <dri-devel@lists.freedesktop.org>; Fri,  4 Jun 2021 18:56:45 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPS id E3CA86140F
 for <dri-devel@lists.freedesktop.org>; Fri,  4 Jun 2021 18:56:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1622833004;
 bh=V8EoS4lVPpQsuK2LmMEPqUMNb0R3AswigBNVs6+yunI=;
 h=From:To:Subject:Date:In-Reply-To:References:From;
 b=UNXYR+sPdr7tR25HGdrWEGWxLrfEVSClH0oerVO/aTgYOMzwtuptk96cyhPDnHZiQ
 9YhOt/8/mrN6KSyWePyo7zzT/73Nf6d1whr1Ml1/zpU+LrvunUZtfmQ98kQUBzTOpx
 RVs65pumYSEe0cQyt0VZCIt3bziPh1JXV9SS0XchOJPzmcKmeI6u/OKT+XRfZNx2oQ
 eYzZBRf01QWEGY0w8yFJJqWQbzVkmIP+jZuLDAJpOTFZx8yHUHA/58ncO9xvQY0GtM
 Se9eo7BHTqq/Ne3jUP7ZhWryA+AtNnfSL0jwJmjg0W1tf8Xo+JgjbTGPPJVVzbBKDh
 8yN5fDjvn7jTg==
Received: by pdx-korg-bugzilla-2.web.codeaurora.org (Postfix, from userid 48)
 id DAC1661261; Fri,  4 Jun 2021 18:56:44 +0000 (UTC)
From: bugzilla-daemon@bugzilla.kernel.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 212333] Bisected: 5.11.7 breaks amdgpu resume from S3
Date: Fri, 04 Jun 2021 18:56:44 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Video(DRI - non Intel)
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: timo.valtoaho@gmail.com
X-Bugzilla-Status: RESOLVED
X-Bugzilla-Resolution: CODE_FIX
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: bug_status resolution
Message-ID: <bug-212333-2300-sNHKzh1UEI@https.bugzilla.kernel.org/>
In-Reply-To: <bug-212333-2300@https.bugzilla.kernel.org/>
References: <bug-212333-2300@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D212333

Timo Valtoaho (timo.valtoaho@gmail.com) changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
             Status|NEW                         |RESOLVED
         Resolution|---                         |CODE_FIX

--- Comment #4 from Timo Valtoaho (timo.valtoaho@gmail.com) ---
The link above helps. Suspend (S0ix) seems to work fine. Every now and then=
 I
need to hard reboot my laptop, I can't find any logic for that.

One minor issue left. When ACPI events (charging and battery gets full) occ=
ur
while suspended, I need to close and reopen the lid on resume if I have
suspended using power button.

Vanilla kernels 5.12.x work like described with these 6 patches applied:

https://gitlab.freedesktop.org/agd5f/linux/-/commits/s0ix-8

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
