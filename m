Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 880ED66D0B7
	for <lists+dri-devel@lfdr.de>; Mon, 16 Jan 2023 22:08:47 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BD09510E4D5;
	Mon, 16 Jan 2023 21:08:39 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 03B5C10E4D5
 for <dri-devel@lists.freedesktop.org>; Mon, 16 Jan 2023 21:08:37 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 6725C61147
 for <dri-devel@lists.freedesktop.org>; Mon, 16 Jan 2023 21:08:36 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id C4197C433F1
 for <dri-devel@lists.freedesktop.org>; Mon, 16 Jan 2023 21:08:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1673903315;
 bh=MXNdORUi3RAn3RwI77PA7Z9X1WqFElG7HdRkKD5liNM=;
 h=From:To:Subject:Date:In-Reply-To:References:From;
 b=L1z8h7I3llp2MVQwqemy56dpz3H7jXjAVYnkYxmMf4dQzwTbW1vEEf/PC9vQnSjCs
 gUax3a4fMT9rswUjeAFEBZ1XF3oN47wRdAJU0j9fhC6Bs9BjLzUJIFgOL5ctzGTxmh
 pclCjiE/qLSRIrWgS2mU9AvDo9q6i3ULZzs0jYf0nXILIpH1rKOq7v2PmY/SL7e1Zw
 HC8bdgN41uIYL4MJY1Vdc3VwVgKMx4bMPoaI/O8yTs08d4Of7VwBZ7EcnHFFllIAwC
 gWgH4nfe2FZmgHbbi0dWm3CSxLV+qSVjr+piSqFhs5zL/yQHDZ4zjYwgInnEbvRLyl
 9HFg/7GG06Rjw==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix,
 from userid 48) id B138EC05FD6; Mon, 16 Jan 2023 21:08:35 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 216917] hibernation regression since 6.0.18 (Ryzen-5650U incl.
 Radeon GPU)
Date: Mon, 16 Jan 2023 21:08:35 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Video(DRI - non Intel)
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: alexdeucher@gmail.com
X-Bugzilla-Status: NEEDINFO
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-216917-2300-owyMnilg1N@https.bugzilla.kernel.org/>
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

--- Comment #23 from Alex Deucher (alexdeucher@gmail.com) ---
I'll just revert it.  It is more important for kernels with the the drm_bud=
dy
changes.

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
