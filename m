Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5D3002FC35C
	for <lists+dri-devel@lfdr.de>; Tue, 19 Jan 2021 23:25:52 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BA39B6E10D;
	Tue, 19 Jan 2021 22:25:48 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BC81E6E10D
 for <dri-devel@lists.freedesktop.org>; Tue, 19 Jan 2021 22:25:46 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPS id 9D74923104
 for <dri-devel@lists.freedesktop.org>; Tue, 19 Jan 2021 22:25:46 +0000 (UTC)
Received: by pdx-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
 id 83AC281649; Tue, 19 Jan 2021 22:25:46 +0000 (UTC)
From: bugzilla-daemon@bugzilla.kernel.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 210321] /display/dc/dcn20/dcn20_resource.c:3240
 dcn20_validate_bandwidth_fp+0x8b/0xd0 [amdgpu]
Date: Tue, 19 Jan 2021 22:25:46 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Video(DRI - non Intel)
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: florian-evers@gmx.de
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-210321-2300-LvLr47qJ9L@https.bugzilla.kernel.org/>
In-Reply-To: <bug-210321-2300@https.bugzilla.kernel.org/>
References: <bug-210321-2300@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=210321

--- Comment #3 from Florian Evers (florian-evers@gmx.de) ---
Hi,

new info: this "crash" can be reproduced very easily here on my system. It is
enough to switch the screen off and on again to find the dump in the dmesg log.
I did not test yet whether it happens during switching off or while switiching
it back on, but I may test that using a second box.

I first noticed that the crash never happens if I work or play on my computer,
but if I come back after a pause I certainly found it in the logs. Thus I got
the assumption that it happens during the power saving phase of the screen.
Interestingly, using the power switch of the screen the dump can be triggered
very easily and 100% reliably.

Hope this helps!

Regards,
Florian

-- 
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
