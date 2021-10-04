Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id CDAE8421ACC
	for <lists+dri-devel@lfdr.de>; Tue,  5 Oct 2021 01:41:47 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8DACB6EAC3;
	Mon,  4 Oct 2021 23:41:45 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5909B6EAC3
 for <dri-devel@lists.freedesktop.org>; Mon,  4 Oct 2021 23:41:44 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPS id 3076761381
 for <dri-devel@lists.freedesktop.org>; Mon,  4 Oct 2021 23:41:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1633390904;
 bh=yjTUOTSz5y2YP5MhyTeBRRtO/ST7TurSjz8vQ40gtso=;
 h=From:To:Subject:Date:In-Reply-To:References:From;
 b=Zm84/1cVTxCDHYlFyfuLYEKXkefsthhB1zsSejgXZgzPWVtLZQBN7VHeHsCANj6RX
 A8o0xsH0BMAJlwHNaEakCexvT3Dq4HlGx2VSM0gVUFKuww1YgwLpAGuE991ad0czbi
 CyPRGftWS/Huveq6JRqhveUBLvEGzzCOkXYSMoU6vtmjjjQuMdbf0zVjw3W3HHByMa
 s1IfSUBTaL0KijiIyLrMsArCJ0HovAn4DFX+CU4P/MacMIpkhP651+hXb4sReizTgW
 vwIVqoV6Wu8MtdBhPJPWEq5/baLFw1+eqRGMdXvy1Hy3Ac0fLX3aZO+nbRbv9YynIc
 f7Bk6vDIp/1vg==
Received: by pdx-korg-bugzilla-2.web.codeaurora.org (Postfix, from userid 48)
 id 25F81610FA; Mon,  4 Oct 2021 23:41:44 +0000 (UTC)
From: bugzilla-daemon@bugzilla.kernel.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 214621] WARNING: CPU: 3 PID: 521 at
 drivers/gpu/drm/ttm/ttm_bo.c:409 ttm_bo_release+0xb64/0xe40 [ttm]
Date: Mon, 04 Oct 2021 23:41:43 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Video(DRI - non Intel)
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: erhard_f@mailbox.org
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: attachments.created
Message-ID: <bug-214621-2300-93DcMCTzlE@https.bugzilla.kernel.org/>
In-Reply-To: <bug-214621-2300@https.bugzilla.kernel.org/>
References: <bug-214621-2300@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D214621

--- Comment #1 from Erhard F. (erhard_f@mailbox.org) ---
Created attachment 299099
  --> https://bugzilla.kernel.org/attachment.cgi?id=3D299099&action=3Dedit
kernel .config (5.15-rc4, AMD PRO A10-8750B)

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
