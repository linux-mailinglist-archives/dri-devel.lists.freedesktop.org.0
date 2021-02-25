Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 001D83257DC
	for <lists+dri-devel@lfdr.de>; Thu, 25 Feb 2021 21:41:04 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8B9186E06E;
	Thu, 25 Feb 2021 20:41:00 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7C8C96E06E
 for <dri-devel@lists.freedesktop.org>; Thu, 25 Feb 2021 20:40:59 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPS id 37A8964E51
 for <dri-devel@lists.freedesktop.org>; Thu, 25 Feb 2021 20:40:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1614285659;
 bh=SwSTDVNvZIBCmsR4ys0Y7I2JAhb+YdH1QiXH0/pOOYs=;
 h=From:To:Subject:Date:In-Reply-To:References:From;
 b=OvOdZBIdUzGqo9X80nF2zW9pagkC2hdIBbxg+Ipkv4sJfTMyzKosGly9mUIMSHnP0
 jVlHc6eHv+1WFz7m8t4jzFGH5z7ClCijIS3cxp1yEt1jxLdYh1hUH+YqHtbCvLYMNP
 Nc6mRSJCwia8IM7mpGzB5qBN7aoLhQYdD/gDr69b+wtisb4ulSdyvU2JcyskihvtRj
 214Qdn/3C75nl8K/+peMJJItlbkDH+kTa+sIVJjqHo9lzVcuhPPDpKECw+/L6f3KQl
 Ik3C+QO3Ommz8CEzSfyOWpM/84zZxStxNJqnBVy77akgTxHAQWq0U7YqhCwwntoNG8
 8bmZBEl27MTIQ==
Received: by pdx-korg-bugzilla-2.web.codeaurora.org (Postfix, from userid 48)
 id 2CED0653D0; Thu, 25 Feb 2021 20:40:59 +0000 (UTC)
From: bugzilla-daemon@bugzilla.kernel.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 211649] "drm/amd/display: reuse current context instead of
 recreating one" cause hdmi hotplug blackscreen on amdgpu
Date: Thu, 25 Feb 2021 20:40:58 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Video(DRI - non Intel)
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: alexdeucher@gmail.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-211649-2300-5r7MdwSqrH@https.bugzilla.kernel.org/>
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

--- Comment #15 from Alex Deucher (alexdeucher@gmail.com) ---
Reverted:
https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?id=efc8278eecfd5e6fa36c5d41e71d038f534fe107

-- 
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
