Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BCD9766D713
	for <lists+dri-devel@lfdr.de>; Tue, 17 Jan 2023 08:43:09 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A019C10E0D1;
	Tue, 17 Jan 2023 07:43:07 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from ams.source.kernel.org (ams.source.kernel.org
 [IPv6:2604:1380:4601:e00::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 08BF310E0D1
 for <dri-devel@lists.freedesktop.org>; Tue, 17 Jan 2023 07:43:06 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 589FAB81188
 for <dri-devel@lists.freedesktop.org>; Tue, 17 Jan 2023 07:43:04 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 0B6DCC43392
 for <dri-devel@lists.freedesktop.org>; Tue, 17 Jan 2023 07:43:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1673941383;
 bh=gV90l0k5ROjR7U7MZOyCLUjA08+l5emZcpVyu/Mnjow=;
 h=From:To:Subject:Date:In-Reply-To:References:From;
 b=g61TsbDhisyzXtj+H02/u9OqTle2CMBQ4gwstLoaNuBdSx5bzw37Y6gNRkc1jT+Ju
 3IG7CHmWb0Yl9z+YMz5ZcKdAarYWbWeDVLhmYkewzWoFmWdz4WnrtG/2zcfbSz9Kde
 42/1BNcn5ZQD3TwbZxkj23F1UOAHl7iFDO0TH6aCwfYSD/MldOLR5RndnKKamedeTm
 K12L/4/BHSCHQrTRtLtg3f6n9qJUO9qqIu4gIJ4kU1f5h0L5S83xsMYIr/YVfsavXq
 afkXkie6oYbCHQb6Q39SW6oq5t6BmfWf/RMabREEeWJXrtIBPXon47/AyY/YbpcxUh
 EA4fdWc+Kry5w==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix,
 from userid 48) id E3329C43143; Tue, 17 Jan 2023 07:43:02 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 216917] hibernation regression since 6.0.18 (Ryzen-5650U incl.
 Radeon GPU)
Date: Tue, 17 Jan 2023 07:43:02 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Video(DRI - non Intel)
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: jrf@mailbox.org
X-Bugzilla-Status: NEEDINFO
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-216917-2300-eDJMtNBeT2@https.bugzilla.kernel.org/>
In-Reply-To: <bug-216917-2300@https.bugzilla.kernel.org/>
References: <bug-216917-2300@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D216917

--- Comment #24 from Rainer Fiebig (jrf@mailbox.org) ---
(In reply to Alex Deucher from comment #23)
> I'll just revert it.  It is more important for kernels with the the
> drm_buddy changes.

Right thing to do for now, I guess. If I can find a way to identify the
commit(s) between 6.0.19 and 6.1 that fix the problem, I'll report it here.
Thanks.

Rainer

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
