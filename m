Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 28DC9ABB21F
	for <lists+dri-devel@lfdr.de>; Mon, 19 May 2025 00:14:23 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0052B10E1DA;
	Sun, 18 May 2025 22:14:20 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="gJJ9IHu8";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from nyc.source.kernel.org (nyc.source.kernel.org [147.75.193.91])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F001C10E1CC
 for <dri-devel@lists.freedesktop.org>; Sun, 18 May 2025 22:14:17 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by nyc.source.kernel.org (Postfix) with ESMTP id 84345A4EB72
 for <dri-devel@lists.freedesktop.org>; Sun, 18 May 2025 22:14:11 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 31770C4CEE7
 for <dri-devel@lists.freedesktop.org>; Sun, 18 May 2025 22:14:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1747606451;
 bh=ZBQ6y6B+1Bt51IPSPG1PEyo8b+Mkcwvt+TmMhdBWC1g=;
 h=From:To:Subject:Date:In-Reply-To:References:From;
 b=gJJ9IHu8fPtwLX5+Szu3qp5Xdbt1AVch7efErhOJX02tIP3YY6Zpuv9Kl+ORqtXAI
 zUq/am3NXG2bJdayAGneldzKM1MlBC+DccWSr7gSNpcjoGpk+JRVamdqSpBzDBQSKJ
 uy5I03nSo1K/lmvNElzjOxkhxkaxikjcqEd3iiEiArZHjTprYKNoiA4Pi3c0lIb+yk
 UMHA2nukrbcRW98zvzYpa6dr5Vu4I6/b3WiF5627AhoHMVv/gGYT0wsB8YPzFtGiPt
 /udPE91fUYpVCiAgnQacA14uvGKuZPXoXiylbwE62vOoczt02IHCvycNc/6krywseQ
 +Gi3w4KUytueA==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix,
 from userid 48) id 2826FC41616; Sun, 18 May 2025 22:14:11 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 220130] Display not working when connected via displayport
 (purple screen)
Date: Sun, 18 May 2025 22:14:11 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Video(DRI - non Intel)
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: kontoepicowe@tutanota.com
X-Bugzilla-Status: REOPENED
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P3
X-Bugzilla-Assigned-To: drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: bug_status resolution
Message-ID: <bug-220130-2300-Sqx9Pf9v7z@https.bugzilla.kernel.org/>
In-Reply-To: <bug-220130-2300@https.bugzilla.kernel.org/>
References: <bug-220130-2300@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D220130

Maciej Maciak (kontoepicowe@tutanota.com) changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
             Status|RESOLVED                    |REOPENED
         Resolution|ANSWERED                    |---

--- Comment #2 from Maciej Maciak (kontoepicowe@tutanota.com) ---
This problem happens with the proprietary driver, actually. Both free driver
and nomodeset get stuck at TTY.

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
