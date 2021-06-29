Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 025BE3B7AD4
	for <lists+dri-devel@lfdr.de>; Wed, 30 Jun 2021 01:55:16 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0281A6E0D0;
	Tue, 29 Jun 2021 23:55:13 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5A33B6E0D0
 for <dri-devel@lists.freedesktop.org>; Tue, 29 Jun 2021 23:55:12 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPS id 2E94661CB1
 for <dri-devel@lists.freedesktop.org>; Tue, 29 Jun 2021 23:55:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1625010912;
 bh=0T0r/75xqf4IzFbUTPBA5xTl7oBmgvzZVBYK8O4PBSY=;
 h=From:To:Subject:Date:In-Reply-To:References:From;
 b=bJkN4yXRqlBG6dzP/vsocu0xEw1QpX+v6la3X/cHU6WtB59XuyiPP2H7RheicUAUO
 5EqnvPHNb5g+TrCUq4FM5himxnk0xGADPWqoPq4QFE0x/d2N6WAM5Gh3m6hhhEUO5U
 QbcjNLuY5H+BfGCWOjTd1U6pcLaA+UId90vGZjPgiNGQIHjyoRkE0WRnxgQxHo6zo7
 HFt8rSryJdb22l8LnnjEJK+7ZSfdsxKfbG0cIgVhNf9IUy7L4kUz1ruf3YxbB8N4d/
 BR5dU17T4/yGc55sdiyrcUvdqqzodJ0S+mLWWm+fiXGI8t4jSNv7Z9kwHUgSP3x+1E
 bnL4LeEu1FfQw==
Received: by pdx-korg-bugzilla-2.web.codeaurora.org (Postfix, from userid 48)
 id 29DB6610C8; Tue, 29 Jun 2021 23:55:12 +0000 (UTC)
From: bugzilla-daemon@bugzilla.kernel.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 213391] AMDGPU retries page fault with some specific processes
 amdgpu and sometimes followed [gfxhub0] retry page fault until *ERROR* ring
 gfx timeout, but soft recovered
Date: Tue, 29 Jun 2021 23:55:11 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Video(DRI - non Intel)
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: low
X-Bugzilla-Who: samy@lahfa.xyz
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: attachments.created
Message-ID: <bug-213391-2300-BkqQ1QYtFx@https.bugzilla.kernel.org/>
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

--- Comment #26 from Lahfa Samy (samy@lahfa.xyz) ---
Created attachment 297669
  --> https://bugzilla.kernel.org/attachment.cgi?id=3D297669&action=3Dedit
amdgpu-xorg-page-faults-screen-blackout-when-memory-heavily-used

Here are other logs. I have seen that when triggering the bug yet again on =
the
5.12.10-arch1-1 linux kernel running on ArchLinux, the computer didn't free=
ze
this time like before, it just stopped displaying anything (Xorg was affect=
ed
so I guess that's why).=20
I'm using this version of the linux-firmware package under Arch :
linux-firmware-20210511.7685cf4-1=20

I have not yet downgraded to test with a downgraded linux-firmware package,=
 may
try this soon, if I get affected by the issue too frequently.

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
