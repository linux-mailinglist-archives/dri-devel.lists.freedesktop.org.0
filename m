Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7BA8332721F
	for <lists+dri-devel@lfdr.de>; Sun, 28 Feb 2021 12:47:49 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 247BE6E201;
	Sun, 28 Feb 2021 11:47:46 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 44DA86E201
 for <dri-devel@lists.freedesktop.org>; Sun, 28 Feb 2021 11:47:45 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPS id 1C25C64E55
 for <dri-devel@lists.freedesktop.org>; Sun, 28 Feb 2021 11:47:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1614512865;
 bh=6mReT70tAe/URMPjIV2PWOmoODM1lchU4+VS6igeLws=;
 h=From:To:Subject:Date:In-Reply-To:References:From;
 b=i9R4gQGOrefHBtT5MVSLWWsyN/lpMQ4EKQijwO0GtW/H9iVFTkFtO9C+qkYAbLy+3
 c7CPaHOMUR4ZvxzD5ErlTpKXnHrcnpR1B8W7rR65F+Gat9pZEzpXKqmmXPKmGWzyt4
 WjiyUl/IKBKNVB3qJcRWhjPDKuIAdovI4QZjY0Ic06F8sn7NZq76WDitj7/GoHQlRH
 YyiL4RclmyD72d4jLS58G1PWxFE5mzVrz1DEbTE9quhCt/rH0eZtqZ9XH73hh91hxc
 xCjUivaBkouyULb4tHHEhoTfUdFuz5wdagglkBGFll1KR5tsJb4GJMseoadma1R96H
 fOqRDGhGRIp0g==
Received: by pdx-korg-bugzilla-2.web.codeaurora.org (Postfix, from userid 48)
 id 0DD1465360; Sun, 28 Feb 2021 11:47:45 +0000 (UTC)
From: bugzilla-daemon@bugzilla.kernel.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 211997] sys-kernel/gentoo-sources-5.11.2 crash upon disconnect
 HDMI monitor AMDGPU
Date: Sun, 28 Feb 2021 11:47:44 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Video(DRI - non Intel)
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: stefan@konink.de
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-211997-2300-nnB4ul9H9M@https.bugzilla.kernel.org/>
In-Reply-To: <bug-211997-2300@https.bugzilla.kernel.org/>
References: <bug-211997-2300@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=211997

--- Comment #1 from Stefan de Konink (stefan@konink.de) ---
5.10.5-gentoo still works for me. Have not checked the other releases.

-- 
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
