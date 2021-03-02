Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4172532A789
	for <lists+dri-devel@lfdr.de>; Tue,  2 Mar 2021 18:17:04 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2EA6C6E2B4;
	Tue,  2 Mar 2021 17:17:00 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2367D6E2B4
 for <dri-devel@lists.freedesktop.org>; Tue,  2 Mar 2021 17:16:59 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPS id 1854364F2F
 for <dri-devel@lists.freedesktop.org>; Tue,  2 Mar 2021 17:16:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1614705417;
 bh=6fyiQl6Ka9K1shXs3gfi6/z6rikhUleKwCqzng6eDe4=;
 h=From:To:Subject:Date:In-Reply-To:References:From;
 b=IiHp4l3Saa0veOH2nsfFZLF036vv2PavFghbSbbsFB9gUprD9OdHS14+jRJXzUrwT
 TK5BN9K7hRoH3GrjyIYjD6LyLoVuKSeeCMBnzDbNiJq89iytEexYCUYt7hcVeuJ0J2
 QjuKEdzOymvuQlPDVuZLJtnrT7/TnQguxk1KnQ88c1TK6BIBr/iSL3bsAkvHlIXVOk
 D4CxjhcgdZsSHmzq2lHahq4Vo2yrOzh7fSOdiEib4vvZhlQiJ3ylDOuxqFeg0r0Lsw
 yuCGBCBr1lxS1g2aShX/3ra0CuZ4UWH8S2WfjQlgFv1DGigzky3E1yqDBeiFJwXE4F
 Sp71lIpOSAf4A==
Received: by pdx-korg-bugzilla-2.web.codeaurora.org (Postfix, from userid 48)
 id 0ABCE652F6; Tue,  2 Mar 2021 17:16:57 +0000 (UTC)
From: bugzilla-daemon@bugzilla.kernel.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 211875] CPU frequency scaling lost after "WARNING: CPU: 2 PID:
 2358578 at smu8_send_msg_to_smc_with_parameter+0xfe/0x140 [amdgpu]"
Date: Tue, 02 Mar 2021 17:16:56 +0000
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
Message-ID: <bug-211875-2300-22UVo655ri@https.bugzilla.kernel.org/>
In-Reply-To: <bug-211875-2300@https.bugzilla.kernel.org/>
References: <bug-211875-2300@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=211875

Alex Deucher (alexdeucher@gmail.com) changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
                 CC|                            |alexdeucher@gmail.com

--- Comment #4 from Alex Deucher (alexdeucher@gmail.com) ---
If this is a regression, can you bisect? 
https://www.kernel.org/doc/html/latest/admin-guide/bug-bisect.html

-- 
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
