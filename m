Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 723E334B023
	for <lists+dri-devel@lfdr.de>; Fri, 26 Mar 2021 21:25:50 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 66ABD6F481;
	Fri, 26 Mar 2021 20:25:46 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9F97B6F481
 for <dri-devel@lists.freedesktop.org>; Fri, 26 Mar 2021 20:25:45 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPS id 7E7EE61A26
 for <dri-devel@lists.freedesktop.org>; Fri, 26 Mar 2021 20:25:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1616790345;
 bh=KCmRusAQ8oxzxt0YRaIfg6p3uxLTvXVRX0JuLA018ak=;
 h=From:To:Subject:Date:In-Reply-To:References:From;
 b=qylSxfe0byjII2V4SSnhScZhehRlZIh/mO4O7GgVvWvymmTadp7rdV0R4qdC5MNw9
 zAqH3505AbQlUFLqSxsh8xuEy+vxl8Ey4JlCbwG8/OaL8jlsTEdWec1Ir5cjROTTWj
 KUUNgUCcTMdu93y0ZgEKaJJAwS7rRlmynSIfpGjv8NweQtauYSBgR7O4hdqroGrR7Q
 0CYbbbZRmd2MLEQQAeLSPMnhIsTgQY16TgJonFZuP5PE5zUbgaSt9fWRRfUm5gvUKE
 jsrSWEQRidHXxmpcpRZCHf/e6xBtrKtPtvJ/Y/clkaFaLX/tqVnAFe2c8KGUEhSD/F
 73vSqKzy4pQFg==
Received: by pdx-korg-bugzilla-2.web.codeaurora.org (Postfix, from userid 48)
 id 6542E62AC6; Fri, 26 Mar 2021 20:25:45 +0000 (UTC)
From: bugzilla-daemon@bugzilla.kernel.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 212077] AMD GPU discrete card memory at highest frequency even
 while not in use
Date: Fri, 26 Mar 2021 20:25:45 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Video(DRI - non Intel)
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: high
X-Bugzilla-Who: bat_malin@abv.bg
X-Bugzilla-Status: REOPENED
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-212077-2300-dGhkijuJwj@https.bugzilla.kernel.org/>
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

--- Comment #14 from Bat Malin (bat_malin@abv.bg) ---
Thank you Alex for your engagement! Could you please include the patch in the
next 5.11.11 release so I could test the patch, sorry but I am not allowed to
compile a kernel on this machine.

-- 
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
