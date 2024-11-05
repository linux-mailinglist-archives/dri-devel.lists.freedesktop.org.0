Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 00F279BCA70
	for <lists+dri-devel@lfdr.de>; Tue,  5 Nov 2024 11:26:48 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 096EE10E559;
	Tue,  5 Nov 2024 10:26:47 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="udCVObay";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from nyc.source.kernel.org (nyc.source.kernel.org [147.75.193.91])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 47EEB10E557
 for <dri-devel@lists.freedesktop.org>; Tue,  5 Nov 2024 10:26:45 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by nyc.source.kernel.org (Postfix) with ESMTP id 557E0A4023A
 for <dri-devel@lists.freedesktop.org>; Tue,  5 Nov 2024 10:24:49 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 0EC13C4CECF
 for <dri-devel@lists.freedesktop.org>; Tue,  5 Nov 2024 10:26:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1730802404;
 bh=Jvf5tzNVZMiZEfHQ+fChOnWL2KP0WrHOmZxzJuSnqXY=;
 h=From:To:Subject:Date:In-Reply-To:References:From;
 b=udCVObayPvFDQIT91Vx7rxO0P9yii8kh8vfybFTrEP9XPzGw4HVJ56+qEzppGnmzW
 lH0v3rpkZ1IQvVoMr4UnomdvlAcleS3nulKDNmUVI0+v38QANi8Ok/w57MzXr0iTUt
 fY0wehHTmycrAcCVTCEcu/iZIUALNbs6z64H9zm6CTY+GI+S5XFdQnVNL1tqk7lp6B
 AYAEOzS2QYvZ/jHxRhsmea1KEER1LkMudTIRMGPsjhegiiBJlxwOVwygOSmXlGnoqd
 8kxSQMrgi6juSOwDyh4N6oj8Iuk0fMN15OM0JxeN7QMdBTYzRSk0bbQ8NdCcAiGhh3
 S/6kHEX3s2PUg==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix,
 from userid 48) id 07787C53BC4; Tue,  5 Nov 2024 10:26:44 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 219468] Screen flickering on Radeon 680M - 6.12
Date: Tue, 05 Nov 2024 10:26:43 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Video(DRI - non Intel)
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: low
X-Bugzilla-Who: leejm516@gmail.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P3
X-Bugzilla-Assigned-To: drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: cf_kernel_version
Message-ID: <bug-219468-2300-CCfBUYS3wF@https.bugzilla.kernel.org/>
In-Reply-To: <bug-219468-2300@https.bugzilla.kernel.org/>
References: <bug-219468-2300@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D219468

Joungmin Lee (leejm516@gmail.com) changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
     Kernel Version|                            |6.12

--- Comment #2 from Joungmin Lee (leejm516@gmail.com) ---
Video clips taken.

https://youtu.be/WfS5tWvqiYc
https://youtu.be/vVnlvhUzIvY

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
