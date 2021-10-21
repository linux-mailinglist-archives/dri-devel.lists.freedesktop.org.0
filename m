Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2BC21435D31
	for <lists+dri-devel@lfdr.de>; Thu, 21 Oct 2021 10:44:10 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8AEA96E418;
	Thu, 21 Oct 2021 08:44:06 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BBB2F6E418
 for <dri-devel@lists.freedesktop.org>; Thu, 21 Oct 2021 08:44:05 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPS id 7A1C261212
 for <dri-devel@lists.freedesktop.org>; Thu, 21 Oct 2021 08:44:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1634805845;
 bh=oBEqcjwYduzZoZWjqGO09CuqBz/qnH6qbrucCLor5bY=;
 h=From:To:Subject:Date:In-Reply-To:References:From;
 b=p3NL2TGi887Gvlnb98RPBtiFwE8FMMUzO5lEJRurr0E1nqCckMxOWXJk7jQLcAr71
 NDtCqZvZ99jzFD3A/STF9zZZ7E0792m/U46Tan9FKA5SQiWEqzsM1d1zs/gpzs9Vn+
 wRy8CUXWF8nrVHLn72tg/lByizSTLEeuBUAol1YFmlEbrNywcuR9/cQqV5dCnBtWvO
 J6pFKH+x3HJsYHog4daqNe8y6qz7xn4LQnd7dmMZVjRqgZHqELuFFYkaEzA0ZXo+7L
 coMgoUw1IWVwYkjzImDJlm2uxto7RvN2K4JiRzs1lUaGTHfy3E2voDoaTJE//gl1Pe
 4Rk2R5N4jt5sw==
Received: by pdx-korg-bugzilla-2.web.codeaurora.org (Postfix, from userid 48)
 id 76CFD60F41; Thu, 21 Oct 2021 08:44:05 +0000 (UTC)
From: bugzilla-daemon@bugzilla.kernel.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 214029] [bisected] [amdgpu] Several memory leaks in amdgpu and
 ttm
Date: Thu, 21 Oct 2021 08:44:04 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Video(DRI - non Intel)
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: christian.koenig@amd.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-214029-2300-QYvBXoZhGk@https.bugzilla.kernel.org/>
In-Reply-To: <bug-214029-2300@https.bugzilla.kernel.org/>
References: <bug-214029-2300@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D214029

--- Comment #21 from Christian K=C3=B6nig (christian.koenig@amd.com) ---
No problem. It just took me a while to realize what the issue is.

The patches bisected didn't caused it, but rather just made it more likely =
to
appear.

Can I add your mail as Tested-by? (you potentially get a bit more spam with
that).

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
