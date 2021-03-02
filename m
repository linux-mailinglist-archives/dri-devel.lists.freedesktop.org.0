Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2D82F32A4B4
	for <lists+dri-devel@lfdr.de>; Tue,  2 Mar 2021 16:43:17 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 392F789C2C;
	Tue,  2 Mar 2021 15:43:13 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 56F2989C2C
 for <dri-devel@lists.freedesktop.org>; Tue,  2 Mar 2021 15:43:12 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPS id 334AE61494
 for <dri-devel@lists.freedesktop.org>; Tue,  2 Mar 2021 15:43:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1614699791;
 bh=5diciaqOiqqQhz15ZJC7iIkNZZJEvHsTX3R8Xar2qgs=;
 h=From:To:Subject:Date:In-Reply-To:References:From;
 b=kxZPtViENHzbfHP1hglBqKlD2cYIXVhW3z5moI6QlexKH6k1BqcKLU06uoAtBwb2Q
 lM0BOIuaMufjEMFk/nr4fGaaG+SzZvSVwgYO56T497bK87lUXOjCnUPp+ivtGkQaQk
 ozxRPbxAjIW00HL9QgUWkvk7tTT9/DkfyS1TADMKiOF/TJGWLq/TivKHmt9IjaEELX
 /rvnsXkgfB0BK9dijza35IoFL3KuYhYYXq8U42f4SoQe0sIsg96i13YJemjmYb3aP5
 2eZ4QXVNNCbTL/p2ULRAfi8eTiHXu5WW4OHS5SXotmnrr6g0XdHoY+xaQkOzVMxP5K
 bIkOylNKkGB4g==
Received: by pdx-korg-bugzilla-2.web.codeaurora.org (Postfix, from userid 48)
 id 237C465356; Tue,  2 Mar 2021 15:43:11 +0000 (UTC)
From: bugzilla-daemon@bugzilla.kernel.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 211981] AMDGPU: without cable attached videocard shuts down and
 does not wake up again,
 log prints "[drm] Cannot find any crtc or sizes"
Date: Tue, 02 Mar 2021 15:43:10 +0000
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
Message-ID: <bug-211981-2300-r56L45a0ug@https.bugzilla.kernel.org/>
In-Reply-To: <bug-211981-2300@https.bugzilla.kernel.org/>
References: <bug-211981-2300@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=211981

Alex Deucher (alexdeucher@gmail.com) changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
                 CC|                            |alexdeucher@gmail.com

--- Comment #1 from Alex Deucher (alexdeucher@gmail.com) ---
Does setting amdgpu.runpm=0 fix it?

-- 
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
