Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 112D54A5A75
	for <lists+dri-devel@lfdr.de>; Tue,  1 Feb 2022 11:47:51 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 082EA10E754;
	Tue,  1 Feb 2022 10:47:47 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5A23210E60B
 for <dri-devel@lists.freedesktop.org>; Tue,  1 Feb 2022 10:47:45 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 1EF2F614DE
 for <dri-devel@lists.freedesktop.org>; Tue,  1 Feb 2022 10:47:39 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 343E9C340F1
 for <dri-devel@lists.freedesktop.org>; Tue,  1 Feb 2022 10:47:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1643712457;
 bh=Cgg89j+V5fz/mNEn8ibphlOprMwSTtVt18YrIWHJL94=;
 h=From:To:Subject:Date:In-Reply-To:References:From;
 b=NniLU1wCgubXhuRZCBq0aKRQOP4ugC04id4IBtxc7Kjj4gbPe3cIDR8BG6kXryVAf
 U0C6V2BtqOF2Uz2NnMxVLfezzKeALGu4bq35sO/HlNxkmgHWF+OU6Op9ShqmiPvcuT
 tzFcKxy1l3gnd+07NXr8D0R12WK0ilM4ZFicxa2cqfuR6nxrru4VZ4JNpAVVLPJw7B
 Qw5hqzshrDiNskrXpc9uNWyK3p6q2pM/ssEg1jwjawXwosV2iE8GnHM1XBCN1vKlsf
 ZnTocj0Qf1+btoeIiFf5c5kDNNrabZGkGfLsaBv6kiw/pQaU3YclTVMO3ykKNe0zIt
 F6x0qKbH22//Q==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix,
 from userid 48) id 2009BC05FD5; Tue,  1 Feb 2022 10:47:37 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 215549] My 6900XT can't recover while it's idle (but not
 asleep), and sometimes doesn't show at boot
Date: Tue, 01 Feb 2022 10:47:36 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Video(DRI - non Intel)
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: high
X-Bugzilla-Who: aros@gmx.com
X-Bugzilla-Status: RESOLVED
X-Bugzilla-Resolution: MOVED
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: bug_status resolution cf_regression
Message-ID: <bug-215549-2300-tH60Efbp3D@https.bugzilla.kernel.org/>
In-Reply-To: <bug-215549-2300@https.bugzilla.kernel.org/>
References: <bug-215549-2300@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D215549

Artem S. Tashkinov (aros@gmx.com) changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
             Status|NEW                         |RESOLVED
         Resolution|---                         |MOVED
         Regression|No                          |Yes

--- Comment #2 from Artem S. Tashkinov (aros@gmx.com) ---
Please refile here: https://gitlab.freedesktop.org/drm/amd

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
