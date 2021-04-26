Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 232E936B0D0
	for <lists+dri-devel@lfdr.de>; Mon, 26 Apr 2021 11:40:58 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 51ED06E15E;
	Mon, 26 Apr 2021 09:40:56 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1B7776E15E
 for <dri-devel@lists.freedesktop.org>; Mon, 26 Apr 2021 09:40:55 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPS id AEF5A61363
 for <dri-devel@lists.freedesktop.org>; Mon, 26 Apr 2021 09:40:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1619430054;
 bh=DxLad8jUxoWLqL43G31KcJ476teWK1OY66wCq4vXOGw=;
 h=From:To:Subject:Date:In-Reply-To:References:From;
 b=hTw0dO1IRNNsM4cTzdj6NJuvsN14xirnVfvWFQJyUzOMdOXCp5CQJ/6M+qaxpa99q
 60P6Kl5FtJhbkzm+RPhTauljjtwJmb1xIOPgo4wtKMamCV0YXD6xOa+4GsNU8F/V8U
 wA8Kh6cNip1qvHn6jz2+/D9EkegArrk+wN4lO6EQCGjfnvwv6jnrSi1SPNeFTATXQf
 qnUFFtFaGcZZveN0gzxBowcpsWiwvMRYUpFCAxfT4DtKqOwK50K46MH3fofKgrz+dS
 wkJvjSr0DrTT1cHd0Oq7HYxHLmRBG2XS6+HNQ4Zmj0d0FvDvFfNhsqOFd6zSLDt9QP
 yhgG0AFKXi+XA==
Received: by pdx-korg-bugzilla-2.web.codeaurora.org (Postfix, from userid 48)
 id AC86F61263; Mon, 26 Apr 2021 09:40:54 +0000 (UTC)
From: bugzilla-daemon@bugzilla.kernel.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 212469] plymouth animation freezes during shutdown
Date: Mon, 26 Apr 2021 09:40:54 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Video(DRI - non Intel)
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: low
X-Bugzilla-Who: mail2021ac62@detlef-pogrzeba.de
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: cc
Message-ID: <bug-212469-2300-dWPjsyiuMu@https.bugzilla.kernel.org/>
In-Reply-To: <bug-212469-2300@https.bugzilla.kernel.org/>
References: <bug-212469-2300@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=212469

DieKleene (mail2021ac62@detlef-pogrzeba.de) changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
                 CC|                            |mail2021ac62@detlef-pogrzeb
                   |                            |a.de

--- Comment #4 from DieKleene (mail2021ac62@detlef-pogrzeba.de) ---
Similar problem
Shutdown / restart:

Computer hangs on shutdown or restart and shows the following symptoms:
Watchdog error message and then takes up to 15 minutes to shut down / restart
Or
Computer shuts down with black screens (both monitors are switched off). But
then alternately activates one of the two monitors (one remains switched off
and the other is switched on).

In addition:
Occasionally only one of the two monitors is activated when the system is
started. Or, both monitors are activated. But the attitudes regarding the
position are no longer correct. Or: Mirror mode has been activated.

My system:

Arch Linux
XFCE


AMD Ryzen 7 2700 Eight-Core Processor
AMD Radeon (TM) R9 380 Series (TONGA, DRM 3.40.0, 5.11.16-arch1-1, LLVM 11.1.0)
The X.Org Foundation 1.20.11

Current Display Name            : :0.0
Hersteller              : The X.Org Foundation
Version         : 1.20.11
Release Number          : 12011000
-Screens-
Screen 0                : 1920x2160 pixels
-Outputs (XRandR)-
DP-1            : Disconnected; Unused
HDMI-1          : Disconnected; Unused
DVI-D-1         : Connected; 1920x1080 pixels, offset (0, 0)
DVI-D-2         : Connected; 1920x1080 pixels, offset (0, 1080)

-- 
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
