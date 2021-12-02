Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 711A7465F8F
	for <lists+dri-devel@lfdr.de>; Thu,  2 Dec 2021 09:35:50 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 35EBB6E9FA;
	Thu,  2 Dec 2021 08:35:46 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sin.source.kernel.org (sin.source.kernel.org
 [IPv6:2604:1380:40e1:4800::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0A05F6E9FA
 for <dri-devel@lists.freedesktop.org>; Thu,  2 Dec 2021 08:35:45 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by sin.source.kernel.org (Postfix) with ESMTPS id CF358CE21CC
 for <dri-devel@lists.freedesktop.org>; Thu,  2 Dec 2021 08:35:40 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 0AEB1C53FCB
 for <dri-devel@lists.freedesktop.org>; Thu,  2 Dec 2021 08:35:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1638434139;
 bh=UdyWSLoK6oIXCVrWFDid6rexxhiavq5gi0RlAKIq9aU=;
 h=From:To:Subject:Date:In-Reply-To:References:From;
 b=dfHWB2FTCWU8yv0EwxhvVKMB6c0Kad45CYn/ocYqhdqyOjkuLM6ip3wwG1ecU9tEk
 SHP7Q81NefFNqtnSfkV8i8WxXVJaHa7Ck6FtLUhxVHrNEn0zUyrXzX4JOjBRupS1iJ
 N555TdgHtYBaB3jxrsJCBzfZAAmqBlr6ZdPDIZvq3qtiu8bxXiGa+MH75ct5R5uezt
 zJs5YvJal8vUTzEptHp+a9GvXC4xy0jd6n+QoxbO4Dbzr59SxnFnnH72MC/JPln4gl
 2u4+vY7QrSQWI3k0DsfM05Qqpq3rLh9hkuVcw4qWmCcH/Eqzbbp3xIF+XMWatV+ieE
 COAf4vmJwYPPA==
Received: by pdx-korg-bugzilla-2.web.codeaurora.org (Postfix, from userid 48)
 id ECAEC60FA0; Thu,  2 Dec 2021 08:35:38 +0000 (UTC)
From: bugzilla-daemon@bugzilla.kernel.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 210263] brightness device returns ENXIO (?) on brightness
 restore at boot, with bootoption "quiet"
Date: Thu, 02 Dec 2021 08:35:38 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Video(DRI - non Intel)
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: fabiscafe@mailbox.org
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-210263-2300-0f7aPsfG7y@https.bugzilla.kernel.org/>
In-Reply-To: <bug-210263-2300@https.bugzilla.kernel.org/>
References: <bug-210263-2300@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D210263

--- Comment #5 from Fabian (fabiscafe@mailbox.org) ---
As of Kernel 5.15, I don't need fbcon=3Dnodefer anymore. By default the bac=
klight
works and is set on start. I still get from time to time an boot-error by
systemd, but that can be also worked around by loading amdgpu early.

Can someone confirm this?

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
