Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D0FEF31B2D6
	for <lists+dri-devel@lfdr.de>; Sun, 14 Feb 2021 22:36:58 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D9C466E0CC;
	Sun, 14 Feb 2021 21:36:56 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7DD046E0CC
 for <dri-devel@lists.freedesktop.org>; Sun, 14 Feb 2021 21:36:55 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPS id 5BAD464E26
 for <dri-devel@lists.freedesktop.org>; Sun, 14 Feb 2021 21:36:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1613338615;
 bh=5nZB+R5KmVucVpZtN1wkkr3sxQ56A02w94+uZt8VXfg=;
 h=From:To:Subject:Date:In-Reply-To:References:From;
 b=BjdxA8uA6rRZMeWanfvp4PHKiAGQUmlTmkqa3bc0Gc4bz7SoB8yJx5W2EV0BOcdBB
 2CVcDWASO53AN5MjmSPxAoJhaG3nIPFdCwZPlDKQMyEzmicMVB2kQMAmURRip1KFv9
 x3RhKVq6Ra0bpSlH9p71N64wKW6ceYwD+qIlM5Y9YJNbJ47UVZxMbhI7YBYdXcH9Ki
 xi5C9Hl09zgjA+RVfLIVT1KFScDwSpZOdJ0kDLxAgJ5fRZbel2xSV2r+5ackf86Pb1
 vx716V4KD8TJQY44IS2G+q0FyAyzgWAf3DjaRU43EYj6rYNY9mrLBjav51IHIoZ7Nw
 Qda5PcAd1XEZA==
Received: by pdx-korg-bugzilla-2.web.codeaurora.org (Postfix, from userid 48)
 id 5895F65374; Sun, 14 Feb 2021 21:36:55 +0000 (UTC)
From: bugzilla-daemon@bugzilla.kernel.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 211745] Latest 5.11 git doesn't boot.
Date: Sun, 14 Feb 2021 21:36:55 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Video(DRI - non Intel)
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: blocking
X-Bugzilla-Who: rmuncrief@humanavance.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: attachments.created
Message-ID: <bug-211745-2300-PEPWWd1GeA@https.bugzilla.kernel.org/>
In-Reply-To: <bug-211745-2300@https.bugzilla.kernel.org/>
References: <bug-211745-2300@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=211745

--- Comment #5 from Robert M. Muncrief (rmuncrief@humanavance.com) ---
Created attachment 295281
  --> https://bugzilla.kernel.org/attachment.cgi?id=295281&action=edit
Bad journalctl

-- 
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
