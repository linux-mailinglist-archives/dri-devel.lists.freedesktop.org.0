Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1CBE431694C
	for <lists+dri-devel@lfdr.de>; Wed, 10 Feb 2021 15:42:07 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 12D5D6EC95;
	Wed, 10 Feb 2021 14:42:05 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 20C4E6EC95
 for <dri-devel@lists.freedesktop.org>; Wed, 10 Feb 2021 14:42:04 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPS id EF5DD64E31
 for <dri-devel@lists.freedesktop.org>; Wed, 10 Feb 2021 14:42:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1612968124;
 bh=oXzgnWmi/tU0ft/iOCPqcKln5TsoRTm6zSOJaSF6ZNE=;
 h=From:To:Subject:Date:In-Reply-To:References:From;
 b=sMjp6p0MTQQyn3uVn7t9EUwMtecuOkXQHXLmz363L3XDUFagOSw7lyIKF0Sl0Cnj0
 +4UTP0nxNeCzi9LF/3hCNv12HXvgVzwLJXHCLPo7EL4rNF8IGIcWHGvARPUeRJ4guX
 TBST3kaUHE5r5H23SfOwvg4X003dlAJ60mRv9tCjB1R8guUHyEjTrrc+SGqjYC0BFe
 eApR6523v2nnhp8TC+/rSc7IcGnKheVhfWch2Nrehb44aLV2H1PK1nLHQ4mew4c3s0
 SANXh9THvEObChdGRJ6xa3tLw78ox8L9pBIetL2qKV8OVkK3lItsd8JL69k4xVymnT
 tlTR1Mm7CAnMw==
Received: by pdx-korg-bugzilla-2.web.codeaurora.org (Postfix, from userid 48)
 id DE22C65259; Wed, 10 Feb 2021 14:42:03 +0000 (UTC)
From: bugzilla-daemon@bugzilla.kernel.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 211649] "drm/amd/display: reuse current context instead of
 recreating one" cause hdmi hotplug blackscreen on amdgpu
Date: Wed, 10 Feb 2021 14:42:03 +0000
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
X-Bugzilla-Changed-Fields: cc
Message-ID: <bug-211649-2300-4yE0GE9VtW@https.bugzilla.kernel.org/>
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

Nicholas Kazlauskas (nicholas.kazlauskas@amd.com) changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
                 CC|                            |nicholas.kazlauskas@amd.com

--- Comment #2 from Nicholas Kazlauskas (nicholas.kazlauskas@amd.com) ---
Please reproduce the blackscreen issue and attach the following
logs/information:

- dmesg.log (with drm.debug=6 set as part of your modeline)
- Xorg.0.log if using X
- The name of your desktop environment - eg. GNOME, KDE, etc.

I'm unable to reproduce this locally on my end and it doesn't seem to have
applied generically to DCN21/DCN30 per Dan's test report.

-- 
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
