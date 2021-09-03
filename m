Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A35E73FFFB0
	for <lists+dri-devel@lfdr.de>; Fri,  3 Sep 2021 14:23:59 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BB5426E881;
	Fri,  3 Sep 2021 12:23:54 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 184046E881
 for <dri-devel@lists.freedesktop.org>; Fri,  3 Sep 2021 12:23:53 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPS id D94E9610CF
 for <dri-devel@lists.freedesktop.org>; Fri,  3 Sep 2021 12:23:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1630671832;
 bh=QhXGCq262OVdvDL9nF4xpt67xCXmq/4Pmkd9DXaRNr0=;
 h=From:To:Subject:Date:In-Reply-To:References:From;
 b=FgQLmMgvvJeTIrqWa1DGpe3bDYnbkXXW0J4+xnCRz7NB3EYZDO02ght8sBSFueBSW
 22cG9o4iHoPX7YK8sR52MdRAhWZ5Mbl3+4k2Lt5zinquEgZASQDLZ7+mkIEWVhed/y
 jtKGwNexdiTPzvRMqhTQbKWokKr1RPXZlsmaE5VhEiAdyFLuD2j4Dh9hQhvy6enE/y
 IvBbnKAKd8o84sOPSra8t6PQz4OXcM11YrLUCpiO0V8Nezg7uxWNVbboc+PaQ+QGfM
 mvesHMdum8vfRTqo8CB6UdzTNH4mMQ/bEjNPy3oVdWHK7GgYGvN0pYGOWWTYd2yDAu
 jy/2ZZKcNHSrg==
Received: by pdx-korg-bugzilla-2.web.codeaurora.org (Postfix, from userid 48)
 id D20A1603E1; Fri,  3 Sep 2021 12:23:52 +0000 (UTC)
From: bugzilla-daemon@bugzilla.kernel.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 211277] sometimes crash at s2ram-wake (Ryzen 3500U): amdgpu,
 drm, commit_tail, amdgpu_dm_atomic_commit_tail
Date: Fri, 03 Sep 2021 12:23:52 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Video(DRI - non Intel)
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: jamesz@amd.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-211277-2300-P2U58YllgS@https.bugzilla.kernel.org/>
In-Reply-To: <bug-211277-2300@https.bugzilla.kernel.org/>
References: <bug-211277-2300@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D211277

--- Comment #50 from James Zhu (jamesz@amd.com) ---
Hi Anthony,=20
Can you try if Comment #37? see if it helps. But from the log that you
attached, it is a different issue  that GFX hw has lots of ECC error, which
cause gfx ring time out. after that the gpu recover is triggered,
unfortunately, screen blank came up. I think you need create another ticket=
 for
your case.
Best Regards!
James

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
