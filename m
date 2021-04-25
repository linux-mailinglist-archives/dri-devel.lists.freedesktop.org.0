Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B9A3136A43E
	for <lists+dri-devel@lfdr.de>; Sun, 25 Apr 2021 04:50:31 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AC3386E44F;
	Sun, 25 Apr 2021 02:50:26 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id ABDCA6E44F
 for <dri-devel@lists.freedesktop.org>; Sun, 25 Apr 2021 02:50:24 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPS id D606461494
 for <dri-devel@lists.freedesktop.org>; Sun, 25 Apr 2021 02:50:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1619319022;
 bh=CIllmY6Jm8/CkV9zbJ4tTZhEFTsFo6xGm9dH7oEOSEo=;
 h=From:To:Subject:Date:In-Reply-To:References:From;
 b=TEBwuNw2+PJ3DMAVYRidODNpRs1I5Yqfu9ztI32FPZpS2S7Dwo/4QDHmk88rkyZen
 edZgHtTi7220ytdtqDJpZJ+JePgklZEA+YS4UpK5TZS5iI03/RdMg4IYsBGP624r1i
 pi/6Q/JTq9x73ctOYuvEbSvD1865Oy10Yvs/2MmQpYCR45Y0dv/7hevKYlYtHNAZvJ
 Q5lBTJAM01+DmKClUkByY/bmigCUF7SAs5PVt3i5AXQr1pkzUOoca3VZKKJ9X+FYpX
 mRMbu1zIZ+sqfWYPdlK32niJjUC+o1I/n0uzE3qk1L733ivXTTRpOq09H8/CSc1UGK
 d7lCvPJ6zF7gA==
Received: by pdx-korg-bugzilla-2.web.codeaurora.org (Postfix, from userid 48)
 id CF95761156; Sun, 25 Apr 2021 02:50:22 +0000 (UTC)
From: bugzilla-daemon@bugzilla.kernel.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 211807] [drm:drm_dp_mst_dpcd_read] *ERROR* mstb
 000000004e6288dd port 3: DPCD read on addr 0x60 for 1 bytes NAKed
Date: Sun, 25 Apr 2021 02:50:22 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Video(DRI - non Intel)
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: low
X-Bugzilla-Who: naon@disroot.org
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: cc
Message-ID: <bug-211807-2300-kCtENfOcCW@https.bugzilla.kernel.org/>
In-Reply-To: <bug-211807-2300@https.bugzilla.kernel.org/>
References: <bug-211807-2300@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=211807

naon@disroot.org changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
                 CC|                            |naon@disroot.org

--- Comment #1 from naon@disroot.org ---
I have just discovered after months of searching that I recieve this same
error. I have a desktop computer than uses both a AMD WX3100 and a AMD RX570.
When I turn off my monitor connected to either of my graphics cards (an
effective hotplug), then turn my monitor back on, I recieve the error

[drm:drm_dp_mst_dpcd_read [drm_kms_helper]] *ERROR* mstb 000000008ff61da7 port
8: DPCD read on addr 0x60 for 1 bytes NAKed

xorg crashes, I recieve the message

[drm:drm_dp_check_act_status [drm_kms_helper]] *ERROR* Failed to get ACT after
3000ms, last status: 01

and it takes up to 40 seconds for display of the vt to resume. The longer the
monitor remains off, the higher the chance that display of the vt will never
resume after the monitor is turned on, needing a hard restart. This error has
persisted for about 3 months, ever since i've first installed linux on this
computer, on every kernel variation and build I have tried to date. Currently
reproduceable on 5.11.16.

-- 
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
