Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 18D8B314F3E
	for <lists+dri-devel@lfdr.de>; Tue,  9 Feb 2021 13:41:38 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3E3256EB0F;
	Tue,  9 Feb 2021 12:41:33 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3D18A6EB09
 for <dri-devel@lists.freedesktop.org>; Tue,  9 Feb 2021 12:41:32 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPS id E0DD864E6B
 for <dri-devel@lists.freedesktop.org>; Tue,  9 Feb 2021 12:41:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1612874491;
 bh=qS1FujzyEGDOtkDWkz6oixdsUYc7U1TgplWQKJ866uI=;
 h=From:To:Subject:Date:From;
 b=Ge9jbsVP8XH3qck/I1aOi3FCk65jlp95nv3oaXl7/kz5XWO7/YRWULTdhXTbeqg50
 Q0AXXSw/Kd8/KxNiQi7LW6TKEO4cTun3Flnfvd0lyPCNn2d05qSFJU4fc89W0Kl5Z9
 iBuoiuZSTD+a3LDt/gU9CH7MLp5JGADDsOPJg3zLM3/mGCjkHO8aLAYe8qXxKJzNw9
 ODqUm2OH3SPKE/q183+dnL8AVSweyZL6XhQa1tRfCtfgZh6HRt91BeFrPNhI8J+9Nx
 mptr5mXYbJRFUu7hrhx993WX4BC2EulffHZdwLVIifNuTUKmIm1K4NNL5l6IaqiOsK
 Gxa1WEerJm8mQ==
Received: by pdx-korg-bugzilla-2.web.codeaurora.org (Postfix, from userid 48)
 id D046C6535B; Tue,  9 Feb 2021 12:41:31 +0000 (UTC)
From: bugzilla-daemon@bugzilla.kernel.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 211651] New: Dual screen not working with Nvidia GTX 1050ti in
 a notebook
Date: Tue, 09 Feb 2021 12:41:31 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: new
X-Bugzilla-Watch-Reason: AssignedTo drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Video(DRI - non Intel)
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: kernel@fily.com.de
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: bug_id short_desc product version
 cf_kernel_version rep_platform op_sys cf_tree bug_status bug_severity
 priority component assigned_to reporter cf_regression
Message-ID: <bug-211651-2300@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=211651

            Bug ID: 211651
           Summary: Dual screen not working with Nvidia GTX 1050ti in a
                    notebook
           Product: Drivers
           Version: 2.5
    Kernel Version: 5.8.0.43
          Hardware: Intel
                OS: Linux
              Tree: Mainline
            Status: NEW
          Severity: normal
          Priority: P1
         Component: Video(DRI - non Intel)
          Assignee: drivers_video-dri@kernel-bugs.osdl.org
          Reporter: kernel@fily.com.de
        Regression: No

Hello, 
I can't connect my second monitor with kernel 5.8.0.43 and driver
nvidia-driver-450 and nvidia-driver-460. 

With 5.3.18-050318-generic this is possible. So, I think the problem is the
kernel. Maybe I can do a Kernel bisect, but I don't know how to perform it... 

Can you help me?

-- 
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
