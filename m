Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 09844341728
	for <lists+dri-devel@lfdr.de>; Fri, 19 Mar 2021 09:12:50 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 31E816E101;
	Fri, 19 Mar 2021 08:12:46 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D05466E101
 for <dri-devel@lists.freedesktop.org>; Fri, 19 Mar 2021 08:12:44 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPS id 710E664F6D
 for <dri-devel@lists.freedesktop.org>; Fri, 19 Mar 2021 08:12:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1616141564;
 bh=4iZJrZ1pTbS4N7yzD0AWLV2F5lgOlOc6QvovelTwAtw=;
 h=From:To:Subject:Date:In-Reply-To:References:From;
 b=lkNLSjGkiRIf1ljk9VKHe9JOxh8G5eNVAD7vAEzuMmNLnE27K+QFavYha1m3/mID5
 21dWGK1q1r9vX84dINsGNvp5mFaC7/Y7OGmsHuAfVwU4CE/OYakufn1RwPJWgc3zJW
 Vg31hGGbFF1f8JK6nUdSDe1UYuxAiH+cWlI5VaMYQqNVOF/hRJcMwUfppgl6JyLO+t
 0Wy4n5LvpllyNQe+mNgLEgY22NEDk8W/EMunj4FWXd5Ff9Ro+i3O+oYstGej+yYDsY
 wO+ePhdJZpIZZShB1CF6q8+ftQmsajw1MVgkyD3HeP20RBTbvicpa+uyo+WDOFSjx4
 cV9t92No/iYkA==
Received: by pdx-korg-bugzilla-2.web.codeaurora.org (Postfix, from userid 48)
 id 5E176653CB; Fri, 19 Mar 2021 08:12:44 +0000 (UTC)
From: bugzilla-daemon@bugzilla.kernel.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 212281] AMDGPU warning stack trace in dmesg
 (dcn20_validate_bandwidth_fp)
Date: Fri, 19 Mar 2021 08:12:44 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Video(DRI - non Intel)
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: low
X-Bugzilla-Who: tomas@sandven.email
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-212281-2300-165RlZ3FYH@https.bugzilla.kernel.org/>
In-Reply-To: <bug-212281-2300@https.bugzilla.kernel.org/>
References: <bug-212281-2300@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=212281

--- Comment #4 from Tomas Sandven (tomas@sandven.email) ---
Forgot to add, I'm using Sway (Wayland) and not X, so I don't have X logs to
share.

-- 
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
