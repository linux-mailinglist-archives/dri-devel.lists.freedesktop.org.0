Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A0B845B5ED2
	for <lists+dri-devel@lfdr.de>; Mon, 12 Sep 2022 19:07:18 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 13DC910E045;
	Mon, 12 Sep 2022 17:07:14 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 181CD10E045
 for <dri-devel@lists.freedesktop.org>; Mon, 12 Sep 2022 17:07:11 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id B515FB80C68
 for <dri-devel@lists.freedesktop.org>; Mon, 12 Sep 2022 17:07:09 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 01027C4347C
 for <dri-devel@lists.freedesktop.org>; Mon, 12 Sep 2022 17:07:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1663002428;
 bh=qqZccIP0OTUHgi7f9qjRlPR76NpLc22ZC73MRtLHI9g=;
 h=From:To:Subject:Date:In-Reply-To:References:From;
 b=pni//g44h7T7XVGyIyPh0aqKHjr2SSDxV8ktYx9sIYdae1J6yLfQaYYFE4uyJSMnj
 S9UkpV+jaIBwEuVHK6xaTj5yJhdLkg3Q1U+DIUZ/5S3Tj/bIEn6IqO8DF8+IklZv7l
 GXS2NjfVrzUSV1h7xWJBjp5pIfoXQZXtyoutmHTpWQqYY4JXKJtKmMqq+ctmeEqumn
 nlGslLJqXNw5lAR3qSvKGHU2dvgVlUU40h23Y8K0lXOcuQZz+dqa4Y9QfiJzza5jHK
 dW6DWXIlRckx2VuTOijaG2ChRPm9hAADGv2paZe2E/73dqq/2eI0ZqQtzSfEq+m8QI
 cgPu52jdeaIag==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix,
 from userid 48) id DA0AAC05FD4; Mon, 12 Sep 2022 17:07:07 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 213145] AMDGPU resets, timesout and crashes after "*ERROR*
 Waiting for fences timed out!"
Date: Mon, 12 Sep 2022 17:07:07 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Video(DRI - non Intel)
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: high
X-Bugzilla-Who: nvaert1986@hotmail.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: cc
Message-ID: <bug-213145-2300-MyYoIzFsls@https.bugzilla.kernel.org/>
In-Reply-To: <bug-213145-2300@https.bugzilla.kernel.org/>
References: <bug-213145-2300@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D213145

nvaert1986 (nvaert1986@hotmail.com) changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
                 CC|                            |nvaert1986@hotmail.com

--- Comment #21 from nvaert1986 (nvaert1986@hotmail.com) ---
I'm experiencing the same issue on 5.19 with mesa. It rarely happens, but w=
hen
it happens my whole system needs a reboot. I've seen it happening with Fire=
fox
and Steam so far.

[drm:0xffffffffc04e61a6] *ERROR* Waiting for fences timed out!
[drm:0xffffffffc04e61a6] *ERROR* Waiting for fences timed out!
[drm:0xffffffffc0465370] *ERROR* Process information: process firefox pid 1=
918
thread firefox:cs0 pid 2069
amdgpu 0000:03:00.0: amdgpu: GPU reset begin!
amdgpu 0000:03:00.0: [drm:0xffffffffc0321d49] *ERROR* ring kiq_2.1.0 test
failed (-110)
[drm:0xffffffffc03b4bfc] *ERROR* KGQ disable failed
[drm:0xffffffffc03b4a60] *ERROR* failed to halt cp gfx
[drm] free PSP TMR buffer
DMAR: DRHD: handling fault status reg 3
 DMAR: [DMA Read NO_PASID] Request device [03:00.0] fault addr 0x77d0541a000
[fault reason 0x04] Access beyond MGAW
 DMAR: DRHD: handling fault status reg 3
 DMAR: [DMA Read NO_PASID] Request device [03:00.0] fault addr 0x77d0541e000
[fault reason 0x04] Access beyond MGAW
CPU: 0 PID: 1028 Comm: kworker/u48:22 Tainted: G           O      5.19.1
 Hardware name: Micro-Star International Co., Ltd. MS-7D31/MPG Z690 EDGE WI=
FI
DDR4 (MS-7D31), BIOS 1.40 05/18/2022
Workqueue: amdgpu-reset-dev 0xffffffffc0242a90
Call Trace:
  <TASK>
0xffffffffa28f2514
0xffffffffc065e673
0xffffffffc065ef99
0xffffffffc04653ca
0xffffffffc0242aeb
0xffffffffa1f30ae8amdgpu 0000:03:00.0: amdgpu: GPU mode1 reset

0xffffffffa1f31048
? 0xffffffffa1f31000
0xffffffffa1f372fa
? 0xffffffffa1f37220
0xffffffffa1e010ef
</TASK>
amdgpu 0000:03:00.0: amdgpu: MODE1 reset
amdgpu 0000:03:00.0: amdgpu: GPU smu mode1 reset
amdgpu 0000:03:00.0: amdgpu: GPU reset succeeded, trying to resume
 [drm] PCIE GART of 512M enabled (table at 0x0000008000300000).
 [drm] VRAM is lost due to GPU reset!
 [drm] PSP is resuming...


 Here it initializes my full GPU, but then throws:
 [drm] Skip scheduling IBs!
and the crash starts over again.

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
