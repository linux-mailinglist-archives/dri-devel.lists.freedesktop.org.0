Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E7F6E7EA1D0
	for <lists+dri-devel@lfdr.de>; Mon, 13 Nov 2023 18:26:04 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EF4AB10E3D3;
	Mon, 13 Nov 2023 17:26:00 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1CF9D10E3D3
 for <dri-devel@lists.freedesktop.org>; Mon, 13 Nov 2023 17:25:59 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 3C9DB60FCD
 for <dri-devel@lists.freedesktop.org>; Mon, 13 Nov 2023 17:25:58 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id DE23DC433C7
 for <dri-devel@lists.freedesktop.org>; Mon, 13 Nov 2023 17:25:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1699896357;
 bh=HVJL8hDVUKtyaXm0IwHWUcm/7fpsx55zWVNoxFzsv2I=;
 h=From:To:Subject:Date:From;
 b=qoZxdKgt3s0wqzK6knReUKiTDmgD9/OajCdC5h/mERUkLWWBsOKlHU/E/jajYY1Ly
 G0AD9yN61sewQu042TJXgbrqLbdJubaSxNt/DRFYCKOG5msfMciL7NemH/Ij3tex+m
 lGd4vSNAFGyOBVxDTNInsXYwimYc3TkjbUznzy2W4stNWX4XhitKSGzTjF6AMGgSHD
 2VJ04jQMq/V6ySRLQlKJFr/pKbeRHeBY2ZBC7ieGnFSdMHMB47DsVeoXU3I8pyjBMx
 gvYxwXGWyeW5XbAkXKZgvoqXb3C91dxVAaVS/qLrI6lokPZTSujPYA28xICNns7bO6
 h6KVILFWaDawQ==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix,
 from userid 48) id C75E3C53BD0; Mon, 13 Nov 2023 17:25:57 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 218141] New: fb: trapped write at 0000006000 on channel -1
 [3fed0000 unknown] engine 06 [BAR] client 04 [PFIFO_WRITE] subclient 00 [FB]
 reason 00000002 [PAGE_NOT_PRESENT]
Date: Mon, 13 Nov 2023 17:25:57 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: new
X-Bugzilla-Watch-Reason: AssignedTo drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Video(DRI - non Intel)
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: ionut_n2001@yahoo.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P3
X-Bugzilla-Assigned-To: drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: bug_id short_desc product version rep_platform
 op_sys bug_status bug_severity priority component assigned_to reporter
 cf_regression
Message-ID: <bug-218141-2300@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D218141

            Bug ID: 218141
           Summary: fb: trapped write at 0000006000 on channel -1
                    [3fed0000 unknown] engine 06 [BAR] client 04
                    [PFIFO_WRITE] subclient 00 [FB] reason 00000002
                    [PAGE_NOT_PRESENT]
           Product: Drivers
           Version: 2.5
          Hardware: All
                OS: Linux
            Status: NEW
          Severity: normal
          Priority: P3
         Component: Video(DRI - non Intel)
          Assignee: drivers_video-dri@kernel-bugs.osdl.org
          Reporter: ionut_n2001@yahoo.com
        Regression: No

Hi Kernel Team,

I notice today this:

nouveau 0000:65:00.0: fb: trapped write at 0000006000 on channel -1 [3fed00=
00
unknown] engine 06 [BAR] client 04 [PFIFO_WRITE] subclient 00 [FB] reason
00000002 [PAGE_NOT_PRESENT]

Kernel: 6.6.1-vanilla

Sporadic nouveau driver have issue with performance.

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
