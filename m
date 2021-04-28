Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 064C336D7A5
	for <lists+dri-devel@lfdr.de>; Wed, 28 Apr 2021 14:48:48 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C2DDE6EB27;
	Wed, 28 Apr 2021 12:48:45 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E87556EB27
 for <dri-devel@lists.freedesktop.org>; Wed, 28 Apr 2021 12:48:43 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPS id AD8EF61289
 for <dri-devel@lists.freedesktop.org>; Wed, 28 Apr 2021 12:48:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1619614123;
 bh=j/zUEXqVXeu8Nw1hXtleoUR0US7d/gN9I/BPgXeqOqA=;
 h=From:To:Subject:Date:From;
 b=LBmuzUXO7n9tMdXouNH/vw2E9n+a7Largu1ededkeBku9hrewaB1odTgGXdYjZ/+K
 w84oHVqICaXmzqz/tpoLxWNprSAnNhLLMIZ6dHdd0ejF2QWZmqobqRoNavcdXueqs7
 yHBGyJXKE4TBkNRX6xEkfJN1nhgteEg9yOtxiKGljcjEx81SWSKgkJaLE5frl7Ptne
 bPXTNYTwpwdPFxx6RnNsICam93AnuAryIANz4VHDaKSeYtniP0rTt4jYBWqsczzdXB
 4Gl4uU2akpCFnnRCLnh7ZHqDoUjJIPObxzaIbWkZX9t8eYujbuWEkD6BmaKPefSGUy
 GgL8AJ3tCIMqw==
Received: by pdx-korg-bugzilla-2.web.codeaurora.org (Postfix, from userid 48)
 id A6A8261289; Wed, 28 Apr 2021 12:48:43 +0000 (UTC)
From: bugzilla-daemon@bugzilla.kernel.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 212871] New: AMD Radeon Pro VEGA 20 (Aka Vega12) - Glitch and
 freeze on any kernel and/or distro.
Date: Wed, 28 Apr 2021 12:48:43 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: new
X-Bugzilla-Watch-Reason: AssignedTo drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Video(DRI - non Intel)
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: blocking
X-Bugzilla-Who: rodrigo.luglio@icloud.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: bug_id short_desc product version
 cf_kernel_version rep_platform op_sys cf_tree bug_status bug_severity
 priority component assigned_to reporter cf_regression
Message-ID: <bug-212871-2300@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=212871

            Bug ID: 212871
           Summary: AMD Radeon Pro VEGA 20 (Aka Vega12) - Glitch and
                    freeze on any kernel and/or distro.
           Product: Drivers
           Version: 2.5
    Kernel Version: Any
          Hardware: x86-64
                OS: Linux
              Tree: Mainline
            Status: NEW
          Severity: blocking
          Priority: P1
         Component: Video(DRI - non Intel)
          Assignee: drivers_video-dri@kernel-bugs.osdl.org
          Reporter: rodrigo.luglio@icloud.com
        Regression: No

I have a macbook pro with vega 20 which uses the amdgpu firmware vega12 and
when i boot any distro the graphics glitch and the computer freezes.
 If i install amdgpu pro on ubuntu it works flawlessly. Would you guys help me
debug this and fix for upstream? 

Let me know what can I send to complement the information required for
analysis, like logs or dmesg. I would be very happy to help and participate on
this.

Please, excuse me if this is not the right place for me to ask this kind of
thing, and please if you can, kindly redirect me to the right place.

-- 
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
