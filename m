Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 746DC121F20
	for <lists+dri-devel@lfdr.de>; Tue, 17 Dec 2019 00:52:52 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A4C536E8F6;
	Mon, 16 Dec 2019 23:52:49 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 49BDC6E8F6
 for <dri-devel@lists.freedesktop.org>; Mon, 16 Dec 2019 23:52:48 +0000 (UTC)
From: bugzilla-daemon@bugzilla.kernel.org
Authentication-Results: mail.kernel.org;
 dkim=permerror (bad message/signature format)
To: dri-devel@lists.freedesktop.org
Subject: [Bug 200695] Blank screen on RX 580 with amdgpu.dc=1 enabled (no
 displays detected)
Date: Mon, 16 Dec 2019 23:52:47 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Video(DRI - non Intel)
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: claude@mathr.co.uk
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: cf_kernel_version
Message-ID: <bug-200695-2300-8VcXQkNUyN@https.bugzilla.kernel.org/>
In-Reply-To: <bug-200695-2300@https.bugzilla.kernel.org/>
References: <bug-200695-2300@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=200695

Claude Heiland-Allen (claude@mathr.co.uk) changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
     Kernel Version|4.17.19, 4.18.5 -- 4.18.20, |4.17.19, 4.18.5 -- 4.18.20,
                   |4.19-rc1 -- 4.19.32,        |4.19-rc1 -- 4.19.89,
                   |4.20-rc1 -- 4.20.17,        |4.20-rc1 -- 4.20.17,
                   |5.0-rc1 -- 5.0.5, 5.1-rc3   |5.0-rc1 -- 5.0.5, 5.1-rc3,
                   |                            |5.3.9, 5.3.16, 5.4.3,
                   |                            |5.5-rc2

--- Comment #35 from Claude Heiland-Allen (claude@mathr.co.uk) ---
Still getting this issue: with monitor connected via DVI, screen goes blank and
monitor turns off a few seconds into boot (is fine before that, in motherboard
power on display and grub and start of boot process).  With same monitor
connected via HDMI and HDMI/DVI adaptor there are no issues.

Kernel versions tested today, with behaviour as above:
- 4.19.89
- 5.3.16
- 5.4.3 (partial test, forgot to test with DVI; HDMI works fine)
- 5.5-rc2

-- 
You are receiving this mail because:
You are watching the assignee of the bug.
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
