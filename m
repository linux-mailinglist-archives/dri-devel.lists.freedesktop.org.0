Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C6543639832
	for <lists+dri-devel@lfdr.de>; Sat, 26 Nov 2022 21:19:47 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8D52410E17F;
	Sat, 26 Nov 2022 20:19:42 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sin.source.kernel.org (sin.source.kernel.org [145.40.73.55])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EDE6B10E17F
 for <dri-devel@lists.freedesktop.org>; Sat, 26 Nov 2022 20:19:37 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by sin.source.kernel.org (Postfix) with ESMTPS id 22C14CE0A28
 for <dri-devel@lists.freedesktop.org>; Sat, 26 Nov 2022 20:19:35 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 14C2EC43149
 for <dri-devel@lists.freedesktop.org>; Sat, 26 Nov 2022 20:19:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1669493973;
 bh=JO/PiaIOF8SIf2zzO7AyW3E1yJHTgvRlv2UBh/aAu7A=;
 h=From:To:Subject:Date:In-Reply-To:References:From;
 b=DdKGJGDZDtqEO5KDh60h4avXJwFOAytLWjILaePqHkbG7MTr3cE1cDjPjv031W+hF
 olmR07ZN2Wt2zET6auWJ1TBKbFUA9bORCapAwqHfmGLnrbam/8iYF44GcVmfg+pVHA
 fjYPq/Iw7t2/J5yjZEJxBTdNnh//Ax6Ki+fxaHtnR1oP9ZcJhNCg5O/ieniOvCzfav
 BiNA20JoGWd7sqa+v503j1NLNDpPH+8sVg8Pm7l2VyY/mjaptQlODOprt77zA4yT8B
 lMVPmzfrJRD6S/2AlS97+nFkBrTTbySUEa34K0uzY9X9AryG1jmAjaKc+wsgF1RH9w
 cSzWHLVy2gBVA==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix,
 from userid 48) id 04810C433E4; Sat, 26 Nov 2022 20:19:33 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 213145] AMDGPU resets, timesout and crashes after "*ERROR*
 Waiting for fences timed out!"
Date: Sat, 26 Nov 2022 20:19:32 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Video(DRI - non Intel)
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: high
X-Bugzilla-Who: a@qebajhkbkcyc86.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: cc
Message-ID: <bug-213145-2300-hwAAkJyGcP@https.bugzilla.kernel.org/>
In-Reply-To: <bug-213145-2300@https.bugzilla.kernel.org/>
References: <bug-213145-2300@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D213145

Elliot (a@qebajhkbkcyc86.com) changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
                 CC|                            |a@qebajhkbkcyc86.com

--- Comment #30 from Elliot (a@qebajhkbkcyc86.com) ---
(In reply to Viktor from comment #29)
> Same problem on Lenovo Thinkpad T14 Gen3 with Ryzen 7 and Radeon 680M.

Getting same errors on Thinkpad T14s Gen3 Ryzen 6800U (Radeon 680m iGPU).
Running i3 / XOrg on Archlinux, no DE. Was using Gnome on Wayland and saw m=
ore
crashes + screen glitches. Switching to i3 definitely lowered glitch rate.

Crash seems to occur after leaving laptop on after a while (10+ hours).

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
