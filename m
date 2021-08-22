Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 461ED3F41EA
	for <lists+dri-devel@lfdr.de>; Mon, 23 Aug 2021 00:20:01 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B26A889CC4;
	Sun, 22 Aug 2021 22:19:49 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4786289CC4
 for <dri-devel@lists.freedesktop.org>; Sun, 22 Aug 2021 22:19:48 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPS id 1824D6127B
 for <dri-devel@lists.freedesktop.org>; Sun, 22 Aug 2021 22:19:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1629670788;
 bh=749W6GPcGzBBc1hybbX5CsWJnfj3KZK+ScOSQG7Yqak=;
 h=From:To:Subject:Date:In-Reply-To:References:From;
 b=XbkdFHbHWApLNGBiXvvkUeoWTXxr+uMTylxidMO/frE0cxepvn4gZtQPLEXlPPTrj
 8nzmocgolP11OS30+6zWjDabiChSPf1rAnQqEDATJ3jdYVFOK+hWQughzCnWYZtHEx
 MK97NFPfKlIrxu/BujqzNV4+BIDHxe+ixp6QkZvCSXvJ4FnxlX5hlsX1OLNhE+XdUt
 df2QPTS+ZLQHbwXCwSFNrZksmW7Rq6HqDZiEP4g2R0o4siZW5T7nDuCy/BmIkLLzq5
 y4aH/bXD41LWVkX63BVS2jIkWVYNSw2CZ/3jBhVVtO93af4y0H4svx06bWlV0V5Zgj
 SG/CTa05wk+vQ==
Received: by pdx-korg-bugzilla-2.web.codeaurora.org (Postfix, from userid 48)
 id 1056460F94; Sun, 22 Aug 2021 22:19:48 +0000 (UTC)
From: bugzilla-daemon@bugzilla.kernel.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 214001] [bisected][regression] After commit "drm/ttm:
 Initialize debugfs from ttm_global_init()" kernels without debugfs explicitly
 set to 'allow all' fail to boot
Date: Sun, 22 Aug 2021 22:19:47 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Video(Other)
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: untaintableangel@hotmail.co.uk
X-Bugzilla-Status: RESOLVED
X-Bugzilla-Resolution: CODE_FIX
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: bug_status resolution
Message-ID: <bug-214001-2300-9UpiZU1V1y@https.bugzilla.kernel.org/>
In-Reply-To: <bug-214001-2300@https.bugzilla.kernel.org/>
References: <bug-214001-2300@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D214001

Linux_Chemist (untaintableangel@hotmail.co.uk) changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
             Status|NEW                         |RESOLVED
         Resolution|---                         |CODE_FIX

--- Comment #6 from Linux_Chemist (untaintableangel@hotmail.co.uk) ---
All good! CONFIG_DEBUG_FS is not set and can boot again :) Marking as fixed.

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
