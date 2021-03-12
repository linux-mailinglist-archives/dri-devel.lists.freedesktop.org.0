Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5546533952B
	for <lists+dri-devel@lfdr.de>; Fri, 12 Mar 2021 18:38:49 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6DB826E21A;
	Fri, 12 Mar 2021 17:38:46 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F0D9F6E21A
 for <dri-devel@lists.freedesktop.org>; Fri, 12 Mar 2021 17:38:44 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPS id E71B464F0F
 for <dri-devel@lists.freedesktop.org>; Fri, 12 Mar 2021 17:38:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1615570722;
 bh=48R2mswL+Ipg3iRP2BJ8CZAbUrFeEFM//9ltSriKnEk=;
 h=From:To:Subject:Date:From;
 b=mXBbcgiyE5hn4XVVse8vKh/fYGO0IKECSqxpOpT58asFyqTmT8S6f12g2HsthTRXL
 Q9ck+OuEglVWKzKQFAcOw6x2d9970DpQW/e5YS0+zhrDgiA9m2ntePkP2tXcp1rieq
 Zui7ULOxV7RWDYUctUbyWBYtkWRYhZrbhHgggqGiFljOmBeI6QB5yNidKFiAAar6wp
 ZfoU9d92jmDFCSDlPUzthqN/0iHlfRozM68KLuSgJxdFzbOAvqkuid8EB8DUbs/W1I
 sNPLu+dRyzqzGAuQwPwVAE792iJ23R/5eYX/S3pEffdfD428GKaEOhFTaklPrksj3q
 ZHWI+wbOfzbGg==
Received: by pdx-korg-bugzilla-2.web.codeaurora.org (Postfix, from userid 48)
 id D8D8E65369; Fri, 12 Mar 2021 17:38:42 +0000 (UTC)
From: bugzilla-daemon@bugzilla.kernel.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 212255] New: WARNING: at arch/x86/kernel/fpu/core.c:129
 kernel_fpu_begin_mask
Date: Fri, 12 Mar 2021 17:38:42 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: new
X-Bugzilla-Watch-Reason: AssignedTo drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Video(DRI - non Intel)
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: info@felicetufo.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: bug_id short_desc product version
 cf_kernel_version rep_platform op_sys cf_tree bug_status bug_severity
 priority component assigned_to reporter cf_regression attachments.created
Message-ID: <bug-212255-2300@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=212255

            Bug ID: 212255
           Summary: WARNING: at arch/x86/kernel/fpu/core.c:129
                    kernel_fpu_begin_mask
           Product: Drivers
           Version: 2.5
    Kernel Version: 5.11.3
          Hardware: x86-64
                OS: Linux
              Tree: Mainline
            Status: NEW
          Severity: normal
          Priority: P1
         Component: Video(DRI - non Intel)
          Assignee: drivers_video-dri@kernel-bugs.osdl.org
          Reporter: info@felicetufo.com
        Regression: No

Created attachment 295819
  --> https://bugzilla.kernel.org/attachment.cgi?id=295819&action=edit
dmesg

Hello,
i get two warnings booting kernel 5.11.3. The warning is present on later
5.11.x kernels (included 5.11.6) too, but does not show on 5.11.2.

------------[ cut here ]------------
[    6.099356] WARNING: CPU: 6 PID: 366 at arch/x86/kernel/fpu/core.c:129
kernel_fpu_begin_mask+0xa3/0xb0
 ---[ end trace 4cbc711ff0b0578b ]---

[    6.102354] ------------[ cut here ]------------
[    6.102354] WARNING: CPU: 6 PID: 366 at arch/x86/kernel/fpu/core.c:155
kernel_fpu_end+0x1e/0x30

-- 
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
