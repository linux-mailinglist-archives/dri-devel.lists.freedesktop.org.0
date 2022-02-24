Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 89A6A4C39C3
	for <lists+dri-devel@lfdr.de>; Fri, 25 Feb 2022 00:40:56 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 45ED310E119;
	Thu, 24 Feb 2022 23:40:52 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 10D8710E119
 for <dri-devel@lists.freedesktop.org>; Thu, 24 Feb 2022 23:40:51 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 909E461CCA
 for <dri-devel@lists.freedesktop.org>; Thu, 24 Feb 2022 23:40:50 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 9AC9EC34119
 for <dri-devel@lists.freedesktop.org>; Thu, 24 Feb 2022 23:40:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1645746049;
 bh=CKm00h+9FIJSOMsOvh98wYbR0S4G6wxf7Bd7QhgVbtM=;
 h=From:To:Subject:Date:In-Reply-To:References:From;
 b=r5BI9HFBkSsJt9kJqfX/pbvnh0okWztp09JAQM6zj4IRR+H2VX8pa4v0hXKtSoroZ
 WiyCTyX/vkJ/sUxnIFyHyRU5NVxgVnzp5ozFnqffrJTp6lsJo/WyMarkXzlHtjU8BS
 j43/FB1MrJB/dLlVDbqH5PIvCPKIbqpcGvAxT2+ZH00yIjnNgpxS2xQUWjMEsQ/Rqj
 RZn9cyNxjyygF8TZxanaBqQc3xrb4152i9Ocomm9t/i5Pz1tGSgbcP4SvfLGkHAO/+
 ufgibSzfggYVY2UctsnGzUhWJLrfmzUv6WUrjSzCs5h1dEizc5LaJI8BYa9Y5u7Etz
 nCu1eGYHZYeWw==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix,
 from userid 48) id 8B538C05FF5; Thu, 24 Feb 2022 23:40:49 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 201957] amdgpu: ring gfx timeout
Date: Thu, 24 Feb 2022 23:40:47 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Video(DRI - non Intel)
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: blocking
X-Bugzilla-Who: randyk161@gmail.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-201957-2300-AHKhmupprH@https.bugzilla.kernel.org/>
In-Reply-To: <bug-201957-2300@https.bugzilla.kernel.org/>
References: <bug-201957-2300@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D201957

--- Comment #66 from Randune (randyk161@gmail.com) ---
So I've been running for about 2.5 weeks now using the amdgpu.runpm=3D0 ker=
nel
parameter and I've had no crashes or freezes so far. I'm cautiously optimis=
tic
that for me at least this may have solved the problem.  So far I haven't
noticed any side effects (performance degradation etc.).

I understand that amdgpu.runpm=3D0 is related to power management but I don=
't
know the specifics. Possibly Alex Deucher can chime in and specify exactly =
what
this parameter does?

See my previous comments for some context:
comment 35
comment 62
comment 63

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
