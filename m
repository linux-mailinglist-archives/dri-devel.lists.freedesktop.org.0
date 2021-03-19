Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3E820342665
	for <lists+dri-devel@lfdr.de>; Fri, 19 Mar 2021 20:44:41 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 67CC56EA9E;
	Fri, 19 Mar 2021 19:44:37 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 837BD6EA9E
 for <dri-devel@lists.freedesktop.org>; Fri, 19 Mar 2021 19:44:36 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPS id 6A7226197B
 for <dri-devel@lists.freedesktop.org>; Fri, 19 Mar 2021 19:44:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1616183075;
 bh=5gZjZ/iAzPpPZGlEACiIRQvhzaCu8Z0moaRqi3wd/yA=;
 h=From:To:Subject:Date:In-Reply-To:References:From;
 b=NQA1qezl/bJhMvHiES/UECUzMrS0b69J+MjCW5s36FInBFzbY91AjY6zYF5G7B1/D
 KAxRn8bx3PJzyzV6Ppw4vsVP4TKjtL9B/rAVdTJ9pkS8Q9/9Gh8PpTYBzl11LmMc/O
 4nY1SayypXQcx7sf2Ezf0FkweE5G7nHaQUpSCJaMG9RcxUbuH0JSc9gShu2unS+mty
 CAm0yF6t4gABUGcvBFrz6AvXOWpauB+5O1JITuwl9lRkMRy9H6lSgEgkp738p6HqEP
 9eYDIgq1pFwMrd3JMFEMtkU1DlMJTww42SH7nc/j00FOAkM1fMcE0rgxzugTsF4Lzl
 n7C9ptxqK0nrQ==
Received: by pdx-korg-bugzilla-2.web.codeaurora.org (Postfix, from userid 48)
 id 5D41D62A51; Fri, 19 Mar 2021 19:44:35 +0000 (UTC)
From: bugzilla-daemon@bugzilla.kernel.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 212077] AMD GPU discrete card memory at highest frequency even
 while not in use
Date: Fri, 19 Mar 2021 19:44:35 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Video(DRI - non Intel)
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: high
X-Bugzilla-Who: bat_malin@abv.bg
X-Bugzilla-Status: REOPENED
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-212077-2300-1CfBLRTfo9@https.bugzilla.kernel.org/>
In-Reply-To: <bug-212077-2300@https.bugzilla.kernel.org/>
References: <bug-212077-2300@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=212077

--- Comment #12 from Bat Malin (bat_malin@abv.bg) ---
Old Kernel e.g. 5.10.23 initializes this 
1.038643] [drm] DM_PPLIB: values for Engine clock
[    1.038645] [drm] DM_PPLIB:   214000
[    1.038646] [drm] DM_PPLIB:   603000
[    1.038646] [drm] DM_PPLIB:   958000
[    1.038647] [drm] DM_PPLIB:   1060000
[    1.038647] [drm] DM_PPLIB:   1128000
[    1.038647] [drm] DM_PPLIB:   1182000
[    1.038648] [drm] DM_PPLIB:   1230000
[    1.038648] [drm] DM_PPLIB:   1275000
[    1.038649] [drm] DM_PPLIB: Validation clocks:
[    1.038649] [drm] DM_PPLIB:    engine_max_clock: 127500
[    1.038649] [drm] DM_PPLIB:    memory_max_clock: 175000
[    1.038650] [drm] DM_PPLIB:    level           : 8
[    1.038651] [drm] DM_PPLIB: values for Memory clock
[    1.038651] [drm] DM_PPLIB:   300000
[    1.038651] [drm] DM_PPLIB:   625000
[    1.038652] [drm] DM_PPLIB:   1750000
[    1.038652] [drm] DM_PPLIB: Validation clocks:
[    1.038652] [drm] DM_PPLIB:    engine_max_clock: 127500
[    1.038653] [drm] DM_PPLIB:    memory_max_clock: 175000
[    1.038653] [drm] DM_PPLIB:    level           : 8
 and for the integrated card- 
[    1.469248] [drm] DM_PPLIB: values for F clock
[    1.469250] [drm] DM_PPLIB:   400000 in kHz, 2874 in mV
[    1.469251] [drm] DM_PPLIB:   933000 in kHz, 3224 in mV
[    1.469252] [drm] DM_PPLIB:   1067000 in kHz, 3924 in mV
[    1.469253] [drm] DM_PPLIB:   1200000 in kHz, 4074 in mV
[    1.469256] [drm] DM_PPLIB: values for DCF clock
[    1.469257] [drm] DM_PPLIB:   300000 in kHz, 2874 in mV
[    1.469258] [drm] DM_PPLIB:   600000 in kHz, 3224 in mV
[    1.469259] [drm] DM_PPLIB:   626000 in kHz, 3924 in mV
[    1.469260] [drm] DM_PPLIB:   654000 in kHz, 4074 in mV
[    1.469553] [drm] Display Core initialized with v3.2.104!


The new one 5.11.7 only for integrated card
[    1.992374] kernel: [drm] DM_PPLIB: values for F clock
[    1.992377] kernel: [drm] DM_PPLIB:         400000 in kHz, 2874 in mV
[    1.992379] kernel: [drm] DM_PPLIB:         933000 in kHz, 3224 in mV
[    1.992381] kernel: [drm] DM_PPLIB:         1067000 in kHz, 3924 in mV
[    1.992382] kernel: [drm] DM_PPLIB:         1200000 in kHz, 4074 in mV
[    1.992385] kernel: [drm] DM_PPLIB: values for DCF clock
[    1.992387] kernel: [drm] DM_PPLIB:         300000 in kHz, 2874 in mV
[    1.992388] kernel: [drm] DM_PPLIB:         600000 in kHz, 3224 in mV
[    1.992390] kernel: [drm] DM_PPLIB:         626000 in kHz, 3924 in mV
[    1.992391] kernel: [drm] DM_PPLIB:         654000 in kHz, 4074 in mV
So I think this is related as the new kernel driver can`t initialize the values
for the discrete card.
Please fix.

-- 
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
