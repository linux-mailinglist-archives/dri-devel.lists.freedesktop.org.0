Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 1CBDA55BDE2
	for <lists+dri-devel@lfdr.de>; Tue, 28 Jun 2022 05:43:33 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CD56D10FAA7;
	Tue, 28 Jun 2022 03:43:27 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from ams.source.kernel.org (ams.source.kernel.org
 [IPv6:2604:1380:4601:e00::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 19F1F10FAB1
 for <dri-devel@lists.freedesktop.org>; Tue, 28 Jun 2022 03:43:27 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id C404DB81C09
 for <dri-devel@lists.freedesktop.org>; Tue, 28 Jun 2022 03:43:25 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 934A7C341CB
 for <dri-devel@lists.freedesktop.org>; Tue, 28 Jun 2022 03:43:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1656387804;
 bh=cyXovOYn30cFi3L7Nwai6o76N1u49uWYUvvaBenahVI=;
 h=From:To:Subject:Date:In-Reply-To:References:From;
 b=pTnE7BKq1EgRaADFPhD4kUiB1hyc1aUaM9v/jN6+if8PuUGAC2zu1V/jZhc8v5B/5
 yx2Q/1Y9lqLgtEFGsVbO7bwPzgQjJprcc0OV5J0WJHBwCxHlKl0uvHq0/92iFLfGur
 rO+BjeE0I/m4h6lMUA5349J0gxdStBFS+U4ZFgq+U4Y8qclw2Rd42FfBsRZoHtRH9Z
 vEnbD0+ZdQsdE2ECdTGHq3+jrnKvWgEZzmYxAGhSeXtXKomSkGM+1VExLDpMsDin/n
 4tilANDQO58BDKaPHg0QhTup4Lo8MhEKWCSEye1sbRS5aJ6r6dOq+kvMb7l7Kx2Df8
 thYe7dqsn7Klw==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix,
 from userid 48) id 7ECE3CC13B1; Tue, 28 Jun 2022 03:43:24 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 216175] PowerColor Radeon Rx 6400 ITX does not work.
Date: Tue, 28 Jun 2022 03:43:24 +0000
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
Message-ID: <bug-216175-2300-Wzj2D0iAQ6@https.bugzilla.kernel.org/>
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

--- Comment #7 from Nobiuki (nobutarounosuke@gmail.com) ---
Comment on attachment 301293
  --> https://bugzilla.kernel.org/attachment.cgi?id=3D301293
journal with rx6400 and amdgpu.runpm=3D0

I put RX 6400 and output from RX 6400. It crashed and I could not do soft
reset. Thus, I turned off the power supply.

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
