Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 1476131BBFA
	for <lists+dri-devel@lfdr.de>; Mon, 15 Feb 2021 16:14:43 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BC7096E241;
	Mon, 15 Feb 2021 15:14:39 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EF3426E241
 for <dri-devel@lists.freedesktop.org>; Mon, 15 Feb 2021 15:14:38 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPS id C1D6C600CF
 for <dri-devel@lists.freedesktop.org>; Mon, 15 Feb 2021 15:14:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1613402078;
 bh=7/lltRWEU6Jv44F5TMjmHK3Im8HHz0ArwIH4YwavaJw=;
 h=From:To:Subject:Date:In-Reply-To:References:From;
 b=KSDRDbn0cfydT4zCPvzJ1XVd0m0rvYCo4Yo25w+iW3Kd+spwLxUWkwTkTU9HO2yNL
 7eeeE8XjtuydV0gvbI0NoC34JwApo2aY+dCM90uBCgYIyUbSEcnHxfwMlKtsPeG9/s
 ICGHy0tYNaNqPj69mwf/Lssw99PUOQRalUu+RMm4P6AIs80c/ltKhbsKwOc2RZIVtd
 UUEG1yebKeWjV/haG892nPSLFbWY3fZ8v3FNdWy9gchruDZWKIwKuybHxkVCpyHfVo
 8v9dXb3zVnpXJgJwcUM+5VGYWQB2hJCZ9l6bMQD2gptODSid4glhrDXxADfkhUONXG
 8gLvU3n62HePw==
Received: by pdx-korg-bugzilla-2.web.codeaurora.org (Postfix, from userid 48)
 id AD9C860180; Mon, 15 Feb 2021 15:14:38 +0000 (UTC)
From: bugzilla-daemon@bugzilla.kernel.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 211425] [drm:atom_op_jump] *ERROR* atombios stuck in loop for
 more than 20secs aborting
Date: Mon, 15 Feb 2021 15:14:38 +0000
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
Message-ID: <bug-211425-2300-779JQzfTcU@https.bugzilla.kernel.org/>
In-Reply-To: <bug-211425-2300@https.bugzilla.kernel.org/>
References: <bug-211425-2300@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=211425

--- Comment #8 from Alex Deucher (alexdeucher@gmail.com) ---
Can you narrow down the specific commit?

https://www.kernel.org/doc/html/latest/admin-guide/bug-bisect.html

-- 
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
