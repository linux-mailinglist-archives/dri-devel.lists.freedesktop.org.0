Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 89FB27A0842
	for <lists+dri-devel@lfdr.de>; Thu, 14 Sep 2023 16:59:47 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 297A710E595;
	Thu, 14 Sep 2023 14:59:44 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5ED5910E589
 for <dri-devel@lists.freedesktop.org>; Thu, 14 Sep 2023 14:59:42 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id A6616B827A2
 for <dri-devel@lists.freedesktop.org>; Thu, 14 Sep 2023 14:59:40 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 58D3BC433CB
 for <dri-devel@lists.freedesktop.org>; Thu, 14 Sep 2023 14:59:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1694703580;
 bh=T6v99raGFwG1DgfYGk2brwEklXJkfJfrjEfAd1OqSOc=;
 h=From:To:Subject:Date:From;
 b=LYlqLRDbZvggQ5k6L/53KpVyZS0BPnlAH9VkEAkjiL6GpwuswRcTg3hdCP/A2zahR
 17L4FumCDRl+k0MXeN6YzOE+HXaOXwjbpiMo8lT7vez1JiI54RexfzhuH79GUWDssG
 Zt2XE4Ka5Zna1JWDJXxAOxnFBDA+rUbd9driiqzow+nr6eOS/+htOeuPoC0bwDDVof
 qqiiG1meP4HdO6OzmmWBhSGZKxht5jHYcMHB01Sg9PUxr7X39g4JI8oP5BzZppT5zv
 FifKU6ojrPp2Vokf1MssT4tXXSQuoPy6zP64ROEf0X6kU46ONJKuz0hYCEUNjU+enI
 P9NuqQ8wdDhkg==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix,
 from userid 48) id 3E436C53BCD; Thu, 14 Sep 2023 14:59:40 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 217910] New: AMD Radeon RX 6600 XT: redraw artifacts around gui
 elements on primary monitor if TearFree disabled
Date: Thu, 14 Sep 2023 14:59:39 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: new
X-Bugzilla-Watch-Reason: AssignedTo drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Video(DRI - non Intel)
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: kevin.sopp@protonmail.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P3
X-Bugzilla-Assigned-To: drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: bug_id short_desc product version rep_platform
 op_sys bug_status bug_severity priority component assigned_to reporter
 cf_regression attachments.created
Message-ID: <bug-217910-2300@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D217910

            Bug ID: 217910
           Summary: AMD Radeon RX 6600 XT: redraw artifacts around gui
                    elements on primary monitor if TearFree disabled
           Product: Drivers
           Version: 2.5
          Hardware: AMD
                OS: Linux
            Status: NEW
          Severity: normal
          Priority: P3
         Component: Video(DRI - non Intel)
          Assignee: drivers_video-dri@kernel-bugs.osdl.org
          Reporter: kevin.sopp@protonmail.com
        Regression: No

Created attachment 305109
  --> https://bugzilla.kernel.org/attachment.cgi?id=3D305109&action=3Dedit
moving calculator app up/down introduces artifacts

OS: Arch Linux

Bug occurs since kernel 6.5.3-arch1-1, last known good kernel is 6.5.2.arch=
1-1.

Two monitors are attached:
- secondary @60Hz via DVI
- primary @143.91Hz (freesync capable) via DisplayPort

Kernel boot options:
- amdgpu.ppfeaturemask=3D0xffffffff

Xorg options:
- VariableRefresh true
- AsyncFlipSecondaries true

Artifacts occur only on primary monitor on every GUI element that gets redr=
awn.
Bug is fixed once I enable TearFree option on primary monitor (xrandr --out=
put
DisplayPort-2 --set TearFree on).
Bug reoccurs when I disable TearFree option.

OBS could not capture the artifacts so I had to take a video with my phone,=
 see
attachment.

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
