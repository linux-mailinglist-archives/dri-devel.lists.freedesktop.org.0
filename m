Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 031E93EC7DD
	for <lists+dri-devel@lfdr.de>; Sun, 15 Aug 2021 09:09:57 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 07AD389D4D;
	Sun, 15 Aug 2021 07:09:51 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 016D289D4D
 for <dri-devel@lists.freedesktop.org>; Sun, 15 Aug 2021 07:09:48 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPS id A2C1260462
 for <dri-devel@lists.freedesktop.org>; Sun, 15 Aug 2021 07:09:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1629011388;
 bh=6JICn4E42rMIpcc60bbfT9FdSHs9CZC+7+YZIjJgDZk=;
 h=From:To:Subject:Date:From;
 b=nOETUgsu8Ew14yuofLEaDMQIwpwqkV7TFd7I/c5ZD7Oizh8EQWh+yiS22aeAyEa1j
 x4NXSOXY3fMgA5OHqsSTgAmqIs9cUa+aWhBK2+is/Roy6ocYIjPk7z3HgVtOkAeb2S
 WF8XdOopy0u6VXdnKhIat3MyaCNCeq3AlfDSfbneavAx5hGsDt+S1Jt5mCII2hLeWh
 sTQV0rNSTVjRg3JReqDUwKgqw4v4FaKEsb6O8H/z8KBIiRMjC5XI19cB9AUqUdrEVx
 f9HJ/CKnTmwg9KVlsiVSrl/h3g7i0+kDII0MB8476vb7vf4ndNSWUP0RU9LB2WwIBd
 tRyYLM810dDCA==
Received: by pdx-korg-bugzilla-2.web.codeaurora.org (Postfix, from userid 48)
 id 98CC460EC0; Sun, 15 Aug 2021 07:09:48 +0000 (UTC)
From: bugzilla-daemon@bugzilla.kernel.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 214071] New: amdgpu idle power draw to high at +75Hz
Date: Sun, 15 Aug 2021 07:09:48 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: new
X-Bugzilla-Watch-Reason: AssignedTo drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Video(DRI - non Intel)
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: pb.g@gmx.de
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: bug_id short_desc product version
 cf_kernel_version rep_platform op_sys cf_tree bug_status bug_severity
 priority component assigned_to reporter cf_regression
Message-ID: <bug-214071-2300@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D214071

            Bug ID: 214071
           Summary: amdgpu idle power draw to high at +75Hz
           Product: Drivers
           Version: 2.5
    Kernel Version: 5.13.10
          Hardware: x86-64
                OS: Linux
              Tree: Mainline
            Status: NEW
          Severity: normal
          Priority: P1
         Component: Video(DRI - non Intel)
          Assignee: drivers_video-dri@kernel-bugs.osdl.org
          Reporter: pb.g@gmx.de
        Regression: No

For best viewing pleasure I usually set my monitor to 144Hz and native 1080=
p.

At that refresh rate my RX6900XT draws about 35 Watts in idle situations
Memory clock stays at 1000Hz.=20

I have to lower the monitors refresh rate to 75Hz, then the card draws only=
 8
Watts in idle and memory clock goes significantly down to 96MHz.

Using 100 or 120 Hz does not help.

Situation in windows is different. The same hardware setup works in Windows=
10
at 1080p@144 with idle power draw of just 8 Watts.

So my guess is this is a driver issue and not a hardware issue.

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
