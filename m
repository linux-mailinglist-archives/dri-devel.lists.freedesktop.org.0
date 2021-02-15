Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 78D5631BC2C
	for <lists+dri-devel@lfdr.de>; Mon, 15 Feb 2021 16:22:28 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9A11B89CCE;
	Mon, 15 Feb 2021 15:22:24 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9D0A289CCE
 for <dri-devel@lists.freedesktop.org>; Mon, 15 Feb 2021 15:22:23 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPS id 60E4964DA3
 for <dri-devel@lists.freedesktop.org>; Mon, 15 Feb 2021 15:22:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1613402543;
 bh=bPBdhGJGNi42u9rCVqSL3ia1gbJnRxJbwlcEC7XtABg=;
 h=From:To:Subject:Date:In-Reply-To:References:From;
 b=grRmEbeF8wpz4QAHAdnvZTWSNNCd+E3C8Up+vz56t8ZYDCuS2f36mDA892bGrVjRy
 +E5PTQDBE5ebjpqOjmY2qlbwvYK3borJ05xEXezw0M3eqgIkqfnt5GG7ItXaiWDzws
 3ZFAmiS73JBLmh3BEZj2ZQ5DuUqL+DDqhov13NwIoV0+6U8CQms/ZhYqxl3Cs9ECF8
 J7qaMTzZhemgmBD1pezGvbZ7li/nGF7D/qr6HEcSajwD5921dPTrzIXgha8estZxLM
 kLugeVQjEoi+AJ3iLDxr3TEMpToQqORr9b96xsbRSzJcwcfcuQ6HAJ4YXVXcNhb1FH
 bX4lfggJPO7cQ==
Received: by pdx-korg-bugzilla-2.web.codeaurora.org (Postfix, from userid 48)
 id 4F52860180; Mon, 15 Feb 2021 15:22:23 +0000 (UTC)
From: bugzilla-daemon@bugzilla.kernel.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 211649] "drm/amd/display: reuse current context instead of
 recreating one" cause hdmi hotplug blackscreen on amdgpu
Date: Mon, 15 Feb 2021 15:22:23 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Video(DRI - non Intel)
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: alexdeucher@gmail.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-211649-2300-ju5PaBCvZO@https.bugzilla.kernel.org/>
In-Reply-To: <bug-211649-2300@https.bugzilla.kernel.org/>
References: <bug-211649-2300@https.bugzilla.kernel.org/>
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

https://bugzilla.kernel.org/show_bug.cgi?id=211649

--- Comment #13 from Alex Deucher (alexdeucher@gmail.com) ---
See also:
https://gitlab.freedesktop.org/drm/amd/-/issues/1487

-- 
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
