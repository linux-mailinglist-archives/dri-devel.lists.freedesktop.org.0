Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C65E890BBC4
	for <lists+dri-devel@lfdr.de>; Mon, 17 Jun 2024 22:10:11 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A179C10E4DE;
	Mon, 17 Jun 2024 20:10:08 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="riIoUkQX";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sin.source.kernel.org (sin.source.kernel.org [145.40.73.55])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 10BCB10E4DE
 for <dri-devel@lists.freedesktop.org>; Mon, 17 Jun 2024 20:10:06 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sin.source.kernel.org (Postfix) with ESMTP id ED045CE137D
 for <dri-devel@lists.freedesktop.org>; Mon, 17 Jun 2024 20:10:03 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 2FF99C4AF53
 for <dri-devel@lists.freedesktop.org>; Mon, 17 Jun 2024 20:10:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1718655003;
 bh=5D6y8SZPgCYq1zL4rUuw7gS8PU9Qn8wpvgUiQdF3tss=;
 h=From:To:Subject:Date:In-Reply-To:References:From;
 b=riIoUkQXnSM1TVTGJCbhYq/L0ikcGcfZQEgcw5NucOBgSWz/uyVvAOg1BLWSrl2Ce
 nPa9zYDNujASNb2wPugWAa7fLrkXpQtaxTWt6CCbQ65Qb1b7312YNRvnleloiB59GQ
 PhIFqHtV1nlPzbQ2Qwv0fqou8ppFAx+cCIC4BfnP4aPRRQ20dmfA+tPA88ZgS+v86t
 kVqfzuODVWBrwQFj67TMO6+j47ZsaTu0BXzACnIUnnDWkF1q/xEbdImxCEa+wrRW+D
 ncPqY1pAgaCKQpzikz6sEKlm/zn2vA8yd98DHR0aK3vFlWGOCb+igxftuYlSnkyio6
 KLqPQdm5Y+aUg==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix,
 from userid 48) id 26BB5C53B73; Mon, 17 Jun 2024 20:10:03 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 211807] [drm:drm_dp_mst_dpcd_read] *ERROR* mstb
 000000004e6288dd port 3: DPCD read on addr 0x60 for 1 bytes NAKed
Date: Mon, 17 Jun 2024 20:10:02 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Video(DRI - non Intel)
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: low
X-Bugzilla-Who: aros@gmx.com
X-Bugzilla-Status: RESOLVED
X-Bugzilla-Resolution: ANSWERED
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: bug_status resolution
Message-ID: <bug-211807-2300-ycSnifkTyF@https.bugzilla.kernel.org/>
In-Reply-To: <bug-211807-2300@https.bugzilla.kernel.org/>
References: <bug-211807-2300@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D211807

Artem S. Tashkinov (aros@gmx.com) changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
             Status|NEW                         |RESOLVED
         Resolution|---                         |ANSWERED

--- Comment #25 from Artem S. Tashkinov (aros@gmx.com) ---
Most Linux developers are not aware of this issue.

If you're still affected using either 6.9.5 or 6.6.34, please file a new bug
report here:

For Intel:

https://gitlab.freedesktop.org/drm/intel/-/issues

For AMD:

https://gitlab.freedesktop.org/drm/amd/-/issues

To me it looks like a HW issue of some sort but I'm not an expert. Would be
nice if affected people tried a different HDMI/DP cable.

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
