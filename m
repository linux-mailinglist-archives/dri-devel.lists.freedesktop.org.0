Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 917E2931EED
	for <lists+dri-devel@lfdr.de>; Tue, 16 Jul 2024 04:36:06 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6646F10E345;
	Tue, 16 Jul 2024 02:36:04 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="JXz9XGOb";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sin.source.kernel.org (sin.source.kernel.org [145.40.73.55])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1888010E345
 for <dri-devel@lists.freedesktop.org>; Tue, 16 Jul 2024 02:36:03 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sin.source.kernel.org (Postfix) with ESMTP id A106CCE0FCB
 for <dri-devel@lists.freedesktop.org>; Tue, 16 Jul 2024 02:36:00 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 9DE82C4AF15
 for <dri-devel@lists.freedesktop.org>; Tue, 16 Jul 2024 02:35:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1721097359;
 bh=MC7rVFV8wgXsQQ0hhLl1/sz9nowIN+sBbM3p5P8lXeE=;
 h=From:To:Subject:Date:In-Reply-To:References:From;
 b=JXz9XGObZObWiWoqJp1U+C4N69rTh6jqD/gO0gveKnboCCmwgnZF/tnwQhQFD1Hy7
 +UQNjKffmuNLZjgC6ibOElzlqJ4o5bB1tezyusru0SQem9JpqH2JqYvEXXfsfFbkvR
 /EtkslNFSvUeZ0lebQx/S/r0AbnCf37yJh8rp/mJheUAnPdjE5Bq4hc5drjMkwkmj5
 hX8tyWvXRYB+7IoSSLFtSz2GQ52Z3cWWVomaz76TLh93wD7KIp/7/Qy2aABxwJiJwQ
 U4z3A025wPfIDKIbj42jwOrztqZac/EUQjOFc/YHyCsTzHqPqP12NzBVBvNw+A4YxV
 Dn0gsDdtvUwfA==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix,
 from userid 48) id 97665C53BB9; Tue, 16 Jul 2024 02:35:59 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 201497] [amdgpu]: '*ERROR* No EDID read' is back in 4.19
Date: Tue, 16 Jul 2024 02:35:58 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Video(DRI - non Intel)
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: gabrielbarros+k@gmail.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: attachments.created
Message-ID: <bug-201497-2300-0VBsrkP19z@https.bugzilla.kernel.org/>
In-Reply-To: <bug-201497-2300@https.bugzilla.kernel.org/>
References: <bug-201497-2300@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D201497

--- Comment #30 from gabriel barros (gabrielbarros+k@gmail.com) ---
Created attachment 306573
  --> https://bugzilla.kernel.org/attachment.cgi?id=3D306573&action=3Dedit
kernel logs, failure when attaching HDMI cable to long running system

Adding to Comment 29. I still get the EDID errors even when it "works" afte=
r a
reboot-with-monitor-already-plugged. Here are the logs. First the log for t=
he
failure, which happens when i plug in the monitor in a long running system

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
