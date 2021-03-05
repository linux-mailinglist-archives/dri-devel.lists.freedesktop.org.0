Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 53A2932F431
	for <lists+dri-devel@lfdr.de>; Fri,  5 Mar 2021 20:47:19 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2DC936EC32;
	Fri,  5 Mar 2021 19:47:17 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3FA9C6EC32
 for <dri-devel@lists.freedesktop.org>; Fri,  5 Mar 2021 19:47:16 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPS id 135AD6509A
 for <dri-devel@lists.freedesktop.org>; Fri,  5 Mar 2021 19:47:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1614973636;
 bh=85FglGM+NUJlUQrJRDlxOmOj8jXtaiCy1uWZRKu0za0=;
 h=From:To:Subject:Date:In-Reply-To:References:From;
 b=t1KGU/mAZDDHnjRA71dz71EbXpcMVjCGF7Jx9A/MOauVFmFO92417ZL1c/Rgju02/
 m/cT2xdH1sIJLyxmkBwkLegCp0aHAhm6kSKfwY5pn2bkJVwqtvJENP/hiPtHUSNQhQ
 D2A/GRXsy90LgWd3QVZi2PyElbvVV0lwjRiFFZhyuoEoMfS+U91UiUVAW+nRdXWsOI
 9JeVhhQzoZgKm5dYlyGIuUzzyDVSOTNBD2E6MvZQRRe66T5yujstOmX5pGCPxEuUnA
 9YRZNPY9avPOVjKGCgs+/dzPi5ByJmkllPIm0caMXoDp2qg5UZzR9WlT8obj5E80LA
 bch9k4lX/RG5Q==
Received: by pdx-korg-bugzilla-2.web.codeaurora.org (Postfix, from userid 48)
 id 0809165307; Fri,  5 Mar 2021 19:47:16 +0000 (UTC)
From: bugzilla-daemon@bugzilla.kernel.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 212077] AMD GPU discrete card memory at highest frequency even
 not in use
Date: Fri, 05 Mar 2021 19:47:15 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Video(DRI - non Intel)
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: high
X-Bugzilla-Who: bat_malin@abv.bg
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: short_desc
Message-ID: <bug-212077-2300-Z2k9Zoxs87@https.bugzilla.kernel.org/>
In-Reply-To: <bug-212077-2300@https.bugzilla.kernel.org/>
References: <bug-212077-2300@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=212077

Bat Malin (bat_malin@abv.bg) changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
            Summary|AMD GPU at highest          |AMD GPU discrete card
                   |frequency even not in use   |memory at highest frequency
                   |                            |even not in use

-- 
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
