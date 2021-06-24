Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 5D1613B30F1
	for <lists+dri-devel@lfdr.de>; Thu, 24 Jun 2021 16:06:31 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 101896EB08;
	Thu, 24 Jun 2021 14:06:28 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1115D6EB08
 for <dri-devel@lists.freedesktop.org>; Thu, 24 Jun 2021 14:06:27 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPS id D93156140B
 for <dri-devel@lists.freedesktop.org>; Thu, 24 Jun 2021 14:06:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1624543586;
 bh=p3dQnXf0UTkPLpvtTuyXy/JKlbQgMbi/oY9Q3w/aSfg=;
 h=From:To:Subject:Date:In-Reply-To:References:From;
 b=NNfOkJoQWSmPFp++kqR3nSOI0hqjhvZU/I4xO8A0F4mX1jZsSKgd22FUbPh4YNpu0
 8tnm67a1siFqsAj8U0LkRrNUw7jb8N47u2/IiLigL2VK7bhHolplA5zojRzmD5Yi+E
 TqAC7NtEdIo1RNOEEGfr7cjSSI5xxsPKfZKROdWh+4H3jJ/rMVfSNP3xb+ocZ6+Zvm
 eqZBSM2GIzNZ194GlyHYfB1wlLmeXmL/zZD/P/rq5i7iKb0def0+jBrvopBk5Umkcm
 auHCqX4q4o+J0WOUaliboVCbiiSIOXD1YBhgHyJtIssognQNlfknpPg22okPk9BYGs
 mThk21+Muls6g==
Received: by pdx-korg-bugzilla-2.web.codeaurora.org (Postfix, from userid 48)
 id CCD5F6113E; Thu, 24 Jun 2021 14:06:26 +0000 (UTC)
From: bugzilla-daemon@bugzilla.kernel.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 213561] [bisected][regression] AMD GPU can no longer enter idle
 state after commit
Date: Thu, 24 Jun 2021 14:06:26 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Video(DRI - non Intel)
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: untaintableangel@hotmail.co.uk
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: cf_kernel_version
Message-ID: <bug-213561-2300-GHNwyII6rC@https.bugzilla.kernel.org/>
In-Reply-To: <bug-213561-2300@https.bugzilla.kernel.org/>
References: <bug-213561-2300@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D213561

Linux_Chemist (untaintableangel@hotmail.co.uk) changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
     Kernel Version|5.13rc7, 5.12.13            |5.13rc7, 5.12.13, 5.10.46,
                   |                            |5.4.128

--- Comment #6 from Linux_Chemist (untaintableangel@hotmail.co.uk) ---
Commit is also present in kernels 5.10.46 and 5.4.128 (stables) dated 23rd =
June
2021, so updating info for bug report. Should be a few people hitting this =
if
they update to the latest kernels this week.

It is also conceivable that a similar bug may happen with gfx9 devices with=
 a
similar commit (I don't know and can't test though) (but that is commit
4cbbe34807938e6e494e535a68d5ff64edac3f20 upstream) that is also in all of t=
hese
kernels.
If you don't have a gfx10 device, you should file a separate bug report if =
that
commit IS causing you an issue (it may not, I'm just guessing based on repo=
rts)
- build a linux kernel and do a git bisect to check.

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
