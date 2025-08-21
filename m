Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A44B7B302BA
	for <lists+dri-devel@lfdr.de>; Thu, 21 Aug 2025 21:18:10 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8831110E144;
	Thu, 21 Aug 2025 19:18:07 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="EqbdOw4C";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from nyc.source.kernel.org (nyc.source.kernel.org [147.75.193.91])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A573510E144
 for <dri-devel@lists.freedesktop.org>; Thu, 21 Aug 2025 19:18:05 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by nyc.source.kernel.org (Postfix) with ESMTP id 7B08AA58591
 for <dri-devel@lists.freedesktop.org>; Thu, 21 Aug 2025 19:18:04 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 28592C4CEEB
 for <dri-devel@lists.freedesktop.org>; Thu, 21 Aug 2025 19:18:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1755803884;
 bh=TSBdlB0JXQiUIgDlJf1S5CIPGz3TMSzNWydsr376bZg=;
 h=From:To:Subject:Date:In-Reply-To:References:From;
 b=EqbdOw4CMgXgPuuo6nNZSVhq22xtMDU1iqku0C5BVWqSg/rmHOvsctqJLB+jVNnA7
 T+zuB7woExdVKRo0CoxZRpnu0ktRUlhMF94o20IajCdQkpAaPlDanVTUbtfkXClDx5
 NhgTQkahVh8AWlr4KKsh1LeiFWic0MoSAmLVsuSOjECg9McmelqXOE3nbsAPDqZa0X
 OdgBOyboasRMfREj2+dc1vfQSN8PiaW0UGtgyl5YCLpI2ptGgjc9R5oX1103X6vPqD
 FpFYBt8Obwmi6vlSjaf9/R5xbD6pKgZMPno7GvplGyc6YOf66sq3/fnh+IxqQrp5NA
 eljXh+xo49d4w==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix,
 from userid 48) id 212E5C53BC9; Thu, 21 Aug 2025 19:18:04 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 46181] No Brightness control-nouveau
Date: Thu, 21 Aug 2025 19:18:03 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Video(DRI - non Intel)
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: aros@gmx.com
X-Bugzilla-Status: RESOLVED
X-Bugzilla-Resolution: ANSWERED
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: bug_status resolution
Message-ID: <bug-46181-2300-fphRaUUpo4@https.bugzilla.kernel.org/>
In-Reply-To: <bug-46181-2300@https.bugzilla.kernel.org/>
References: <bug-46181-2300@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D46181

Artem S. Tashkinov (aros@gmx.com) changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
             Status|NEW                         |RESOLVED
         Resolution|---                         |ANSWERED

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
