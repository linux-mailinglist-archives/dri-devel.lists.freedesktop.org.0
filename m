Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 28F3F30C0BA
	for <lists+dri-devel@lfdr.de>; Tue,  2 Feb 2021 15:06:54 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C3D808918E;
	Tue,  2 Feb 2021 14:06:51 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DC45C8918E
 for <dri-devel@lists.freedesktop.org>; Tue,  2 Feb 2021 14:06:50 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPS id BAB3D64F68
 for <dri-devel@lists.freedesktop.org>; Tue,  2 Feb 2021 14:06:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1612274810;
 bh=7qwuG9p966psCAwZOpvENMSGy16iKH40SQ4l+eNoLCE=;
 h=From:To:Subject:Date:In-Reply-To:References:From;
 b=L7hrHI+6H4q+k94mqMC/SKRDDJj2v9Z1RcONTKu31ronjZEdMCDvl/QOy1ClnmSxS
 IW4LZ5L6f/SEAYJt9vhuNsDjKEVG3xxrEaWV9OIX7nU0TXjyey3hvrBavX0N8MgLl9
 XS+bm+Uk1it3AxnD9WG/TTOO8DcYR2wIfBiHXr84wi4GX92UwK4Xmt20qRgDOgbp2f
 iCLU5QGsRGi5r6nCa+fFEXBhdAmGu4w5EbAYyK36JQZVVypt/0zlCQfYzl/J4MTUhS
 SdUvcp3AHWHA8jt91lqPmNBqX8dm+XiBQqxl2dBnyAO3VimOQEVzRGRm7zijyE8JIx
 gjLMHY1P9vK9A==
Received: by pdx-korg-bugzilla-2.web.codeaurora.org (Postfix, from userid 48)
 id B76B865304; Tue,  2 Feb 2021 14:06:50 +0000 (UTC)
From: bugzilla-daemon@bugzilla.kernel.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 203905] amdgpu:actual_brightness has unreal/wrong value
Date: Tue, 02 Feb 2021 14:06:50 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Video(DRI - non Intel)
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: antonyjr000@gmail.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: cc
Message-ID: <bug-203905-2300-sDCECEbX9x@https.bugzilla.kernel.org/>
In-Reply-To: <bug-203905-2300@https.bugzilla.kernel.org/>
References: <bug-203905-2300@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=203905

Antony J.R (antonyjr000@gmail.com) changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
                 CC|                            |antonyjr000@gmail.com

--- Comment #20 from Antony J.R (antonyjr000@gmail.com) ---
I can confirm that the bug is still not fixed even in 5.11-rc6 (the latest
kernel at the time of writing).

I can't control brightness also.

I have a AMD Ryzen 7 4800H APU which has Renoir Graphics.

The brightness control only works with Fedora Workstation 32 with Linux Kernel
5.6.6 but with 5.11-rc6 brightness control does not work at all.

-- 
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
