Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 8DD95340AB5
	for <lists+dri-devel@lfdr.de>; Thu, 18 Mar 2021 17:54:27 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CEC9F6E926;
	Thu, 18 Mar 2021 16:54:25 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1ECE36E926
 for <dri-devel@lists.freedesktop.org>; Thu, 18 Mar 2021 16:54:24 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPS id E64CB64D74
 for <dri-devel@lists.freedesktop.org>; Thu, 18 Mar 2021 16:54:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1616086463;
 bh=4zP+dhLe0pRFHUTG+G42x0SBdnJRU8NXI225ywLdnHU=;
 h=From:To:Subject:Date:In-Reply-To:References:From;
 b=X4x7GxmRJvayui6h4Um3plQbf3l50aqEmJVGPfi58P3oKbwjuP1KXT+0jVEOgvgIE
 NZT9n3V/D2MRtPCPbdf+h442ZwQjq8kpgOfW+wfrn2JpK1UuAEwOEfD72IVWfeqp4o
 cgJL9og3K1mL+F9dgacPnWn9BIm5oVkYiB6AaZz+PuoMNUtgmL0vY+3J+1Z/tCfZzY
 LUTLYBP2JEMg3sn/xIBgqYDz30rRam9M+HdlK2tanlB2h68BBoMIxpXG2E5yFek5W4
 p9bYhsjqjCubVGVvjQIi3vRqqDmrJgNS+HXH+5MGPSgipHrmqgqoEIlUUOxYNSV119
 AYUOcwTfyLZ1A==
Received: by pdx-korg-bugzilla-2.web.codeaurora.org (Postfix, from userid 48)
 id E30C665382; Thu, 18 Mar 2021 16:54:23 +0000 (UTC)
From: bugzilla-daemon@bugzilla.kernel.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 212333] Bisected: 5.11.7 breaks amdgpu resume from S3
Date: Thu, 18 Mar 2021 16:54:23 +0000
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
X-Bugzilla-Changed-Fields: cc
Message-ID: <bug-212333-2300-3eFbxYcQ7N@https.bugzilla.kernel.org/>
In-Reply-To: <bug-212333-2300@https.bugzilla.kernel.org/>
References: <bug-212333-2300@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=212333

Alex Deucher (alexdeucher@gmail.com) changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
                 CC|                            |alexdeucher@gmail.com

--- Comment #3 from Alex Deucher (alexdeucher@gmail.com) ---
See this page for more info on getting S0ix working:
https://gitlab.freedesktop.org/drm/amd/-/issues/1230

-- 
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
