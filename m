Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 0F832304D65
	for <lists+dri-devel@lfdr.de>; Wed, 27 Jan 2021 01:10:48 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4082D6E466;
	Wed, 27 Jan 2021 00:10:45 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 139AA6E466
 for <dri-devel@lists.freedesktop.org>; Wed, 27 Jan 2021 00:10:44 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPS id A645164D86
 for <dri-devel@lists.freedesktop.org>; Wed, 27 Jan 2021 00:10:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1611706243;
 bh=3J/6Ry02JJcdz25DvJ/kk3sygImqq81kl+5BlUte3Tk=;
 h=From:To:Subject:Date:In-Reply-To:References:From;
 b=VvA4jsHODIfHu3Md1PUuQxBJbluQbJJrz9M3APuAJ7XTKonh482MzoLSunBmjzShw
 JCNo1i8Cwz0TBbe8+P9fVUnfMawBtVStE/pJ591B/JQhZRqxku12Vo3QQlGf9RdF1V
 O2pcMGazRWLSbqN+vkdZSkmIfkFumAmtMSfew8EwTCAy+2ddM+5v5/wg26d2HkcXyO
 bm2+7tVUFxqINazAggr4+5ZmWgY6oUQo1NMLXyYwqwV4jM0AF6ZAvS1QVTLRN+lNEt
 aktrN3pI/sfQw9E2V/3kl8EKuHvoQKu5yBIPw3dSq0sZSEsVMNbVbAmgMovlEm4oZj
 4AuP9v4+q+ONg==
Received: by pdx-korg-bugzilla-2.web.codeaurora.org (Postfix, from userid 48)
 id A27AC652D3; Wed, 27 Jan 2021 00:10:43 +0000 (UTC)
From: bugzilla-daemon@bugzilla.kernel.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 211033] [bisected][regression] amdgpu: *ERROR* Restoring old
 state failed with -12
Date: Wed, 27 Jan 2021 00:10:42 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Video(DRI - non Intel)
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: shawn@anastas.io
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: cc
Message-ID: <bug-211033-2300-mLBTwxRxeW@https.bugzilla.kernel.org/>
In-Reply-To: <bug-211033-2300@https.bugzilla.kernel.org/>
References: <bug-211033-2300@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=211033

Shawn Anastasio (shawn@anastas.io) changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
                 CC|                            |shawn@anastas.io

--- Comment #14 from Shawn Anastasio (shawn@anastas.io) ---
I can confirm the same issue on 5.10.4 with a 2x 4K KVM setup on an AMD Radeon
Pro WX 5100 (Talos II POWER9 host).

-- 
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
