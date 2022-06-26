Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 400AE55ADB4
	for <lists+dri-devel@lfdr.de>; Sun, 26 Jun 2022 02:06:14 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3A3C910E035;
	Sun, 26 Jun 2022 00:06:09 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AC13810E131
 for <dri-devel@lists.freedesktop.org>; Sun, 26 Jun 2022 00:06:07 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 2A29660FC9
 for <dri-devel@lists.freedesktop.org>; Sun, 26 Jun 2022 00:06:07 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 6952CC3411C
 for <dri-devel@lists.freedesktop.org>; Sun, 26 Jun 2022 00:06:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1656201966;
 bh=z7QA6FkUSDRKnEcQiXhPf6f2JvdpZLNVDi64Rtdn8DU=;
 h=From:To:Subject:Date:In-Reply-To:References:From;
 b=TRQNUeSpLZdtrwWEddje7cMpTNkI5VJPPCR4+lltoNJifxF14i4BHuu1Dm0xKxmt7
 0pIifrbJkt2yDDG3Payk89QkUtllS1+Aoz0yXMJxTcQsRNwNgTd32o1BlrGeNdxT89
 5p3CMfdAwTn90a3AaCw4sGTxmQvoucSB1Yxm2qLlf9JwtqAzL2PIZPdsGhNcyh4pSn
 GHFda+jBnzGCcEJANqTJ/jCycPV4L0nWB/zFLlbYm+hIjw5r8sl5dZjbk/jmHD53o5
 Yevbx14YZjHaIq2WeD4KwmotqXTGo3TnqogLXC6c9JV8NdcBkPXuaZ0GHZmN+039ot
 sg65WuJiPWmSA==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix,
 from userid 48) id 51997CAC6E2; Sun, 26 Jun 2022 00:06:06 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 216173] amdgpu [gfxhub] page fault (src_id:0 ring:173 vmid:1
 pasid:32769, for process Xorg pid 2994 thread Xorg:cs0 pid 3237)
Date: Sun, 26 Jun 2022 00:06:06 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Video(DRI - non Intel)
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: high
X-Bugzilla-Who: witold.baryluk+kernel@gmail.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-216173-2300-tNvKc3LEOU@https.bugzilla.kernel.org/>
In-Reply-To: <bug-216173-2300@https.bugzilla.kernel.org/>
References: <bug-216173-2300@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D216173

--- Comment #7 from Witold Baryluk (witold.baryluk+kernel@gmail.com) ---
The issue can happen even before logging from display manager to the desktop
environment.

I use lightdm.

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
