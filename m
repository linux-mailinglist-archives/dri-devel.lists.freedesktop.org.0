Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 66CE23A5E08
	for <lists+dri-devel@lfdr.de>; Mon, 14 Jun 2021 10:01:54 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E381989CD8;
	Mon, 14 Jun 2021 08:01:51 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A06CF89CD8
 for <dri-devel@lists.freedesktop.org>; Mon, 14 Jun 2021 08:01:50 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPS id 76B7761289
 for <dri-devel@lists.freedesktop.org>; Mon, 14 Jun 2021 08:01:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1623657710;
 bh=0vcwBCfpT2EZZm2/fAZiZX/M/Qb59filBlZchQFjeMM=;
 h=From:To:Subject:Date:In-Reply-To:References:From;
 b=JAYqwR+fbmG9vH+VwBe8qq5NVTynJaxy5g6ALFd50T10Z6Ovk+1dezcR5T/scHRXf
 D+A9PYLcBD9r+nTv+uApkyZ55VkOtU+lmNjARNip2ZwkYR1Fvfwn4siVVKouoMzXZU
 I6dVnGDgomrBvr6sypoEaxphFRaR5p+8zox5gEjPfBPiJ+xwwL6U4a2Ri4GFhHHTK6
 tVBKDyY2uDHuY7dN9vFXQT5/9Lgu1gVJC49ViHdgB+OSavz8BEc8y/HIOy5sL1/CTL
 y0d8R+MVuGRC4v8YbSKsksaZO6LOmU1BI4fp8fb1EPsBHx5Zstzx/Q8VUyXRM9Xrog
 b7wWafzauFaag==
Received: by pdx-korg-bugzilla-2.web.codeaurora.org (Postfix, from userid 48)
 id 6744A61278; Mon, 14 Jun 2021 08:01:50 +0000 (UTC)
From: bugzilla-daemon@bugzilla.kernel.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 213391] AMDGPU retries page fault with some specific processes
 amdgpu and sometimes followed [gfxhub0] retry page fault until *ERROR* ring
 gfx timeout, but soft recovered
Date: Mon, 14 Jun 2021 08:01:50 +0000
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
Message-ID: <bug-213391-2300-LjQkZkNaSg@https.bugzilla.kernel.org/>
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

--- Comment #13 from Nirmoy (nirmoy.aiemd@gmail.com) ---
Hi Dimitris and Lahfa, please try Michel's suggestion.

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
