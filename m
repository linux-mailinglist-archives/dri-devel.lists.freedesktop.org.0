Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2DA1D6C7924
	for <lists+dri-devel@lfdr.de>; Fri, 24 Mar 2023 08:43:25 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8740810E516;
	Fri, 24 Mar 2023 07:43:19 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from ams.source.kernel.org (ams.source.kernel.org
 [IPv6:2604:1380:4601:e00::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6A73110E516
 for <dri-devel@lists.freedesktop.org>; Fri, 24 Mar 2023 07:43:16 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 25583B822AC
 for <dri-devel@lists.freedesktop.org>; Fri, 24 Mar 2023 07:43:15 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id D131CC433EF
 for <dri-devel@lists.freedesktop.org>; Fri, 24 Mar 2023 07:43:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1679643793;
 bh=1bhRBFzdNcUeK+mLkmy9+Q0uolkZ7MqPeezE44FP75Y=;
 h=From:To:Subject:Date:In-Reply-To:References:From;
 b=KYBotXYkxzyGlJhlBzddkVAEIaPAUkFSvq7E1ef2qCN0JzunvQelCrI5ixsopVUtD
 6xt3rsrpH5ddRT55XFHHCLKUnuwtZFyTwxLcMJQV+ls/IeKxO6eSu2C6BvCqmpy64f
 jLDTdJvl8n/E67hbOVAOankNtWDVYp3Srr2okeV3AlIUU7D+PGHW86IdREIK5ijBHc
 KfznMsp3cRx8hPyspHpOJdkm6JRH31Zmyl9fqGI1eJBuGfFx1vJ7+DwJL7zHEY8W20
 fs1aaBF4oLQZANlxWfB0iIwT1b/VhiWJmAakrFUUaEk3EgReXL4uDbSByPcCtgOHlI
 oSuVqQb1fEwyg==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix,
 from userid 48) id B5C8AC43141; Fri, 24 Mar 2023 07:43:13 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 217237] Fail to read EDID after resuming from suspend since
 kernel 6.2
Date: Fri, 24 Mar 2023 07:43:13 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Video(DRI - non Intel)
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: aros@gmx.com
X-Bugzilla-Status: RESOLVED
X-Bugzilla-Resolution: ANSWERED
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: bug_status resolution
Message-ID: <bug-217237-2300-nR9tDRLEF4@https.bugzilla.kernel.org/>
In-Reply-To: <bug-217237-2300@https.bugzilla.kernel.org/>
References: <bug-217237-2300@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D217237

Artem S. Tashkinov (aros@gmx.com) changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
             Status|NEW                         |RESOLVED
         Resolution|---                         |ANSWERED

--- Comment #1 from Artem S. Tashkinov (aros@gmx.com) ---
Please report here instead https://gitlab.freedesktop.org/drm/amd/-/issues

Also, since you're not averse to testing, you could perform regression test=
ing:

https://docs.kernel.org/admin-guide/bug-bisect.html

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
