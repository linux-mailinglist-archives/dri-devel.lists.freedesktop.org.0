Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id F0C7D7B4327
	for <lists+dri-devel@lfdr.de>; Sat, 30 Sep 2023 20:58:07 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 83A2B10E169;
	Sat, 30 Sep 2023 18:58:04 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sin.source.kernel.org (sin.source.kernel.org [145.40.73.55])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A7B0010E169
 for <dri-devel@lists.freedesktop.org>; Sat, 30 Sep 2023 18:58:02 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sin.source.kernel.org (Postfix) with ESMTP id DFF98CE1BBF
 for <dri-devel@lists.freedesktop.org>; Sat, 30 Sep 2023 18:57:59 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 2BB67C433C7
 for <dri-devel@lists.freedesktop.org>; Sat, 30 Sep 2023 18:57:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1696100279;
 bh=mlKiKSc9O/maifNvRPB9AYYFG9P6r5dr5kxM3sUrngU=;
 h=From:To:Subject:Date:In-Reply-To:References:From;
 b=i9arSZ4eFljoyiEo6HW5+sbjh2RNFy7+a9wKJl1LjkgH8OLt8clKD/g5I334WfjKF
 lxP+a/ZM2x+34q+klIZc+neV6sfbBNJ2nzrCXFuEN/FZDjtSQYcyN3U2RSE0hnGdhg
 3ZIZIVZqsgFxxWqaDq1w3UzP34Pk9Sxrh++MXumnzoBT6TSuHdffVlbw9MTa4zZaw/
 P7gemPboO1xqUPs4GOJkCWYaPOxaOSMXQ+edtBmkp211K+G9nYIpURMbdQGKHyGyF4
 O5fJQs2CjtfInrZbYQNYHov9qzr+J4aGEYCkb8pYO3xkfKu3CFcqKFG0EzPl7KkdE4
 WKfsnco0aC2TQ==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix,
 from userid 48) id 07B08C53BC6; Sat, 30 Sep 2023 18:57:59 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 201957] amdgpu: ring gfx timeout
Date: Sat, 30 Sep 2023 18:57:50 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Video(DRI - non Intel)
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: blocking
X-Bugzilla-Who: aspicer@gmail.com
X-Bugzilla-Status: RESOLVED
X-Bugzilla-Resolution: ANSWERED
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: cc
Message-ID: <bug-201957-2300-oomjXSKl2b@https.bugzilla.kernel.org/>
In-Reply-To: <bug-201957-2300@https.bugzilla.kernel.org/>
References: <bug-201957-2300@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D201957

aspicer@gmail.com changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
                 CC|                            |aspicer@gmail.com

--- Comment #93 from aspicer@gmail.com ---
I have also been having this issue. It started occurring recently (last 2-3
months). No other changes.

Mostly lockups while gaming (yuzu), one lockup because of chrome.

I was able to fix this issue by switching from HDMI to DP or DVI.

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
