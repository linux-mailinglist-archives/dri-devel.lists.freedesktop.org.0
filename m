Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D809847A124
	for <lists+dri-devel@lfdr.de>; Sun, 19 Dec 2021 16:33:45 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BA1A712B92E;
	Sun, 19 Dec 2021 15:33:42 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from ams.source.kernel.org (ams.source.kernel.org
 [IPv6:2604:1380:4601:e00::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E0BC912B92C
 for <dri-devel@lists.freedesktop.org>; Sun, 19 Dec 2021 15:33:41 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 8B0CAB80D09
 for <dri-devel@lists.freedesktop.org>; Sun, 19 Dec 2021 15:33:40 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 5318EC36AEA
 for <dri-devel@lists.freedesktop.org>; Sun, 19 Dec 2021 15:33:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1639928019;
 bh=6P8Ad/EIeHxnJHwXEggb5mXJN7fcdp3AnG7xOmny4xY=;
 h=From:To:Subject:Date:In-Reply-To:References:From;
 b=B99ynYOk4QIiWbv7ER/EpzLGErb53q5KGxNb2ldZIqVCFdPHWPc6g3iVcZsMKGr1h
 t4b9lb0LxdhI8lEVaL5s6xOLNkbdo/awIwI8S7z7owDddUjk75xcYvu9+jCpgXZT1t
 IKIEH6/eyayOp5PGYALkMmBnYmrUlNY5/d6uqNDmYM9VKSsWfjwTAkd8ErpzKbe7SA
 tacdSpJUGX4IbcA7r7oONcmg5gmnrJlY1bQnh+aaDcqbWJF7f62OX/UaZMdhSODbGs
 QTiOColmCjptIdn8ofGGgwd9lxwGb99IiwTlPBq2j4CNl8ClhjJkT53j/L2+A4DFVV
 XIYOufDEdazuw==
Received: by pdx-korg-bugzilla-2.web.codeaurora.org (Postfix, from userid 48)
 id 380E460F91; Sun, 19 Dec 2021 15:33:39 +0000 (UTC)
From: bugzilla-daemon@bugzilla.kernel.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 215223] AMDGPU Driver with Radeon RX 6700 sometimes can not
 find display
Date: Sun, 19 Dec 2021 15:33:38 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Video(DRI - non Intel)
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: reznov90210@gmail.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: cf_kernel_version
Message-ID: <bug-215223-2300-BolMWBbJ2U@https.bugzilla.kernel.org/>
In-Reply-To: <bug-215223-2300@https.bugzilla.kernel.org/>
References: <bug-215223-2300@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D215223

reznov90210@gmail.com changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
     Kernel Version|5.15.6                      |5.15.10

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
