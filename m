Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 0985880A270
	for <lists+dri-devel@lfdr.de>; Fri,  8 Dec 2023 12:42:25 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C6C1B10EA93;
	Fri,  8 Dec 2023 11:42:20 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from ams.source.kernel.org (ams.source.kernel.org
 [IPv6:2604:1380:4601:e00::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DAE2D10EA93
 for <dri-devel@lists.freedesktop.org>; Fri,  8 Dec 2023 11:42:18 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by ams.source.kernel.org (Postfix) with ESMTP id 729F6B82C97
 for <dri-devel@lists.freedesktop.org>; Fri,  8 Dec 2023 11:42:17 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id C8F28C433CA
 for <dri-devel@lists.freedesktop.org>; Fri,  8 Dec 2023 11:42:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1702035736;
 bh=LRUQsDEpCTqXo5VHECr7zz+sAf1XmZshqL3hET/TzTI=;
 h=From:To:Subject:Date:From;
 b=LrWDXgN7Uaod1QTkT7okv6ZMSmVQj7Vqi0xhRHA59SfaKbClJwkjj/+cxbEVNSlnH
 Mt+ExVz0AhiCl+Jbv5iPUeUuE05mNbJHZ8sSGvflG0Pp99dhdOQrghFgvxIMBw/zT5
 F6K4J/Mpn8DV7oqbRgOug8IK0l4jPHiQvvQyhhmTVwGaibnbVYpWzhmRfrtnV6/Vex
 zDpNRlpNF3Q0RzVgke4k7XkM1SYG9hHJSmsEk9cLGrGzZJ/oz6ISxJ7OBY4cwU/49N
 v7ZKfpSE5poDIzymLDfU77KvlLox3jmz7t1EZYVHCgwXPQ+cnZbaIYS2Jz858mOySu
 VjteLUyxx/etQ==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix,
 from userid 48) id B17A5C53BD0; Fri,  8 Dec 2023 11:42:16 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 218241] New: amdgpu: MODE2 reset
Date: Fri, 08 Dec 2023 11:42:16 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: new
X-Bugzilla-Watch-Reason: AssignedTo drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Video(DRI - non Intel)
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: supportend@protonmail.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P3
X-Bugzilla-Assigned-To: drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: bug_id short_desc product version
 cf_kernel_version rep_platform op_sys bug_status bug_severity priority
 component assigned_to reporter cf_regression attachments.created
Message-ID: <bug-218241-2300@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D218241

            Bug ID: 218241
           Summary: amdgpu: MODE2 reset
           Product: Drivers
           Version: 2.5
    Kernel Version: 6.6.5
          Hardware: AMD
                OS: Linux
            Status: NEW
          Severity: normal
          Priority: P3
         Component: Video(DRI - non Intel)
          Assignee: drivers_video-dri@kernel-bugs.osdl.org
          Reporter: supportend@protonmail.com
        Regression: No

Created attachment 305568
  --> https://bugzilla.kernel.org/attachment.cgi?id=3D305568&action=3Dedit
dmesg output

I compiled and installed Kernel 6.6.5 today and got a short black screen. I
attached the dmesg output. Because i saw changes in DRM, amdgpu in the
changelog, and i never had a reset under 6.6.4 and many Kernel versions bef=
ore,
i think, it's releated to these changes.

Hardware: AMD Ryzen 7 5700U with Radeon Graphics

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
