Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 06C905035C9
	for <lists+dri-devel@lfdr.de>; Sat, 16 Apr 2022 11:38:16 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AB8BE10E748;
	Sat, 16 Apr 2022 09:38:11 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4BF2110E748
 for <dri-devel@lists.freedesktop.org>; Sat, 16 Apr 2022 09:38:10 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 9A86660C04
 for <dri-devel@lists.freedesktop.org>; Sat, 16 Apr 2022 09:38:07 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 0AC29C385A1
 for <dri-devel@lists.freedesktop.org>; Sat, 16 Apr 2022 09:38:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1650101887;
 bh=44Hy5dPtYDdykLV7/oKwU32IZrvnEOUQ12uQ33jjMJc=;
 h=From:To:Subject:Date:In-Reply-To:References:From;
 b=pNKSEHxdymISccQYczW3LUP61XJGXjawGbuhHW81FUVq9YoBYJWYjnnATT55npdTg
 llrrqgL4E/1vZNC5VP0JwFD4aeviyPmG++zBXzOFORGj4me1GlSXPpQCi5qlOM1yod
 WxGuy46U5DK8OWe8QVe4qrRb+U8OHQ5EKgRIhmqpvfnqIy4maCdnK7D+UjUCBlddQ1
 pYJ30vd9HGGTLf9P+79ymWLx4k4n8/36C1Yu3Xtu7V9V9WBV3F2QmU2Mtrfe44MOmf
 Qbry+s58KGZseolH5RFOzJ/LU6jLdCxWzeAjT4CCBnmbfB2EMKcWRBvuMLIOukNvFf
 KgTD/NUBwBXSw==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix,
 from userid 48) id E8014C05FD6; Sat, 16 Apr 2022 09:38:06 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 215842] PC freeze sidn kernel 5.17.x
Date: Sat, 16 Apr 2022 09:38:06 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Video(DRI - non Intel)
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: blocking
X-Bugzilla-Who: aros@gmx.com
X-Bugzilla-Status: RESOLVED
X-Bugzilla-Resolution: ANSWERED
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: bug_status resolution
Message-ID: <bug-215842-2300-bbAxuFc3YJ@https.bugzilla.kernel.org/>
In-Reply-To: <bug-215842-2300@https.bugzilla.kernel.org/>
References: <bug-215842-2300@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D215842

Artem S. Tashkinov (aros@gmx.com) changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
             Status|NEW                         |RESOLVED
         Resolution|---                         |ANSWERED

--- Comment #1 from Artem S. Tashkinov (aros@gmx.com) ---
I presume your Radeon RX GPU is driving everything.

Please refile here: https://gitlab.freedesktop.org/drm/amd/-/issues while
providing all the necessary details. Also please search for existing bug
reports, this could be already known.

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
