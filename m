Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 1F078443F8C
	for <lists+dri-devel@lfdr.de>; Wed,  3 Nov 2021 10:45:51 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DCB0673053;
	Wed,  3 Nov 2021 09:45:46 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8D3D373053
 for <dri-devel@lists.freedesktop.org>; Wed,  3 Nov 2021 09:45:45 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPS id 5CB3D6115B
 for <dri-devel@lists.freedesktop.org>; Wed,  3 Nov 2021 09:45:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1635932745;
 bh=ojFaabw2UZrizl7gV2dbqMGl+MBr1tU/oG4e2f8yQQQ=;
 h=From:To:Subject:Date:In-Reply-To:References:From;
 b=KUNqz4ci3VLxpsB0eauUs0klux+9MgxVxzC/YC9NcTIz16xTirRixwyAAXXW7wsi5
 P9i2RP3zkQOZhUfPiKpbfQsWuSZ6Z3GJgVlPzcSQQXyMr7rXrQTtgruh+fDq8dHO80
 6oqG7GZlJSIT0RPANvc/yr663oaI2b0/dy3mNlVhiA95lZZ0klCleCitKJ+k0neEW8
 JI21fl6TftvOzHx3FD9NEfCSpfmj3sPO1IXStvaPZfdUhuhToaMU33wVyLDJtyW/Cu
 d6/Z6A9Q/X9Tt5EvA9xBIZZWTTW4jY6xWectYvvHIO+eVnuZJ60nRWqVQIi+5xKi6S
 4OofWSALsmAmg==
Received: by pdx-korg-bugzilla-2.web.codeaurora.org (Postfix, from userid 48)
 id 59FDC60FEC; Wed,  3 Nov 2021 09:45:45 +0000 (UTC)
From: bugzilla-daemon@bugzilla.kernel.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 214029] [bisected] [amdgpu] Several memory leaks in amdgpu and
 ttm
Date: Wed, 03 Nov 2021 09:45:44 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Video(DRI - non Intel)
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: erhard_f@mailbox.org
X-Bugzilla-Status: RESOLVED
X-Bugzilla-Resolution: CODE_FIX
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: bug_status resolution
Message-ID: <bug-214029-2300-kcRpGWQtX0@https.bugzilla.kernel.org/>
In-Reply-To: <bug-214029-2300@https.bugzilla.kernel.org/>
References: <bug-214029-2300@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D214029

Erhard F. (erhard_f@mailbox.org) changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
             Status|NEW                         |RESOLVED
         Resolution|---                         |CODE_FIX

--- Comment #23 from Erhard F. (erhard_f@mailbox.org) ---
The fix landed in kernel 5.15, 5.14.16 and affected LTS kernels.

Closing.

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
