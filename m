Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3438486EF12
	for <lists+dri-devel@lfdr.de>; Sat,  2 Mar 2024 08:15:09 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 373EB10EFEB;
	Sat,  2 Mar 2024 07:15:07 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="gsBdR5Oq";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sin.source.kernel.org (sin.source.kernel.org [145.40.73.55])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EED5110EFEB
 for <dri-devel@lists.freedesktop.org>; Sat,  2 Mar 2024 07:15:05 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sin.source.kernel.org (Postfix) with ESMTP id 3608CCE009F
 for <dri-devel@lists.freedesktop.org>; Sat,  2 Mar 2024 07:15:02 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 6FC03C433F1
 for <dri-devel@lists.freedesktop.org>; Sat,  2 Mar 2024 07:15:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1709363701;
 bh=A3BgE3LrN9xhjTWNWZkUkfLajD55iolrIrOySQxgSDM=;
 h=From:To:Subject:Date:In-Reply-To:References:From;
 b=gsBdR5OqTNa0pGYLM4Ii7EL78MpiXKfhZgaKQowPaE6z0BFduBxHXPdvIWrAo/9mL
 Ysmk5rOP/AfQIRqfo4U6I9y3f/oSRkR+MAbTfIfFva1NVdUBIyVDb67Pfgdg5KRQno
 QHxsitwdolfjP3jpXChRsET4eKQzV65i8TpfCT/U0+T6ZZCCVcypTpKO0kcQZKkTxr
 fgonVn+LUGVLfPGywLfvjqQn5lRZ81DZj3EHsNp/gVpHzlEcrRl8GBLGA1Cit13chj
 wTP8pFqy+7sGw3hUQFjsxrheMLr8ILGBw6rD+LUcoWy4VCk7hbZdMjLsSLJJ3UNdjb
 81tF9T6mH3rbA==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix,
 from userid 48) id 60DFEC53BCD; Sat,  2 Mar 2024 07:15:01 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 218549] [REGRESSION] in 6.7.5, amdgpu: amdgpu_device_ip_resume
 failed (-62).
Date: Sat, 02 Mar 2024 07:15:01 +0000
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
Message-ID: <bug-218549-2300-350zQN8ZdE@https.bugzilla.kernel.org/>
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

--- Comment #3 from Alexander Goomenyuk (emerg.reanimator@gmail.com) ---
Created attachment 305947
  --> https://bugzilla.kernel.org/attachment.cgi?id=3D305947&action=3Dedit
modinfo amdgpu, 6.7.5, failure

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
