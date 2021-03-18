Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B59453407DF
	for <lists+dri-devel@lfdr.de>; Thu, 18 Mar 2021 15:32:47 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 153EB6E05C;
	Thu, 18 Mar 2021 14:32:43 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 283886E05C
 for <dri-devel@lists.freedesktop.org>; Thu, 18 Mar 2021 14:32:42 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPS id 045A964F24
 for <dri-devel@lists.freedesktop.org>; Thu, 18 Mar 2021 14:32:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1616077962;
 bh=7Jt71dROLWvMpY60yxEJuXbR7poMiyAp8AMsbiR9cZM=;
 h=From:To:Subject:Date:In-Reply-To:References:From;
 b=PujkiY1LVFh+d9tUs/7OPtjFYwQuX7jDDTQd+VEzApl5ZWAtZf/Aar9EIljQn5PlM
 p01Old8v6nh9iIm7IosKH2dk2plNtVlEaumq8SkbyJ4CfRkU+6oddNLWbuAGMZeQFk
 Ty2ozj3BaGOCZBjeeyWzeyMCMY8ZlYhwF6s+swOVH3Z9F5tGHCE/ALOJN1UM9AQizz
 ig3/jMGr99UV8gCIXKpXCQ5fWZn+L0mEMUi8ymZ5qxXVwwJUITn+YyJnDxK0D2q4CZ
 jWTck4TAzsUGku6Ro7BS7xEyCzb2028vYRjcVUPT25JRWY01luv/RM9DoKKGzof0ji
 TEiTkWB5U7Pbw==
Received: by pdx-korg-bugzilla-2.web.codeaurora.org (Postfix, from userid 48)
 id E34A7653CC; Thu, 18 Mar 2021 14:32:41 +0000 (UTC)
From: bugzilla-daemon@bugzilla.kernel.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 212137] kernel NULL pointer dereference, black screen when
 using two graphics cards
Date: Thu, 18 Mar 2021 14:32:41 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Video(DRI - non Intel)
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: high
X-Bugzilla-Who: mail@dennisfoster.us
X-Bugzilla-Status: RESOLVED
X-Bugzilla-Resolution: CODE_FIX
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: bug_status resolution
Message-ID: <bug-212137-2300-KEuHWNJXIB@https.bugzilla.kernel.org/>
In-Reply-To: <bug-212137-2300@https.bugzilla.kernel.org/>
References: <bug-212137-2300@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=212137

Dennis Foster (mail@dennisfoster.us) changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
             Status|NEW                         |RESOLVED
         Resolution|---                         |CODE_FIX

--- Comment #4 from Dennis Foster (mail@dennisfoster.us) ---
I can confirm now that the issue is fixed in recent 5.11.7 kernel.

-- 
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
