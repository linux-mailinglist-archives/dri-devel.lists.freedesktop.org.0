Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E7C6C328837
	for <lists+dri-devel@lfdr.de>; Mon,  1 Mar 2021 18:39:12 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C5F556E046;
	Mon,  1 Mar 2021 17:39:10 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 22C256E046
 for <dri-devel@lists.freedesktop.org>; Mon,  1 Mar 2021 17:39:10 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPS id 0049464F34
 for <dri-devel@lists.freedesktop.org>; Mon,  1 Mar 2021 17:39:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1614620350;
 bh=RT0O3Yd1oAVcS65E5wknqvYQYOa3Ls0FHjPcsXDrzO4=;
 h=From:To:Subject:Date:In-Reply-To:References:From;
 b=hhYtbB091KyIe/EdTb2WL/VCif51hY9QOZMyCWV+tZDV+dB2t8rHvk/gTd3zq8EaF
 zwItrcpUtEDzGxZTbRewToUoL/jeIGjf2oignKYf13hMW8EzUX+1JsJF1kbJjZ11so
 mq3p8pUTypwXc6McYvHRHtsrTYpQ0QNWsatmPYyMnLxMUd/obgLiGH0Ui4iSm/dzI9
 2pGDZ4EwrohL2kEB8bGU1b/NIqzTM61BXOyERNHGfcGH8QreY98A6RsYVg9XI20UKq
 LS3Ui4/ONWe9owErMkKHfrWWmgLUhim9bgYvqrSnSogLp3RJpmtHf8mGX0yXXvKhZC
 OyfNDCOzKtfSw==
Received: by pdx-korg-bugzilla-2.web.codeaurora.org (Postfix, from userid 48)
 id EA83665356; Mon,  1 Mar 2021 17:39:09 +0000 (UTC)
From: bugzilla-daemon@bugzilla.kernel.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 208115] amdgpu (likely) - power management and display
 connection problems with an RX590 card
Date: Mon, 01 Mar 2021 17:39:09 +0000
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
Message-ID: <bug-208115-2300-3xfQuxGHl1@https.bugzilla.kernel.org/>
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

--- Comment #3 from Adarion from userland (h_mailinglists@posteo.de) ---
A little (and very late, sorry, but I have a v. stressful "real life") update
from my side. 
I recently found the time to plug the RX 590 back into the Zen+ setup. (was
running with the HD 5450 (radeonhd) meanwhile)
I am on kernel 5.10.x / 5.11. there, recent libdrm, mesa etc.; most recent BIOS
I could obtain for the MSI B350 PCMate.

I did plug the DP cable into a different port this time. I need to test
thoroughly, but now I am on something that seems normal! Screen wakeup seems
okay so far, it wakes up from power saving (BACO?), an regains the screen
control correctly, without resolution drop or distortion. Full operable.
S2Ram works incl. wakeup (tested once only yet, but that gave me hope).
And: wall power measurement looks as expected: 51... 55 watts for the whole
box. This is on par with the HD 5450 and as I would expect it to be on idle. 

I'll keep an eye on it, esp. once I start using it as my main box (so far it
was mostly used for chroot compiling Gentoo intallations and occasional video
encoding), but maybe things have settled?
It's sad that I don't know the real reason for the change (different DP port on
GPU side? kernel update (PM things should be in the kernel so I don't think
it's mesa related), mainboard BIOS update?).
If I find the time I'll test it on different mainboards and I'll try to find
out if the GPU-side video output port has an influence on behaviour. (But I
have very full weeks ahead.)

-- 
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
