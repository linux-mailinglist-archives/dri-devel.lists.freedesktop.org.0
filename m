Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 7AAF432D8B6
	for <lists+dri-devel@lfdr.de>; Thu,  4 Mar 2021 18:40:24 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2C44C6E10B;
	Thu,  4 Mar 2021 17:40:21 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3DBC66E10B
 for <dri-devel@lists.freedesktop.org>; Thu,  4 Mar 2021 17:40:20 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPS id 7DD0164F51
 for <dri-devel@lists.freedesktop.org>; Thu,  4 Mar 2021 17:40:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1614879619;
 bh=peEPHYNm4X5MfrdjghmNJ4fMqOnkbQCF326Vs91/GWE=;
 h=From:To:Subject:Date:In-Reply-To:References:From;
 b=Ng1CrhoqNxsEDmn+riAHrJP4GeEytT4sTH/wdw+lvOaRo1bMy8+LQxLP+6RmvDg6S
 LdezpvZQm34Bnnlq8m5L/VUlWYN/pViiRzbYhi+TuxDNUAbx3MjoAhg4a7BZ8EhV62
 wTfy3+U6B0WcwCxCS8e1m55RolJ63LFr5Rlk3awPPIwI08xtwbIusMukrLN+jxOh77
 OOjbe1UVMrxyz/9ez6M++Cut5JGuZ9GNqwBiUvMlvJucrd6coQAAE57J6uBA9ToRoC
 G6tUYd6SkAOVWQMZUPl4aSoFPXC7Yvp6CbsBkZCbKN4O10qb+oDeHiqgRPeDpvJL8F
 2IiAniOmC0Hrg==
Received: by pdx-korg-bugzilla-2.web.codeaurora.org (Postfix, from userid 48)
 id 7947F65372; Thu,  4 Mar 2021 17:40:19 +0000 (UTC)
From: bugzilla-daemon@bugzilla.kernel.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 211649] "drm/amd/display: reuse current context instead of
 recreating one" cause hdmi hotplug blackscreen on amdgpu
Date: Thu, 04 Mar 2021 17:40:18 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Video(DRI - non Intel)
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: stefan@konink.de
X-Bugzilla-Status: RESOLVED
X-Bugzilla-Resolution: CODE_FIX
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: cc
Message-ID: <bug-211649-2300-EryMnHhakV@https.bugzilla.kernel.org/>
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

Stefan de Konink (stefan@konink.de) changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
                 CC|                            |stefan@konink.de

--- Comment #18 from Stefan de Konink (stefan@konink.de) ---
*** Bug 211997 has been marked as a duplicate of this bug. ***

-- 
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
