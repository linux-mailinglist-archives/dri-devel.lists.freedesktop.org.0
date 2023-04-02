Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 661FC6D3623
	for <lists+dri-devel@lfdr.de>; Sun,  2 Apr 2023 10:15:31 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id ADE1710E036;
	Sun,  2 Apr 2023 08:15:21 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6448910E036
 for <dri-devel@lists.freedesktop.org>; Sun,  2 Apr 2023 08:15:06 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 77B196108D
 for <dri-devel@lists.freedesktop.org>; Sun,  2 Apr 2023 08:15:04 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id DC56AC4339B
 for <dri-devel@lists.freedesktop.org>; Sun,  2 Apr 2023 08:15:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1680423303;
 bh=9FHiTKDtWYX6OQRjDftaD99XCm482wNojx5tVK6DeZg=;
 h=From:To:Subject:Date:In-Reply-To:References:From;
 b=GV5d0lXg6s7E9gJwQ6MYtL8d7LQSiCoCl+FREe0aoE/QPrnD3YdsWa8Afyu4De6WL
 LjIByx8Gpcfk50eE+ZeIkkYSs5bAszATFEtHARtOEhB9w0maHCjL0TdTDjKnPlvHcW
 UHyeFni/raqur0AT5QfSxQhUueurHkQLXIPYPHmQWZ5LazB/NDpn/t4bGBijgZslNJ
 wFQbnzu21rBqbzNSGeVblsawvTrbZzUi85lxaryAmsHcOvD4X1bvr0vovIIaUGLKlp
 0S/FBEmeZk+tcoy8g+BwCS08AyxS8GXkQbChDr1l946MqoAtZ3JinUB/gSvhSsPNpn
 1xLhnKxjMz/Hg==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix,
 from userid 48) id C6358C43144; Sun,  2 Apr 2023 08:15:03 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 217278] ast 0000:03:00.0: PM: **** DPM device timeout ****
 during S4 resuming
Date: Sun, 02 Apr 2023 08:15:03 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Video(DRI - non Intel)
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: blocking
X-Bugzilla-Who: regressions@leemhuis.info
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: cc
Message-ID: <bug-217278-2300-avMZuNq9Rj@https.bugzilla.kernel.org/>
In-Reply-To: <bug-217278-2300@https.bugzilla.kernel.org/>
References: <bug-217278-2300@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D217278

The Linux kernel's regression tracker (Thorsten Leemhuis) (regressions@leem=
huis.info) changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
                 CC|regressions@leemhuis.info   |

--- Comment #7 from The Linux kernel's regression tracker (Thorsten Leemhui=
s) (regressions@leemhuis.info) ---
Then it sounds like this is not a regression and thus nothing for me.

But FWIW, I doubt your report here will reach the maintainers of the driver.
You might want to contact them by mail to Joel Stanley <joel@jms.id.au>, CC=
ed
to linux-aspeed@lists.ozlabs.org

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
