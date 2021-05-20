Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6289738A275
	for <lists+dri-devel@lfdr.de>; Thu, 20 May 2021 11:40:42 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4AB6F6E1B8;
	Thu, 20 May 2021 09:40:40 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 353C06E1B8
 for <dri-devel@lists.freedesktop.org>; Thu, 20 May 2021 09:40:39 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPS id 09E2761931
 for <dri-devel@lists.freedesktop.org>; Thu, 20 May 2021 09:40:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1621503639;
 bh=A8BlAw2o0XzFlfzZhcYS3njz33o0vkz6iIEm1I0sQ3c=;
 h=From:To:Subject:Date:In-Reply-To:References:From;
 b=FwLSv/BmfPAYubh1nSUuOZozV8nqQr6Yldy+BsVJX7WR8+6AEduGd29byPy/NLeR7
 wKPPgIaCWm1MxcbMH08xFxKrxZZRJ6oVhKLG002pdFI3ebCJJkaMuRbGJhHr6lkDHm
 Fe/UVeLn6M5AH3WTLuzH5btdoNrce/x9Q/yCzos1Hr33zY9Ba3/yBrLHp8M6NZkZTQ
 YM9JC0PQlWl8afqskSwh7dZqQ3Xq1BoOsuXkUuTH239aYwvrfYZ/g3bi0/ZD97e9YP
 br7Zj1n5g0tXoWrn514PV1ueQiV5x8WW7NaKHIpX242hdG+hQoZxfj//6+NfoOYSxd
 JDVUUKxZft4Jg==
Received: by pdx-korg-bugzilla-2.web.codeaurora.org (Postfix, from userid 48)
 id F28916129C; Thu, 20 May 2021 09:40:38 +0000 (UTC)
From: bugzilla-daemon@bugzilla.kernel.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 211277] sometimes crash at s2ram-wake (Ryzen 3500U): amdgpu,
 drm, commit_tail, amdgpu_dm_atomic_commit_tail
Date: Thu, 20 May 2021 09:40:38 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Video(DRI - non Intel)
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: me@jeromec.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-211277-2300-UoVCG5hPUy@https.bugzilla.kernel.org/>
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

--- Comment #31 from Jerome C (me@jeromec.com) ---
(In reply to kolAflash from comment #30)
> Created attachment 296891 [details]
> all kernel messages with ip_block_mask=3D0x0ff (Debian kernel 5.10.0-6)
>=20
> Also crashes with ip_block_mask=3D0x0ff
> Tested with the current Debian Testing kernel 5.10.0-6.
>=20
> I attached all kernel messages from /var/log/messages from boot to crash.
> I think that should be the dmesg output.

hiya, you may not know this but use in "amdgpu.ip_block_mask=3D0x0ff" and n=
ot
"ip_block_mask=3D0x0ff"

"ip_block_mask=3D0x0ff" will only apply to linux

"amdgpu.ip_block_mask=3D0x0ff" will only apply to amdgpu module

I can see in your kernel logs that VCN is still enabled

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
