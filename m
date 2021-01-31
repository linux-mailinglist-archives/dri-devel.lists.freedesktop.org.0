Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A2405309DD5
	for <lists+dri-devel@lfdr.de>; Sun, 31 Jan 2021 17:26:03 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 76EEC6E33F;
	Sun, 31 Jan 2021 16:26:01 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 89AF56E33F
 for <dri-devel@lists.freedesktop.org>; Sun, 31 Jan 2021 16:26:00 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPS id 5850264E27
 for <dri-devel@lists.freedesktop.org>; Sun, 31 Jan 2021 16:26:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1612110360;
 bh=lBklwELhAULL8mmYvyeDilfvh19at62lA+Pk6UeKVsg=;
 h=From:To:Subject:Date:In-Reply-To:References:From;
 b=Lr2bR+DaTKYMKxPwZBe5JogXIoZalk/WechkVTZdIztRQBgMBzajcVrDsJsh91058
 bWaYVHaRa3oNCvyJZnGzFKYyMt3gKe8r9TkSExlzgR/sv05CPMyShPFaG6DwFExiVQ
 oREck6c8vTnYV4DUrCfT2KT/oL7Ti9l4/isyoPM1VARZlrBDW8CUUo2G/X5F+LHfZO
 zf84ch/sJ2lavn8yK3a1KwAhQ5f8oorqF+693izZCbUV901VntfA9YfmD6BAc11/cg
 O7c6IuOLwElf3VAaMkZ8cTSen/n9Q3FQVE2IgGuEuU+YXE3He+prE+u+/6XqhL0RYW
 EZbo/6hvNCrZg==
Received: by pdx-korg-bugzilla-2.web.codeaurora.org (Postfix, from userid 48)
 id 5146E6531E; Sun, 31 Jan 2021 16:26:00 +0000 (UTC)
From: bugzilla-daemon@bugzilla.kernel.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 211501] Kernel freeze when waking monitor from blanking / DPMS
 (AMDGPU / DC)
Date: Sun, 31 Jan 2021 16:26:00 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Video(DRI - non Intel)
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: borisovjasen@protonmail.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: attachments.created
Message-ID: <bug-211501-2300-O7u18SRYah@https.bugzilla.kernel.org/>
In-Reply-To: <bug-211501-2300@https.bugzilla.kernel.org/>
References: <bug-211501-2300@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=211501

--- Comment #1 from Jasen Borisov (borisovjasen@protonmail.com) ---
Created attachment 295023
  --> https://bugzilla.kernel.org/attachment.cgi?id=295023&action=edit
dmesg output from the system booting (for extra info)

-- 
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
