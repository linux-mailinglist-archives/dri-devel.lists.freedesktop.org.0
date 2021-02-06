Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 97386311EAD
	for <lists+dri-devel@lfdr.de>; Sat,  6 Feb 2021 17:34:48 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B43726E454;
	Sat,  6 Feb 2021 16:34:46 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0ED1E6E454
 for <dri-devel@lists.freedesktop.org>; Sat,  6 Feb 2021 16:34:46 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPS id 7A2D164E80
 for <dri-devel@lists.freedesktop.org>; Sat,  6 Feb 2021 16:34:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1612629285;
 bh=roMEgGOGBT+qj9yeUVXbXg8KjmQ+INtwMrmcS1HleJ4=;
 h=From:To:Subject:Date:In-Reply-To:References:From;
 b=o45rNWlioSAC79NtFxDiP7SAOnVtRWzk41t4JiZFwtHqE53hrC6ZE1MhA+AqIhpXJ
 IoPP/ApN8d8YuF395Ihl4lfg5Bk1hso3wyv/rYpfW9tdaOoQQ+QYixzo0qJZmn0xQL
 jMSeoQB2vkxdf83oX4yFNe3wFOrCCRpG2iauTi+8/+3GWdq7TAmTKx3idCO6mIMmjZ
 T3OJN+WxyAsKCPn4UJHlhh9Iu3jkNGM/1v0ISd/vZG8TO7jyMdE4gzHOYOTZcFyYp8
 c4KiUSl5DO4OBUQtrQR5W23b14LkqDdC1YfGajsg3bF9CX0TGgC9GkTVKognOiP1ee
 5EqX7/8ZcTKVw==
Received: by pdx-korg-bugzilla-2.web.codeaurora.org (Postfix, from userid 48)
 id 67EB965346; Sat,  6 Feb 2021 16:34:45 +0000 (UTC)
From: bugzilla-daemon@bugzilla.kernel.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 207763] Noisy Screen in Linux with kernel 5
Date: Sat, 06 Feb 2021 16:34:45 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Video(DRI - non Intel)
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: xunilarium@gmail.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-207763-2300-UA91BbXRYK@https.bugzilla.kernel.org/>
In-Reply-To: <bug-207763-2300@https.bugzilla.kernel.org/>
References: <bug-207763-2300@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=207763

--- Comment #7 from Mohammad Naeim (xunilarium@gmail.com) ---
(In reply to Alex Deucher from comment #5)
> Does it work correctly with 5.9-rc1 or newer?

I tested with 5.10 and the problem still exists.

-- 
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
