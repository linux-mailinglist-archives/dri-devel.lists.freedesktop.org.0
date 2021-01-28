Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 4D2E3306C4C
	for <lists+dri-devel@lfdr.de>; Thu, 28 Jan 2021 05:36:32 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E13416E14C;
	Thu, 28 Jan 2021 04:36:27 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8C34D6E14C
 for <dri-devel@lists.freedesktop.org>; Thu, 28 Jan 2021 04:36:26 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPS id 3009264DBD
 for <dri-devel@lists.freedesktop.org>; Thu, 28 Jan 2021 04:36:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1611808586;
 bh=XG/lp7RV1anJSuc/TNxq6/rUnc6ArR0FeKqDvnqbD1I=;
 h=From:To:Subject:Date:In-Reply-To:References:From;
 b=c0l21PeVkywlcRvcddlxwYSckGhVS6HkDtck/B8Au3zzCT/b72B6VfPfOTVRHAkvs
 e7D8U3ei8vfws7xlVUjmrCX//NIPkFDz6BJq0AuKp+ZQhtyx12Z3CaNoaltr3Za2Ki
 yEIE2CcNi0+wznHibZ3GkIp4J8xBqoufMzxBskivIc8TEY5TrkzwYtEsAuy74eMxRp
 Z7haHC9jAFbZ+KMPDnXe+wcht9mnRtvKve2Aub35aw+0Do/Y+zpdqwaD9Aq4q5fQMk
 /60U8EIWTgEnI31J+yLyFyjJ/+0SUDoXlKr1wpr+rcL/cLdgNstd3Up28qaRQGhiNE
 EBBPVBFggL6hA==
Received: by pdx-korg-bugzilla-2.web.codeaurora.org (Postfix, from userid 48)
 id 21897652FB; Thu, 28 Jan 2021 04:36:26 +0000 (UTC)
From: bugzilla-daemon@bugzilla.kernel.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 211349] IB test failed on sdma0 ! AMDGPU driver for Raven APU
 (ryzen 2400G) hangs!
Date: Thu, 28 Jan 2021 04:36:25 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Video(DRI - non Intel)
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: bolando@163.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-211349-2300-VINFh7y1g0@https.bugzilla.kernel.org/>
In-Reply-To: <bug-211349-2300@https.bugzilla.kernel.org/>
References: <bug-211349-2300@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=211349

--- Comment #18 from bolando@163.com ---
I have compiled x64 kernel for my LFS10.0.Booting with the X64 kernel,when load
the amdgpu driver,screen frozen again. check the kern log ,everything seems OK
but no amdgpudrmfb .I try to start X11,but failed with no fittable modes.

-- 
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
