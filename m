Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E75BE487F3D
	for <lists+dri-devel@lfdr.de>; Sat,  8 Jan 2022 00:12:47 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 210B010F71F;
	Fri,  7 Jan 2022 23:12:45 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B850F10F702
 for <dri-devel@lists.freedesktop.org>; Fri,  7 Jan 2022 23:12:43 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id E1A6A62017
 for <dri-devel@lists.freedesktop.org>; Fri,  7 Jan 2022 23:12:42 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 592B9C36AF2
 for <dri-devel@lists.freedesktop.org>; Fri,  7 Jan 2022 23:12:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1641597162;
 bh=WI4gbqzfMUiuFrQYfHKU0SRl6QuEjgsHeAQSoG8KmOo=;
 h=From:To:Subject:Date:In-Reply-To:References:From;
 b=n4PEluoD+kExoLQhP05+RSk4pTD15EjUNJzAcCBB35s41xjnN0ZvoVlavHYjAcY9l
 JuBjydcUIv2VKpn9uNycFyts0LXXnbWWxN2EsgukQZED4wwF9iQlWe0pbE6/yNCu5E
 4BTLgm94eaQ92Q6b5CAFdLxJg71CEfvY6yrE+qg2yZzIjjLznaUCTkSXM4LSe0J495
 dMlWxaMmFLNHEjd/24ops/v4bO81fO8a6j+7q9mVK9qPAAAeInUHifynlbWRtwNcL3
 DkQASxG/IfdG2Eb+24M/rRPh7RFWNG17O4PSXgl8KqmDlYZi92ZEMnzs6iQFTPLWJg
 xTkKFuNiseEhA==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix,
 from userid 48) id 48BB4C05FCF; Fri,  7 Jan 2022 23:12:42 +0000 (UTC)
From: bugzilla-daemon@bugzilla.kernel.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 215001] Regression in 5.15, Firmware-initialized graphics
 console selects FB_VGA16, screen corruption
Date: Fri, 07 Jan 2022 23:12:41 +0000
X-Bugzilla-Reason: CC
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: None
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Video(Other)
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: bugs-a21@moonlit-rail.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_video-other@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-215001-2300-cnkDCf3rNZ@https.bugzilla.kernel.org/>
In-Reply-To: <bug-215001-2300@https.bugzilla.kernel.org/>
References: <bug-215001-2300@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D215001

--- Comment #10 from Kris Karas (bugs-a21@moonlit-rail.com) ---
Hi Thorsten -

Thanks for the helpful pointer on bug reporting (comment 9).  I've been so =
used
to dealing with LKML and Bugzilla (since 1993) that I'd rather forgotten ab=
out
Lore.  :-)

I didn't know whether the regression trackers were a real "bot" sort of thi=
ng,
or just folks pitching in to try to keep track by hand.  Good to know that =
it's
still human-powered.

I've got another bug to file now, multiple flavors of OOPSen showing up on =
boot
in _kmalloc due to creation/manipulation of network devices (bridges, veth),
perhaps as a result of the "igb" patches in 5.15 as it seems hardware-speci=
fic.
 I'll try to cc those lists when I have it bisected or narrowed down a bit.=
..

Kris

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are on the CC list for the bug.=
