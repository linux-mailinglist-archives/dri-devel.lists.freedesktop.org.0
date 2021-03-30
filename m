Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C067834F265
	for <lists+dri-devel@lfdr.de>; Tue, 30 Mar 2021 22:50:00 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8BD1C6E97C;
	Tue, 30 Mar 2021 20:49:56 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D4B316E97C
 for <dri-devel@lists.freedesktop.org>; Tue, 30 Mar 2021 20:49:55 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPS id 1021461957
 for <dri-devel@lists.freedesktop.org>; Tue, 30 Mar 2021 20:49:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1617137394;
 bh=0iaz8L7G9C0H4UICFDVTe+baPQ7Q8CcJ8H4pwC2JSzQ=;
 h=From:To:Subject:Date:In-Reply-To:References:From;
 b=D4NjUsxGWZsH488WaYoszvK1rMp7BRt3oXd7sf885V07z0XDshCMEfAG4Qz/9Ht/B
 vWVnHVQjxohyn5JPDJAYcFoY/C4Rkpt7yqzCfJnnra/7/rUR1mLYu8G/hfUbzRsMJP
 kMY+F3+iRthToFsaNkrGZu3zAOdWA3NXiE2U3ucCW3+cikag6S0Wg1zZIyoLPPkdYA
 jAq484ZCPyXpASeFTThoZBpWGpiOYOY6HmVtYyGuoLVRZPXpxFpDpLE7Y/jb9535TU
 K6cWgOZyzSMLi5Q5uHGsGkMliQXNeL1Xe8L+UdY+LtKSvqIiVh7susyO3rh5NwPcyN
 cj41afOcL9ohQ==
Received: by pdx-korg-bugzilla-2.web.codeaurora.org (Postfix, from userid 48)
 id 0263262AB7; Tue, 30 Mar 2021 20:49:53 +0000 (UTC)
From: bugzilla-daemon@bugzilla.kernel.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 211425] [drm:atom_op_jump] *ERROR* atombios stuck in loop for
 more than 20secs aborting
Date: Tue, 30 Mar 2021 20:49:53 +0000
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
Message-ID: <bug-211425-2300-6QDnyc1ge0@https.bugzilla.kernel.org/>
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

--- Comment #14 from Alex Deucher (alexdeucher@gmail.com) ---
Renoir and vega10 are two different GPUs.  They have the same gfx core, but
most other things are different (different display hardware, different
multi-media hardware, etc.).  The atombios errors are related to the display
handling.  Does it work ok if you let the desktop manager blank the displays
automatically rather than physically turning them off?

-- 
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
