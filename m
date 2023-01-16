Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 31D5A66D0A5
	for <lists+dri-devel@lfdr.de>; Mon, 16 Jan 2023 22:02:40 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9CC2A10E4D6;
	Mon, 16 Jan 2023 21:02:33 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 304A110E4D6
 for <dri-devel@lists.freedesktop.org>; Mon, 16 Jan 2023 21:02:30 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 589C5B810CC
 for <dri-devel@lists.freedesktop.org>; Mon, 16 Jan 2023 21:02:28 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 03A1FC43392
 for <dri-devel@lists.freedesktop.org>; Mon, 16 Jan 2023 21:02:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1673902947;
 bh=gnJLZd02vNR2/Er0D9+leYcDhVDNmNlj42ooUp9yyzA=;
 h=From:To:Subject:Date:In-Reply-To:References:From;
 b=CM8ao2gjp5wog18R27ZPNAWK6bvPmZXFvsy+kuhravUkBigmVETQ3elsAttktacm5
 tD8KDsG2sBlw18vgtVMZeDwMpyqleIxrugm2cnm3uS4WePGTI3Z810KNEtz4yoAvck
 Z1yMSULfV+5AYIyr8oWFZ8YffAQjyBLExr0E42+bnOSbpcfYj1og9TimpvkEngY6Al
 Xcq/h+i71CIAYVvAIoYcnQvb9iLfinQAr82axJr1EfX/uwj8kR3AXjiBTz0k+WD5+U
 EH8QCtDq6mX79E7zPqal8XI3dPW4D0JehAUez1IuKsTlOg4JhE0lPQYMLYEon/qkLH
 9pJQa/BO6+xVw==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix,
 from userid 48) id E3833C43143; Mon, 16 Jan 2023 21:02:26 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 216917] hibernation regression since 6.0.18 (Ryzen-5650U incl.
 Radeon GPU)
Date: Mon, 16 Jan 2023 21:02:26 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Video(DRI - non Intel)
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: mario.limonciello@amd.com
X-Bugzilla-Status: NEEDINFO
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-216917-2300-Qpcqf7rmpV@https.bugzilla.kernel.org/>
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

--- Comment #22 from Mario Limonciello (AMD) (mario.limonciello@amd.com) ---
Thanks for trying.

Another idea that might be feasible to do to identify it is a proper bisect
between v6.0 and v6.1 but manually applying=20
'306df163069e78160e7a534b892c5cd6fefdd537 ("drm/amdgpu: make display pinning
more flexible (v2)")' on each test point.

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
