Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 99C01316C96
	for <lists+dri-devel@lfdr.de>; Wed, 10 Feb 2021 18:28:11 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 664DF6E140;
	Wed, 10 Feb 2021 17:28:09 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CD7C16E140
 for <dri-devel@lists.freedesktop.org>; Wed, 10 Feb 2021 17:28:07 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPS id 8C6B664E79
 for <dri-devel@lists.freedesktop.org>; Wed, 10 Feb 2021 17:28:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1612978087;
 bh=6wNm7zMGec0BSTGHI6xvfGD8TI36qLoXV23AKg3r4LE=;
 h=From:To:Subject:Date:In-Reply-To:References:From;
 b=jo8sxDBy7LqDJJ3tVB6887VMkdIB0p/qpL++RPeL2CCx0KgVvxV3RZ+8gmIimPxTt
 TRjYAymCIZtpR23viW4uBThweUptSv63I3ruHJtBcRvd2oluq688rCtzgMyNgsBOPy
 PdpDjgdzt98dTwRSYS1XxhoKp7r4/ED+eH/eFO/1sSyAHthmbvfbcC2GJRqw69oguh
 EURReUv7h1ttGV+eh129uU1e9J/IRDQDRogFgyVNMXddmLUFwnjmvJije8RObOhJQm
 /cZ8iqC+A6GHX449mG4oSDe1JmNKWwKYEXqTr6ACnuw0pWhnQQX9pA7YVfRBzsO1YE
 0QRFpHoBFRxzA==
Received: by pdx-korg-bugzilla-2.web.codeaurora.org (Postfix, from userid 48)
 id 807D761470; Wed, 10 Feb 2021 17:28:07 +0000 (UTC)
From: bugzilla-daemon@bugzilla.kernel.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 211649] "drm/amd/display: reuse current context instead of
 recreating one" cause hdmi hotplug blackscreen on amdgpu
Date: Wed, 10 Feb 2021 17:28:07 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Video(DRI - non Intel)
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: youling257@gmail.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: attachments.created
Message-ID: <bug-211649-2300-Z7KDoYJCDT@https.bugzilla.kernel.org/>
In-Reply-To: <bug-211649-2300@https.bugzilla.kernel.org/>
References: <bug-211649-2300@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=211649

--- Comment #6 from youling257@gmail.com ---
Created attachment 295193
  --> https://bugzilla.kernel.org/attachment.cgi?id=295193&action=edit
amdgpu_dm_dtn_log

I using amd 3400g running on androidx86 7 with mesa21.0

cat /sys/kernel/debug/dri/0/amdgpu_dm_dtn_log

-- 
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
