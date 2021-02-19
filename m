Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 136BA31F6B8
	for <lists+dri-devel@lfdr.de>; Fri, 19 Feb 2021 10:47:37 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 659FB6E8AE;
	Fri, 19 Feb 2021 09:47:33 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DC9016E8AE
 for <dri-devel@lists.freedesktop.org>; Fri, 19 Feb 2021 09:47:31 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPS id 8A1DA64ED9
 for <dri-devel@lists.freedesktop.org>; Fri, 19 Feb 2021 09:47:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1613728051;
 bh=TouejTwURb2Av/NzVOvLjjZ9g38RSxG+PlQiAcvsC4E=;
 h=From:To:Subject:Date:In-Reply-To:References:From;
 b=QKVUnJfpT4qzUbk/eCxMiY5YF0lB8mn6jDH/FU54CAaTND6wpZKU1NJj4qH+sIlit
 5k8Z5FzA3puHz/VmELqXrcEgUvtvfBEFRrcIOoncKd4EdNsdqaVSausTnvwMwBLq7m
 12u7ZT8CC8xHpICyCOlJGboK/iq/aix7ntEFkM1EK2YfKaOa274Bfjp3Z5v1iCfN8z
 0nbz8bmfzsmwdBynlG5V0+eML/DX2/IDm5hGZDZS0N9gjhrCOHOVgdhNzpWlLKbx45
 8TSlmA0sSj1nTvLQU4BpwSVY8TgkY2KbGJPbVgQFpcpL3WSOC0071ShoXEeaJ8sz2q
 1Jmjx0teHusZg==
Received: by pdx-korg-bugzilla-2.web.codeaurora.org (Postfix, from userid 48)
 id 86CE565332; Fri, 19 Feb 2021 09:47:31 +0000 (UTC)
From: bugzilla-daemon@bugzilla.kernel.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 201497] [amdgpu]: '*ERROR* No EDID read' is back in 4.19
Date: Fri, 19 Feb 2021 09:47:30 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Video(DRI - non Intel)
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: chriskoch@goldmail.de
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-201497-2300-309EpmA1BA@https.bugzilla.kernel.org/>
In-Reply-To: <bug-201497-2300@https.bugzilla.kernel.org/>
References: <bug-201497-2300@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=201497

--- Comment #23 from chriskoch@goldmail.de ---
Update:
We are now at Kernel 5.11 and this problem is still not fixed. I am stuck at
5.8 + manually entering the EDID on startup.
When 5.8 gets too outdated for me, I will buy a new monitor. I guess we cannot
expect any fix after almost 3 years.

-- 
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
