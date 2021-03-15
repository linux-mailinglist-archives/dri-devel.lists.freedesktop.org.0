Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id CFC8D33C4FF
	for <lists+dri-devel@lfdr.de>; Mon, 15 Mar 2021 18:58:34 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 124596E053;
	Mon, 15 Mar 2021 17:58:33 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8DBCE6E053
 for <dri-devel@lists.freedesktop.org>; Mon, 15 Mar 2021 17:58:31 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPS id B4FCC64F10
 for <dri-devel@lists.freedesktop.org>; Mon, 15 Mar 2021 17:58:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1615831109;
 bh=YENDyCfCWnADXETWttZBuBLqejNtM8LD1CaZFFyYHVA=;
 h=From:To:Subject:Date:In-Reply-To:References:From;
 b=qYrCcYviO/7V7tpnH7/r324o6uYgrp6/HVEaEPMF1I38XisCe7xtx+eZD0yYjym7N
 xGAdg0hiPuddda1lMd0cQlIKDn8W2d8Z6x9zDkn9CalwYsgOIubM8InLzi+eGT9i0m
 LFRTkR5z9skSai5RL6va7NRAb7NrANTWkgwD+t7lp4wBItf+eGEdIKPuMXVACKQBDP
 UbM8gN0WNR8ocvpPC3IsXcblnJcMBPfo86szQUpvYVp94RoDWhI1yQsb6hedK+VR9d
 8vI194oC3KAr4O5exK30Nk3otyYNXDLH2bAA6WHe453L8W/lrNCSCqQLRmNsz/vaK0
 aAH6q1dPHYvRA==
Received: by pdx-korg-bugzilla-2.web.codeaurora.org (Postfix, from userid 48)
 id A4F4465360; Mon, 15 Mar 2021 17:58:29 +0000 (UTC)
From: bugzilla-daemon@bugzilla.kernel.org
To: dri-devel@lists.freedesktop.org
Subject: =?UTF-8?B?W0J1ZyAyMTIyNzldIEFNREdQVSBkb2VzbuKAmXQgZXhwb3NlIGFu?=
 =?UTF-8?B?eSB3YXkgb2Ygc2V0dGluZyB0aGUgZnVsbCBSR0IgcmFuZ2UgW3J5emVuKyBt?=
 =?UTF-8?B?b2JpbGVd?=
Date: Mon, 15 Mar 2021 17:58:29 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Video(DRI - non Intel)
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: enhancement
X-Bugzilla-Who: alexdeucher@gmail.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: cc
Message-ID: <bug-212279-2300-WVdkhds2cK@https.bugzilla.kernel.org/>
In-Reply-To: <bug-212279-2300@https.bugzilla.kernel.org/>
References: <bug-212279-2300@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=212279

Alex Deucher (alexdeucher@gmail.com) changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
                 CC|                            |alexdeucher@gmail.com

--- Comment #1 from Alex Deucher (alexdeucher@gmail.com) ---
IIRC, the driver sets full or limited range automatically based on the EDID.

-- 
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
