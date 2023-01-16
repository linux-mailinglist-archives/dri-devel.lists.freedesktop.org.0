Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 7771266C629
	for <lists+dri-devel@lfdr.de>; Mon, 16 Jan 2023 17:15:26 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A715210E04C;
	Mon, 16 Jan 2023 16:15:24 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F167110E04C
 for <dri-devel@lists.freedesktop.org>; Mon, 16 Jan 2023 16:15:22 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 5897161057
 for <dri-devel@lists.freedesktop.org>; Mon, 16 Jan 2023 16:15:22 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 2B56DC433F1
 for <dri-devel@lists.freedesktop.org>; Mon, 16 Jan 2023 16:15:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1673885722;
 bh=VWGgCtuGq8VD7eDkBFnOSpLjMlvGEwOSXAGfoKhTR5E=;
 h=From:To:Subject:Date:In-Reply-To:References:From;
 b=gDenhgRKP9TwsBSliinPc2DXYSDXjALzAZw+jTlTteFKii6Tg60KXqSOLMRdFieY+
 3/r+CqUKcpyPSOSauZ4zHy+dD5toro3OwT+D8yDSXSGVe6POKVPIU+mF5ZUaBgWkJf
 aHjDah0zlahkJ8WZWQYTaa2Fy5T36fEHuJKEG2F6i558wfmpkuUJ7Bhd+25/GDwpDS
 hxA1R7CFxy6KX0GJrdb1jYAvCG39CWt1Mfu3K3+Pexv2ah/OTYSlhvvwl/sEjRowhs
 A2b6/sdkjpYkEN7qHw4PQUtgZvsxJRCLkVJzLldgAPc8h4HUE1/Cpl36XtODfDKvxy
 EhuZoFhPPTFAg==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix,
 from userid 48) id 1B849C05FD6; Mon, 16 Jan 2023 16:15:22 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 216917] hibernation regression since 6.0.18 (Ryzen-5650U incl.
 Radeon GPU)
Date: Mon, 16 Jan 2023 16:15:21 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Video(DRI - non Intel)
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: mario.limonciello@amd.com
X-Bugzilla-Status: RESOLVED
X-Bugzilla-Resolution: WILL_NOT_FIX
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-216917-2300-sEHHpBWrmN@https.bugzilla.kernel.org/>
In-Reply-To: <bug-216917-2300@https.bugzilla.kernel.org/>
References: <bug-216917-2300@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D216917

--- Comment #13 from Mario Limonciello (AMD) (mario.limonciello@amd.com) ---
Can we please confirm it's actually broken in 5.15.y before going through t=
hat
effort?

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
