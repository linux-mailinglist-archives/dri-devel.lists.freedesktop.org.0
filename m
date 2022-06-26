Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 6080655B19B
	for <lists+dri-devel@lfdr.de>; Sun, 26 Jun 2022 13:57:54 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 36ACB113423;
	Sun, 26 Jun 2022 11:57:51 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from ams.source.kernel.org (ams.source.kernel.org
 [IPv6:2604:1380:4601:e00::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B351B113423
 for <dri-devel@lists.freedesktop.org>; Sun, 26 Jun 2022 11:57:49 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id EEACEB80B9F
 for <dri-devel@lists.freedesktop.org>; Sun, 26 Jun 2022 11:57:47 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 982FFC34114
 for <dri-devel@lists.freedesktop.org>; Sun, 26 Jun 2022 11:57:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1656244666;
 bh=dOFefoEVSVDEfA7z27KlmK/n7IYdjqwDSRvUTL+zrMM=;
 h=From:To:Subject:Date:In-Reply-To:References:From;
 b=tEhSNeZRV1TD6mEqROy2VUN3pr2Rq7jlgGgcvoxt6jGzWXnqdtspuBgpb8JVM3u6O
 8/VAEemvT7HG0aulYKlyjVouo4BT4z4GIE1A9hiMx7u3RjwycGotPj1Gqduzd8O8uI
 X+09Ip6Gnq1EClxrRYxIQTj0KF7YJ25v7MAKlAeAVsIPcJj1d4xp1g/gc+FZRESyFn
 kHH9YuNPA6/bYOQx77V5Uw03amsLYW3KjxJ35wVU2aAf83ON38YP7v2NwJimMzmoPE
 bHEd+5jyR/ouP/yET+k7FlWunzhFy3aLX5NN7YK62sekR3m95/df9p/fx8fAlUF2hB
 nNhklqCq3VpTw==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix,
 from userid 48) id 7D11ACAC6E2; Sun, 26 Jun 2022 11:57:46 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 216175] PowerColor Radeon Rx 6400 ITX does not work.
Date: Sun, 26 Jun 2022 11:57:46 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Video(DRI - non Intel)
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: blocking
X-Bugzilla-Who: nobutarounosuke@gmail.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-216175-2300-XO1K24iW8q@https.bugzilla.kernel.org/>
In-Reply-To: <bug-216175-2300@https.bugzilla.kernel.org/>
References: <bug-216175-2300@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D216175

--- Comment #3 from nobutarounosuke@gmail.com ---
Next, I add the Rx 6400 and change display output via Ryzen 3 PRO 4350G. The
run goes to reboot automatically. The journal is Attachment-B.

Finally, the run after the automatic reboot works. The journal is attachmen=
t-C.

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
