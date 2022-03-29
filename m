Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6A7E94EB517
	for <lists+dri-devel@lfdr.de>; Tue, 29 Mar 2022 23:15:27 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 679E110E555;
	Tue, 29 Mar 2022 21:15:23 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from ams.source.kernel.org (ams.source.kernel.org
 [IPv6:2604:1380:4601:e00::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2247E10E555
 for <dri-devel@lists.freedesktop.org>; Tue, 29 Mar 2022 21:15:22 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 3FF37B819F8
 for <dri-devel@lists.freedesktop.org>; Tue, 29 Mar 2022 21:15:20 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id E5493C34100
 for <dri-devel@lists.freedesktop.org>; Tue, 29 Mar 2022 21:15:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1648588518;
 bh=VdY2jKS074S5j1VHtixLO+6af1Qs+8/LEIl2SnvZZlM=;
 h=From:To:Subject:Date:In-Reply-To:References:From;
 b=Qd4B8r6UJ+JGrMrg7mnQEF/c8Iwqf5DcpcqhqgMPGS4TAz1votWv2ICzzlc0R9mBO
 1GXFmmNdrHOBteJmFKancOqWdGfd0yjY26+WU0j1OyfwsL/QSdz6c6xE6y+vGebra5
 i7lqowNNrkLTT1PFxQfh/H5PnvHr4MLv/XrF7i+Ecxrqe7hg37CuF5j9WcklKkmq5R
 FbmTmv8Cw3FtlM3IjG25APQvF6ztnlgSfH3XdCOYmdSa7xXPZ8ZyEf4yvjc4RUUPt2
 05zvWerm6DKMnURG4Moue+A8EHV2+m3aaNw+jCDsmjKAYb7UH/gQBPfY7/5kaVCFGa
 /Rw5iOzaoromw==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix,
 from userid 48) id C650EC05FD4; Tue, 29 Mar 2022 21:15:18 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 213983] WARNING: CPU: 3 PID: 520 at
 drivers/gpu/drm/ttm/ttm_bo.c:409 ttm_bo_release+0x7a/0x803 [ttm]
Date: Tue, 29 Mar 2022 21:15:18 +0000
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
Message-ID: <bug-213983-2300-F5eMPXA0hp@https.bugzilla.kernel.org/>
In-Reply-To: <bug-213983-2300@https.bugzilla.kernel.org/>
References: <bug-213983-2300@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D213983

--- Comment #6 from Erhard F. (erhard_f@mailbox.org) ---
While this being true this one is the older bug (2021-08-06) and the duplic=
ate
is the later one (2021-10-04) in timeline.

Also the bugs being linked you can have a look at the other bugs data easil=
y.
So I don't see a problem here.

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
