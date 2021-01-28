Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CA022306C67
	for <lists+dri-devel@lfdr.de>; Thu, 28 Jan 2021 05:48:15 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 890C06E82A;
	Thu, 28 Jan 2021 04:48:12 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A920E6E82A
 for <dri-devel@lists.freedesktop.org>; Thu, 28 Jan 2021 04:48:11 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPS id 7918F64DD9
 for <dri-devel@lists.freedesktop.org>; Thu, 28 Jan 2021 04:48:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1611809291;
 bh=u0k0YibIRYqYBhJ4D6nTtg4rUB87vg34394YSRtqGxs=;
 h=From:To:Subject:Date:In-Reply-To:References:From;
 b=a0hWlfDsh1Rd/sSh/todtSJHvGEW2BkBO/7V19cFHz1Yc4oROoB/sVlFxS4ykvFkf
 qDuDDQcC0VZ6g7Lw2JwIQth/mARXvQxgoCmPsK5XV2TQqKd/MgWgb2zMeYLnmKmcP0
 tGSKP9xkfB3yEFqBPm9byNMBcjOIOmyKHBO+JoikhPB3jJxMb7y5Aerd/uiBbMgxNd
 7x0NimgnR6/HaehEG1i9K6NcARvW4KHt4tI+zN/2yFY2gE9mUyyLda/5DmqfIY6bjY
 I1oxaJi9mwVb+3rPh6hfxbX/Lc7t8uXEVpOOmr3vyP1aaSXJBCYtj8AmGeclR+y2Xa
 boRHoT17GuaOA==
Received: by pdx-korg-bugzilla-2.web.codeaurora.org (Postfix, from userid 48)
 id 61A80652E8; Thu, 28 Jan 2021 04:48:11 +0000 (UTC)
From: bugzilla-daemon@bugzilla.kernel.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 211349] IB test failed on sdma0 ! AMDGPU driver for Raven APU
 (ryzen 2400G) hangs!
Date: Thu, 28 Jan 2021 04:48:11 +0000
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
Message-ID: <bug-211349-2300-Xq1AXConUv@https.bugzilla.kernel.org/>
In-Reply-To: <bug-211349-2300@https.bugzilla.kernel.org/>
References: <bug-211349-2300@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=211349

--- Comment #19 from Alex Deucher (alexdeucher@gmail.com) ---
Please attach your xorg log and dmesg output.  Note that if you want an fbdev
interface for the console, you need to enable CONFIG_DRM_FBDEV_EMULATION=y in
your config.

-- 
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
