Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 9333834FDD6
	for <lists+dri-devel@lfdr.de>; Wed, 31 Mar 2021 12:12:51 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7CAA66EA38;
	Wed, 31 Mar 2021 10:12:49 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 784B96EA38
 for <dri-devel@lists.freedesktop.org>; Wed, 31 Mar 2021 10:12:48 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPS id 3725B61981
 for <dri-devel@lists.freedesktop.org>; Wed, 31 Mar 2021 10:12:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1617185568;
 bh=LXsj9fOhGMgw9uN1LxYCsmv25ZVCFujJdq+eEDt3Zwg=;
 h=From:To:Subject:Date:In-Reply-To:References:From;
 b=b0wIaTAYMyg0mt+qVSslz1K/apGhHxmGY+86xP3dYgDdV/f60Po6koLdzsaYsGou0
 oCB6KEkEMUcfQ1JEY8S2N89BsWWwgkzYbIsrtyiQ6mxTiPcx113sq9SO/ZmdkkE360
 66cCXHONZrucBiAmdK6xRG1nCEHkvSrqYa8HDOUJgI0LVH+XK3XrtK4fNaY3DiPZ2B
 I/ZWXpTs0kKQs3B16OUX6NQJL4nVUyaJ4jO4PCYNoQgMJeDOpXqccXS92UDE5YNodv
 5qgviyq3ElJPGfNU4EAhWNS0Jd7oeftNfL66QvEgWE0yVuRDT9yMnzFkvZgjGtHdAB
 rJJ88VImrJ9Qg==
Received: by pdx-korg-bugzilla-2.web.codeaurora.org (Postfix, from userid 48)
 id 29AEE62AC0; Wed, 31 Mar 2021 10:12:48 +0000 (UTC)
From: bugzilla-daemon@bugzilla.kernel.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 211501] Kernel freeze when waking monitor from blanking / DPMS
 (AMDGPU / DC)
Date: Wed, 31 Mar 2021 10:12:47 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Video(DRI - non Intel)
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: honza.klos@gmail.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: cc
Message-ID: <bug-211501-2300-zoPqnpXhzS@https.bugzilla.kernel.org/>
In-Reply-To: <bug-211501-2300@https.bugzilla.kernel.org/>
References: <bug-211501-2300@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=211501

Jan Klos (honza.klos@gmail.com) changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
                 CC|                            |honza.klos@gmail.com

--- Comment #5 from Jan Klos (honza.klos@gmail.com) ---
I have the same/similar problem with my 2 monitors - but only when waking them
from sleep. However, switching to terminal (ctrl+alt+fX) allows me to regain
display output in both monitors, after that I can switch back to X and
everything works - until the sleep timer turns the monitors off again.

-- 
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
