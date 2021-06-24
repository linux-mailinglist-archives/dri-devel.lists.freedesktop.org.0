Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4E7F13B38F3
	for <lists+dri-devel@lfdr.de>; Thu, 24 Jun 2021 23:52:17 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 020486E059;
	Thu, 24 Jun 2021 21:52:15 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2F74E6E059
 for <dri-devel@lists.freedesktop.org>; Thu, 24 Jun 2021 21:52:14 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPS id B92F8613C8
 for <dri-devel@lists.freedesktop.org>; Thu, 24 Jun 2021 21:52:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1624571533;
 bh=7JFKGWrluwSoQhZ2JdF9G7tr9xLje7KjUpf4Prm1i1U=;
 h=From:To:Subject:Date:In-Reply-To:References:From;
 b=aP1vZ+RhV5Ym3c79Q8ZuBCquF/GEhsl6pfDLBXrXXGvwkqJekzUjkdpT4CMyzI9Gg
 vMrlVgnB6OBwl5lFrm2p6ySF7uqXAaTv903P5z0WULHv+deI4She98s3ByuOEoFiug
 XDa272sEBJXcTxo3SQ2qUz4eGpFbw3oaUD49XrNHSv8rfGO50Qi16GIp9ovvM1rVS5
 1/L2naY2vpjhuotGTphAIJrNBy0uq9QGWVRzS6BIEW/FLjMCpZM0TjkPZKgf6YmOW4
 AXjzP63JWlgqq18/4InXf8hlCpp/grZyl82Er4nESvmdIPHrq1PtPSUWoJsVcE1r/K
 UrY6QpQQoUang==
Received: by pdx-korg-bugzilla-2.web.codeaurora.org (Postfix, from userid 48)
 id B682A6112F; Thu, 24 Jun 2021 21:52:13 +0000 (UTC)
From: bugzilla-daemon@bugzilla.kernel.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 213561] [bisected][regression] GFX10 AMDGPUs can no longer
 enter idle state after commit. Commit has been pushed to stable branches too.
Date: Thu, 24 Jun 2021 21:52:13 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Video(DRI - non Intel)
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: reiver@improbability.net
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: cc
Message-ID: <bug-213561-2300-fI5pge3DO1@https.bugzilla.kernel.org/>
In-Reply-To: <bug-213561-2300@https.bugzilla.kernel.org/>
References: <bug-213561-2300@https.bugzilla.kernel.org/>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

https://bugzilla.kernel.org/show_bug.cgi?id=3D213561

Alan Swanson (reiver@improbability.net) changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
                 CC|                            |reiver@improbability.net

--- Comment #9 from Alan Swanson (reiver@improbability.net) ---
These patches have just been reverted for 5.13-rc8 and should hopefully be
backported to be stable.

https://lists.freedesktop.org/archives/amd-gfx/2021-June/065575.html
https://lists.freedesktop.org/archives/dri-devel/2021-June/312755.html

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
