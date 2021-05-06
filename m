Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 080E237555D
	for <lists+dri-devel@lfdr.de>; Thu,  6 May 2021 16:03:51 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 59D0A6ECC6;
	Thu,  6 May 2021 14:03:46 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F33976EC80
 for <dri-devel@lists.freedesktop.org>; Thu,  6 May 2021 14:03:44 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPS id AAD3B610A5
 for <dri-devel@lists.freedesktop.org>; Thu,  6 May 2021 14:03:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1620309824;
 bh=GTRl6ZngfY641VFJO1WwUywe+S93+uzxuB41JR10A3I=;
 h=From:To:Subject:Date:In-Reply-To:References:From;
 b=uLk3CNAUYNBpfWrS1RiG2onP0j2Qt2YK9ig+lmP3aY+MK2Z91FpM6CRoAon7dvt0v
 E599lFwjq70Gy4fp0axuXvbxhVeOGl+1Thb8Y5lwwgBgLjt3lWPqaSGnl3lbcKT99v
 WYTQ3ewIevN5c3Kbp5faMARPkRsWFinCDEx4h85F9vyOQsGokeIekCTZ1EsWgyH0tz
 nywX+SkbwoE3TaLqgVRVaIl4+D7upHfgLUMW99rEPlmPtaSrMicBLWEMTTkRFIGOHR
 lM5Ewo08fOPbp4hzyUCShQdQyI3UC23ngC7pj1pX0jHis7JViLyRTo1wX0SZ0kr9Fr
 2cYpU+skwWEvQ==
Received: by pdx-korg-bugzilla-2.web.codeaurora.org (Postfix, from userid 48)
 id A45ED6129D; Thu,  6 May 2021 14:03:44 +0000 (UTC)
From: bugzilla-daemon@bugzilla.kernel.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 207833] Brightness control not working on ASUS TUF FA506IU (AMD
 Ryzen 7 4800H / Nvidia GTX 1660 Ti)
Date: Thu, 06 May 2021 14:03:44 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Video(DRI - non Intel)
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: high
X-Bugzilla-Who: filip.hejsek@gmail.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: cc
Message-ID: <bug-207833-2300-RTFtHNBQY2@https.bugzilla.kernel.org/>
In-Reply-To: <bug-207833-2300@https.bugzilla.kernel.org/>
References: <bug-207833-2300@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D207833

Filip Hejsek (filip.hejsek@gmail.com) changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
                 CC|                            |filip.hejsek@gmail.com

--- Comment #5 from Filip Hejsek (filip.hejsek@gmail.com) ---
This seems like a duplicate of
https://bugzilla.kernel.org/show_bug.cgi?id=3D203905 (with more info at
https://bugzilla.opensuse.org/show_bug.cgi?id=3D1180749). Could you try wit=
h the
latest kernel and amdgpu.aux_backlight=3D0? If that fixes the problem and t=
here
are no other problems, this bug can probably be closed in favor of the other
bug.

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
