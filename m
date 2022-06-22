Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 3FE96554AD4
	for <lists+dri-devel@lfdr.de>; Wed, 22 Jun 2022 15:22:21 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1D7D710FA04;
	Wed, 22 Jun 2022 13:22:19 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 29B1310FA04
 for <dri-devel@lists.freedesktop.org>; Wed, 22 Jun 2022 13:22:18 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 003EB61A3D
 for <dri-devel@lists.freedesktop.org>; Wed, 22 Jun 2022 13:22:16 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 674E3C341C7
 for <dri-devel@lists.freedesktop.org>; Wed, 22 Jun 2022 13:22:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1655904135;
 bh=ZNEScYC3zVql0nEXUvpjBRSQUroci+bG4cS9o94QMws=;
 h=From:To:Subject:Date:In-Reply-To:References:From;
 b=SH7Mkh6N/VzxqUZUgnLX7IJJEBrJeqclM9GxEw3jxsUWybuElom7xhXY8sfbXqEvR
 pZ4zXrP/JHhujZwfYoKKPNEN5Wu1vKF6CxA4vSI2xThbBL559DCKDr7ey1bWJirq8m
 6c+tKGcA4/SDixuQNaAGhatRDcgrfYkkHYOPpZCZ3NlihzftXrgJzmd7qDa+NsBphy
 7Bq5YU47w3MjBDK+ngOkeyLTMauOCrl1asnKJcQkVkNV6Jfuqhk83ovqXh6az/lD9M
 mM0WfhtH6WZ6EMcpUJsMh6k3q1iVdpw8yI5z0kK6Up399OoUvQm2v8JdmnWmr0laoH
 nDXh8mDEyZtcw==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix,
 from userid 48) id 506CCC05FD2; Wed, 22 Jun 2022 13:22:15 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 216119] 087451f372bf76d breaks hibernation on amdgpu Radeon R9
 390
Date: Wed, 22 Jun 2022 13:22:14 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Video(DRI - non Intel)
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: alexdeucher@gmail.com
X-Bugzilla-Status: REOPENED
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-216119-2300-sXxNvhOPje@https.bugzilla.kernel.org/>
In-Reply-To: <bug-216119-2300@https.bugzilla.kernel.org/>
References: <bug-216119-2300@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D216119

--- Comment #18 from Alex Deucher (alexdeucher@gmail.com) ---
Just to verify, you removed the patch from comment 11 before testing the new
patches?  Also, can you try the just patch 1/4 and then again with just pat=
ches
2/4 and 3/4?  Do either of those combinations also work?

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
