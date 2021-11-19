Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 7F454456EC8
	for <lists+dri-devel@lfdr.de>; Fri, 19 Nov 2021 13:25:37 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8DBBB6EE70;
	Fri, 19 Nov 2021 12:25:32 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 892D16EE73
 for <dri-devel@lists.freedesktop.org>; Fri, 19 Nov 2021 12:25:31 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPS id 5EE3661AD0
 for <dri-devel@lists.freedesktop.org>; Fri, 19 Nov 2021 12:25:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1637324731;
 bh=45hGoWxv2t6liWgGgVO+ppm6H8JX+Imp/9r7aczqf5Y=;
 h=From:To:Subject:Date:In-Reply-To:References:From;
 b=tndRmjKWDfMO/PW9Fn9VdUCOwdECLyPQ91iyklN6M276ZqLV7Ne60sd2yvm7lY1Lp
 15J0edy+g8iWkodL+RL0iWo8Em3FityGbCR1XzHAiTOOfBuDO57sKTCOKXH2K4SKOF
 oyMLRQUt2gb5QPJ7yhENtwUmJxbcK7L5dKefL71+f+VM9Z4snXuGW56pIP5zRUQlPM
 qD+6E6v+yCFLPxmVamcyN3JIy5tunKIvB6F7ZTcibG2BdBf4DuTU3C9cScNim8NX3c
 SDfBlkGjiTNDLCkmhRpzrF8KBKihygfYhwg3Tv+L5bYuW2Q9a0yCljI7e1KVfCrt+Z
 Nan3MDIpML9Fg==
Received: by pdx-korg-bugzilla-2.web.codeaurora.org (Postfix, from userid 48)
 id 5BFF661004; Fri, 19 Nov 2021 12:25:31 +0000 (UTC)
From: bugzilla-daemon@bugzilla.kernel.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 211807] [drm:drm_dp_mst_dpcd_read] *ERROR* mstb
 000000004e6288dd port 3: DPCD read on addr 0x60 for 1 bytes NAKed
Date: Fri, 19 Nov 2021 12:25:30 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Video(DRI - non Intel)
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: low
X-Bugzilla-Who: daandelombaert@gmail.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: cc
Message-ID: <bug-211807-2300-JMTF70Cc1f@https.bugzilla.kernel.org/>
In-Reply-To: <bug-211807-2300@https.bugzilla.kernel.org/>
References: <bug-211807-2300@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D211807

Daan (daandelombaert@gmail.com) changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
                 CC|                            |daandelombaert@gmail.com

--- Comment #14 from Daan (daandelombaert@gmail.com) ---
I also had this in my logs yesterday, right before my system locked complet=
ely
(had to do a hard reset).

I also have a Lenovo Thinkpad Thunderbolt Dock, which connects my Thinkpad =
T480
with two external monitors (one Hdmi, one Displayport). I didn't have this
lockup before, in the past both monitors were hdmi so maybe Displayport is =
the
culprit here?

Exact message:  i915 0000:00:02.0: [drm] *ERROR* mstb 00000000afedfd20 port=
 3:
DPCD read on addr 0x4b0 for 1 bytes NAKed

Setup:=20
Thinkpad T480, i7, UHD Graphics 620 + Nvidia Mx150
Fedora (5.14.16-201.fc34.x86_64)

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
