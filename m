Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3F2915FE2B2
	for <lists+dri-devel@lfdr.de>; Thu, 13 Oct 2022 21:31:09 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7C4CD10E94B;
	Thu, 13 Oct 2022 19:31:02 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 97D9010E94B
 for <dri-devel@lists.freedesktop.org>; Thu, 13 Oct 2022 19:30:57 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id A55DFB82076
 for <dri-devel@lists.freedesktop.org>; Thu, 13 Oct 2022 19:30:55 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 643A6C43143
 for <dri-devel@lists.freedesktop.org>; Thu, 13 Oct 2022 19:30:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1665689454;
 bh=LpcCQCuB4SMewUdjWNCi4rlIfCIRx8CV0RFvrPieg7Q=;
 h=From:To:Subject:Date:In-Reply-To:References:From;
 b=sxVetzKFTiyKSh0bIju61z2YAvDmg705GTaXcVT4a14qXLELVe23I5F3rPCVMPovj
 5aAJ0OqEhjD28CMoCVv55YX+nMCpY+EaJvHC+DtebnpDbnkeP+mIvrRzzYI1jRtBO8
 xgNh0vh+hS3P+Y2mGQnG52UXQhkTW+E9Pknz/v5mc6G/tME5/317WktKD9LIrneh7g
 ukZE5uVmBP4UdXt2DaS/uqDAyrHQkwlDrk6dqYVSzbnXhf2/e+/3VXo7fENXaFwYAq
 1iscmkrCrqGStxKe5XskWTbQ9fWLYtc9qHQcn/7BSSTVIaTU4uuJgo7eb3HycLprF5
 PgXMft5XlK37g==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix,
 from userid 48) id 46F73C05FD2; Thu, 13 Oct 2022 19:30:54 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 216119] 087451f372bf76d breaks hibernation on amdgpu Radeon R9
 390
Date: Thu, 13 Oct 2022 19:30:53 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Video(DRI - non Intel)
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: h.judt@gmx.at
X-Bugzilla-Status: REOPENED
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-216119-2300-EkIlsJofcN@https.bugzilla.kernel.org/>
In-Reply-To: <bug-216119-2300@https.bugzilla.kernel.org/>
References: <bug-216119-2300@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D216119

--- Comment #40 from Harald Judt (h.judt@gmx.at) ---
Any updates on this? Hibernate/resume is still borked after a few cycles
(rather sooner than later) and it gets harder and harder to revert these fb
patches on newer kernels. The prefer_shadow patch alone does not really fix
this.

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
