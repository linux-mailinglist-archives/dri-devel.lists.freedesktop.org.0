Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 70A3264F842
	for <lists+dri-devel@lfdr.de>; Sat, 17 Dec 2022 09:30:35 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1A95010E0C6;
	Sat, 17 Dec 2022 08:30:28 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B59FD10E0C6
 for <dri-devel@lists.freedesktop.org>; Sat, 17 Dec 2022 08:30:19 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 81F83B8068C
 for <dri-devel@lists.freedesktop.org>; Sat, 17 Dec 2022 08:30:14 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 15D1DC433D2
 for <dri-devel@lists.freedesktop.org>; Sat, 17 Dec 2022 08:30:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1671265813;
 bh=z0SyJCm7uGsFx/sKO2Qp4HjluP3EPbXDKX2r0MZBzeI=;
 h=From:To:Subject:Date:In-Reply-To:References:From;
 b=WvRIIr3FEA6bLKIeUzE6vPT/MgGkBGaluFsl2ztUWXyW7B+7xain4ZDQ6/rAWsOFi
 82EgO5ooHnLGQtZ6YDewJwcxXA5G+77pc0KHGumHrOinkJN9bD7LexGWCbcez/ULay
 aM5qCZ544mNgdSCEUkmz+GL2PhPkHQYr9LOA12KMkPEAHjzE29zzZ3o2YFXvNinMKu
 fYP80VI2kBtV2LcEiSsZEeMmxbmmqcOMOrwu2bzEeNuimrl/8auaHUqy5ZYJWgfRX4
 bTWOVadd34ccbDNUuB+S6kI7sgSSusfTRG+hlyLDRl5tArRzTUYsdIbdYBv/sAdvx8
 IUKqiZ3QMt0oQ==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix,
 from userid 48) id F3883C43141; Sat, 17 Dec 2022 08:30:12 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 216814] amdgpu: CTM support has disappeared (vega)
Date: Sat, 17 Dec 2022 08:30:12 +0000
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
Message-ID: <bug-216814-2300-g5DT8fiYgX@https.bugzilla.kernel.org/>
In-Reply-To: <bug-216814-2300@https.bugzilla.kernel.org/>
References: <bug-216814-2300@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D216814

Artem S. Tashkinov (aros@gmx.com) changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
             Status|NEW                         |RESOLVED
         Resolution|---                         |ANSWERED

--- Comment #1 from Artem S. Tashkinov (aros@gmx.com) ---
The proper bug tracker for AMD GPU drivers is here:

https://gitlab.freedesktop.org/drm/amd/-/issues

Please repost over there.

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
