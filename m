Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 5EADC3EC7EE
	for <lists+dri-devel@lfdr.de>; Sun, 15 Aug 2021 09:22:01 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7756689AB7;
	Sun, 15 Aug 2021 07:21:57 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0B7B189AB7
 for <dri-devel@lists.freedesktop.org>; Sun, 15 Aug 2021 07:21:55 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPS id D255660D07
 for <dri-devel@lists.freedesktop.org>; Sun, 15 Aug 2021 07:21:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1629012114;
 bh=/WhHgSuAquhpEBck+w4nfcPQSWxVTVv1DmR3GAvzp3M=;
 h=From:To:Subject:Date:In-Reply-To:References:From;
 b=p5Y6TK4HOwzKgkLUfgVOna81a+7g0J75rzsM1uW8OeaBhWt/VNs5FqBe6sY7UGD85
 tUUk84p+czY6COikagTYvGmc0YOkgKsp/tzXhrTQvpoKjbZXaKIdejmjXbMV8Gkwlf
 mwyzoLpBUG1VpJIAch0Pu+qx/zLPlw/j/Hz94qBJkwnQC/dP5D7vL8Us2Mw3/MCUhp
 Gy3RBC+9oDG3K+PFHZqxosKibCKNLB0dyKCGL9RBHktOebJgtQzNiY6eULNcrRmc4w
 SmZ9+ubBYKYetRRxDTXbrwn3LZ/6JaVIEf8QZCmRdLwfD2xj6Hwatplbo/hm2YsqxD
 cFFSOUgR29SSw==
Received: by pdx-korg-bugzilla-2.web.codeaurora.org (Postfix, from userid 48)
 id C446760FBF; Sun, 15 Aug 2021 07:21:54 +0000 (UTC)
From: bugzilla-daemon@bugzilla.kernel.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 214071] amdgpu idle power draw too high at +75Hz
Date: Sun, 15 Aug 2021 07:21:54 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Video(DRI - non Intel)
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: pb.g@gmx.de
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-214071-2300-5vr796aDv9@https.bugzilla.kernel.org/>
In-Reply-To: <bug-214071-2300@https.bugzilla.kernel.org/>
References: <bug-214071-2300@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D214071

--- Comment #1 from Paul Gr=C3=B6=C3=9Fel (pb.g@gmx.de) ---
Hardware setup:
Mainboard: MSI MPG B550I GAMING EDGE WIFI
CPU: Ryzen 5950X
GPU: Radeon RX 6900XT

Kernel 5.13.10
mesa 21.1.4
X11

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
