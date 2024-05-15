Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8393F8C612B
	for <lists+dri-devel@lfdr.de>; Wed, 15 May 2024 09:09:35 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2B4B810E10E;
	Wed, 15 May 2024 07:09:31 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="ZehL10ef";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D390B10E10E
 for <dri-devel@lists.freedesktop.org>; Wed, 15 May 2024 07:09:29 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id D274E613F7
 for <dri-devel@lists.freedesktop.org>; Wed, 15 May 2024 07:09:28 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 856AAC32781
 for <dri-devel@lists.freedesktop.org>; Wed, 15 May 2024 07:09:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1715756968;
 bh=PnE89+7XTbLbAiZImN4JhnH5VnACrUQM58fHA5RHxe0=;
 h=From:To:Subject:Date:From;
 b=ZehL10efoQmJ5qWaFIFzbLv4dEOIKB7ATF0j5dgEX6awVdhcU4WdAKXL5lFrc1EYh
 l49hMkv8VOCpr+ryoS4InWttSCIrh1gH03XzgiB5jG7EsdOwCZghUFh82nY7EPT76N
 9d2NT0FmKsegvCfjqxvHEei3UlQjys5SMHGEEpRtoJbCGHSZbPo/iCVzh4e54XlLbY
 zYLkACDrEfogqmUWaoT0vpKoflAbAVrOeohrvvuLHNu2BHXwnU4uwrvpGsPgQLYuK3
 eTU+mHSFP8IMzlCFjcZOVEFj9EjMjIZeAswwFo+l9KasZcChZn9i9zidGGayyhMlA5
 6vZZlPiQfU20w==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix,
 from userid 48) id 77C39C53BB0; Wed, 15 May 2024 07:09:28 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 218841] New: Security issue (VERY old video memory displaying
 in Window preview)
Date: Wed, 15 May 2024 07:09:28 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: new
X-Bugzilla-Watch-Reason: AssignedTo drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Video(DRI - non Intel)
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: high
X-Bugzilla-Who: trentgamblin@hotmail.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P3
X-Bugzilla-Assigned-To: drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: bug_id short_desc product version rep_platform
 op_sys bug_status bug_severity priority component assigned_to reporter
 cf_regression
Message-ID: <bug-218841-2300@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D218841

            Bug ID: 218841
           Summary: Security issue (VERY old video memory displaying in
                    Window preview)
           Product: Drivers
           Version: 2.5
          Hardware: Intel
                OS: Linux
            Status: NEW
          Severity: high
          Priority: P3
         Component: Video(DRI - non Intel)
          Assignee: drivers_video-dri@kernel-bugs.osdl.org
          Reporter: trentgamblin@hotmail.com
        Regression: No

The window preview of Rhythmbox shows a Twitter window, even though Twitter
isn't even open in my browsers and I actually deleted the account a few days
ago!

I deleted my Twitter account about 4 days ago. I don't think I've rebooted =
my
computer though. There is only one tab open in each of those browser window=
s in
the video.

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
