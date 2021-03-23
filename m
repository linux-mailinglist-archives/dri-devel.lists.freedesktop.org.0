Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 1CD573465B7
	for <lists+dri-devel@lfdr.de>; Tue, 23 Mar 2021 17:54:39 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5F7726E11A;
	Tue, 23 Mar 2021 16:54:36 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0B0ED6E11A
 for <dri-devel@lists.freedesktop.org>; Tue, 23 Mar 2021 16:54:35 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPS id 0FABF619B8
 for <dri-devel@lists.freedesktop.org>; Tue, 23 Mar 2021 16:54:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1616518474;
 bh=MyjSooxbxUczeO9TTOtTSf2zrKBCXT3NFGqMVBXn744=;
 h=From:To:Subject:Date:In-Reply-To:References:From;
 b=qPUEa0nCfhZSfZTx7kqHmuYItUv4jb9QiYLQ/DVrnuq0qoYnV6R4QC1OZjlGC+nqF
 +hYZnYZCSwFCVa90gr9L+HU0I57WM3bE+R5OF5vsqjdghoEQPtrAjeFQNrlbKCNws5
 E6G6r6I55er8JGnyZq3RGBPPZF/f6rt9/tvviM1OEzZp9jgBEXFbde3/SpduqYQKhT
 DJYRtWkTw40TYlsT7EYpa89nx8/ZFZ7hfxsoGlQ6cwbvek/zTQO8CX5EdGQPRUJ09q
 9LOI5RB7bqQ7lUwfUrKF1xUed8Wyhd4VZJ4IT4uLut3mYr/D2UGz/OSqCTI1sN8QZR
 Y4OI0SjYd3AJw==
Received: by pdx-korg-bugzilla-2.web.codeaurora.org (Postfix, from userid 48)
 id F0FD262AB8; Tue, 23 Mar 2021 16:54:33 +0000 (UTC)
From: bugzilla-daemon@bugzilla.kernel.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 212369] AMDGPU: GPU hangs with '*ERROR* Couldn't update BO_VA
 (-12)' on MIPS64
Date: Tue, 23 Mar 2021 16:54:33 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Video(DRI - non Intel)
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: xry111@mengyan1223.wang
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-212369-2300-6QsrM4hWSP@https.bugzilla.kernel.org/>
In-Reply-To: <bug-212369-2300@https.bugzilla.kernel.org/>
References: <bug-212369-2300@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=212369

--- Comment #2 from Xi Ruoyao (xry111@mengyan1223.wang) ---
With some workarounds, bisection gives:

first bad commit: [5b8c596976d4338942dd889b66cd06dc766424e1] Merge tag
'amd-drm-next-5.11-2020-11-05' of git://people.freedesktop.org/~agd5f/linux
into drm-next

-- 
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
