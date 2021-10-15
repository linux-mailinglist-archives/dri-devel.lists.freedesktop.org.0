Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BA07142FE6A
	for <lists+dri-devel@lfdr.de>; Sat, 16 Oct 2021 00:53:55 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1C10C6EE04;
	Fri, 15 Oct 2021 22:53:52 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D967E6EE04
 for <dri-devel@lists.freedesktop.org>; Fri, 15 Oct 2021 22:53:50 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPS id 8F8CC6120C
 for <dri-devel@lists.freedesktop.org>; Fri, 15 Oct 2021 22:53:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1634338430;
 bh=mzyo8gb5UoDMPvVGD26anMekXxWvcx0zpvAz7M32y0k=;
 h=From:To:Subject:Date:In-Reply-To:References:From;
 b=QrMxU27P6nKpykakJIc3O7+dFh2CZCXL/+7ObWPWzTY7rQG4xh8stx7EHzmMrFojQ
 BbSf7QzmdrDkXQcmro0VWldo5uuRM5wekPOCbBOagzk5VoeSg7TbfNCc79C9XLtqYv
 bK3yJOHn57sT6KJ+mpM2p1JGZgQLnbP+EioQd1RLtGIXTs+g88u8BHP3F/6N9dEDRE
 BwN/OCDkhX6twTKxMM476Ur/3GM+DWcb4gcJ1mZbMiVJx6B4w1ydH5K9VydS1VEn32
 ozDTVG+F1d1dvXaD/8/hLspNA3g+oOu0Itb0kdspy2hua+YZYvtefkjawQJVij6mTT
 jOElWwCg7JPDQ==
Received: by pdx-korg-bugzilla-2.web.codeaurora.org (Postfix, from userid 48)
 id 8C6BD60E4A; Fri, 15 Oct 2021 22:53:50 +0000 (UTC)
From: bugzilla-daemon@bugzilla.kernel.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 214029] [bisected] [amdgpu] Several memory leaks in amdgpu and
 ttm
Date: Fri, 15 Oct 2021 22:53:50 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Video(DRI - non Intel)
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: erhard_f@mailbox.org
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-214029-2300-KGKerI4ijg@https.bugzilla.kernel.org/>
In-Reply-To: <bug-214029-2300@https.bugzilla.kernel.org/>
References: <bug-214029-2300@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D214029

--- Comment #17 from Erhard F. (erhard_f@mailbox.org) ---
v5.15-rc5 is still affected.

However I reverted d02117f8efaa5fbc37437df1ae955a147a2a424a on top of v5.15=
-rc5
and can confirm this fixes the leak.

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
