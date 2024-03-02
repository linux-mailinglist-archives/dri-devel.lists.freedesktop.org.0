Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C484886EF0F
	for <lists+dri-devel@lfdr.de>; Sat,  2 Mar 2024 08:14:44 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EC82D10E6E1;
	Sat,  2 Mar 2024 07:14:42 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="hrDjYklX";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 876D910E6E1
 for <dri-devel@lists.freedesktop.org>; Sat,  2 Mar 2024 07:14:41 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id C9E5360F0D
 for <dri-devel@lists.freedesktop.org>; Sat,  2 Mar 2024 07:14:40 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 792B5C43390
 for <dri-devel@lists.freedesktop.org>; Sat,  2 Mar 2024 07:14:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1709363680;
 bh=nRyyFS3RDvt183G4RI6UV2ylDbb5XgUGzKO0aSzPCq8=;
 h=From:To:Subject:Date:In-Reply-To:References:From;
 b=hrDjYklXg0if71BjvR84W/oguGtZTu3Txm3W3Ya0P5drety5AA8xaQjazvP84oT/5
 oCG9h3nn3QsdsOX/PlMXtIDpMHDSg+93DdKiuJz0x46jUW91X9MUq5ta7iq49qlY+i
 G//Oo3wkrGej9HhI5O8DuOeYSo6rEwuZgY0hD4lCc7FQKz3J1IQPWdUamvLFq9dA7e
 kyuOU8UmrwHUGIc+SFx3fEn7IyDjn7ntxPdP6p2AiFnYXxBv7o+F01op27M3V0veAz
 w2WMu267Y3jcy3vYPYmOX6fEH8CkAR4FHAwU4WwfWPaMcmFsoZgGnA081uEuUr6+vP
 WmPrqEyDteMhw==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix,
 from userid 48) id 67BF0C53BD0; Sat,  2 Mar 2024 07:14:40 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 218549] [REGRESSION] in 6.7.5, amdgpu: amdgpu_device_ip_resume
 failed (-62).
Date: Sat, 02 Mar 2024 07:14:40 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Video(DRI - non Intel)
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: emerg.reanimator@gmail.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P3
X-Bugzilla-Assigned-To: drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: attachments.created
Message-ID: <bug-218549-2300-HMQVT5lUxP@https.bugzilla.kernel.org/>
In-Reply-To: <bug-218549-2300@https.bugzilla.kernel.org/>
References: <bug-218549-2300@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D218549

--- Comment #2 from Alexander Goomenyuk (emerg.reanimator@gmail.com) ---
Created attachment 305946
  --> https://bugzilla.kernel.org/attachment.cgi?id=3D305946&action=3Dedit
modinfo amdgpu, 6.7.3, working

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
