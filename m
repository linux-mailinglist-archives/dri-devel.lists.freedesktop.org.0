Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 854583B253D
	for <lists+dri-devel@lfdr.de>; Thu, 24 Jun 2021 04:57:27 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 699D36E9C7;
	Thu, 24 Jun 2021 02:57:23 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D0D616E9C7
 for <dri-devel@lists.freedesktop.org>; Thu, 24 Jun 2021 02:57:21 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPS id 9CC4A61209
 for <dri-devel@lists.freedesktop.org>; Thu, 24 Jun 2021 02:57:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1624503441;
 bh=Oq7BZW5i2TzDC6ihERoav8Ym91ZpTcTyOmxOKFT90Cg=;
 h=From:To:Subject:Date:In-Reply-To:References:From;
 b=tHH6zmXeFa8vCDRtVwemixZJCXHsgiTep3JsJEXAkJ8z3ePxV9moIkmv3Uy1R2SRF
 c9sFyG8sohtzeVT8dzm9qtnmGkAN/pdraoW4R103FqQh2hZG8uiynpjEzFm5nHw84c
 qldwr+O7QRB8z4ryItGvJdawGmF210Z/jnIdXRib4BXTyp5TOFJerI7QwATQVQZEiK
 jBMFfE5rJ/yqCDOCaPxfQjMaveoOZxxbo2OsmrDqrFmsOBZfF+trEmPPWcHXGRakBz
 SC7JCq6ph8TEph9cyMGTJ1ihwiF9eUxvjiAwjZsSZC69JwbydgPSj4He3eEj/7nxqw
 fX31D6jEoyHuw==
Received: by pdx-korg-bugzilla-2.web.codeaurora.org (Postfix, from userid 48)
 id 8BD39612A0; Thu, 24 Jun 2021 02:57:21 +0000 (UTC)
From: bugzilla-daemon@bugzilla.kernel.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 213561] [bisected][regression] AMD GPU can no longer enter idle
 state after commit
Date: Thu, 24 Jun 2021 02:57:21 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Video(DRI - non Intel)
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: matoro@airmail.cc
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: cc
Message-ID: <bug-213561-2300-DbZMYnYxOJ@https.bugzilla.kernel.org/>
In-Reply-To: <bug-213561-2300@https.bugzilla.kernel.org/>
References: <bug-213561-2300@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D213561

matoro (matoro@airmail.cc) changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
                 CC|                            |matoro@airmail.cc

--- Comment #1 from matoro (matoro@airmail.cc) ---
Hi, I am confirming this issue in 5.12.13 on my Colorful Red Devil RX 5700X=
T.=20
Because of the OC profile it was consuming almost 100W continuously and hea=
ted
up to nearly 90=C2=B0C before I realized what was happening and reverted to=
 5.12.12.

My card:
0d:00.0 VGA compatible controller: Advanced Micro Devices, Inc. [AMD/ATI] N=
avi
10 [Radeon RX 5600 OEM/5600 XT / 5700/5700 XT] (rev c1)

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
