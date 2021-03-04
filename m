Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 6B1E832D3A0
	for <lists+dri-devel@lfdr.de>; Thu,  4 Mar 2021 13:54:32 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CB67E6E4F3;
	Thu,  4 Mar 2021 12:54:28 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C20806E4F3
 for <dri-devel@lists.freedesktop.org>; Thu,  4 Mar 2021 12:54:27 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPS id 6E29E64F2C
 for <dri-devel@lists.freedesktop.org>; Thu,  4 Mar 2021 12:54:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1614862467;
 bh=s0RZmBs2pkyRu/Vf3UO6L52qEtvxkg78ABGEl6yE5nQ=;
 h=From:To:Subject:Date:In-Reply-To:References:From;
 b=b+R1Q1QzLJmwGIcEjwVvBKSJkliwdUPquXlFgscNOjUd5g4TWt7eRmqh4O9SBeG3s
 XgkXcTkWNd0UY8MaJNiA/SXHxiBflTrOOL25Q6RweDb0FBJvwz6PEF3WlOZRtzPuXv
 NWR8+Xrq06fq6luwdq9yCKqE/+blJ51rjjrMdYGelgezxMreibL2FXIISsXGUmCOCz
 wm6nqowJeaS7lI2g0QTXd18Jh/Sihn48/SxDN8G400QQwoz3ZOFUIz6NaMv2m/VjfF
 QppqdJdr4kFQO4+yt+4lbiMg99YMk0uWIDO2pr5K9a1btvvFrZuYWxl5ltAqwqFrHX
 h5bTlPRhogSJA==
Received: by pdx-korg-bugzilla-2.web.codeaurora.org (Postfix, from userid 48)
 id 6305D653C6; Thu,  4 Mar 2021 12:54:27 +0000 (UTC)
From: bugzilla-daemon@bugzilla.kernel.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 211997] sys-kernel/gentoo-sources-5.11.2 crash upon disconnect
 HDMI monitor AMDGPU
Date: Thu, 04 Mar 2021 12:54:27 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Video(DRI - non Intel)
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: pmenzel+bugzilla.kernel.org@molgen.mpg.de
X-Bugzilla-Status: RESOLVED
X-Bugzilla-Resolution: PATCH_ALREADY_AVAILABLE
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-211997-2300-hqYjxzhcoc@https.bugzilla.kernel.org/>
In-Reply-To: <bug-211997-2300@https.bugzilla.kernel.org/>
References: <bug-211997-2300@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=211997

--- Comment #4 from Paul Menzel (pmenzel+bugzilla.kernel.org@molgen.mpg.de) ---
Thank you for updating the status. Can you please mark it as a duplicate of bug
#211649 [1].

[1]: https://bugzilla.kernel.org/show_bug.cgi?id=211649

-- 
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
