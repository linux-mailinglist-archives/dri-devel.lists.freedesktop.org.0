Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 650AF70A680
	for <lists+dri-devel@lfdr.de>; Sat, 20 May 2023 10:53:16 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AAB7210E13B;
	Sat, 20 May 2023 08:53:09 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 88EFF10E13B
 for <dri-devel@lists.freedesktop.org>; Sat, 20 May 2023 08:53:08 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id B67456100B
 for <dri-devel@lists.freedesktop.org>; Sat, 20 May 2023 08:53:04 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 172DCC4339C
 for <dri-devel@lists.freedesktop.org>; Sat, 20 May 2023 08:53:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1684572784;
 bh=ciRWuwDNqwSVpQxZ+PbpReJfh1YHQiSdABCcEvQgXaQ=;
 h=From:To:Subject:Date:In-Reply-To:References:From;
 b=iypHRizPAnnxnCvKM6m3RdtEs53ghYU/dSlO4qzG5uvoaDKBslzbw8jUWnUdftVOL
 EXSfkQDVwfl+HuVPt2/z3iseJBwlJXlYeMx7ZMN3kFvISPooZ+PkhiDfkJaUjp+pZq
 dTEKGuxud5cGNAwAq8ViIqJPLZQ1O8pzfNC0dim0IGwKeWgmHtvA0tv1xLx1ZdD6f7
 169hAPTfy+CujjMgBbHh/pwVWKihOFNJIkDz2+RnditFGIYWe3X/lk1plB0uD6qe7U
 0EkLkw0Cb8mFmY6mwTlyxbxE0oO9udpkuoEi2nNkvF9pgtaTjIDr/WlFn2+zR66N8W
 92EDOEX4rejzA==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix,
 from userid 48) id F3948C43144; Sat, 20 May 2023 08:53:03 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 217464] Radeon Driver Crash
Date: Sat, 20 May 2023 08:53:03 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Video(DRI - non Intel)
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: high
X-Bugzilla-Who: aros@gmx.com
X-Bugzilla-Status: RESOLVED
X-Bugzilla-Resolution: ANSWERED
X-Bugzilla-Priority: P3
X-Bugzilla-Assigned-To: drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: bug_status resolution
Message-ID: <bug-217464-2300-4Zrc85x3te@https.bugzilla.kernel.org/>
In-Reply-To: <bug-217464-2300@https.bugzilla.kernel.org/>
References: <bug-217464-2300@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D217464

Artem S. Tashkinov (aros@gmx.com) changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
             Status|NEW                         |RESOLVED
         Resolution|---                         |ANSWERED

--- Comment #1 from Artem S. Tashkinov (aros@gmx.com) ---
Please report here instead:

https://gitlab.freedesktop.org/drm/amd/-/issues

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
