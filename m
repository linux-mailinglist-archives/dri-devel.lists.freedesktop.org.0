Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 82D5C9C03C7
	for <lists+dri-devel@lfdr.de>; Thu,  7 Nov 2024 12:21:59 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9124610E80F;
	Thu,  7 Nov 2024 11:21:56 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="kODR3XLr";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from nyc.source.kernel.org (nyc.source.kernel.org [147.75.193.91])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BE05910E81F
 for <dri-devel@lists.freedesktop.org>; Thu,  7 Nov 2024 11:21:54 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by nyc.source.kernel.org (Postfix) with ESMTP id 1D68DA43949
 for <dri-devel@lists.freedesktop.org>; Thu,  7 Nov 2024 11:19:59 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 9C1CBC4CED3
 for <dri-devel@lists.freedesktop.org>; Thu,  7 Nov 2024 11:21:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1730978513;
 bh=VHVydhpm0TWkrehtKlXdw1WLOcussO1gxIhHXNRibVI=;
 h=From:To:Subject:Date:In-Reply-To:References:From;
 b=kODR3XLrHvh+zJAKCJbzv1Bm2N2r700JPgcjnWnp3kAlLIv6EoRuwcmzKIN6nudxZ
 qQIpax1DhmSWs1LtLjKblE6/DuDfa1H6moZOauqt1hFctAAfOunzGvePiLF0+vq/wj
 Bcx7dbM7A4lrbmUoqBV++XMCv7Z4Qe3vXXhJynnS80ydmUS8N6yT8fyeqf2jwXLA2V
 9X6xEK4ctqQL19P5814kH0ESydJFsUILIC8/FJZxGI2QMCjSm+pQY/rqNeKugCBNx6
 6UzvXDc0a5xPElsy1cJZDdQUZR90o8KWNhk8r/9PMRZeUShuTD88CaIwDR0t9bxrBO
 cqO8s1pJ2uLkw==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix,
 from userid 48) id 8C6ACC53BBF; Thu,  7 Nov 2024 11:21:53 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 206225] nouveau: Screen distortion and lockup on resume
Date: Thu, 07 Nov 2024 11:21:53 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Video(DRI - non Intel)
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: high
X-Bugzilla-Who: aros@gmx.com
X-Bugzilla-Status: RESOLVED
X-Bugzilla-Resolution: DOCUMENTED
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: bug_status resolution
Message-ID: <bug-206225-2300-aiVqGjZlo6@https.bugzilla.kernel.org/>
In-Reply-To: <bug-206225-2300@https.bugzilla.kernel.org/>
References: <bug-206225-2300@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D206225

Artem S. Tashkinov (aros@gmx.com) changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
             Status|NEW                         |RESOLVED
         Resolution|---                         |DOCUMENTED

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
