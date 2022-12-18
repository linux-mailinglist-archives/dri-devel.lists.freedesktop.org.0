Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 213F164FEC6
	for <lists+dri-devel@lfdr.de>; Sun, 18 Dec 2022 12:39:09 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 17B6E10E194;
	Sun, 18 Dec 2022 11:38:53 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0C50510E194
 for <dri-devel@lists.freedesktop.org>; Sun, 18 Dec 2022 11:38:43 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 6D607B80066
 for <dri-devel@lists.freedesktop.org>; Sun, 18 Dec 2022 11:38:33 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 0DABEC433EF
 for <dri-devel@lists.freedesktop.org>; Sun, 18 Dec 2022 11:38:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1671363512;
 bh=lHURTiHXwUMQheHNIT+FcL0vU4SDd0b80iQ5WPUoBvA=;
 h=From:To:Subject:Date:In-Reply-To:References:From;
 b=u1ayA4yR1VL0vU24MUUo7eG9aj4smYjx6qn9XV0a4pJ/nCzAsOuTa4M/w3Z1h8P1g
 Py9qplpwbQp8Y39sEFVnX+bgLCcdA1f1o9Gw7M9k+VmaGMzl4iMLafldspoG5Utw9e
 Ebp00iqLHAnDz9NWneyP3cNmNWQd9RhibPp1S/q7QEFPG5WML2azV+OAZcrqSsgDqp
 1ZhsyuFeyIbD+Z8nHBHTqYuga56rnGBYDxJPnXkHhY6ltofkWucFY2yrNWBbGiHo9y
 EYVKKvcqoJaVaUzYYBnjAWoZNYLwPMBES1yvsLO1a98X+zndnT59+wSkyxQApZVXh5
 nD/LIZ6YeA4/g==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix,
 from userid 48) id EA425C43143; Sun, 18 Dec 2022 11:38:31 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 216780] problem of Mesa drawing boxes after resume from suspend
 with Geforce4 420 Go
Date: Sun, 18 Dec 2022 11:38:31 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Video(DRI - non Intel)
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: estellnb@elstel.org
X-Bugzilla-Status: RESOLVED
X-Bugzilla-Resolution: ANSWERED
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-216780-2300-XBodp7Hw4R@https.bugzilla.kernel.org/>
In-Reply-To: <bug-216780-2300@https.bugzilla.kernel.org/>
References: <bug-216780-2300@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D216780

--- Comment #6 from Elmar Stellnberger (estellnb@elstel.org) ---
  Just for curiosity I have tested on that machine with different values for
acpi_sleep:
acpi_sleep=3Ds3_mode: white/bright character boxes, no resume
acpi_sleep=3Ds3_bios: black screen, as usual but no resume
acpi_sleep=3Ds3_bios,s3_mode: black screen, as usual but no resume

  Now I am a bit clueless since these three values were what I supposed to =
be
the only values that can be passed to acpi_sleep. The default must be diffe=
rent
since there it works. Didn=C2=B4t find respective docs. Perhaps I have not =
waited
long enough for resume?

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
