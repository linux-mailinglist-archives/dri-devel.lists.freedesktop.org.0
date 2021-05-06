Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C10EF375642
	for <lists+dri-devel@lfdr.de>; Thu,  6 May 2021 17:10:48 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DFDAE6E0AB;
	Thu,  6 May 2021 15:10:46 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 00FEF6E0AB
 for <dri-devel@lists.freedesktop.org>; Thu,  6 May 2021 15:10:44 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPS id 9F188611AE
 for <dri-devel@lists.freedesktop.org>; Thu,  6 May 2021 15:10:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1620313844;
 bh=H2JuaEBL0OVtg2k8cmzwuPCMZrA+VjoNg0agNMEpc6I=;
 h=From:To:Subject:Date:In-Reply-To:References:From;
 b=u0xKcfEMlTHl7Jd6OE9jlxnIJtZ0BRDTgQZXR9QOlkjk8I8rGAh1QPRltePi1P+Hf
 drlt8bMGftAMDyV/bzrdYyDdtIabog7pqfM0sjjmRXQUnQhNUHbYUM4bauwKd/M8hx
 XGXUXaSdtUpmRLK/rs5TIUQR/P3FjxNjyRouQoNs/7KR2dgw0RmVM4ujRgloaKQsci
 ntlv19ag4CFwY1oQD/jIyRdYu8fB9jzyqMDOCg4HKcEuSDJDiohSck6nOvcFZ4S8FG
 38jBaGWQmPxQf0rqsgkGH0fW0TWIpxjaCXOFxGYVp8AIqErlw0alC2K4KOrgmZwMdx
 /v6CE3yeeii+A==
Received: by pdx-korg-bugzilla-2.web.codeaurora.org (Postfix, from userid 48)
 id 99BE16129E; Thu,  6 May 2021 15:10:44 +0000 (UTC)
From: bugzilla-daemon@bugzilla.kernel.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 207833] Brightness control not working on ASUS TUF FA506IU (AMD
 Ryzen 7 4800H / Nvidia GTX 1660 Ti)
Date: Thu, 06 May 2021 15:10:44 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Video(DRI - non Intel)
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: high
X-Bugzilla-Who: filip.hejsek@gmail.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-207833-2300-rMwZ6Tx2QM@https.bugzilla.kernel.org/>
In-Reply-To: <bug-207833-2300@https.bugzilla.kernel.org/>
References: <bug-207833-2300@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D207833

--- Comment #6 from Filip Hejsek (filip.hejsek@gmail.com) ---
Sorry, the correct option is amdgpu.backlight=3D0, not amdgpu.aux_backlight=
=3D0 (it
was changed)

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
