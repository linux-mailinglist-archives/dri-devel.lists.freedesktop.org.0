Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0E1C4AE5C93
	for <lists+dri-devel@lfdr.de>; Tue, 24 Jun 2025 08:08:17 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1B99010E4E2;
	Tue, 24 Jun 2025 06:08:14 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="KSk1J2Rd";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9435B10E4E2
 for <dri-devel@lists.freedesktop.org>; Tue, 24 Jun 2025 06:08:12 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id EEAAB61139
 for <dri-devel@lists.freedesktop.org>; Tue, 24 Jun 2025 06:08:09 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id A4021C4CEF2
 for <dri-devel@lists.freedesktop.org>; Tue, 24 Jun 2025 06:08:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1750745289;
 bh=n35MhImISN+ysXGNCx0TORGUK3KM/6IMJ1SLSuMJbJM=;
 h=From:To:Subject:Date:In-Reply-To:References:From;
 b=KSk1J2Rd7jGsLcnA0hnAKpRYqA8rPBF5rSTfd4oQdr1wIUbkZWpsTQ/tME/lv3JUk
 nM2BDUFO5Gfosm0BXpwR6Uqig25WQUh+cPzqxvGRnmrlOd4HZ1zPVf7kERscU3kwel
 zJGToVADVR4VWdlZdE8inLwFq3gDh7838pA4vlLtNt5bX2eQQYVC037A/oGA0FP3Oz
 /Rlwgr9cB8JuaM/1+8xLIvkYEOAaoZva0FHmvX81cSxhqftZU9Lfl4Ec4DgysToDdY
 DJ/3Ij94yQ851Pd+c9D14NfiZqlMHRZ2unVE1vUDg9/vsJ7Oc1vTIbuimf9eiEbVNc
 lg15YL8b2EHhA==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix,
 from userid 48) id 93505C41614; Tue, 24 Jun 2025 06:08:09 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 219492] amdgpu: failed to write reg 28b4 wait reg 28c6 and
 amdgpu: failed to write reg 1a6f4 wait reg 1a706
Date: Tue, 24 Jun 2025 06:08:09 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Video(DRI - non Intel)
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: email2shubhra@gmail.com
X-Bugzilla-Status: RESOLVED
X-Bugzilla-Resolution: ANSWERED
X-Bugzilla-Priority: P3
X-Bugzilla-Assigned-To: drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-219492-2300-DDckF07gYI@https.bugzilla.kernel.org/>
In-Reply-To: <bug-219492-2300@https.bugzilla.kernel.org/>
References: <bug-219492-2300@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D219492

--- Comment #4 from Shubhra Prakash Nandi (email2shubhra@gmail.com) ---
Since the issue is still not resolved. The below bug is the better one to
track.

https://gitlab.freedesktop.org/drm/amd/-/issues/4152

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
