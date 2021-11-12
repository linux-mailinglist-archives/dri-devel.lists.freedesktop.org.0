Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 31D4844ED47
	for <lists+dri-devel@lfdr.de>; Fri, 12 Nov 2021 20:29:22 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 509546E1F5;
	Fri, 12 Nov 2021 19:29:19 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 43E4E6E1F5
 for <dri-devel@lists.freedesktop.org>; Fri, 12 Nov 2021 19:29:18 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPS id 1D5BC610C8
 for <dri-devel@lists.freedesktop.org>; Fri, 12 Nov 2021 19:29:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1636745358;
 bh=+uLptyL3TEC4MSNK0R445FZpkpYOYWkCXE9fkNuw88o=;
 h=From:To:Subject:Date:In-Reply-To:References:From;
 b=XiabM6bUn9L6TKi2I9aeg8hQ4QYrV0sys2hP7Xi1LdxE0nwKqkIX/iVpx0Tmjz9pP
 NR+BXGcQbntl4Ui7NdweXqAlkVtScOCLD4ak2pfT4mCSwm3qpxDeBPrLlW/+/iHyHc
 4iqkWy+azAmtfg8GNAU4JCrT56BReFqTVWKMWcPU2C1EKwyrwcaXiFtBoRjA6XQWEj
 4DZa99fXSsQl2rhJiiHhEdtIQyKJOC9Vo6OJwLOMkDNIFc0QIaY9WMRbIyiIcXi9w6
 dRU4uJrciU5o/J3vjPitpKl7A4Qd0Uwn6FxJaF+8hLdPZ97ZnzCRlQJV+ucYt+mqXx
 7+VCtTFNFrk1Q==
Received: by pdx-korg-bugzilla-2.web.codeaurora.org (Postfix, from userid 48)
 id 1504861004; Fri, 12 Nov 2021 19:29:18 +0000 (UTC)
From: bugzilla-daemon@bugzilla.kernel.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 205089] amdgpu : drm:amdgpu_cs_ioctl : Failed to initialize
 parser -125
Date: Fri, 12 Nov 2021 19:29:17 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Video(DRI - non Intel)
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: 56turtle56@gmail.com
X-Bugzilla-Status: RESOLVED
X-Bugzilla-Resolution: CODE_FIX
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: cc
Message-ID: <bug-205089-2300-4AyfNDvkEP@https.bugzilla.kernel.org/>
In-Reply-To: <bug-205089-2300@https.bugzilla.kernel.org/>
References: <bug-205089-2300@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D205089

Antoni (56turtle56@gmail.com) changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
                 CC|                            |56turtle56@gmail.com

--- Comment #24 from Antoni (56turtle56@gmail.com) ---
this bug triggers almost every day for me. I use awesomeWM on arch linux (a=
lso
tried KDE but it also happens there).


software
linux 5.14.16.arch1-1
mesa 21.2.4-1
awesome 4.3-3


hardware
amd ryzen 5 5600g (integrated gpu)

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
