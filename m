Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A0131307EB2
	for <lists+dri-devel@lfdr.de>; Thu, 28 Jan 2021 20:25:18 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AE6416E9DD;
	Thu, 28 Jan 2021 19:25:16 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 427206E9E2
 for <dri-devel@lists.freedesktop.org>; Thu, 28 Jan 2021 19:25:15 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPS id F292D64E4B
 for <dri-devel@lists.freedesktop.org>; Thu, 28 Jan 2021 19:25:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1611861915;
 bh=VSQLAU18pDhHB/8lR0Nlglz7DBu5IxF5ygmS5XPJwvo=;
 h=From:To:Subject:Date:In-Reply-To:References:From;
 b=fkAQV6GCJC/84NQatpZZp16blucCX/bm+tcPcEZUapfkXXK2350cqdNH7Cvnp/x2k
 e5JBZ7EraWdCC8OuTWPm+TX8YDqA6UnMaJZ45B5nPEi27KfZROrU1HWLfIjjKU6nmv
 g0RTYGOoo5l99fON/pJ8mS5q4p22grSOTHdENI/L50v1zUXLJ8Lwu4nwpvgGS8WHFa
 8j+8u+wo9pux02MBVXSm4UqVG9TyrtndeN9+Al8nYEK8hzNRNVT53Zg5fAEYLi6kQ/
 JdP4fB7ge5FBigahlVyo+G2J3vpE5Yvp3H8Zb8CtHFnYi2KUTX8YR0zkRqGFZP+D23
 DIpQVAmJlETbw==
Received: by pdx-korg-bugzilla-2.web.codeaurora.org (Postfix, from userid 48)
 id DBE11652FE; Thu, 28 Jan 2021 19:25:14 +0000 (UTC)
From: bugzilla-daemon@bugzilla.kernel.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 210123] drm:drm_atomic_helper_wait_for_dependencies
 [drm_kms_helper]] - flip_done time out with vmwgfx
Date: Thu, 28 Jan 2021 19:25:14 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Video(DRI - non Intel)
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: stefan+kernel@mayr-stefan.de
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-210123-2300-8Zaanb3pi3@https.bugzilla.kernel.org/>
In-Reply-To: <bug-210123-2300@https.bugzilla.kernel.org/>
References: <bug-210123-2300@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=210123

--- Comment #7 from Stefan Mayr (stefan+kernel@mayr-stefan.de) ---
Same issue with Kernel 5.10.9

-- 
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
