Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A36B73B5FB0
	for <lists+dri-devel@lfdr.de>; Mon, 28 Jun 2021 16:10:56 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1EE2689F35;
	Mon, 28 Jun 2021 14:10:54 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E0EF189FF7
 for <dri-devel@lists.freedesktop.org>; Mon, 28 Jun 2021 14:10:52 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPS id 4CE8C619A3
 for <dri-devel@lists.freedesktop.org>; Mon, 28 Jun 2021 14:10:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1624889452;
 bh=LSDuyHqYaS7IEF1BhOjUjBKHpKAPQZTYoxDOOvLVhso=;
 h=From:To:Subject:Date:In-Reply-To:References:From;
 b=tL+xmD5HTRFiIiYqYigdtDAedex2U7l0HPs9ODWcpnP+6m5+gt/ujkk8i3T/Sdqh6
 rHinzXYJVRZ7ePzWNYv1onNvZKmjp5QjPBHQ/vOUx1nOmlI+Kz+bcawiDd9hijIkBV
 ELsNT6rhK9vNnM51mbjqI94lSR5X8h67fSAEPvlAv4GhBoT4sONy64wMAd/6lQBfoE
 28H6O3OoPX7JY/Noe5Wjv8w/MgS6fNkK0AhkD0p8nUlvXYGn42P2RFDyHJ+IWlSk5H
 KwaiO9dSILez4n9ogySN83tP3EB0/xs5xHH7M5axZiBCKyU0YHTtVNEHO0Z3n2GQy+
 1KZ/z+W2g1JQg==
Received: by pdx-korg-bugzilla-2.web.codeaurora.org (Postfix, from userid 48)
 id 44CB661242; Mon, 28 Jun 2021 14:10:52 +0000 (UTC)
From: bugzilla-daemon@bugzilla.kernel.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 213599] amdgpu: navi RX 5500XT Very high idle power consumption
 (22 Watts)
Date: Mon, 28 Jun 2021 14:10:51 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Video(DRI - non Intel)
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: trivial
X-Bugzilla-Severity: high
X-Bugzilla-Who: alexdeucher@gmail.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: cc
Message-ID: <bug-213599-2300-wvS43BgSDE@https.bugzilla.kernel.org/>
In-Reply-To: <bug-213599-2300@https.bugzilla.kernel.org/>
References: <bug-213599-2300@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D213599

Alex Deucher (alexdeucher@gmail.com) changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
                 CC|                            |alexdeucher@gmail.com

--- Comment #5 from Alex Deucher (alexdeucher@gmail.com) ---
Already reverted:
https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?=
id=3Dbaacf52a473b24e10322b67757ddb92ab8d86717
https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?=
id=3Dee5468b9f1d3bf48082eed351dace14598e8ca39
Should hit stable any day now.

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
