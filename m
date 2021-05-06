Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 72B89374C4D
	for <lists+dri-devel@lfdr.de>; Thu,  6 May 2021 02:23:25 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7189A89B3C;
	Thu,  6 May 2021 00:23:21 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 947B089AA2
 for <dri-devel@lists.freedesktop.org>; Thu,  6 May 2021 00:23:19 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPS id 4737461076
 for <dri-devel@lists.freedesktop.org>; Thu,  6 May 2021 00:23:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1620260599;
 bh=GUlGCPD83TSF77mt/1+eJxoqdZjHOnvEwKbBCh8augk=;
 h=From:To:Subject:Date:From;
 b=kT2SIEI/Wb7KepNadCMpzifvkWFTxxYzGWL1O6wTKHSsSkpKHdKTwAxiM+dDoOrt9
 wJNl8s7J8Hrw2AAHTYGSEdDCybt4njUvX4D5qbZtY0/OlC2wF1N30w8R7wmCdoPEUB
 vEcegrRMPY6ORbKnjKvdxUXBvRzRxBnhLqKZWM5Ne/e0y2WJ2/ndasy1TgQhEPqbDL
 lmzqdrRlIqGnbrDxrHRJTFUb2JAFvUoP3D2TJyZMmOWXC8mVRj7r5fHB5CJy0aaEym
 qcgsIlhZa1UiiYOjLAvn6hLEvNgsosWetwCg9xX+RXghPjBweiOdCt63uicyE7wm+G
 MnzC5pXHqDmsw==
Received: by pdx-korg-bugzilla-2.web.codeaurora.org (Postfix, from userid 48)
 id 3ACCC6127C; Thu,  6 May 2021 00:23:19 +0000 (UTC)
From: bugzilla-daemon@bugzilla.kernel.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 212959] New: [drm:dm_helpers_dp_write_dpcd [amdgpu]] *ERROR*
 Failed to find connector for link!
Date: Thu, 06 May 2021 00:23:18 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: new
X-Bugzilla-Watch-Reason: AssignedTo drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Video(DRI - non Intel)
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: blocking
X-Bugzilla-Who: tob88570@gmail.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: bug_id short_desc product version
 cf_kernel_version rep_platform op_sys cf_tree bug_status bug_severity
 priority component assigned_to reporter cf_regression
Message-ID: <bug-212959-2300@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D212959

            Bug ID: 212959
           Summary: [drm:dm_helpers_dp_write_dpcd [amdgpu]] *ERROR* Failed
                    to find connector for link!
           Product: Drivers
           Version: 2.5
    Kernel Version: 5.4, 5.8
          Hardware: Other
                OS: Linux
              Tree: Mainline
            Status: NEW
          Severity: blocking
          Priority: P1
         Component: Video(DRI - non Intel)
          Assignee: drivers_video-dri@kernel-bugs.osdl.org
          Reporter: tob88570@gmail.com
        Regression: No

This error occurs on all distros based on Ubuntu 20.04 with Linux Kernel 5.=
4 as
well as Kernel 5.8, that attempt to load a GUI, upon booting from a mounted=
 iso
into said Operating Systems installations.

This error occurs at least for AMD RYZEN 7 4700U Apus with AMD VEGA 7 RENOIR
graphics.

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
