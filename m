Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 92D991606AE
	for <lists+dri-devel@lfdr.de>; Sun, 16 Feb 2020 22:12:19 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AD3E56E497;
	Sun, 16 Feb 2020 21:12:15 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 29D9B6E497
 for <dri-devel@lists.freedesktop.org>; Sun, 16 Feb 2020 21:12:15 +0000 (UTC)
From: bugzilla-daemon@bugzilla.kernel.org
Authentication-Results: mail.kernel.org;
 dkim=permerror (bad message/signature format)
To: dri-devel@lists.freedesktop.org
Subject: [Bug 200695] Blank screen on RX 580 with amdgpu.dc=1 enabled (no
 displays detected)
Date: Sun, 16 Feb 2020 21:12:14 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Video(DRI - non Intel)
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: babgozdtb@outlook.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: cc
Message-ID: <bug-200695-2300-qXyY94L6jk@https.bugzilla.kernel.org/>
In-Reply-To: <bug-200695-2300@https.bugzilla.kernel.org/>
References: <bug-200695-2300@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=200695

babgozd (babgozdtb@outlook.com) changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
                 CC|                            |babgozdtb@outlook.com

--- Comment #38 from babgozd (babgozdtb@outlook.com) ---
(In reply to Adam from comment #37)
> As several comments mention different behavior between the different
> connector types I found a spare DVI cable and tried connecting to the same
> monitor via that input and it worked! So once logged in I plugged in the
> HDMI cable and switched input and it worked just fine (monitor was glitchy
> at first but once I disabled DVI output in monitor configuration it worked
> perfectly). To confirm this was indeed working with the DC code path I
> tested audio over HDMI and it worked just fine (and does not work with DC
> disabled, as expected). So I rebooted with both the DVI and HDMI in and the
> output over HDMI worked all through boot. I then disconnected the DVI and
> rebooted and the HDMI continues to work so far. Unfortunately I don't have a
> displayport monitor around to test if that behaves as weirdly. Just to be
> clear, I had tried to make this monitor work for a couple weeks over HDMI
> and the only thing that worked was amdgpu.dc=0 until I plugged in the DVI
> connector so this was not a one off fail.
> 
> I forgot to mention before that when the HDMI output was not working with DC
> my Xorg logs also showed no monitor detected.
> 
> I can attach the two different Xorg logs if that helps?
I am following this thread since it has created. My R9 380 with DVI-I output is
connected to my VGA monitor with DVI-I male to VGA female adapter and I am
getting black/blank screen while booting with amdgpu.dc=1 which is default
since kernel 4.17. It is fine with amdgpu.dc=0. I can provide logs too if any
kernel contributor wants to investigate the problem any further.

-- 
You are receiving this mail because:
You are watching the assignee of the bug.
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
