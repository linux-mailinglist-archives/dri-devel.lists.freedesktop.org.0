Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 224E631EBE8
	for <lists+dri-devel@lfdr.de>; Thu, 18 Feb 2021 16:58:20 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0480F6EA1A;
	Thu, 18 Feb 2021 15:58:18 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 20B0F6EA1A
 for <dri-devel@lists.freedesktop.org>; Thu, 18 Feb 2021 15:58:16 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPS id BA44D64E2F
 for <dri-devel@lists.freedesktop.org>; Thu, 18 Feb 2021 15:58:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1613663895;
 bh=hJU2MBUa4N+SmX+kvwCQonvqZJD4xbj1dbdgromSij8=;
 h=From:To:Subject:Date:In-Reply-To:References:From;
 b=MDVaNjGegLd65/VwRSPtqvd+odJTIFv/GXVpyl7pxHSEtQS7psRLLBW3HSR8t+mCa
 qiPleYQr3WfmRhlTCgVvDKpDpnBsWosHDjkcdnSL8Qh+g6yUA65+obMNq5Vcjlyrio
 Hr5Ny9OfFyf9FY6viU6YsRZb/2aC3lYZiGQ7OCanSsOYGU+PXRpYbfTax4VfKCnSdy
 4pQpktfoKW+ewYdEcRjWtQ942c+D4FsG2MKrUtRLY5f86mvyCrLGta1m8Zfn1Svo0d
 xuB7/J729jnLWNlbd5sERgOV+X7aWhgIt1BumrPa3LBNiOESPEOgp3o1wIyjhp6K29
 BVoqydEmNNngQ==
Received: by pdx-korg-bugzilla-2.web.codeaurora.org (Postfix, from userid 48)
 id AD87465203; Thu, 18 Feb 2021 15:58:15 +0000 (UTC)
From: bugzilla-daemon@bugzilla.kernel.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 211501] Kernel freeze when waking monitor from blanking / DPMS
 (AMDGPU / DC)
Date: Thu, 18 Feb 2021 15:58:15 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Video(DRI - non Intel)
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: wychuchol7777@gmail.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: cc
Message-ID: <bug-211501-2300-EGb7dYFNHJ@https.bugzilla.kernel.org/>
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

wychuchol (wychuchol7777@gmail.com) changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
                 CC|                            |wychuchol7777@gmail.com

--- Comment #3 from wychuchol (wychuchol7777@gmail.com) ---
It happens every time I turn off monitor or it blanks out  (and monitor goes
into sleep mode).
Kernel 5.11.0 rx 5700 xt Mesa 20.3.2 Pop OS 20.10
I can get back to DE but nothing works besides cursor movement (no response
from clicking or keyboard). Only option is to go to terminal only screen and
reboot.

-- 
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
