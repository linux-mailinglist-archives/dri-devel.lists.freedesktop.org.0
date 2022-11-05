Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 5928A61DDD3
	for <lists+dri-devel@lfdr.de>; Sat,  5 Nov 2022 20:38:55 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4A5FE10E105;
	Sat,  5 Nov 2022 19:38:48 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4262910E105
 for <dri-devel@lists.freedesktop.org>; Sat,  5 Nov 2022 19:38:45 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 97F1A60B8C
 for <dri-devel@lists.freedesktop.org>; Sat,  5 Nov 2022 19:38:44 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id EDCE2C433D7
 for <dri-devel@lists.freedesktop.org>; Sat,  5 Nov 2022 19:38:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1667677124;
 bh=gYgDsQp6shEdnG+fzlleYnDvC+yn2zjAsg1fnif6e20=;
 h=From:To:Subject:Date:From;
 b=J50ZOMr7jKgL/grQgGR6aMYCfmLMDUeyzt0+pmDvwO6Nzz70AXCbUz/+sZZdoCpm/
 9nt1/UgxwNWobWvBH0NaYe9Bxm+wQksPsK0zMLSQI7c4GDm3ouIkFRqJoPjhxvVkUx
 GLn+QagXoW3pwzTHT7UPiwLKJn+swRKu5ZeE0AwrKhJ8fcVaHlnPtOP7e63h2U2zNY
 MBsZNNB/0FGmhlxOinv+RbX9wjgoKUg57+mDtAKzLyph9WwltbA5ZfPyw++729ohT6
 ZIv6/AKHlKT9MqFmgb8qp0svZHJFuVMBBIeeudAnWqxcKB1/1U0WMmezE86sWJJLGZ
 +Kp5vW2cKvAgw==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix,
 from userid 48) id D1F56C433E7; Sat,  5 Nov 2022 19:38:43 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 216665] New: Synopsys Designware HDMI >= 2.10a seems not to
 insert PCUV bits into HDMI audio stream unless insert_pcuv bit is set
Date: Sat, 05 Nov 2022 19:38:43 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: new
X-Bugzilla-Watch-Reason: AssignedTo drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Video(DRI - non Intel)
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: geraldogabriel@gmail.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: bug_id short_desc product version
 cf_kernel_version rep_platform op_sys cf_tree bug_status bug_severity
 priority component assigned_to reporter cf_regression attachments.created
Message-ID: <bug-216665-2300@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D216665

            Bug ID: 216665
           Summary: Synopsys Designware HDMI >=3D 2.10a seems not to insert
                    PCUV bits into HDMI audio stream unless insert_pcuv
                    bit is set
           Product: Drivers
           Version: 2.5
    Kernel Version: 6.0.7
          Hardware: ARM
                OS: Linux
              Tree: Mainline
            Status: NEW
          Severity: normal
          Priority: P1
         Component: Video(DRI - non Intel)
          Assignee: drivers_video-dri@kernel-bugs.osdl.org
          Reporter: geraldogabriel@gmail.com
        Regression: No

Created attachment 303135
  --> https://bugzilla.kernel.org/attachment.cgi?id=3D303135&action=3Dedit
Patch to set insert_pcuv

Enabling sound in the device tree for my Radxa Rock Pi N10 (RK3399Pro SoM)
resulted in music sounding like white noise with my Philips 243V HDMI monit=
or.

I then found out I wasn't alone by reading the following LibreELEC thread:
https://forum.libreelec.tv/thread/17600-rk3399-hdmi-audio-quality/

Particularly, sigmaris on page 2 of that thread, experienced similar sympto=
ms
with his/her Samsung TV, like I did. Like him/her, I had to software mix the
volume down to 33% at which point music would sound like music, not white
noise.

I was very puzzled by that, and after an exchange with Sugar Zhang from
Rockchip I dumped all the HDMI registers with i2cdump and started checking =
them
one by one, comparing what was set by the Linux kernel driver with the Rock=
chip
Technical Reference Manual.

This lead me to the missing insert_pcuv bit, which it seems to me, Synopsys
introduced purposefully breaking compatibility with existing driver codebas=
es.
The attached patch fixes my problem (I have normal music with 100% of audio
volume and no glitches) and was posted to relevant kernel lists:
https://lore.kernel.org/dri-devel/Y2A48a5ff+SyxqLR@geday/T/

I'd like to thank Mark Brown for pointing out the fix should be restricted =
to
Linear PCM only, and Neil Armstrong for further researching this. Unfortuna=
tely
it seems we're out of testers for the time being.

I post this in the hope all this doesn't sink down the memory hole, and may=
be
Google will lead people experiencing the same problems towards here, and th=
ey
can test the proposed solution in the attachment.

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
