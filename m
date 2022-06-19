Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DCBE1550BE4
	for <lists+dri-devel@lfdr.de>; Sun, 19 Jun 2022 17:44:04 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CF64310FC19;
	Sun, 19 Jun 2022 15:44:00 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5E9D010FC19
 for <dri-devel@lists.freedesktop.org>; Sun, 19 Jun 2022 15:44:00 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 84BAA611E2
 for <dri-devel@lists.freedesktop.org>; Sun, 19 Jun 2022 15:43:59 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 79CB7C341CB
 for <dri-devel@lists.freedesktop.org>; Sun, 19 Jun 2022 15:43:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1655653438;
 bh=CF9h0eIErn149SzRXGIjwvx731I3jNjWb3jK4gknmOM=;
 h=From:To:Subject:Date:In-Reply-To:References:From;
 b=B06RFmU72nA4M5LeeEHg7foeGpMjyrIjDlOrz+eWuaikguQLE8svFY3nVt5K6pKsT
 7w7b8RIXKlb5huAr78P/jrLqjIC5KkndHWrw/UIKKgbUF7oxUomFaG2p4HJ9Y8bnVR
 +P4WZYwf/pjf2iO0FlMEo1/z6sTThv1CFIWNpwoUFGjt1ODe7InVnhXyNTGKpkGcVo
 h+EnhuzWL6eRbSwSWTDTAdhn0gHuloADoEtFG3F4N5X3YEGxTAMI+UoMiUzQh9ZIwz
 Inn70nF7whymHrz4yv5shD33Qct8L8iZpctbWIxZhfUtYcEM5dT7jnQM/g59Vdmkvv
 9WbRq2E7WFbPw==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix,
 from userid 48) id 67E22CBF854; Sun, 19 Jun 2022 15:43:58 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 172421] radeon: allow to set the TMDS frequency by a special
 kernel parameter
Date: Sun, 19 Jun 2022 15:43:57 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Video(DRI - non Intel)
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: enhancement
X-Bugzilla-Who: matt.weiland@gmx.at
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: cc
Message-ID: <bug-172421-2300-QESgTmTB4Z@https.bugzilla.kernel.org/>
In-Reply-To: <bug-172421-2300@https.bugzilla.kernel.org/>
References: <bug-172421-2300@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D172421

Matt Weiland (matt.weiland@gmx.at) changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
                 CC|                            |matt.weiland@gmx.at

--- Comment #23 from Matt Weiland (matt.weiland@gmx.at) ---
I think it a rather political issue that the patch has not been accepted up=
 to
now. So many people have reported about it being useful not only on the ker=
nel
bugzilla here and I would really welcome it if you kernel developers starte=
d to
rethink your decision about it. There is still time and the patch is still
being useful.

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
