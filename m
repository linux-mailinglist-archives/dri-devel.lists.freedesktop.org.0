Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BAD6331FFCF
	for <lists+dri-devel@lfdr.de>; Fri, 19 Feb 2021 21:28:31 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1B4F66EC08;
	Fri, 19 Feb 2021 20:28:29 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D2EE46EC08
 for <dri-devel@lists.freedesktop.org>; Fri, 19 Feb 2021 20:28:27 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPS id 7352664E3E
 for <dri-devel@lists.freedesktop.org>; Fri, 19 Feb 2021 20:28:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1613766507;
 bh=sojTStYwKjdz7IF3NN6/ZoFoOocRuS+yHZZN+7/xJIw=;
 h=From:To:Subject:Date:In-Reply-To:References:From;
 b=u/IAv/IaxWrmuQ/+3Ak2398mOue13y7URCVyETwTZ250hxkAQ3Hw8aw49511L+nkg
 eLvfp5WrxgYKmWaYJ+QZcqzHUb8+lAxYrUXN9DX4HVNmAO6lQp2vvqM90iDOApnSIp
 0ccx1sey3SdV+0t7lkq6149NLUqNbMrXn0GL7RHdHaeyJ7sxH82X60/++Ryo+ihR7V
 DOqKtaLeCcScsX7/mCR7hxRBM9me7LXXw/xPGqGPZMGXyaLaThqwUBHaiwiCbZfor0
 2DCGXuwF0/b5ujLnI7GzHk1kSPTLkijLLKyhJSumPSluOQ4LpkhwL9wUCpVFe0ZDla
 uM9Ya1qTR1eyw==
Received: by pdx-korg-bugzilla-2.web.codeaurora.org (Postfix, from userid 48)
 id 687EF65339; Fri, 19 Feb 2021 20:28:27 +0000 (UTC)
From: bugzilla-daemon@bugzilla.kernel.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 211501] Kernel freeze when waking monitor from blanking / DPMS
 (AMDGPU / DC)
Date: Fri, 19 Feb 2021 20:28:27 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Video(DRI - non Intel)
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: borisovjasen@protonmail.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-211501-2300-rx4Zq6nPas@https.bugzilla.kernel.org/>
In-Reply-To: <bug-211501-2300@https.bugzilla.kernel.org/>
References: <bug-211501-2300@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=211501

--- Comment #4 from Jasen Borisov (borisovjasen@protonmail.com) ---
I suspect you might be experiencing a different bug from mine, because in my
case the kernel recovers after some time and everything is back in a usable
state.

There could be many different causes of the kernel freezing up, and I suspect
the different symptoms probably mean that these are different bugs.

Without a response/assistance from a kernel/driver developer, IDK what to do to
investigate these bugs further.

-- 
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
