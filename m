Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 14A25315472
	for <lists+dri-devel@lfdr.de>; Tue,  9 Feb 2021 17:55:22 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DF8A36E51D;
	Tue,  9 Feb 2021 16:55:19 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 481156E51D
 for <dri-devel@lists.freedesktop.org>; Tue,  9 Feb 2021 16:55:19 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPS id DDB0664E9D
 for <dri-devel@lists.freedesktop.org>; Tue,  9 Feb 2021 16:55:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1612889718;
 bh=8K/Ppw2mmhvI9vrntWBHd2o2bkTivJrUqvPhfM65KKo=;
 h=From:To:Subject:Date:In-Reply-To:References:From;
 b=g/Dh926t+TqWq+bRx9b00H38v74f9ExIMAZEgGspa5mlOwGuaORdhtj4DJ8qRjVdn
 fPXqFJVGl2r/8/w87sml1QKGUp/PowgyTWlGq0TFfPv7Txf1v/xX+EYobSxa4vc3+Y
 +LxDRZpaz6gFjowl6/TqgNFooOVqmTtq22ZTw7LRNVKuZIZ+nciPVdhB9Edqar6pBJ
 nJvcYxhuLrGv5InRQn4Po7lZCBu9PDH007UmMSAzfQcTbazYy6SJNdxP7dDEyVJT/j
 NFhPaDLLCJTA8J7xhc1WbCg6oCIYBt7orP4ZYe6JxCRzAiQK5JktsONW9fSWLddPMA
 BGpPNQdJCpjLQ==
Received: by pdx-korg-bugzilla-2.web.codeaurora.org (Postfix, from userid 48)
 id CEC6965369; Tue,  9 Feb 2021 16:55:18 +0000 (UTC)
From: bugzilla-daemon@bugzilla.kernel.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 211425] [drm:atom_op_jump] *ERROR* atombios stuck in loop for
 more than 20secs aborting
Date: Tue, 09 Feb 2021 16:55:18 +0000
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
Message-ID: <bug-211425-2300-iqPDgSWPXA@https.bugzilla.kernel.org/>
In-Reply-To: <bug-211425-2300@https.bugzilla.kernel.org/>
References: <bug-211425-2300@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=211425

Alex Deucher (alexdeucher@gmail.com) changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
                 CC|                            |alexdeucher@gmail.com

--- Comment #5 from Alex Deucher (alexdeucher@gmail.com) ---
If this is a regression can you bisect?

-- 
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
