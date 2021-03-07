Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 930BC33045A
	for <lists+dri-devel@lfdr.de>; Sun,  7 Mar 2021 20:51:47 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 794086E241;
	Sun,  7 Mar 2021 19:51:42 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 071516E241
 for <dri-devel@lists.freedesktop.org>; Sun,  7 Mar 2021 19:51:42 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPS id 7670965029
 for <dri-devel@lists.freedesktop.org>; Sun,  7 Mar 2021 19:51:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1615146701;
 bh=44AsI67eNxR1i/Yu1wzFpSvu4M8HM1Iq0FlPsHeDAFs=;
 h=From:To:Subject:Date:In-Reply-To:References:From;
 b=I+/PPahIXmbnnQ75b8H5HlpgKO/o0uwUbB6zQy5wa8ZR6z6qyohpsb+eBKqeeOkpp
 /vfKSRVOwzNFG92Yng7HQSw3OzIfC4pPUCmDIdsRwSvbURqHQ13eRBVuf0t/MCRI7E
 q44sMvN4hXIoyzhUL049f/KjHeMIaVWeGgZWR5Z21k5vWhoBZKuXhfgMJmsyUbmsXP
 91hOIpB6nqfyKh0f1Ebkp875oGTqfC4MwjToqe52Klr4qcoyUqm9O4wbjP7iYRhz+l
 LupsNB03GMIQyUNHHx6bF8rV9j/yfzcAB8ksDExmpQtj7jOTx3cmrWNzbeerCZxUW7
 XCqGcgtk9Ne5g==
Received: by pdx-korg-bugzilla-2.web.codeaurora.org (Postfix, from userid 48)
 id 6BA0E65349; Sun,  7 Mar 2021 19:51:41 +0000 (UTC)
From: bugzilla-daemon@bugzilla.kernel.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 212109] Analogix ANX6345 bridge fails to initialize after suspend
Date: Sun, 07 Mar 2021 19:51:41 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Video(DRI - non Intel)
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: high
X-Bugzilla-Who: jaron@kent-dobias.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-212109-2300-egnoOe1coH@https.bugzilla.kernel.org/>
In-Reply-To: <bug-212109-2300@https.bugzilla.kernel.org/>
References: <bug-212109-2300@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=212109

--- Comment #2 from Jaron Kent-Dobias (jaron@kent-dobias.com) ---
Additional information: the 5.10 and 5.11 series appear to attempt different
suspends: the 5.10 enters "s2idle" suspend, while the 5.11 enters "deep"
suspend.

-- 
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
