Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 0F4EC33C2BA
	for <lists+dri-devel@lfdr.de>; Mon, 15 Mar 2021 17:58:01 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3CB3989C94;
	Mon, 15 Mar 2021 16:57:57 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1EB8F89C99
 for <dri-devel@lists.freedesktop.org>; Mon, 15 Mar 2021 16:57:56 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPS id CC5F564F33
 for <dri-devel@lists.freedesktop.org>; Mon, 15 Mar 2021 16:57:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1615827475;
 bh=HOV3xstRILa6rb1zf5NBTVFW7d/Yh1KKd05g4uA20KY=;
 h=From:To:Subject:Date:In-Reply-To:References:From;
 b=eFWYAzZBuJF6OGh62X3NN52v8xAgq19CMBUiaUCgb9auujG0hjh+CI96w7l0fpzu5
 pIXhABw0RIGABD0pbL0OaQn3vTYPlv9Cl4SpdktordVsMgep4PmDT8rH9aRtiywZG7
 DUUFEYGR5kmF/Q+x16FvnlDYuzBm5Qn8qBEzsv5MVyiYq4MDyjkqW7YV3OS5bS5tUU
 XSr+fXRhqo8O1dMHNns2OHQ1o6aAzRVeNXRh41WDJiOCvtJgiPcqZdPh8jn7Fo9y6N
 AKtnkwm2ggME/3hgEMCCDN6RKd4bT97ip1YEUpwgws8zCx+95R49lcsC0X2sZkYx+K
 4aw7uQ6xKruVg==
Received: by pdx-korg-bugzilla-2.web.codeaurora.org (Postfix, from userid 48)
 id B30D165350; Mon, 15 Mar 2021 16:57:55 +0000 (UTC)
From: bugzilla-daemon@bugzilla.kernel.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 212293] [amdgpu] divide error: 0000 on resume from S3
Date: Mon, 15 Mar 2021 16:57:55 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Video(DRI - non Intel)
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: contact@scrumplex.net
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-212293-2300-6O4Eb323Iq@https.bugzilla.kernel.org/>
In-Reply-To: <bug-212293-2300@https.bugzilla.kernel.org/>
References: <bug-212293-2300@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=212293

--- Comment #1 from Sefa Eyeoglu (contact@scrumplex.net) ---
ADDITIONAL SYSTEM INFO
OS: Arch Linux (with testing repos)

Kernels with this issue: 5.11.6.arch1, 5.11.6.zen1, 5.12rc2 (built from Arch
Linux User Repository)
Kernels without this issue: 5.10.23-1-lts

-- 
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
