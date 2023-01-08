Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CBA4A661457
	for <lists+dri-devel@lfdr.de>; Sun,  8 Jan 2023 10:39:59 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BF06310E1B1;
	Sun,  8 Jan 2023 09:39:53 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2E57F10E1B1
 for <dri-devel@lists.freedesktop.org>; Sun,  8 Jan 2023 09:39:51 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 68A5560C12
 for <dri-devel@lists.freedesktop.org>; Sun,  8 Jan 2023 09:39:50 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id C9C3DC433F1
 for <dri-devel@lists.freedesktop.org>; Sun,  8 Jan 2023 09:39:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1673170789;
 bh=59vz+d62mY0WHu6tVlqZEeiTw2NGurINCozjio1uTW8=;
 h=From:To:Subject:Date:In-Reply-To:References:From;
 b=p90cTlz7RfkTmsHkU8CwJwINZx+hQopP8axs3UfG0jXZZAiAWL/sNBjFoGH5VtXX/
 UgRx6w8KD/uLy4QrqXI+x0IjaX4f4WFiXAYEPjyv1tSLS65uV/TgfqDqJsDxq5nv26
 3YYqWzfsSXHpXZ+pDJ1yzZb8gFCr2g5SqiTqqMjJ7QAxfNicCPoaByClkncJd78ygs
 zGEKqkbILxV09imWsJ6uObix5Cp82+EYIo1zmm20Qw987KVNHVqDLR+W1vFOg5ks+9
 uvskSVzm2YVxrhNG7Iwt4ZliOsL63rlEhdspo3P5RemlZqaGxnGtQ7VrxvysLTMv7v
 yI0nOvSWev8nw==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix,
 from userid 48) id B799DC43144; Sun,  8 Jan 2023 09:39:49 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 216899] amdgpu ring timeout after gfxoff on Navi 24 beige_goby
Date: Sun, 08 Jan 2023 09:39:49 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Video(DRI - non Intel)
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: aros@gmx.com
X-Bugzilla-Status: RESOLVED
X-Bugzilla-Resolution: ANSWERED
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: bug_status resolution
Message-ID: <bug-216899-2300-esR0joNeVo@https.bugzilla.kernel.org/>
In-Reply-To: <bug-216899-2300@https.bugzilla.kernel.org/>
References: <bug-216899-2300@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D216899

Artem S. Tashkinov (aros@gmx.com) changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
             Status|NEW                         |RESOLVED
         Resolution|---                         |ANSWERED

--- Comment #1 from Artem S. Tashkinov (aros@gmx.com) ---
Please search for duplicates here
https://gitlab.freedesktop.org/drm/amd/-/issues and if there are none, file=
 a
bug report over there.

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
