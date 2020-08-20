Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7FF4E24BAED
	for <lists+dri-devel@lfdr.de>; Thu, 20 Aug 2020 14:22:40 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 358DB6E947;
	Thu, 20 Aug 2020 12:22:37 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C789C6E947
 for <dri-devel@lists.freedesktop.org>; Thu, 20 Aug 2020 12:22:35 +0000 (UTC)
From: bugzilla-daemon@bugzilla.kernel.org
Authentication-Results: mail.kernel.org;
 dkim=permerror (bad message/signature format)
To: dri-devel@lists.freedesktop.org
Subject: [Bug 206017] Kernel 5.4.x unusable with GUI due to crashes (some hard)
Date: Thu, 20 Aug 2020 12:22:34 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Video(DRI - non Intel)
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: blocking
X-Bugzilla-Who: priit@ww.ee
X-Bugzilla-Status: RESOLVED
X-Bugzilla-Resolution: CODE_FIX
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-206017-2300-Ccg3WwDue0@https.bugzilla.kernel.org/>
In-Reply-To: <bug-206017-2300@https.bugzilla.kernel.org/>
References: <bug-206017-2300@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=206017

--- Comment #20 from priit@ww.ee (priit@ww.ee) ---
kernel 5.8.0-2-MANJARO; Vega 64 GPU; mesa 20.1.5; xf86-video-amdgpu 19.1.0

aug   20 12:58:47 Zen kernel: [drm:amdgpu_dm_atomic_commit_tail [amdgpu]]
*ERROR* Waiting for fences timed out!
aug   20 12:58:47 Zen kernel: [drm:amdgpu_dm_atomic_commit_tail [amdgpu]]
*ERROR* Waiting for fences timed out!
aug   20 12:58:52 Zen kernel: [drm:amdgpu_dm_atomic_commit_tail [amdgpu]]
*ERROR* Waiting for fences timed out!
aug   20 12:58:52 Zen kernel: [drm:amdgpu_job_timedout [amdgpu]] *ERROR* ring
gfx timeout, signaled seq=158674961, emitted seq=158674963
aug   20 12:58:52 Zen kernel: [drm:amdgpu_job_timedout [amdgpu]] *ERROR*
Process information: process Xorg pid 933 thread Xorg:cs0 pid 941
aug   20 12:58:53 Zen kernel: amdgpu: [powerplay] Failed to send message: 0x63,
ret value: 0xffffffff
aug   20 12:58:53 Zen kernel: amdgpu: [powerplay] Failed to send message: 0x26,
ret value: 0xffffffff
aug   20 12:58:53 Zen kernel: amdgpu: [powerplay] Failed to send message: 0x61,
ret value: 0xffffffff
aug   20 12:58:53 Zen kernel: amdgpu: [powerplay] Failed message: 0x37, input
parameter: 0x0, error code: 0xffffffff
aug   20 12:58:53 Zen kernel: amdgpu: [powerplay] Failed to send message: 0x63,
ret value: 0xffffffff
aug   20 12:58:53 Zen kernel: amdgpu: [powerplay] Failed to send message: 0x26,
ret value: 0xffffffff
aug   20 12:58:53 Zen kernel: amdgpu: [powerplay] Failed to send message: 0x61,
ret value: 0xffffffff
aug   20 12:58:53 Zen kernel: amdgpu: [powerplay] Failed message: 0x37, input
parameter: 0x0, error code: 0xffffffff
aug   20 12:58:56 Zen systemd-coredump[109412]: Process 933 (Xorg) of user 0
dumped core.

-- 
You are receiving this mail because:
You are watching the assignee of the bug.
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
