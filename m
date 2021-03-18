Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 4F7CD34078F
	for <lists+dri-devel@lfdr.de>; Thu, 18 Mar 2021 15:16:26 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BA4F56E10F;
	Thu, 18 Mar 2021 14:16:22 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 36E6C6E10F
 for <dri-devel@lists.freedesktop.org>; Thu, 18 Mar 2021 14:16:22 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPS id 1E98A64E01
 for <dri-devel@lists.freedesktop.org>; Thu, 18 Mar 2021 14:16:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1616076981;
 bh=Uegw8XNRAot7MwOQS0EFi/J1F7HTWcjCDZxmVK6wuYc=;
 h=From:To:Subject:Date:From;
 b=GSOTxdpCaC/1bRsGxBnK6yevUG1cclfh5cRp2RAP2s5kYv4+vxaf1YE4qa7WRpfGz
 2QdgggppUW/V7Qp/ANsi5zp8QMEk99Iwtcr7LNQIq1wiHxMGRI0vz1fT4Ptlrm0nXX
 VEdq6w36xg1eZqamz2g5HydCvsVuKgZGtS2mrDD+Vu1kzYXy0zvLizUZl5oBdfVycb
 S2Ijs0WqU4h+Ered8n+BweztTnbNlMoCfIrOaR5IiPupZ+44ZnHXHG3zdKBmjWNHn0
 VbnTum3EX9pxPelaUhioHFeKSzMVhZprJ6qmW1bvbCQm5Nq9IqETGY/UAg4EtG7xPx
 7Ky60hxqoB41w==
Received: by pdx-korg-bugzilla-2.web.codeaurora.org (Postfix, from userid 48)
 id 189F4653CB; Thu, 18 Mar 2021 14:16:21 +0000 (UTC)
From: bugzilla-daemon@bugzilla.kernel.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 212327] New: i915 / Kernel Mode Setting - Distorts Screen
Date: Thu, 18 Mar 2021 14:16:20 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: new
X-Bugzilla-Watch-Reason: AssignedTo drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Video(DRI - non Intel)
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: roshan@rkarim.xyz
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: bug_id short_desc product version
 cf_kernel_version rep_platform op_sys cf_tree bug_status bug_severity
 priority component assigned_to reporter cf_regression attachments.created
Message-ID: <bug-212327-2300@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=212327

            Bug ID: 212327
           Summary: i915 / Kernel Mode Setting - Distorts Screen
           Product: Drivers
           Version: 2.5
    Kernel Version: 5.12.0-rc3
          Hardware: Intel
                OS: Linux
              Tree: Mainline
            Status: NEW
          Severity: normal
          Priority: P1
         Component: Video(DRI - non Intel)
          Assignee: drivers_video-dri@kernel-bugs.osdl.org
          Reporter: roshan@rkarim.xyz
        Regression: No

Created attachment 295913
  --> https://bugzilla.kernel.org/attachment.cgi?id=295913&action=edit
dmesg output

Hello,

I have this problem seemingly with the i915 driver. When kernel mode setting is
active, only half of my screen attempts to display all of the pixels, with the
other half turning all various shades of colours, but not working. Will attach
an image below.

Not totally sure what information to provide for this, so I've provided my
dmesg output.

Thanks,

RK

-- 
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
