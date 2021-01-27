Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8B7F5304F05
	for <lists+dri-devel@lfdr.de>; Wed, 27 Jan 2021 02:41:07 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C36196E4CD;
	Wed, 27 Jan 2021 01:41:02 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4435E6E4CD
 for <dri-devel@lists.freedesktop.org>; Wed, 27 Jan 2021 01:41:01 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPS id E969964D85
 for <dri-devel@lists.freedesktop.org>; Wed, 27 Jan 2021 01:41:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1611711660;
 bh=49+cXgoiLzZ/8e8yox9s5agm238crXtkynUya0KbRPE=;
 h=From:To:Subject:Date:In-Reply-To:References:From;
 b=CuSuAnYFyH8uD3XEvoVtG9vTEjbqYzurFsos66JgSBhJrIjmxmDgBhatSa2lI68E7
 TytusPXD+8JUNNyZvo10bs6Jly8VYUkUvVDm0lEBT7RIx2u+XiuUnR0yBJD0M838C8
 GYxiUUNXuhkyjLwl8LsItZcNHgHnqtAWatU+OPsicb3ayvgZK8ZIgqJYHqij0E8woI
 whf4egXAbyuxZG9rHkjInrRLCsE6lgGWMYZvOd/E03/SoqfYnjLu8KGKWBGmAyKMpm
 WEDe+SVfoGRwwVSrkeYRlSP/+l4/+LMZE7CL3wB9CuIP/pKpAAlgU+M+j9f0r5r21k
 TW316NZfgdYSQ==
Received: by pdx-korg-bugzilla-2.web.codeaurora.org (Postfix, from userid 48)
 id E2188652D3; Wed, 27 Jan 2021 01:41:00 +0000 (UTC)
From: bugzilla-daemon@bugzilla.kernel.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 211033] [bisected][regression] amdgpu: *ERROR* Restoring old
 state failed with -12
Date: Wed, 27 Jan 2021 01:41:00 +0000
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
X-Bugzilla-Changed-Fields: cc
Message-ID: <bug-211033-2300-sTPQeYHXv0@https.bugzilla.kernel.org/>
In-Reply-To: <bug-211033-2300@https.bugzilla.kernel.org/>
References: <bug-211033-2300@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=211033

Alex Deucher (alexdeucher@gmail.com) changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
                 CC|                            |alexdeucher@gmail.com

--- Comment #15 from Alex Deucher (alexdeucher@gmail.com) ---
already reverted in stable:
https://git.kernel.org/pub/scm/linux/kernel/git/stable/linux.git/commit/?h=linux-5.10.y&id=261f4d03ad23c63964a6e1dd7b3611b108b1cb57

-- 
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
