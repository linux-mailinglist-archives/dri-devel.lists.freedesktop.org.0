Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4353633C55F
	for <lists+dri-devel@lfdr.de>; Mon, 15 Mar 2021 19:17:57 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D291D6E09C;
	Mon, 15 Mar 2021 18:17:53 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 27AD26E09C
 for <dri-devel@lists.freedesktop.org>; Mon, 15 Mar 2021 18:17:53 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPS id 0528464DF0
 for <dri-devel@lists.freedesktop.org>; Mon, 15 Mar 2021 18:17:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1615832273;
 bh=t/zttx8a9PA3U51Y5af1JFzVo4C7awpyZGsiaujAx3c=;
 h=From:To:Subject:Date:In-Reply-To:References:From;
 b=QvgcYWGaW0GQ/nqjC9cfhm2QNkADszhTQ2IcWkLdsR3UCaRGayhqb7/tY3XCYSbUV
 N6xFfiX4UKREXpWmTdVY+AbEhGNDr/l27206cUDnLRX/6v2+JBp6ZoCAYmUeT128WQ
 WzZCS8Gj2sViN1YdMY1IvqjjVescTqqfkNVUTBPtqKn//pFlasZJKtpUur65j9b7Gw
 c8GBoYyQcwZHmYoXCDZKxWaR9YmXncdxndPJ7wYtSO3EIKC4zr+SYkI7OFmuF1Zonv
 wUiqDBQEwnPFQshRvndQC6v9cBJlS0HqwTHWn4/CCfrvpmw4sKA68eCQ8ulp8VbtWk
 /bzAW0HPCbryg==
Received: by pdx-korg-bugzilla-2.web.codeaurora.org (Postfix, from userid 48)
 id E8B266533C; Mon, 15 Mar 2021 18:17:52 +0000 (UTC)
From: bugzilla-daemon@bugzilla.kernel.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 212259] Entire graphics stack locks up when running SteamVR and
 sometimes Sway; is sometimes unrecoverable
Date: Mon, 15 Mar 2021 18:17:52 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Video(DRI - non Intel)
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: high
X-Bugzilla-Who: alexdeucher@gmail.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: cc
Message-ID: <bug-212259-2300-pr5dySkzul@https.bugzilla.kernel.org/>
In-Reply-To: <bug-212259-2300@https.bugzilla.kernel.org/>
References: <bug-212259-2300@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=212259

Alex Deucher (alexdeucher@gmail.com) changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
                 CC|                            |alexdeucher@gmail.com

--- Comment #1 from Alex Deucher (alexdeucher@gmail.com) ---
What chip is this?  Can you attach your full dmesg output?  Does updating mesa
help?

-- 
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
