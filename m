Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id EBC413482FD
	for <lists+dri-devel@lfdr.de>; Wed, 24 Mar 2021 21:38:33 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8964B6E9FE;
	Wed, 24 Mar 2021 20:38:30 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E41BB6E9FE
 for <dri-devel@lists.freedesktop.org>; Wed, 24 Mar 2021 20:38:28 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPS id BB01C61A10
 for <dri-devel@lists.freedesktop.org>; Wed, 24 Mar 2021 20:38:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1616618308;
 bh=D6RZsazNI+O3Kli+aPPNORHPu7/L0kq2m4lGzAzL3Cw=;
 h=From:To:Subject:Date:In-Reply-To:References:From;
 b=mEzpHpVfTGMH6Gn3r2yfF559BNhJke1EukDu7ZDRWBX28cDMkW95W6EcrHwPiQhYS
 PHzKTSLpuiELzmaqNiIGfLIgloGNpcidQmCKI/UwuH8mX06PVxcbaly4y4dpXPrZ7L
 tzfCM64JZS5sr9GQ1uRyvTIilp790Dm+jPvn/9C6uAd1SIg6r2OzWRL4t2FojA9lqm
 QaksmJjMlqrOXA3Cv2cs3qY6lqUlPpgNbFcA4KWdNyzyD5db5AMmWF78t93sIMPGJZ
 uSyhfT/AO0vQPsKmm9rX28WvGQgK84SttSZ1n5uN81P7oQRyXL7ZRG2rz4a+eikgaG
 VB3u9frcFMJ0g==
Received: by pdx-korg-bugzilla-2.web.codeaurora.org (Postfix, from userid 48)
 id AD3B762AC2; Wed, 24 Mar 2021 20:38:28 +0000 (UTC)
From: bugzilla-daemon@bugzilla.kernel.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 212397] Resume from suspend (S3) does not bring back video
 anymore
Date: Wed, 24 Mar 2021 20:38:28 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Video(DRI - non Intel)
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: alexdeucher@gmail.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: cc
Message-ID: <bug-212397-2300-5VGn4byLQG@https.bugzilla.kernel.org/>
In-Reply-To: <bug-212397-2300@https.bugzilla.kernel.org/>
References: <bug-212397-2300@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=212397

Alex Deucher (alexdeucher@gmail.com) changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
                 CC|                            |alexdeucher@gmail.com

--- Comment #1 from Alex Deucher (alexdeucher@gmail.com) ---
Can you bisect
(https://www.kernel.org/doc/html/latest/admin-guide/bug-bisect.html)?  The
radeon driver has not been changed much in the last few years so the problem
may be outside of the driver.

-- 
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
