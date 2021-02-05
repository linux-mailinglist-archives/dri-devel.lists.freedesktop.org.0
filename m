Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D65F7310D48
	for <lists+dri-devel@lfdr.de>; Fri,  5 Feb 2021 16:40:25 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 09BEB6E329;
	Fri,  5 Feb 2021 15:40:24 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 78D856E329
 for <dri-devel@lists.freedesktop.org>; Fri,  5 Feb 2021 15:40:22 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPS id 8FC2F650F8
 for <dri-devel@lists.freedesktop.org>; Fri,  5 Feb 2021 15:40:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1612539621;
 bh=M3ZPCub7TzFkzcHuUMYIE+XcFxg24Spu7IV25MTYn5U=;
 h=From:To:Subject:Date:In-Reply-To:References:From;
 b=FRxtR+YdFObpuLgzbIaZq1NXa9nOqHF0Gk1O8diV1DO8h9TWVuyTzNmW5GNLUYuqo
 00jv3L7T91eESdb1BE3rf32OHEOLK+HD7HKhpESTIvQ4GeK9yywoSP0tcCUFzkiLHP
 GGtvkUEOwcl+PLiKiwbPi84oQj9pc9FUmbU0aJhYxv8VeSJGWj2AHZRqGK2vVBjwLi
 0iRFx+CoV7AbtHLEthd6NFb80kg8wwzxZ2Ed73ooRWvF+W9ndr8wxxpG4BFsoCbDiY
 knIJA9Dw/WPfUdVFB6ToGjl3kcYL6hY+Owq0HJ99Og37Z2a0P0aVxJ3z/xSrUlxzXG
 yYi44qGTojerA==
Received: by pdx-korg-bugzilla-2.web.codeaurora.org (Postfix, from userid 48)
 id 893696533E; Fri,  5 Feb 2021 15:40:21 +0000 (UTC)
From: bugzilla-daemon@bugzilla.kernel.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 210849] Black screen after resume from long suspend. Open/Close
 lid. AMDGPU
Date: Fri, 05 Feb 2021 15:40:21 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Video(DRI - non Intel)
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: blocking
X-Bugzilla-Who: alexdeucher@gmail.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: cc
Message-ID: <bug-210849-2300-05SZ3FNkoE@https.bugzilla.kernel.org/>
In-Reply-To: <bug-210849-2300@https.bugzilla.kernel.org/>
References: <bug-210849-2300@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=210849

Alex Deucher (alexdeucher@gmail.com) changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
                 CC|                            |alexdeucher@gmail.com

--- Comment #11 from Alex Deucher (alexdeucher@gmail.com) ---
Can you bisect?

-- 
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
