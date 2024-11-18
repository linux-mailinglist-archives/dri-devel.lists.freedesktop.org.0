Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 97E789D1638
	for <lists+dri-devel@lfdr.de>; Mon, 18 Nov 2024 17:55:27 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 01A5910E262;
	Mon, 18 Nov 2024 16:55:25 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="U4Qecx37";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9F8CD10E262
 for <dri-devel@lists.freedesktop.org>; Mon, 18 Nov 2024 16:55:23 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id B67805C162F
 for <dri-devel@lists.freedesktop.org>; Mon, 18 Nov 2024 16:54:38 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 7EEE5C4CECC
 for <dri-devel@lists.freedesktop.org>; Mon, 18 Nov 2024 16:55:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1731948922;
 bh=eqViCOkxa5fSezNOKv+DjMIQc3U0pOTRSE4SQMxS3OU=;
 h=From:To:Subject:Date:In-Reply-To:References:From;
 b=U4Qecx37xMcaq113XAe9meGFhEm0Lr0E8sXTSa6khIu5mpuM13mKtCmxOhglKO4FM
 IXe36P/NgZUeND3r4A4Yd7LAmBQ4gEkiLT5qMlg+tk1a+f8sfbcoy9ZYWztax1+qg8
 Fz56cy0SWSvx0zRWxEVIkA1Oi2/oYrOtd9+oCdpgO58nv+uMqLNmJfv7TPomUkRsp0
 kL1ai+/mlxmSC3Gi/yUpzjWhbFuB+X1W8Lpo03V5g8nMIkRCvsrJ5fHLbySDaKRITF
 ViPRuPpL8N5l1pxRs2sbzkX1ujGJG74yXsRRhl4MjHJjskP/HIRV2TNU/A4tydYTc3
 7k2AOBGYcVnDw==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix,
 from userid 48) id 7486FC53BC2; Mon, 18 Nov 2024 16:55:22 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 219507] nouveau: GeForce GT 710: irq 166 handler
 nvkm_intr+0x0/0x1b3 [nouveau] enabled interrupts
Date: Mon, 18 Nov 2024 16:55:22 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Video(DRI - non Intel)
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: high
X-Bugzilla-Who: newchief@king.net.pl
X-Bugzilla-Status: RESOLVED
X-Bugzilla-Resolution: ANSWERED
X-Bugzilla-Priority: P3
X-Bugzilla-Assigned-To: drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-219507-2300-LdMbKBcAwy@https.bugzilla.kernel.org/>
In-Reply-To: <bug-219507-2300@https.bugzilla.kernel.org/>
References: <bug-219507-2300@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D219507

--- Comment #4 from Paul Osmialowski (newchief@king.net.pl) ---
As suggested, I've opened freedesktop issue:
https://gitlab.freedesktop.org/drm/nouveau/-/issues/394

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
