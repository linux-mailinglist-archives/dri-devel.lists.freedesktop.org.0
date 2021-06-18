Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 84BF73AD39D
	for <lists+dri-devel@lfdr.de>; Fri, 18 Jun 2021 22:30:55 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D88976EA94;
	Fri, 18 Jun 2021 20:30:52 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A27386EA94
 for <dri-devel@lists.freedesktop.org>; Fri, 18 Jun 2021 20:30:51 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPS id AEB5B613E2
 for <dri-devel@lists.freedesktop.org>; Fri, 18 Jun 2021 20:30:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1624048250;
 bh=3vhe8zneNGMsRoejX5/htGPteCNcRSBYB3yFPowF19A=;
 h=From:To:Subject:Date:In-Reply-To:References:From;
 b=vGqrIPX9pjCt/PfegFE7rO2kuNuDfeYOE9+JygYlCBhpDvA7YN3BLrDr7bVC+jDtN
 wZIOY0+7BYK8nwdZ8SDPEKZ2OYX+MJ0WZ4MuO6F7/3uGqFL7YEUms/3JHKNtBPfz+Y
 7toxqlONTXeexwREvlFST2Y377ZjAU+e1SyEWKvsgLzYdlgZahewX5LuhsqEw++yu1
 OCv2ZOM4YRKF5ZrSG9ccv2c00whVOLcd6M0idi376+b+p8buG04+Hfz/240HZAMrR0
 AU+zw/vCQl8i84mrCWqvb8hNVSKTm/66LPNn2lIlXl9QmjxGauRvPSdbUgoruAlFI4
 Mm1ZRWXD1ZMbg==
Received: by pdx-korg-bugzilla-2.web.codeaurora.org (Postfix, from userid 48)
 id AAAE76115B; Fri, 18 Jun 2021 20:30:50 +0000 (UTC)
From: bugzilla-daemon@bugzilla.kernel.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 213391] AMDGPU retries page fault with some specific processes
 amdgpu and sometimes followed [gfxhub0] retry page fault until *ERROR* ring
 gfx timeout, but soft recovered
Date: Fri, 18 Jun 2021 20:30:50 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Video(DRI - non Intel)
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: low
X-Bugzilla-Who: dimitris@gmail.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-213391-2300-7tk3Iq8fiz@https.bugzilla.kernel.org/>
In-Reply-To: <bug-213391-2300@https.bugzilla.kernel.org/>
References: <bug-213391-2300@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D213391

--- Comment #19 from dimitris@gmail.com ---
I've also just replaced /lib/firmware/amdgpu with the `20210315` version, I=
'll
see how this goes.  Currently running Fedora kernel 5.12.11-200.fc33.x86_64=
 on
a T495.

Question, don't I also need to update the initrd?  `lsinitrd` shows that all
the amdgpu modules are included in the initrd image.  Or is the firmware
reloaded once root is mounted?

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
