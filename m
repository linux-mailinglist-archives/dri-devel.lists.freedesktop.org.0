Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 8718F438747
	for <lists+dri-devel@lfdr.de>; Sun, 24 Oct 2021 09:59:20 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E3ED56E0F8;
	Sun, 24 Oct 2021 07:59:15 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D16116E0F8
 for <dri-devel@lists.freedesktop.org>; Sun, 24 Oct 2021 07:59:14 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPS id 8D96160D43
 for <dri-devel@lists.freedesktop.org>; Sun, 24 Oct 2021 07:59:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1635062352;
 bh=9iy3FU1+oELF8alpaIcsWR5GA5cPlkXHw/tltt1FzNA=;
 h=From:To:Subject:Date:From;
 b=M6DxhMHJQiBRP5S05EakhGWstrMKaUeg9oQG6Tw3NTbNTKVpyC4hfN7mh7tlgIfAO
 6cEDWlsmXe+caSs1JIaIoM3FkWxWsHUDc2qDxDoWb509Cl5UDzym++RnzRWGwacH+l
 hwPNzo4sMfX/MAL8zCal0m7+/56yDJsKTE1cXVhV0V5IMpNozmfm2rAQ+SyHU915Ex
 I36BH7N6lzZOzo3Td4dWa9yY3HYndG5M97AQWzUeW4vbMNgGwfLmcYxpeazeGVtWXb
 9NO4EekIl5WeRugCQVvnk/1wLZzn1EfYUTedzNP4sbOcxiEsQeYvh23kGtjV0Gq81c
 fm+M8n65a5JBQ==
Received: by pdx-korg-bugzilla-2.web.codeaurora.org (Postfix, from userid 48)
 id 84478610CA; Sun, 24 Oct 2021 07:59:12 +0000 (UTC)
From: bugzilla-daemon@bugzilla.kernel.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 214801] New: polaris11 (rx560) regression
Date: Sun, 24 Oct 2021 07:59:12 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: new
X-Bugzilla-Watch-Reason: AssignedTo drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Video(DRI - non Intel)
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: roxmail@list.ru
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: bug_id short_desc product version
 cf_kernel_version rep_platform op_sys cf_tree bug_status bug_severity
 priority component assigned_to reporter cf_regression attachments.created
Message-ID: <bug-214801-2300@https.bugzilla.kernel.org/>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

https://bugzilla.kernel.org/show_bug.cgi?id=3D214801

            Bug ID: 214801
           Summary: polaris11 (rx560) regression
           Product: Drivers
           Version: 2.5
    Kernel Version: 5.14.14
          Hardware: All
                OS: Linux
              Tree: Mainline
            Status: NEW
          Severity: normal
          Priority: P1
         Component: Video(DRI - non Intel)
          Assignee: drivers_video-dri@kernel-bugs.osdl.org
          Reporter: roxmail@list.ru
        Regression: No

Created attachment 299307
  --> https://bugzilla.kernel.org/attachment.cgi?id=3D299307&action=3Dedit
dmesg

After a long using 4.19.122, i am trying to move for a newer kernel (my xhci
greatly improved since), currently it is 5.14.14 and there are noticeable
slowdown. For a numbers the Unigine Heaven Benchmark 4.0 (linux OpenGL) was
used.

4.19.122:
 FPS: 43.9
 Score: 1105
 Min FPS: 15.2
 Max FPS: 90.7

5.14.14:
 FPS: 31.4
 Score: 790
 Min FPS: 22.4
 Max FPS: 60.1

And there are flickering artifacts visible while benchmarking with newer
kernel.

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
