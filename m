Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A4BB94EB4FE
	for <lists+dri-devel@lfdr.de>; Tue, 29 Mar 2022 23:03:26 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A4E0010E2C0;
	Tue, 29 Mar 2022 21:03:22 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 04A9810E2C0
 for <dri-devel@lists.freedesktop.org>; Tue, 29 Mar 2022 21:03:22 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 33A6061724
 for <dri-devel@lists.freedesktop.org>; Tue, 29 Mar 2022 21:03:19 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 94BD3C34110
 for <dri-devel@lists.freedesktop.org>; Tue, 29 Mar 2022 21:03:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1648587798;
 bh=MEaY/etAzXKdhZ0kmFzO7WaBQ0CtiOTAu17uiIdZ6/U=;
 h=From:To:Subject:Date:In-Reply-To:References:From;
 b=hXlaQm/4+iwN+Uvi977jY9asy9J33BrCZLboipl43d4LmL/nWfBl/dJ65dYSETH2O
 YBnR3UQlwQdo367AZDc63zZNn5/PSz5X+qNAsLR92h6DEruJlvdw0K07zmp9G66/Vw
 1thJvXzV6EskBJHnR3Z7Y9D5+FH0zx7SQYXupug8HZLC8XOg8NGYKquQPZ4Op6Etev
 GJRFi7jdiR5GBTJgQl0L01dCarksvMtXCskQPepRZ/6Ea8Dy9i9CIgEI7Lvspr41I5
 0ZRa68yYdvAp9z4u2xLCOTKHBLhTvbeF7gg6+c0wQ+N8IGDjXCim/BlE45gco0NjJH
 rie1QY/wu0BNA==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix,
 from userid 48) id 7CB27CC13AF; Tue, 29 Mar 2022 21:03:18 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 213983] WARNING: CPU: 3 PID: 520 at
 drivers/gpu/drm/ttm/ttm_bo.c:409 ttm_bo_release+0x7a/0x803 [ttm]
Date: Tue, 29 Mar 2022 21:03:17 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Video(DRI - non Intel)
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: fdc@fcami.net
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: cc
Message-ID: <bug-213983-2300-6myF4FqZw3@https.bugzilla.kernel.org/>
In-Reply-To: <bug-213983-2300@https.bugzilla.kernel.org/>
References: <bug-213983-2300@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D213983

Fran=C3=A7ois Cami (fdc@fcami.net) changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
                 CC|                            |fdc@fcami.net

--- Comment #5 from Fran=C3=A7ois Cami (fdc@fcami.net) ---
I don't see why https://bugzilla.kernel.org/show_bug.cgi?id=3D214621 was re=
solved
as it contains a lot more data than this bug.

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
