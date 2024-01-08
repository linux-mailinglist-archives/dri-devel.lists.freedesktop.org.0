Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id DD558826B7D
	for <lists+dri-devel@lfdr.de>; Mon,  8 Jan 2024 11:19:46 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B43B310E225;
	Mon,  8 Jan 2024 10:19:43 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C02D810E1F5
 for <dri-devel@lists.freedesktop.org>; Mon,  8 Jan 2024 10:19:42 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id C901560EDC
 for <dri-devel@lists.freedesktop.org>; Mon,  8 Jan 2024 10:19:41 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 78121C433C9
 for <dri-devel@lists.freedesktop.org>; Mon,  8 Jan 2024 10:19:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1704709181;
 bh=5Lg9JbIakHaAA4WlVxvlFzKp2TNiE++JCk6IYbnCHyg=;
 h=From:To:Subject:Date:In-Reply-To:References:From;
 b=CRPkILdDCtebjK9JIgw5tdrvO/OkPXNXkY0lwgCr4VR+n9530Qk07YI5d1pH02C72
 wCQN6meZCOoriSkCv6A9QV62wh3jKgijJaNyM0rfJ/HOuFpD9b7jiDIwy5RiWfhgvV
 m3ZosQ+t1/+7cWX9R38FOr2ctZOxDdxL3F0+9THPMwPRsdWuRpNti6yFhk31Osgrsu
 7f5T2j8Nam5wdIm7RtjAUNIzxopzNEDUkgE0D0TBMN8mDA27Aex+xREqVz1fVqrJsU
 7w+p5f1zwUblKKj5mOUqJ4ZBgNGGwfZzV02B3eqcV5NHmSsQb00yz7QiFt5oXf6HWU
 NOn8wGqGxEQkA==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix,
 from userid 48) id 62BF4C53BD3; Mon,  8 Jan 2024 10:19:41 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 111271] Black stripe on screen with MGAG200 (PowerEdge R320)
 and modesetting
Date: Mon, 08 Jan 2024 10:19:41 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Video(DRI - non Intel)
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: devzero@web.de
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: cc
Message-ID: <bug-111271-2300-nzWzVruf7y@https.bugzilla.kernel.org/>
In-Reply-To: <bug-111271-2300@https.bugzilla.kernel.org/>
References: <bug-111271-2300@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D111271

Roland Kletzing (devzero@web.de) changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
                 CC|                            |devzero@web.de

--- Comment #8 from Roland Kletzing (devzero@web.de) ---
there has been major rework in mgag200 since your report, could you perhaps
retry  with recent 6.1 or 6.6 kernel how that behaves?

also mind that there is a patch on the way to get merged soon which fixes an
issue cause by the driver rework
https://bugzilla.kernel.org/show_bug.cgi?id=3D217790

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
