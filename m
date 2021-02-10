Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D2CFB316BDE
	for <lists+dri-devel@lfdr.de>; Wed, 10 Feb 2021 17:57:33 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0F1C36ECB1;
	Wed, 10 Feb 2021 16:57:32 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A715F6ECB1
 for <dri-devel@lists.freedesktop.org>; Wed, 10 Feb 2021 16:57:30 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPS id 5E62464E77
 for <dri-devel@lists.freedesktop.org>; Wed, 10 Feb 2021 16:57:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1612976250;
 bh=nplLQcZQg7IALLocqgmgOEc1s8tjQ+2me41UXbRTAWQ=;
 h=From:To:Subject:Date:In-Reply-To:References:From;
 b=E/20VQ5hFecR6Kn+3vmWYphXdqg9PJ1wV99XNfUUMlFqqwBgfPET6eBJ51aJ+tvoO
 UJnLfjt5s7PqCJvWDC1xAtrDhPbWyAsKqA9Xli6wtBnGpBsnJTdqE8xgnzj/0Ez2dQ
 ek6VEN6uzZFzSMxdv9KFwqIiuczd/0rvrY+8BtKc8Q5/czSfW5JzPdbWLbUqR7Novk
 1bv5BtOcyCqsXKGDkSlfwwgS2+uFwWitHriP5cYKaYdUAcyso4HKwQJ+00q1YivLP3
 R+dRsCz7sOrBjxed8M73F9JteDN+/AsP1pWx101GBKj+u/csPQiOhW2ieU0jv/CFNR
 Fv7SMmEExX4yg==
Received: by pdx-korg-bugzilla-2.web.codeaurora.org (Postfix, from userid 48)
 id 4EDF365259; Wed, 10 Feb 2021 16:57:30 +0000 (UTC)
From: bugzilla-daemon@bugzilla.kernel.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 211649] "drm/amd/display: reuse current context instead of
 recreating one" cause hdmi hotplug blackscreen on amdgpu
Date: Wed, 10 Feb 2021 16:57:30 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Video(DRI - non Intel)
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: nicholas.kazlauskas@amd.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-211649-2300-pfIfa1Pg9g@https.bugzilla.kernel.org/>
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

--- Comment #5 from Nicholas Kazlauskas (nicholas.kazlauskas@amd.com) ---
It would be good to know what OS/Userspace this is, I don't think I've seen
anything that has atomic check failures on nearly every flip, eg:

[  179.142898] [drm:amdgpu_dm_atomic_check [amdgpu]] Atomic check failed with
err: -22

Black screen comes from the page-flip timeout, but it's hard to say what the
root cause is.

When the screen is black can you cat the DTN log and then attach the result to
this ticket?

cat /sys/kernel/debug/dri/0/amdgpu_dm_dtn_log

Thanks!

-- 
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
