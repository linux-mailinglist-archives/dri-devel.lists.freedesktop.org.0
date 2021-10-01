Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 13AF441E7AE
	for <lists+dri-devel@lfdr.de>; Fri,  1 Oct 2021 08:41:03 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 80BCA6ECF7;
	Fri,  1 Oct 2021 06:41:00 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 47D656ECF7
 for <dri-devel@lists.freedesktop.org>; Fri,  1 Oct 2021 06:40:59 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPS id 12FA161A7A
 for <dri-devel@lists.freedesktop.org>; Fri,  1 Oct 2021 06:40:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1633070459;
 bh=XLsbDZPxznmdTJ4VhBSO98W4WrAEAsc+48iEenePcGI=;
 h=From:To:Subject:Date:In-Reply-To:References:From;
 b=cCqnkkMikCw7RofeveG7hDs5p7ZAVsX2re44uDzIjam6RjeMH01IU6QJlNWQC2BhC
 1bymMYxXszqzIwyzclSImtTBxVJAaFxfKP95fll/7HUKX1Hi+w/ki2cGmhDVrYBa34
 4evcyH83GCaxpqPnIWSWCy0s5LbSZmkMMpa1IsNwg2KnEPlBccSK1N0fa9Q7p/K9ZM
 H4d37aSxMpBFXU4DyJCuAeHiMcOFc1KzJRQar+Jxj4rZvg7sqq4ODA5JqlUrGyQ3f2
 ZbnwN5PVs85pstZqgwK4zzjWgWTywnQOOp1c4VTIhruRO8/GnLL25sJfZxbMJgIe1N
 pHLU2dX2EN7NA==
Received: by pdx-korg-bugzilla-2.web.codeaurora.org (Postfix, from userid 48)
 id 06EB9610F7; Fri,  1 Oct 2021 06:40:59 +0000 (UTC)
From: bugzilla-daemon@bugzilla.kernel.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 214413] Kernel oops on boot for amdgpu (in
 si_dpm_set_power_state)
Date: Fri, 01 Oct 2021 06:40:58 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Video(DRI - non Intel)
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: mpiazza@gmail.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-214413-2300-2Y6x3Riuoi@https.bugzilla.kernel.org/>
In-Reply-To: <bug-214413-2300@https.bugzilla.kernel.org/>
References: <bug-214413-2300@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D214413

--- Comment #6 from Marco Piazza (mpiazza@gmail.com) ---
A patch with the bug fix has been included in 5.14.9 release.

I've downloaded the new version, compiled and booted fine.

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
