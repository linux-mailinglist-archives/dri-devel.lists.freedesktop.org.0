Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3B7955140D6
	for <lists+dri-devel@lfdr.de>; Fri, 29 Apr 2022 05:16:08 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B7C7710F033;
	Fri, 29 Apr 2022 03:16:03 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DE71810F033
 for <dri-devel@lists.freedesktop.org>; Fri, 29 Apr 2022 03:16:02 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 231D4B830A9
 for <dri-devel@lists.freedesktop.org>; Fri, 29 Apr 2022 03:16:01 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id E1202C385AF
 for <dri-devel@lists.freedesktop.org>; Fri, 29 Apr 2022 03:15:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1651202159;
 bh=cMxUxazc9XlyrZfwoM0fLxHaikOYNENMUA4WMa0nYjY=;
 h=From:To:Subject:Date:In-Reply-To:References:From;
 b=pI6ryoA7+xo2x2SR/xgPRx35GKr/+cYrZ97Qz+/mTFEiUG+x+Yc4HSvNH04ATUmaF
 cGK3hbnY4NfwFTYyl4/6Q+FnP1cN7dVO/wvW2mwjkXop9PPMJ8BpOo3O1062yz8mGr
 SK60TaVaGdXuXzvVT/IWgMp6LaV7hvJYzf0Jwn7/ClMBOVrlffzS16n15xsIpJoQJr
 5Og802fKLCBBjlnNgdesqWjpZy+rWgcSC7KKEnINs5nuA3fPolcHqAIhYPsEIOLtJ9
 GZnmOihOtS6MdRcVk4MPaSTLS5VkDSCY0iYD1odq1Z1nSuo6X5S7+JScGtC576SgxX
 R8R5THEvvteKg==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix,
 from userid 48) id C7F0DCAC6E2; Fri, 29 Apr 2022 03:15:59 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 201991] amdgpu: clock management is disabled for the 4K
 resolution with polaris 10
Date: Fri, 29 Apr 2022 03:15:59 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Video(DRI - non Intel)
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: enhancement
X-Bugzilla-Who: dofficialgman@gmail.com
X-Bugzilla-Status: RESOLVED
X-Bugzilla-Resolution: CODE_FIX
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: cc
Message-ID: <bug-201991-2300-5t76Mk8WSM@https.bugzilla.kernel.org/>
In-Reply-To: <bug-201991-2300@https.bugzilla.kernel.org/>
References: <bug-201991-2300@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D201991

dofficialgman@gmail.com changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
                 CC|                            |dofficialgman@gmail.com

--- Comment #4 from dofficialgman@gmail.com ---
the above kernel command line is still necessary in 2022 with mesa 22.
Why has this not been fixed in source to not need the clock/voltage adjustm=
ent
parameter for automatic clocks when using 4K monitor output?

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
