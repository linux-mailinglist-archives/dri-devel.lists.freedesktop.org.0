Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 29E82613A6A
	for <lists+dri-devel@lfdr.de>; Mon, 31 Oct 2022 16:42:41 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 92F6310E281;
	Mon, 31 Oct 2022 15:42:31 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from ams.source.kernel.org (ams.source.kernel.org
 [IPv6:2604:1380:4601:e00::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1131F10E281
 for <dri-devel@lists.freedesktop.org>; Mon, 31 Oct 2022 15:42:27 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 6D372B818EC
 for <dri-devel@lists.freedesktop.org>; Mon, 31 Oct 2022 15:42:25 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 20CA1C433B5
 for <dri-devel@lists.freedesktop.org>; Mon, 31 Oct 2022 15:42:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1667230944;
 bh=SbvE5xYG6G4TGKft9JR0NP3cE6XZ9gypnkt2+5Yr0VU=;
 h=From:To:Subject:Date:In-Reply-To:References:From;
 b=M/QnFcwWQKe5Wwx98/7HxECL57nNC6tF6KVg7DSz0hFsQ7mvdPE3y+cyX8FUl2VwU
 zpwmRRCVbwMXrPdrgJEoihYthBysoWCTxYQkvujaoH+CUJV7tLnnDNaYrtj2hKMxW3
 wSjkWGPq5XkYQrQy0L3JigllhuhTSLH5kII/hbQnVk2YB86aJdjcTmH2gjgjMdR4C3
 1s6+Q1dAkhczUcpbArrbjOSTW7OI/zx/f6/2E67qtGRtP/snXnUWJJhWuf5xBhtKcR
 Bt6gjMIyyRx1yBHVkHF/toqrLMtS/3ce/5scFCbJGIRazAGFMTOHdYNp8hKG++3Lt9
 n3tTayPXZiXaA==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix,
 from userid 48) id 028E7C433E9; Mon, 31 Oct 2022 15:42:24 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 216645] Fence fallback timer expired on ring gfx
Date: Mon, 31 Oct 2022 15:42:23 +0000
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
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-216645-2300-g10IZsZR0f@https.bugzilla.kernel.org/>
In-Reply-To: <bug-216645-2300@https.bugzilla.kernel.org/>
References: <bug-216645-2300@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D216645

--- Comment #2 from Alex Deucher (alexdeucher@gmail.com) ---
Are you getting interrupts on the GPU?  Check /proc/interrupts to see if you
are getting interrupts for the GPU.

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
