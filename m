Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0303B8B4AAF
	for <lists+dri-devel@lfdr.de>; Sun, 28 Apr 2024 10:16:59 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6F52D10EF78;
	Sun, 28 Apr 2024 08:16:54 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="LSEHmlPO";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 836C010EF78
 for <dri-devel@lists.freedesktop.org>; Sun, 28 Apr 2024 08:16:52 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 731A36035D
 for <dri-devel@lists.freedesktop.org>; Sun, 28 Apr 2024 08:16:51 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 1C0CFC113CC
 for <dri-devel@lists.freedesktop.org>; Sun, 28 Apr 2024 08:16:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1714292211;
 bh=1M7WHMcmpHunz7CCDyHTLCYtBA0mhqiact/SUyG9RT8=;
 h=From:To:Subject:Date:In-Reply-To:References:From;
 b=LSEHmlPOCdJbh6Yj/oWyrC3gAdX1RjxYg2sOptsac8fJyh7jQYAPTbTkGXYuPcgDR
 ITUY9VyUZEbaLTr0SqvBWDy5H0ICCq2n8XOtU5VrIGRhKVKAs7RDf41n21bgG1eyFj
 SwfPOr77kBB8M9SCiBfSrLPalg/50/YYxFKp6/jpAZhg2+xP/JOKHomVEr0l6+FwYY
 wPkfCnbOiR2rTNgnpjxCb2IpkrpQC/zU3nu14Jmlg37vep1YYmb6oteOLXxryBld/F
 gebHhmJNVJPVOjiLjPZalZmSdmMGjGSmWogcVckvNqTpTN+i9/Br9T/JSB4Lb9dBLp
 M2lx2T2K+0ojg==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix,
 from userid 48) id 0D557C53B50; Sun, 28 Apr 2024 08:16:51 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 218785] HP Victus by HP Laptop 16-e0xxx. HDMI connection
 doesn't detect counterpart projector.
Date: Sun, 28 Apr 2024 08:16:50 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Video(DRI - non Intel)
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: icegood1980@gmail.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P3
X-Bugzilla-Assigned-To: drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-218785-2300-2VoAs9OWEI@https.bugzilla.kernel.org/>
In-Reply-To: <bug-218785-2300@https.bugzilla.kernel.org/>
References: <bug-218785-2300@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D218785

--- Comment #2 from Sergey Ivanov (icegood1980@gmail.com) ---
same empty list is in=20

Linux ice-home 6.5.0-28-generic #29-Ubuntu SMP PREEMPT_DYNAMIC Thu Mar 28
23:46:48 UTC 2024 x86_64 x86_64 x86_64 GNU/Linux

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
