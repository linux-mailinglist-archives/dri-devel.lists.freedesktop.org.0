Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 5CE26626A11
	for <lists+dri-devel@lfdr.de>; Sat, 12 Nov 2022 16:07:15 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8354410E141;
	Sat, 12 Nov 2022 15:07:04 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BCF4110E141
 for <dri-devel@lists.freedesktop.org>; Sat, 12 Nov 2022 15:07:01 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 18224B80011
 for <dri-devel@lists.freedesktop.org>; Sat, 12 Nov 2022 15:07:00 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id A775CC433D7
 for <dri-devel@lists.freedesktop.org>; Sat, 12 Nov 2022 15:06:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1668265618;
 bh=85cC8P/nycVmYLx5VutW5YjcOYT0YJCTI1JTzVEfgVw=;
 h=From:To:Subject:Date:In-Reply-To:References:From;
 b=HrPHJJZ4h9DQNFKPhuBQMlpOYrVQLiHdDQTTegR7gH59fO2yE1G1hfO5LwgdkoWP/
 J15B3DpVkNvgKJZRek/wJxjLH4sNJt9164sGXcs+JhX5UfKh8l8+KbcBd+NDtsLC3p
 V8SXjNcDPFVSQoEWVT2BJb4isdim4w1XVhBBA6+k8bAGQyw+DPqvbb73ZtaSLW75mq
 Af9ISlmpLk7XP4erzz3D7E6bqBkMjUoCMM3GV/oheQnj9etvxw+3TFGnWqfzad3pu8
 c3r3ilk8slAL18VgFWj7yrHTNl9LCPSL4ljIOSaRaHO0RamZdohOATTC6t93PlfEqm
 MQgltJ9h2OfKA==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix,
 from userid 48) id 9454BC433E4; Sat, 12 Nov 2022 15:06:58 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 216684] amdgpu graphics freezing about every 10 seconds in 5.17
 and later
Date: Sat, 12 Nov 2022 15:06:58 +0000
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
Message-ID: <bug-216684-2300-qahfHd9qMv@https.bugzilla.kernel.org/>
In-Reply-To: <bug-216684-2300@https.bugzilla.kernel.org/>
References: <bug-216684-2300@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D216684

Artem S. Tashkinov (aros@gmx.com) changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
             Status|NEW                         |RESOLVED
         Resolution|---                         |ANSWERED

--- Comment #3 from Artem S. Tashkinov (aros@gmx.com) ---
Please search for dupes here:

https://gitlab.freedesktop.org/drm/amd/-/issues

and if there are none, file a bug report.

Unfortunately your dmesg logs seemingly don't contain anything which could
indicate an error.

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
