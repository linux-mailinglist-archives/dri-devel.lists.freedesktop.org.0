Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 2280D15D6FC
	for <lists+dri-devel@lfdr.de>; Fri, 14 Feb 2020 12:54:43 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3915D6F8FA;
	Fri, 14 Feb 2020 11:54:41 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 773B76E5CD
 for <dri-devel@lists.freedesktop.org>; Fri, 14 Feb 2020 11:54:39 +0000 (UTC)
From: bugzilla-daemon@bugzilla.kernel.org
Authentication-Results: mail.kernel.org;
 dkim=permerror (bad message/signature format)
To: dri-devel@lists.freedesktop.org
Subject: [Bug 206519] [amdgpu] kernel NULL pointer dereference on shutdown
Date: Fri, 14 Feb 2020 11:54:39 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Video(DRI - non Intel)
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: shlomo@fastmail.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-206519-2300-8Bc1DYvgCA@https.bugzilla.kernel.org/>
In-Reply-To: <bug-206519-2300@https.bugzilla.kernel.org/>
References: <bug-206519-2300@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=206519

--- Comment #3 from Shlomo (shlomo@fastmail.com) ---
The bug first occurs in Arch Linux 5.5.arch1-1, which set
CONFIG_DRM_AMD_DC_HDCP=y [1].

Arch Linux 5.4.15.arch1-1 is good.
Arch Linux 5.4.15.arch1-1 with CONFIG_DRM_AMD_DC_HDCP=y set (and no other
changes) is bad.

Arch Linux 5.5.arch1-1 (and later) is bad. (CONFIG_DRM_AMD_DC_HDCP=y is set)

Testing the most recent Arch Linux kernel shows the same:
Arch Linux 5.5.3.arch1 is bad.
Arch Linux 5.5.3.arch1 with CONFIG_DRM_AMD_DC_HDCP unset is good.

This means that this bug was triggered by changes to the config, not kernel
changes, so I don't know if this is a regression or not.

[1]
https://git.archlinux.org/svntogit/packages.git/commit/trunk?h=packages/linux&id=019514c4cdff26addfd49db8a78a857cb03994d9

-- 
You are receiving this mail because:
You are watching the assignee of the bug.
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
