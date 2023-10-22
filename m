Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1C3F27D21A5
	for <lists+dri-devel@lfdr.de>; Sun, 22 Oct 2023 09:41:32 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4340F10E051;
	Sun, 22 Oct 2023 07:41:24 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A653810E051
 for <dri-devel@lists.freedesktop.org>; Sun, 22 Oct 2023 07:41:21 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by ams.source.kernel.org (Postfix) with ESMTP id CF933B80CA1
 for <dri-devel@lists.freedesktop.org>; Sun, 22 Oct 2023 07:41:19 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 6957BC433CB
 for <dri-devel@lists.freedesktop.org>; Sun, 22 Oct 2023 07:41:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1697960478;
 bh=FgSQhT4y1eh9nvwgjgBFcHBHaWKd3XCiWmf9JrZVrVY=;
 h=From:To:Subject:Date:In-Reply-To:References:From;
 b=Fb9zEMd1EwNTxVyy9nE+fEEzzDXfI6mnE122Wc6FEYO5MIJzCIdBkFLNKVh42qp4l
 DBqyhKoFqBvSYeiNhkMUVGvUP3Yib2dRdB/wjHUGb0jf5gBN/Lnx26s+n68ReUL5VJ
 gqPPoTjaFENqWzxMbCNAH8fvalHidi/lvw5JuvfmF7EEdqmcTnh9b/uICm70/NXuuH
 qUxJ3ilPFKJL4w31Hyht9lt6zza2im7/6DL73dbcqwwqYOxypTWuPhN0H+fAAJQVSq
 6psF9PWk0S7cNe0laUh0sZ1tZozTJrROtWYMQ4mr5bCJRHmcBY0qFuM19OKtp8y44R
 YOyWvampWw4Vg==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix,
 from userid 48) id 53A03C53BD0; Sun, 22 Oct 2023 07:41:18 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 218015] amdgpu powerplay: Spontaneous changes to
 power_dpm_force_performance_level
Date: Sun, 22 Oct 2023 07:41:18 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Video(DRI - non Intel)
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: high
X-Bugzilla-Who: roman.zilka@gmail.com
X-Bugzilla-Status: RESOLVED
X-Bugzilla-Resolution: ANSWERED
X-Bugzilla-Priority: P3
X-Bugzilla-Assigned-To: drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-218015-2300-7osqNla6nU@https.bugzilla.kernel.org/>
In-Reply-To: <bug-218015-2300@https.bugzilla.kernel.org/>
References: <bug-218015-2300@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D218015

--- Comment #5 from Roman =C5=BDilka (roman.zilka@gmail.com) ---
Thanks, I passed the info on.
https://gitlab.freedesktop.org/drm/amd/-/issues/2931

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
