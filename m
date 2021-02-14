Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A644F31B2C7
	for <lists+dri-devel@lfdr.de>; Sun, 14 Feb 2021 22:33:48 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9E16A6E054;
	Sun, 14 Feb 2021 21:33:45 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EDCD86E054
 for <dri-devel@lists.freedesktop.org>; Sun, 14 Feb 2021 21:33:43 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPS id 7661B64DE0
 for <dri-devel@lists.freedesktop.org>; Sun, 14 Feb 2021 21:33:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1613338423;
 bh=WIazoV1QZ+C9VuqfMXLt9yF4y0D6OJLHiiRBy7JFPuM=;
 h=From:To:Subject:Date:From;
 b=kysS53ipcF41TsMDXOjOy2p2aJjSFykzX+ekRmyDjTzVjWgAYj690/b2wncrdwfGE
 ynqbnIzaHcvWObnntDFoZwO7jtBQKIIfN7hOQ/7DrWirL/uuvzb1gcmON/XjFMjRrm
 eZcBdVwgDuEzY8LqmVAnSSYEkoA61XSpSY43UntH88aimP5Tg9tPJVpxB0Pg/9gmHf
 OivTcqZvCC/zsIcJHwopdQM+eZWdJ0yMgPWHyNtzV4kXwwUP335rDYu6CUmdxU5hZA
 hjycLoe9zK2dEYz3BHyiGknfVT/16IGahDjlnrU20gAwxGJD+fU2wHRVl9VdEu9QXu
 o1XcWhc2MbRwA==
Received: by pdx-korg-bugzilla-2.web.codeaurora.org (Postfix, from userid 48)
 id 61B8E65374; Sun, 14 Feb 2021 21:33:43 +0000 (UTC)
From: bugzilla-daemon@bugzilla.kernel.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 211745] New: Latest 5.11 git doesn't boot.
Date: Sun, 14 Feb 2021 21:33:43 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: new
X-Bugzilla-Watch-Reason: AssignedTo drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Video(DRI - non Intel)
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: blocking
X-Bugzilla-Who: rmuncrief@humanavance.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: bug_id short_desc product version
 cf_kernel_version rep_platform op_sys cf_tree bug_status bug_severity
 priority component assigned_to reporter cf_regression attachments.created
Message-ID: <bug-211745-2300@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=211745

            Bug ID: 211745
           Summary: Latest 5.11 git doesn't boot.
           Product: Drivers
           Version: 2.5
    Kernel Version: linux-git-5.11rc7.r141.g358feceebbf6
          Hardware: x86-64
                OS: Linux
              Tree: Mainline
            Status: NEW
          Severity: blocking
          Priority: P1
         Component: Video(DRI - non Intel)
          Assignee: drivers_video-dri@kernel-bugs.osdl.org
          Reporter: rmuncrief@humanavance.com
        Regression: No

Created attachment 295271
  --> https://bugzilla.kernel.org/attachment.cgi?id=295271&action=edit
Good dmesg

I started testing kernel 5.11 around rc5 and it has never booted. However the
logs always seemed to be truncated, and I couldn't ssh into my system until
today.  

However I compiled the latest git today andd ssh in and get useful information. 

Everything works great with 5.10.16, so I've attached dmesg_5.10.16_good.txt,
Xorg.0.log_5.10.16_good.txt, and journalctl_5.10.16_good.txt to show what
happens during a successful boot.  

And attached dmesg_5.11-git_fail.txt, Xorg.0.log_5.11-git_fail.txt, and
journalctl_5.11-git_fail.txt to show what happens during the failed boot with
5.11 git.  

By the way, the journalctl log was produced with journalctl -b -k.

-- 
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
