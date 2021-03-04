Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 11D8432D38B
	for <lists+dri-devel@lfdr.de>; Thu,  4 Mar 2021 13:49:51 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 94A466E4AE;
	Thu,  4 Mar 2021 12:49:46 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 113AD6E4AE
 for <dri-devel@lists.freedesktop.org>; Thu,  4 Mar 2021 12:49:45 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPS id C513564F34
 for <dri-devel@lists.freedesktop.org>; Thu,  4 Mar 2021 12:49:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1614862184;
 bh=r7QuXDLKXEF2mkERKBQzqpV0YX5wwF/7dIgGq+FJATo=;
 h=From:To:Subject:Date:In-Reply-To:References:From;
 b=q7ImUVGEV+74MrVmDT2ifREhGLLZvagajaWQnnFIMJNu0Ii3GB2e+3aGsQLYriBXp
 h4DGxOwEsSAOi7dNqlh9OmJI9pghTrfLdAJaE4+ONyCgo+fNHD3sKqRZGzgt7szXHs
 Gl2Tv2x2WpD6sbFSGmfJy3J2zxwiDkzrr7eXz3rNtLizKgbW3Z6lM96khVbjgyGiwS
 fhsde09DEiIGu9L+jT4wqwNK/bVnVURGsVk7Ou4faxCYzd+IiBVL97Udri1ZYF5zv5
 DrFATRP/Rrq0V8xjx4I1bVXx56rL5mPKI90KvPcctEWB1aD8CgZYKS/+vUJjVtmsV3
 hxIVSFIkXQOeA==
Received: by pdx-korg-bugzilla-2.web.codeaurora.org (Postfix, from userid 48)
 id BDF7D653C6; Thu,  4 Mar 2021 12:49:44 +0000 (UTC)
From: bugzilla-daemon@bugzilla.kernel.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 211997] sys-kernel/gentoo-sources-5.11.2 crash upon disconnect
 HDMI monitor AMDGPU
Date: Thu, 04 Mar 2021 12:49:44 +0000
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
X-Bugzilla-Resolution: PATCH_ALREADY_AVAILABLE
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: bug_status resolution
Message-ID: <bug-211997-2300-0Rvd8P5han@https.bugzilla.kernel.org/>
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

Stefan de Konink (stefan@konink.de) changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
             Status|NEW                         |RESOLVED
         Resolution|---                         |PATCH_ALREADY_AVAILABLE

--- Comment #3 from Stefan de Konink (stefan@konink.de) ---
Resolved by
https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?id=efc8278eecfd5e6fa36c5d41e71d038f534fe107

-- 
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
