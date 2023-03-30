Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 45FA16D0E36
	for <lists+dri-devel@lfdr.de>; Thu, 30 Mar 2023 20:57:50 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C6D4310E07D;
	Thu, 30 Mar 2023 18:57:46 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 87B2910E07D
 for <dri-devel@lists.freedesktop.org>; Thu, 30 Mar 2023 18:57:45 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id EF6A0620FF
 for <dri-devel@lists.freedesktop.org>; Thu, 30 Mar 2023 18:57:44 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 5F95CC4339E
 for <dri-devel@lists.freedesktop.org>; Thu, 30 Mar 2023 18:57:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1680202664;
 bh=fc9i4kUNkFj5PYaCiJaJk7MPdzBTzBcf5dKWsnyxQo0=;
 h=From:To:Subject:Date:In-Reply-To:References:From;
 b=IyEDCVs/kpf9W7b1y1wS6pK1Fl6NFEVq0fDkwSu7M3RfJvtY1ve20MhwfrdwQQUM9
 ZnUbbI2Yzr700ufa7cR1hOvyztKtE+C0arxJw74fyb+ZNiycDSCCkSFJIgjuQ3yfn2
 TJ3Qvrat0Qxw+r+B+xoI0fplx+2Npzxb9v3v3k36Q8EOapRurYjtMeDf1AI/M+9Dcx
 NFocyz+3zCDEg2Dgs23c7ccpAGm5d9RLFVrraFFHJV4kGiQfxFKaxrQ0F7XpI8/lRz
 jycYr1q5VxGnfLzZujsORbFZGDUiPQuN9jhQTTCfXoDJfVfBt7YCvfyr/+pjpGVQT+
 WtNGvpcR8jQzQ==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix,
 from userid 48) id 4C44FC43141; Thu, 30 Mar 2023 18:57:44 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 214071] amdgpu idle power draw too high at +75Hz
Date: Thu, 30 Mar 2023 18:57:43 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Video(DRI - non Intel)
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: NGAGE13@yandex.ru
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: cc
Message-ID: <bug-214071-2300-XFq454d2iz@https.bugzilla.kernel.org/>
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

NGAGE13 (NGAGE13@yandex.ru) changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
                 CC|                            |NGAGE13@yandex.ru

--- Comment #4 from NGAGE13 (NGAGE13@yandex.ru) ---
I have a similar problem
If I use a refresh rate above 90(100,120,144 or 165), then the memory frequ=
ency
goes up to 1000.
The video memory is heated to 60-65 degrees, the GPU temperature is normal.
As soon as I set the refresh rate to 90 or less, the memory frequency drops=
 to
96. The GPU memory temperature also drops to 45-50 degrees.
The problem exists on the EndeavourOS and Fedora 38 distributions.

Mainboard: MSI PRO B650-P WIFI
CPU: Ryzen 7600X
GPU: Radeon RX 6700XT 12Gb
Display: Xiaomi Mi Gaming 27 with DisplayPort connection.

Kernel 6.2.8 and 6.1.21
mesa 23.0.1
Wayland 1.21.0
KDE 5.27 or GNOME 43

Tested this problem on Windows 11.
Windows 11 set memory clock to 100-200 on 165Hz.

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
