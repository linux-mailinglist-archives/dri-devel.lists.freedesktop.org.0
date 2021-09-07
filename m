Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DCB30402246
	for <lists+dri-devel@lfdr.de>; Tue,  7 Sep 2021 04:32:07 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 82C98894A7;
	Tue,  7 Sep 2021 02:32:03 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 50870894A7
 for <dri-devel@lists.freedesktop.org>; Tue,  7 Sep 2021 02:32:02 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPS id E4F27610E8
 for <dri-devel@lists.freedesktop.org>; Tue,  7 Sep 2021 02:32:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1630981921;
 bh=OooN1+AvIgZ1wYRKqi+Z12qRgTfu4eW6G/BXuF3hyGk=;
 h=From:To:Subject:Date:In-Reply-To:References:From;
 b=ovW+IsoIiuqfgK+WV7+DofbR4B3+6oAiBDnmZrlPnAKCVJCobPxx9JWdhTKUvIJ/k
 pilG7AhvsznNSRMWGS71BPwhuCT8MLsNsyZrSTeFpwxt0RpFXN+UUjhBVVXEfO5ao1
 DPuSn9sV4Qaf5UmfoAgBD7C4TfhCyyBNCHx8qllos6SPkIJlxxJ4R/0uzivEzZziIq
 seKNtrFmk7uwG6FbKK2FhgSSj9rHs8fJ8iSK7D+PAT3nuH3XL30azUuXFXPe0l6U8x
 uyK8cd0SSmUhCnMSiNvhVtoA6tmrTdromn2/JNHlEEmMhhM602YBUaOspNJytJyIw3
 jnYN8kbeVyDjA==
Received: by pdx-korg-bugzilla-2.web.codeaurora.org (Postfix, from userid 48)
 id E0C5260F6B; Tue,  7 Sep 2021 02:32:01 +0000 (UTC)
From: bugzilla-daemon@bugzilla.kernel.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 211277] sometimes crash at s2ram-wake (Ryzen 3500U): amdgpu,
 drm, commit_tail, amdgpu_dm_atomic_commit_tail
Date: Tue, 07 Sep 2021 02:32:01 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Video(DRI - non Intel)
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: ted437@gmail.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-211277-2300-NGhdmZ4Zma@https.bugzilla.kernel.org/>
In-Reply-To: <bug-211277-2300@https.bugzilla.kernel.org/>
References: <bug-211277-2300@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D211277

--- Comment #53 from Anthony Rabbito (ted437@gmail.com) ---
Thanks for chiming in James! Few things I've observed since adding 'pci=3Dn=
oats'
the graphic artifacts seem to happen way less. I did observe one lockup whi=
ch
required me to hard shut down the computer. This was a wake from suspend
scenario.=20

I used to deal with somwhat similar issues here --
https://bugs.freedesktop.org/show_bug.cgi?id=3D110674 not sure if that's of=
 any
use. Let me know if a fresh bug is warranted.

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
