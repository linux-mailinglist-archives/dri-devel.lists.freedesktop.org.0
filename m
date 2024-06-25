Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 81CB9916EE2
	for <lists+dri-devel@lfdr.de>; Tue, 25 Jun 2024 19:11:16 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D457F10E6E0;
	Tue, 25 Jun 2024 17:11:14 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="OOqD7szb";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sin.source.kernel.org (sin.source.kernel.org [145.40.73.55])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E3A0210E6E0
 for <dri-devel@lists.freedesktop.org>; Tue, 25 Jun 2024 17:11:13 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sin.source.kernel.org (Postfix) with ESMTP id ED608CE1C52
 for <dri-devel@lists.freedesktop.org>; Tue, 25 Jun 2024 17:11:11 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id CA56CC4AF0B
 for <dri-devel@lists.freedesktop.org>; Tue, 25 Jun 2024 17:11:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1719335470;
 bh=H51F3GaTJPe5BGgfX2q1y7f3QGYCjyXKMq3qQnvRBt8=;
 h=From:To:Subject:Date:In-Reply-To:References:From;
 b=OOqD7szbESEyi37oM26izlhg/GiWjwJPWkYlTh/XG6/aOI0qf5pWwOwcf723q1v10
 LRUZ8QlHdtzkFkiomonK/Hm/lnFYzPV0h0aqg1THrcYG2VQyn/8vrtWQRAL2s5d1Qp
 YI0eGwhfAtPN/lJT91qHCyefCGEizfI4o6HlcSP4nTT8Wyz3WADlbV62JVZjr0dkFW
 JLud53zzQ8eLQPwvlMV1X/MBPr/ptAvaQDZR8Nv9xPWptDikT4ZIpC3DlXGFZh1Mot
 g71rdSzp2s5ufOMlB8Kp2fi3bCyqazSxqJw8p1d9ozvM9HajVO21vVLe+wQjAnAgZ3
 itIYGvA6a1IGg==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix,
 from userid 48) id C41A9C433E5; Tue, 25 Jun 2024 17:11:10 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 218900] amdgpu: Fatal error during GPU init
Date: Tue, 25 Jun 2024 17:11:10 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Video(DRI - non Intel)
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: blocking
X-Bugzilla-Who: jd.girard@sysnux.pf
X-Bugzilla-Status: RESOLVED
X-Bugzilla-Resolution: CODE_FIX
X-Bugzilla-Priority: P3
X-Bugzilla-Assigned-To: drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: attachments.created
Message-ID: <bug-218900-2300-lM2FSui0e2@https.bugzilla.kernel.org/>
In-Reply-To: <bug-218900-2300@https.bugzilla.kernel.org/>
References: <bug-218900-2300@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D218900

--- Comment #18 from Jean-Denis Girard (jd.girard@sysnux.pf) ---
Created attachment 306495
  --> https://bugzilla.kernel.org/attachment.cgi?id=3D306495&action=3Dedit
Complete dmesg

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
