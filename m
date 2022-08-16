Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BC76459522C
	for <lists+dri-devel@lfdr.de>; Tue, 16 Aug 2022 07:45:35 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D8E1DBA427;
	Tue, 16 Aug 2022 05:45:24 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 032B19523F
 for <dri-devel@lists.freedesktop.org>; Tue, 16 Aug 2022 05:45:07 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 6BC57B815C6
 for <dri-devel@lists.freedesktop.org>; Tue, 16 Aug 2022 05:45:05 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 3A6E8C433D7
 for <dri-devel@lists.freedesktop.org>; Tue, 16 Aug 2022 05:45:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1660628704;
 bh=P4eQeFZw8oWe0wYQ1wV8yM7TrOKyXukTdY8jHyGtgB0=;
 h=From:To:Subject:Date:In-Reply-To:References:From;
 b=HUUkA5ueaC2WwQu4fPn14WesrOCEQxL3eAIriwpk0Esrs2uWYOsi4pfeCU2nd6z9G
 N8yft9YOWB+aOcP+Ej7kMFKFLSF1sSsNw+jI7ki6TyFLeYUVz7R8JNsHJjiXTmAvRm
 121s7lrTx/0CGRSnYzf1gXFW55D6Xk9qihAgz+e2m3H5qiw584UEVCchJK69CciPYC
 rN1rYNXgqTEtSIsRCuaF09x4LMNPfd7QZvvUEKKHkNawrvS8NdFqCt6YGgKXMX/iK1
 4MrmQFWjanD8M05fe3oE9OtjksAoCOuMXrPZOhC1I/RishQwXCmMhWcKtqlzbAgHvy
 zwyilxt4Eq0aQ==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix,
 from userid 48) id 1EFAFC433E9; Tue, 16 Aug 2022 05:45:04 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 216359] [amdgpu] ring gfx timeout after waking from suspend and
 exiting X
Date: Tue, 16 Aug 2022 05:45:03 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Video(DRI - non Intel)
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: shlomo@fastmail.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-216359-2300-KEJJam0FGp@https.bugzilla.kernel.org/>
In-Reply-To: <bug-216359-2300@https.bugzilla.kernel.org/>
References: <bug-216359-2300@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D216359

--- Comment #1 from Shlomo (shlomo@fastmail.com) ---
Reposted on GitLab:

https://gitlab.freedesktop.org/drm/amd/-/issues/2124

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
