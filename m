Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8963C75332D
	for <lists+dri-devel@lfdr.de>; Fri, 14 Jul 2023 09:28:12 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3F98510E7FA;
	Fri, 14 Jul 2023 07:28:09 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B9F4A10E7FA
 for <dri-devel@lists.freedesktop.org>; Fri, 14 Jul 2023 07:28:07 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 199AF61C03
 for <dri-devel@lists.freedesktop.org>; Fri, 14 Jul 2023 07:28:07 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 7A457C433C7
 for <dri-devel@lists.freedesktop.org>; Fri, 14 Jul 2023 07:28:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1689319686;
 bh=MAubDtmH8u9BtMu6gX+nM/q4Yuo4c5mogdAu5DRA04Y=;
 h=From:To:Subject:Date:In-Reply-To:References:From;
 b=XzAeu+0uh4w05D9Wofec8lzDQJAGvukJWOqokoJ5Wvk0d1oakyU+pQxiajyhFWp37
 eB+9/HzD3kDocc3epz6Xfc36jivrJrXZHzht0ft1Ci/QTFUM3EQ7Nk4L5T5KpyEhgi
 sCl/CycVPGzq8gf/q19Z032wNre0HmJYAo7Xm+BooT/PG89dquhHn5Xq3M5rcEkaxj
 gD6jlEqJpRfHzfpgH4RMlSRu7TvpXS9K/15X8qwQhB4ET+EaYOC7cjtThyLLbOko2e
 QJXMq8KqnpUSSiMvWAb4ON0SIk+qnfa/uaE0BoKofDFzbKvxJl0Pc6Gi1pH+NNGHpn
 Fb9odD0JiAaGg==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix,
 from userid 48) id 63CA8C53BCD; Fri, 14 Jul 2023 07:28:06 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 217664] Laptop doesnt wake up from suspend mode.
Date: Fri, 14 Jul 2023 07:28:06 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Video(DRI - non Intel)
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: penteljapan@o2.pl
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P3
X-Bugzilla-Assigned-To: drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-217664-2300-ub4Ytn8aYQ@https.bugzilla.kernel.org/>
In-Reply-To: <bug-217664-2300@https.bugzilla.kernel.org/>
References: <bug-217664-2300@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D217664

--- Comment #4 from popus_czy_to_ty (penteljapan@o2.pl) ---
stripped part, might be interesting?
https://pastebin.com/MgpCf7Xf

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
