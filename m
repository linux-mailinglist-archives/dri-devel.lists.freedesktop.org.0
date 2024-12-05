Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9F56C9E4A59
	for <lists+dri-devel@lfdr.de>; Thu,  5 Dec 2024 01:09:46 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DA1FB10E04D;
	Thu,  5 Dec 2024 00:09:43 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="uR8tYtxn";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 87C4510E04D
 for <dri-devel@lists.freedesktop.org>; Thu,  5 Dec 2024 00:09:42 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 25CF25C6CA0
 for <dri-devel@lists.freedesktop.org>; Thu,  5 Dec 2024 00:08:59 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id AF540C4CECD
 for <dri-devel@lists.freedesktop.org>; Thu,  5 Dec 2024 00:09:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1733357381;
 bh=hM0qBhiShMk+ttVXlSDrID6mnrqH//DzGMZb7eXlrJA=;
 h=From:To:Subject:Date:From;
 b=uR8tYtxnCYDXh2U0PyzjQCx4GZxLRUT5yNF5s9w/eqlD7mf0KstP20egLxIk7hcRB
 V3qQREbx0UzYGb3wrxU8SMP4nDGjQ5THhvA87gVhTAHLIooNphAHg7btUUi+PbGa68
 R51AvwMzWZ5nAr7kcDA4RsnfUgCzn4B2EQI99CwyirY63uXkdUBNZ13Pm9UdeJRWW3
 quNuNaiAevrSqbQ6Sqg+TPOIMkJjmDpfRPLr0TE7ykkUt+mXMg0N/1VE6NjXnxGUOc
 tuJxmFkuE94YvA3VXc0F1b1KfDgHCE5b6yp5QxtNPOTnJzwIw5hefSPAcLqtUrIb0t
 R6Hb1x233Peyg==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix,
 from userid 48) id A65A1C41612; Thu,  5 Dec 2024 00:09:41 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 219563] New: amdgpu graphical glitches on Thinkpad E14 G6 with
 panel self-refresh enabled
Date: Thu, 05 Dec 2024 00:09:41 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: new
X-Bugzilla-Watch-Reason: AssignedTo drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Video(DRI - non Intel)
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: adam.eric.fallon@gmail.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P3
X-Bugzilla-Assigned-To: drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: bug_id short_desc product version rep_platform
 op_sys bug_status bug_severity priority component assigned_to reporter
 cf_regression attachments.created
Message-ID: <bug-219563-2300@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D219563

            Bug ID: 219563
           Summary: amdgpu graphical glitches on Thinkpad E14 G6 with
                    panel self-refresh enabled
           Product: Drivers
           Version: 2.5
          Hardware: AMD
                OS: Linux
            Status: NEW
          Severity: normal
          Priority: P3
         Component: Video(DRI - non Intel)
          Assignee: drivers_video-dri@kernel-bugs.osdl.org
          Reporter: adam.eric.fallon@gmail.com
        Regression: No

Created attachment 307322
  --> https://bugzilla.kernel.org/attachment.cgi?id=3D307322&action=3Dedit
Output of lspci

The amdgpu driver occasionally suffers from graphical glitches/screen
corruption when the screen goes from being static to something changing. The
graphical glitch appears on screen very briefly, for around 1 frame. This m=
ost
often happens when I scroll or move my mouse in an application like Firefox=
 or
Thunderbird and it ranges from occurring every few seconds to every few min=
utes
or hours (usually once every ~30 minutes). There is no output in dmesg when
this occurs.

Using the grub option amdgpu.dcdebugmask=3D0x10 fixes the issue at the expe=
nse of
battery life.

Using Fedora 41 KDE spin
Output of uname -r: 6.11.10-300.fc41.x86_64
Thinkpad E14 Gen 6 (LENOVO 21M3CTO1WW)
AMD Ryzen 5 7535U with Radeon Graphics

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
