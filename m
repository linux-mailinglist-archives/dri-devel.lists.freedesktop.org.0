Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 3436F3A325C
	for <lists+dri-devel@lfdr.de>; Thu, 10 Jun 2021 19:41:11 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C31DB6E195;
	Thu, 10 Jun 2021 17:41:07 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0E3E06E195
 for <dri-devel@lists.freedesktop.org>; Thu, 10 Jun 2021 17:41:07 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPS id D7DEA613E1
 for <dri-devel@lists.freedesktop.org>; Thu, 10 Jun 2021 17:41:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1623346866;
 bh=ytDPWmkzdqXGMMUJ4q4PQN4ehHuEOR2sNYl77J/g0W4=;
 h=From:To:Subject:Date:In-Reply-To:References:From;
 b=oVWfENBhz0gbLty/G0Pokp0AND1uOP+glLE4dgfq8aGV1awZJed8IQr7KM9vZqjnj
 GoSqs5lRLgPWpHamXfYoj/P5D4UwFjQO0MomZh7EC5bNbwqFQFACPtwT5BnGmlt8HC
 CNxMxqMmYV/cKI5FJ+ckg96Nav29y9RE55MhJC+14XA+RimF5CckoEuYgSr3s5TSiV
 OgIOHgxhRi0OvLffv1TInl1wlUgD+57DQ11/ayCkHhMaQra6Y0+l5y6dPRo11pSJbJ
 OQX9O9H+TTiJqq+AgkYLJtMN/rmURnZ63HJId5IF80mNyE7kVk4y177jEMWr4GcnM1
 2kbsi4UfcaVEA==
Received: by pdx-korg-bugzilla-2.web.codeaurora.org (Postfix, from userid 48)
 id C2D5561158; Thu, 10 Jun 2021 17:41:06 +0000 (UTC)
From: bugzilla-daemon@bugzilla.kernel.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 213391] AMDGPU retries page fault with some specific processes
 amdgpu and sometimes followed [gfxhub0] retry page fault until *ERROR* ring
 gfx timeout, but soft recovered
Date: Thu, 10 Jun 2021 17:41:06 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Video(DRI - non Intel)
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: low
X-Bugzilla-Who: nirmoy.aiemd@gmail.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-213391-2300-E8VR49kzvl@https.bugzilla.kernel.org/>
In-Reply-To: <bug-213391-2300@https.bugzilla.kernel.org/>
References: <bug-213391-2300@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D213391

--- Comment #7 from Nirmoy (nirmoy.aiemd@gmail.com) ---
Actually, I am wrong, I checked out v5.12.9-arch1 from Arch and realized the
fix I mentioned before isn't valid.

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
