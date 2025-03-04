Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 93E6BA4CFCC
	for <lists+dri-devel@lfdr.de>; Tue,  4 Mar 2025 01:16:59 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0AD3810E4E1;
	Tue,  4 Mar 2025 00:16:57 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="UG94CFF3";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from nyc.source.kernel.org (nyc.source.kernel.org [147.75.193.91])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6E8E010E4E1
 for <dri-devel@lists.freedesktop.org>; Tue,  4 Mar 2025 00:16:55 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by nyc.source.kernel.org (Postfix) with ESMTP id 66F36A45187
 for <dri-devel@lists.freedesktop.org>; Tue,  4 Mar 2025 00:11:23 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 02412C4CEEB
 for <dri-devel@lists.freedesktop.org>; Tue,  4 Mar 2025 00:16:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1741047414;
 bh=Kq4ommsGV+OJpfVohTm70zG7F+d5F4ysRUrqMnZ4hxE=;
 h=From:To:Subject:Date:In-Reply-To:References:From;
 b=UG94CFF3j8uKzS2Bitne3hdy2yw75cM/MP1xSA6qgihXKce3tNr4a5cksoLqRWv9D
 RyhmSBTEnaFJ6tL9N2nvx8amlX3rdp4QNJ06bhmajQNDN2WC0TgaOmVROxDoq7gj77
 X+yHbMF2/snvDLCZS04shfHpRjcdTVr+aOtLecxhO8YrSuZ3a94f6NHSvt/0MHfjn+
 H1Umc++LLa38fnF4jYlDs/sZJqx4/wbgI0IPesGPQJFohO5JOVvp2xeWIaapbiZvUE
 3qG7r5EWOefnbkkfAnZrGkzHpgO+0qt4zTm7eygKTkHdHfFGlGpDKfzATsyGnTNr6l
 /ZEowNJ2WQUYA==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix,
 from userid 48) id E2539C53BC5; Tue,  4 Mar 2025 00:16:53 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 219835] amdgpu: kernel oops
 dc_dmub_srv_apply_idle_power_optimizations
Date: Tue, 04 Mar 2025 00:16:53 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Video(DRI - non Intel)
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: aros@gmx.com
X-Bugzilla-Status: RESOLVED
X-Bugzilla-Resolution: ANSWERED
X-Bugzilla-Priority: P3
X-Bugzilla-Assigned-To: drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: bug_status resolution
Message-ID: <bug-219835-2300-t1m07iZpfB@https.bugzilla.kernel.org/>
In-Reply-To: <bug-219835-2300@https.bugzilla.kernel.org/>
References: <bug-219835-2300@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D219835

Artem S. Tashkinov (aros@gmx.com) changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
             Status|NEW                         |RESOLVED
         Resolution|---                         |ANSWERED

--- Comment #1 from Artem S. Tashkinov (aros@gmx.com) ---
Please repost here:

https://gitlab.freedesktop.org/drm/amd/-/issues

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
