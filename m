Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 5980D34FA74
	for <lists+dri-devel@lfdr.de>; Wed, 31 Mar 2021 09:40:36 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9373D6E9F9;
	Wed, 31 Mar 2021 07:40:32 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 015C36E9F9
 for <dri-devel@lists.freedesktop.org>; Wed, 31 Mar 2021 07:40:30 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPS id 5675D619B9
 for <dri-devel@lists.freedesktop.org>; Wed, 31 Mar 2021 07:40:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1617176428;
 bh=yBtf1M4+E4t8it62ReV22lUO96kWxub8sugzbvvWWys=;
 h=From:To:Subject:Date:In-Reply-To:References:From;
 b=QEGrpWN4pWf8AHk0zqAI+uOGxHfYPASEMZBIzn+6pTO9ZuEMfdxqZSF3qjGQC/WwQ
 4yc8s7852izqLmM8BXfGd2RNlEWzVoJjDK9IxRApTAXxdD8r+T+C2eA2Ht7delpj6b
 8fj2DmVNyPS9+q2d4d+pM+zcX92BwuiYg4Aurdn7chTYUNSWrfdbMnC46N0fBx5MIN
 CBNQJL5F5xw5GnxpFIR7SsrCy0N159OupBENPBkpHonA75pOGBPRyDVgvY5L6eTlPs
 CPqeBD9nEnT7qN0HFSFpsX4Q+fwVwnkHDFA/o6me3WeRVIvynPB9VdFLMnhEgb8OQ3
 MJykZ8h3cvLLg==
Received: by pdx-korg-bugzilla-2.web.codeaurora.org (Postfix, from userid 48)
 id 4AA5A62ABF; Wed, 31 Mar 2021 07:40:28 +0000 (UTC)
From: bugzilla-daemon@bugzilla.kernel.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 211425] [drm:atom_op_jump] *ERROR* atombios stuck in loop for
 more than 20secs aborting
Date: Wed, 31 Mar 2021 07:40:27 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Video(DRI - non Intel)
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: icedragon.aw@web.de
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-211425-2300-iGYfTJYUWy@https.bugzilla.kernel.org/>
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

--- Comment #15 from Andreas (icedragon.aw@web.de) ---
I setup the automatic power management for the GPU/display down to 3 minutes.
After the 3 minutes the desktop manager blanks the display. I pressed a key to
wake up, but the monitor stays blank for the 2x20sec and I get the error
message too.

-- 
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
