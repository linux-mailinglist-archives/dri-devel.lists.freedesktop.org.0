Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A49564A380D
	for <lists+dri-devel@lfdr.de>; Sun, 30 Jan 2022 19:31:26 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5042A112F5E;
	Sun, 30 Jan 2022 18:31:24 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AB593112F5A
 for <dri-devel@lists.freedesktop.org>; Sun, 30 Jan 2022 18:31:22 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id D76C7B82990
 for <dri-devel@lists.freedesktop.org>; Sun, 30 Jan 2022 18:31:19 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id AC193C340E4
 for <dri-devel@lists.freedesktop.org>; Sun, 30 Jan 2022 18:31:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1643567478;
 bh=fdlgoRTj3YDg5tkiEbqO2bh5WTtR6ZkyJWBYqPt+GmY=;
 h=From:To:Subject:Date:In-Reply-To:References:From;
 b=SjzLvVfrZZoqHRjfoKcrcd1o3cFf9BtCANU8TOLaRvaJ89cKtbmBD5HsV0gJOkaGg
 rDvaGLklzTmccAMSfD4fCHWPVF2pB8QcTo3epAg2n395hWXcGC/vopFfc0zYs7HInB
 XfXlvJFEMGKKwmyo/zcSONnecmtzbHXzwYusZTStGr1NvcFsQOEZmqEc0vVzRUxOB5
 YSXdbsoWEGNa0tSJlHbwnGeAU6wAbQnsE2FdOaHpBvynDoQZTsGD4s/VvGnX9bfEWI
 P14Huh79C6BShbaeI0oUVtQvKS4z3x1vIjxQP3kJ2wHhUfTVRn4ZvmEzqeGLOA5O67
 0AQQKHkM6U9Nw==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix,
 from userid 48) id 9C232C05FCE; Sun, 30 Jan 2022 18:31:18 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 215549] My 6900XT can't recover while it's idle (but not
 asleep), and sometimes doesn't show at boot
Date: Sun, 30 Jan 2022 18:31:18 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Video(DRI - non Intel)
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: high
X-Bugzilla-Who: techxgames@outlook.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: rep_platform
Message-ID: <bug-215549-2300-e5FJAGypuS@https.bugzilla.kernel.org/>
In-Reply-To: <bug-215549-2300@https.bugzilla.kernel.org/>
References: <bug-215549-2300@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D215549

techxgames@outlook.com changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
           Hardware|All                         |x86-64

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
