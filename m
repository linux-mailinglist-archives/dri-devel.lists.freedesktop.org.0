Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0BCBA445498
	for <lists+dri-devel@lfdr.de>; Thu,  4 Nov 2021 15:13:12 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 40D876EE91;
	Thu,  4 Nov 2021 14:13:08 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 744B66EE91
 for <dri-devel@lists.freedesktop.org>; Thu,  4 Nov 2021 14:13:06 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPS id 40259611EF
 for <dri-devel@lists.freedesktop.org>; Thu,  4 Nov 2021 14:13:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1636035186;
 bh=Bo2yuY5TC6RYX4rTfzRcXSuma+7/hiLQbdZ6fuUL5WY=;
 h=From:To:Subject:Date:In-Reply-To:References:From;
 b=S8z/xygEWrmN+M6KbvLHNkpP6cPTt4fspUmAYYnmy/42CPd9V27xoKtSRuI9IQoRc
 CnIeVQarBKUKkrChxDQTdE9lKMQR+/tiCCw+Rnh5w6LSJHYi82lo3gJireTI4HMjZn
 HIybHaSNVlAZolUGZKYAuF+FUrvydqTFK8+NprkLUymy14AvMU3SLzxJQYmCka7Phg
 I1Y3FqmKuqNSvtFhjeDdujEXYK61ma5FLQBjUCZKsZUoAZgFzV4LSwQz5BGinl++nr
 Re9jqL2f8kqM93I6Jz9rjRaad+U1bR6r10G6hNWfLQZHMuGantr3Pt/HTGDaKbNTt8
 kNh9NgMtRMh0g==
Received: by pdx-korg-bugzilla-2.web.codeaurora.org (Postfix, from userid 48)
 id 3D18561106; Thu,  4 Nov 2021 14:13:06 +0000 (UTC)
From: bugzilla-daemon@bugzilla.kernel.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 214621] WARNING: CPU: 3 PID: 521 at
 drivers/gpu/drm/ttm/ttm_bo.c:409 ttm_bo_release+0xb64/0xe40 [ttm]
Date: Thu, 04 Nov 2021 14:13:05 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Video(DRI - non Intel)
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: Lang.Yu@amd.com
X-Bugzilla-Status: RESOLVED
X-Bugzilla-Resolution: DUPLICATE
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-214621-2300-36TNHlU4E4@https.bugzilla.kernel.org/>
In-Reply-To: <bug-214621-2300@https.bugzilla.kernel.org/>
References: <bug-214621-2300@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D214621

--- Comment #15 from Lang Yu (Lang.Yu@amd.com) ---
(In reply to Erhard F. from comment #14)
> (In reply to Lang Yu from comment #12)
> > The warning was just merged into mainline 5.15.0 on Tue Nov 2 16:47:49
> > 2021(commit 56d33754481f). Not sure Erhard F.'s build contains this
> warning.
> I applied your patch on top of v5.15 after its' release which was 2021-10=
-31
> not on git master.

Many thanks for your help! I made a test patch to find who pinned amdgpu
dmabuf.
Could you please apply it on latest(commit
7ddb58cb0ecae8e8b6181d736a87667cc9ab8389) mainline 5.15.0, then reproduce t=
he
warning and collect full dmesg? As I still didn't reproduce it on my machin=
e...

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
