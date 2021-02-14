Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3080E31B254
	for <lists+dri-devel@lfdr.de>; Sun, 14 Feb 2021 20:48:38 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 16CF189BB2;
	Sun, 14 Feb 2021 19:48:35 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 03D7189BB2
 for <dri-devel@lists.freedesktop.org>; Sun, 14 Feb 2021 19:48:33 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPS id 597E264E8A
 for <dri-devel@lists.freedesktop.org>; Sun, 14 Feb 2021 19:48:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1613332113;
 bh=4RPRoVqeBY0SNW2Hg+AfptsflPZNEtI09LNm3VEsoM4=;
 h=From:To:Subject:Date:In-Reply-To:References:From;
 b=JWClFk8Kh7oSf77bP38J8U+5Axd4hNCqvNNAVMl2/u/z/qgvlDeA3i7qhhB2MO45s
 4isU+rbHRTnaPZOTXWa4tKSucHUXUyE2YwALce3J7xDceyKDqw2lK4LyO4HpfUPWz1
 7ESpmZqRN1LNUcXZ3qP8LeKCkAu3YUEq7a+0WqdlWgLUrlm+linCKViBtcveTC8IR+
 QCKulIP6g0ex6E44bhZlLt1NuiBhIYMYfKLHeyyvCYBmhhgL/gNkjnlt9iGLfzDiDI
 VVLOIkUMuApXR5flwcIBrXcmVu5HPU+ecUiBqI5MbOvucEKuX4hO7X8thIgwykWyYP
 uA7JCVGhqeoqQ==
Received: by pdx-korg-bugzilla-2.web.codeaurora.org (Postfix, from userid 48)
 id 53F5465374; Sun, 14 Feb 2021 19:48:33 +0000 (UTC)
From: bugzilla-daemon@bugzilla.kernel.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 201957] amdgpu: ring gfx timeout
Date: Sun, 14 Feb 2021 19:48:31 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Video(DRI - non Intel)
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: blocking
X-Bugzilla-Who: playdohcrow@gmail.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: cc
Message-ID: <bug-201957-2300-VaPK0r4jC8@https.bugzilla.kernel.org/>
In-Reply-To: <bug-201957-2300@https.bugzilla.kernel.org/>
References: <bug-201957-2300@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=201957

slidercrank (playdohcrow@gmail.com) changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
                 CC|                            |playdohcrow@gmail.com

--- Comment #45 from slidercrank (playdohcrow@gmail.com) ---
I still have this issue when I play "Interstellar Marines"

kernel: [drm:amdgpu_job_timedout [amdgpu]] *ERROR* ring gfx timeout, signaled
seq=163824, emitted seq=163826
kernel: [drm:amdgpu_job_timedout [amdgpu]] *ERROR* Process information: process
InterstellarMar pid 4378 thread Interstell:cs0 pid 4382

kernel: 5.10.14-200.fc33.

videocard: Radeon HD7770

When this happens, the image freezes, the system stops responding to keypresses
but the background music plays for a few minutes and I have to hit <reset>.

-- 
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
