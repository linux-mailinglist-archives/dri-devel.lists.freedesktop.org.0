Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 00F9F248EFB
	for <lists+dri-devel@lfdr.de>; Tue, 18 Aug 2020 21:46:16 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 06666897DC;
	Tue, 18 Aug 2020 19:46:12 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 462CA897DC
 for <dri-devel@lists.freedesktop.org>; Tue, 18 Aug 2020 19:46:10 +0000 (UTC)
From: bugzilla-daemon@bugzilla.kernel.org
Authentication-Results: mail.kernel.org;
 dkim=permerror (bad message/signature format)
To: dri-devel@lists.freedesktop.org
Subject: [Bug 208115] amdgpu (likely) - power management and display
 connection problems with an RX590 card
Date: Tue, 18 Aug 2020 19:46:09 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Video(DRI - non Intel)
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: h_mailinglists@posteo.de
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-208115-2300-SBIXAWRhLw@https.bugzilla.kernel.org/>
In-Reply-To: <bug-208115-2300@https.bugzilla.kernel.org/>
References: <bug-208115-2300@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=208115

--- Comment #1 from Adarion from userland (h_mailinglists@posteo.de) ---
Sadly I did not yet find the time for long time tests in my productive systems. 

a quick check:
RX 590 in my FX-6300 based box (Asus M5A78L-M PLUS/USB3)
I did one successful return from DPMS, but that was just one, and different
(newly purchased) monitor (Asus PA24A) hooked up via HDMI.
Kernel was 5.7.x.

idle KDE session: ~69 W (wall, "empty system" just mainboard, CPU, fans, RAM
and one SSD to boot from)
early DPMS off: 66 W
BACO(?): jumps between 62...77 W (there shouldn't have been much of a system
activity, I wonder what's caused the alterations)

"sensors" readings still high, show something around 30W idle.

(The RX 560 however, is down to 56 W in idle KDE, but also shows some variance
during DPMS off/BACO.)

Expected: The RX 590 should be roughly 9-12 W idle, like it's smaller brethren.

Currently running the Zen+ with some old HD 5450, the RX 590 is gathering dust.
(Can't risk crashing my productive system every 10 minutes.)

-- 
You are receiving this mail because:
You are watching the assignee of the bug.
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
