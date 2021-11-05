Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 1968A4466E9
	for <lists+dri-devel@lfdr.de>; Fri,  5 Nov 2021 17:21:39 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7B2376EB3C;
	Fri,  5 Nov 2021 16:21:36 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B79796EB3C
 for <dri-devel@lists.freedesktop.org>; Fri,  5 Nov 2021 16:21:35 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPS id 7D99861252
 for <dri-devel@lists.freedesktop.org>; Fri,  5 Nov 2021 16:21:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1636129295;
 bh=LnYJwUM361rR0KDnMYqWzhhpXhYUCh4pbZLya+rJbAU=;
 h=From:To:Subject:Date:In-Reply-To:References:From;
 b=K9D2I5LoQKFMgTXzFW2/LCM+ouPMgk5Z3Po3mfQrLIAmI53EmqyCCmDQSzFYWGCtD
 gfNTekgYixts9D81wmzolzvN5SfAhxyfdH9Ar2sjO+1WJQffug+pFAEl/PtnwAS4mp
 cL9zzxFCuF+pNfLAqI7bV5xPuLbGcqz/GvU5io+kcKh7jhs0xPpla0cunJLzgM+JTR
 /KLd+DdBjrzkZXweRnbhyV0P2NvrWpqB7s6xCImZ6H4Co7X/CJowi5DycstGKkSAIX
 dYKcWSW9TifHFu+SZSkmlZh8UoQYz8zZm7Qb4SZ1Q/Rf+r7dW/eJMzI5xXqHtO492h
 J6KzXj+h8qBIQ==
Received: by pdx-korg-bugzilla-2.web.codeaurora.org (Postfix, from userid 48)
 id 7146761108; Fri,  5 Nov 2021 16:21:35 +0000 (UTC)
From: bugzilla-daemon@bugzilla.kernel.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 214921] amdgpu hangs HP Laptop on shutdown
Date: Fri, 05 Nov 2021 16:21:35 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Video(DRI - non Intel)
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: pmw.gover@yahoo.co.uk
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: cc
Message-ID: <bug-214921-2300-5PAFnB9p65@https.bugzilla.kernel.org/>
In-Reply-To: <bug-214921-2300@https.bugzilla.kernel.org/>
References: <bug-214921-2300@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D214921

Paul Gover (pmw.gover@yahoo.co.uk) changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
                 CC|                            |pmw.gover@yahoo.co.uk

--- Comment #2 from Paul Gover (pmw.gover@yahoo.co.uk) ---
Spasswolf's comment doesn't seem in any way related to this bug report.  I
presume it was filed against the wrong bug!

I can confirm on my setup, HP laptop with an AMD "Stoney" chipset, on kernel
5.15.0 the system doesn't shutdown when you use KDE power menu "shutdown", =
nor
if you issue the "halt" or "poweroff" commands, nor "shutdown -P now".
The keyboard is dead, so Ctl-Alt-Del doesn't reboot, all that's left is hol=
ding
the power button down.

Behaviour was correct on kernel 5.14 (at least, up to 5.14.14).

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
