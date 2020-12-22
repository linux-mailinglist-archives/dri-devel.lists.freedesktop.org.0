Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 7D6702E0731
	for <lists+dri-devel@lfdr.de>; Tue, 22 Dec 2020 09:29:35 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 994846E1F6;
	Tue, 22 Dec 2020 08:29:33 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 92C6A6E1BD
 for <dri-devel@lists.freedesktop.org>; Tue, 22 Dec 2020 08:29:32 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPS id 696FE23127
 for <dri-devel@lists.freedesktop.org>; Tue, 22 Dec 2020 08:29:32 +0000 (UTC)
Received: by pdx-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
 id 60B6786739; Tue, 22 Dec 2020 08:29:32 +0000 (UTC)
From: bugzilla-daemon@bugzilla.kernel.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 210683] Nasty amdgpu powersave regression Navi14
Date: Tue, 22 Dec 2020 08:29:32 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Video(DRI - non Intel)
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: high
X-Bugzilla-Who: david.18.19.21@gmail.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: attachments.created
Message-ID: <bug-210683-2300-vjvLxEl6Cm@https.bugzilla.kernel.org/>
In-Reply-To: <bug-210683-2300@https.bugzilla.kernel.org/>
References: <bug-210683-2300@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=210683

--- Comment #5 from David Mak (david.18.19.21@gmail.com) ---
Created attachment 294289
  --> https://bugzilla.kernel.org/attachment.cgi?id=294289&action=edit
git bisect for Navi 21.

Not sure if I am doing is properly, but I performed a git bisect between 5.9
and 5.10 on drivers/gpu/drm/amd.

Note that none of the supposedly "good" commits actually fixed the issue. I
just mark them as "good" because those commits either cannot modeset to my
monitor's resolution, or the kernel fails to write certain registers to my GPU
and causes my display lose signal and go to standby. So technically the "first
bad commit" is just the first commit that I can boot into SDDM/KDE and can also
reproduce the issue.

Please let me know if there are anything else I can help with. I have a spare
Vega 64 (Vega 10) card lying around, but it has its own memory clock issues as
far as I remember =/

-- 
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
