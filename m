Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3E96F348298
	for <lists+dri-devel@lfdr.de>; Wed, 24 Mar 2021 21:09:29 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5E1CD6EA7F;
	Wed, 24 Mar 2021 20:09:27 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C043D6EA7F
 for <dri-devel@lists.freedesktop.org>; Wed, 24 Mar 2021 20:09:25 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPS id 8A412619EC
 for <dri-devel@lists.freedesktop.org>; Wed, 24 Mar 2021 20:09:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1616616565;
 bh=X0LLFYT6QVRs1C1xHJNPkBFu3fVXQrRAXtNUJzOhbcY=;
 h=From:To:Subject:Date:In-Reply-To:References:From;
 b=DbQsZ+tnqwqp4T+l1ryrqs9i6HplR6GI63elCf5OmiUc/EF6jET3ESmZPOYvo0cNF
 XnMn3rJo3AqjSTbwWVSyBRmTI1LMmA9Z+fDlreyFLIfdQRBKSvxFQ275uoJeMvUOg3
 vWnHNV3wpoXIZXxkLdRDYmCDvMvNDqSfI31GPWT5CY5PO7VwWFesD92/wlyAwj1Awu
 h7PzG9ps/GFbL8pOtQaGvw44IkBOTQ5TsUdJBr5/ff2UryQyZBw0WR+ayTPBr+dI8D
 qO5WiMJSrsGbmZ5stdqR3LV2jWHOt/NvW2wV1J8xnnDDIScvFKWbT4klOdtn+neP2+
 zSUyk9EB1hzpQ==
Received: by pdx-korg-bugzilla-2.web.codeaurora.org (Postfix, from userid 48)
 id 8538162ABA; Wed, 24 Mar 2021 20:09:25 +0000 (UTC)
From: bugzilla-daemon@bugzilla.kernel.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 212425] Kernel warning at drivers/gpu/drm/ttm/ttm_bo.c:517
Date: Wed, 24 Mar 2021 20:09:25 +0000
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
Message-ID: <bug-212425-2300-uUsoCr2rDk@https.bugzilla.kernel.org/>
In-Reply-To: <bug-212425-2300@https.bugzilla.kernel.org/>
References: <bug-212425-2300@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=212425

Alex Deucher (alexdeucher@gmail.com) changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
                 CC|                            |alexdeucher@gmail.com

--- Comment #1 from Alex Deucher (alexdeucher@gmail.com) ---
I don't know that this should have gone to stable.  Looks like Sasha's bot
picked it up.  I think it may depend on other ttm changes that are not in
stable.

-- 
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
