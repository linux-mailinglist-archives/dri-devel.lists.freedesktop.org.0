Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B766531709D
	for <lists+dri-devel@lfdr.de>; Wed, 10 Feb 2021 20:51:57 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5240C899B0;
	Wed, 10 Feb 2021 19:51:54 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A7341898BE
 for <dri-devel@lists.freedesktop.org>; Wed, 10 Feb 2021 19:51:53 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPS id 7BE7464ED4
 for <dri-devel@lists.freedesktop.org>; Wed, 10 Feb 2021 19:51:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1612986713;
 bh=qVxwdwZ6ovdu9JMvl6EGf0GsCdTX0MnWnXJzkq2wYBU=;
 h=From:To:Subject:Date:In-Reply-To:References:From;
 b=VNDM6lrpNMS+kioF/dKwTpUIByXI9uYtIi+gVOfiSf5VtQjwwayNzpTJTo7mo6zHu
 S5SbHrpvXgFvF+jskX372vk1+VXoaOcd/ZlXxnRqBmPPXhxr/aqbxKwHhoU7ODkwxY
 Ww8bSN93+BIS7166bEjNFROfwIkbPBqPgREzvm+JA31SZxY31GF795uDGUdQPmLHqq
 dYMIWBOGdz5FreUHEh/IAJVqp/7hp/imE7FqBe2Saf0wYfwW50u/e2lV6eFKZs+VtK
 T6f/d8zjYlSIuU4Zi3R66KMWWUFpdukcTJrrRZGsuCH2uTeBc616MvpVNVIczVYgs4
 ZcMkFUBBo37FA==
Received: by pdx-korg-bugzilla-2.web.codeaurora.org (Postfix, from userid 48)
 id 6B93F65259; Wed, 10 Feb 2021 19:51:53 +0000 (UTC)
From: bugzilla-daemon@bugzilla.kernel.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 211649] "drm/amd/display: reuse current context instead of
 recreating one" cause hdmi hotplug blackscreen on amdgpu
Date: Wed, 10 Feb 2021 19:51:53 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Video(DRI - non Intel)
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: nicholas.kazlauskas@amd.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-211649-2300-Duc86p3Zbt@https.bugzilla.kernel.org/>
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

--- Comment #10 from Nicholas Kazlauskas (nicholas.kazlauskas@amd.com) ---
I don't expect the trace log to be completely empty.

You'll need to leave the trace log running after enabling it as well (with
tracing on/trace).

You'll also need various config options set in your kernel:

CONFIG_FUNCTION_TRACER
CONFIG_FUNCTION_GRAPH_TRACER
CONFIG_STACK_TRACER
CONFIG_DYNAMIC_FTRACE

Sorry if this is a little bit involved, but I'd like capture the exact sequence
of atomic commits with the trace so I can reproduce the sequence on my end.

Thanks!

-- 
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
