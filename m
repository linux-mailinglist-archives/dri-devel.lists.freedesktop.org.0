Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EF4F832ED99
	for <lists+dri-devel@lfdr.de>; Fri,  5 Mar 2021 16:02:23 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E79116EB39;
	Fri,  5 Mar 2021 15:02:19 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 228E76EB39
 for <dri-devel@lists.freedesktop.org>; Fri,  5 Mar 2021 15:02:18 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPS id CCEAA6508D
 for <dri-devel@lists.freedesktop.org>; Fri,  5 Mar 2021 15:02:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1614956537;
 bh=O0eqbZ37faTCvn5EdS81jiIeJEwlXGip4VM6rbtkQ/g=;
 h=From:To:Subject:Date:In-Reply-To:References:From;
 b=GXouAFNk0y3PsnpWVBsjHbvmzKro9w8nc04bmiHn2qCRqcpc40C+3K1VUPoQq4qLK
 Ou+32/ZbP7j8d6SKV23y1U72LNI7EvlUHHH9CBA0gkSOUfDi0v5wxQvkwSFxNvjCFz
 7qGewf4dPyqTvdnwTOYSKDZqPjxQBQg9yom2XqL7jBqjNr3uPw8yfJOCf1tn07rgED
 zoPKVTAWYBzeht5l3Pu94OIMi9TmkamyIHlotnKLU4T1iBm/97rOiGGPYCNJIPcdos
 W1onnQp8JZmT+kna5x9+YMuCd6FeDrF+qy/96aO6ROFiJ2ZLc2n3KBAdfzJc6kRgLo
 iXIQZlDHJf1jg==
Received: by pdx-korg-bugzilla-2.web.codeaurora.org (Postfix, from userid 48)
 id C1D416532C; Fri,  5 Mar 2021 15:02:17 +0000 (UTC)
From: bugzilla-daemon@bugzilla.kernel.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 211277] sometimes crash at s2ram-wake (Ryzen 3500U): amdgpu,
 drm, commit_tail, amdgpu_dm_atomic_commit_tail
Date: Fri, 05 Mar 2021 15:02:17 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Video(DRI - non Intel)
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: kolAflash@kolahilft.de
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-211277-2300-KxJ670cWfL@https.bugzilla.kernel.org/>
In-Reply-To: <bug-211277-2300@https.bugzilla.kernel.org/>
References: <bug-211277-2300@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=211277

--- Comment #12 from kolAflash (kolAflash@kolahilft.de) ---
I've tried doing a bisect using this script. Unfortunately I couldn't reproduce
the bug this way. So I bisecting will take a lot longer.

for i in {0..19}; do
  echo -e "\n${i}"
  /usr/sbin/rtcwake --seconds 15 --mode no
  systemctl start suspend.target
  sleep 15
done

-- 
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
