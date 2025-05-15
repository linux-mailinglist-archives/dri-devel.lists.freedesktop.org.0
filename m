Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2825CAB92AC
	for <lists+dri-devel@lfdr.de>; Fri, 16 May 2025 01:06:51 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 212FD10E984;
	Thu, 15 May 2025 23:06:47 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="A1vNwbTp";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from nyc.source.kernel.org (nyc.source.kernel.org [147.75.193.91])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 16E8410E984
 for <dri-devel@lists.freedesktop.org>; Thu, 15 May 2025 23:06:42 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by nyc.source.kernel.org (Postfix) with ESMTP id CA599A4E490
 for <dri-devel@lists.freedesktop.org>; Thu, 15 May 2025 23:06:37 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 781AEC4CEED
 for <dri-devel@lists.freedesktop.org>; Thu, 15 May 2025 23:06:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1747350397;
 bh=YCc4xnWCpfXNoIRBaIjFpj7loq6VutZJ1ns+j6EUuTo=;
 h=From:To:Subject:Date:From;
 b=A1vNwbTpR5ZvnVvT7ifoy/7F5SVy3JgsCA6G/vM6KhYZU8/p2R/eh/4BjUSoKiwp8
 Om3zVqyhxUckxpbECjCwEQCWSSxiGKxOKjQ31L20jIHxbkpwFT8QOLROxu6UlyCjHu
 GYETZd5WIiXm8RPoM9AeLKR6apVYVzBbpnwCEF4R4ZBUQ+mNNKHT7wHoD7nbSe/RvZ
 UrUt8p7os9aqjL8WJeFvcpPSH3Yf2tZFowB5115089qzsQzWlnGT6YluiNNfulBy/e
 R99WLBw0+R1XywvX0ZTTmJzodTo7/GC2dfM/kGCKgFivArhi66SacUa1ONoGtNP6nS
 8lkyPdRK9Wwtg==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix,
 from userid 48) id 67A5FC41612; Thu, 15 May 2025 23:06:37 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 220130] New: Display not working when connected via displayport
 (purple screen)
Date: Thu, 15 May 2025 23:06:37 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: new
X-Bugzilla-Watch-Reason: AssignedTo drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Video(DRI - non Intel)
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: kontoepicowe@tutanota.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P3
X-Bugzilla-Assigned-To: drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: bug_id short_desc product version rep_platform
 op_sys bug_status bug_severity priority component assigned_to reporter
 cf_regression attachments.created
Message-ID: <bug-220130-2300@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D220130

            Bug ID: 220130
           Summary: Display not working when connected via displayport
                    (purple screen)
           Product: Drivers
           Version: 2.5
          Hardware: All
                OS: Linux
            Status: NEW
          Severity: normal
          Priority: P3
         Component: Video(DRI - non Intel)
          Assignee: drivers_video-dri@kernel-bugs.osdl.org
          Reporter: kontoepicowe@tutanota.com
        Regression: No

Created attachment 308130
  --> https://bugzilla.kernel.org/attachment.cgi?id=3D308130&action=3Dedit
the purple screen

The photograph of how it looks is in the attachment. I have a GTX 970 conne=
cted
via DisplayPort. When launching any LiveISO in normal mode, I get this scre=
en.
HDMI works, although stuttery. The GPU is completely fine, as I game on it =
on
daily basis. In some distros (tried Linux Mint) starting with nomodeset mak=
es
the display working. On Arch-based distros I get stuck at "Reached target
graphical interface" in the TTY.

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
