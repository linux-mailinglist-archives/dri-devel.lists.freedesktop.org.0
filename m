Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5DD3E6593D9
	for <lists+dri-devel@lfdr.de>; Fri, 30 Dec 2022 01:37:25 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 611E410E433;
	Fri, 30 Dec 2022 00:37:19 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E233C10E433
 for <dri-devel@lists.freedesktop.org>; Fri, 30 Dec 2022 00:37:16 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 1FAB3619C4
 for <dri-devel@lists.freedesktop.org>; Fri, 30 Dec 2022 00:37:16 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 800C7C433EF
 for <dri-devel@lists.freedesktop.org>; Fri, 30 Dec 2022 00:37:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1672360635;
 bh=96T5M/OeKvF70o/Kw47WrCQaxbim7Hla01YsYAmGw0Y=;
 h=From:To:Subject:Date:In-Reply-To:References:From;
 b=eWL/zTkS9KCeO/MluUbGXJ7yzWZKYcbMuuW4YHefeDIMgNlTZYB8e0314qFYhGiVN
 Xqawcw4jRUU/C+aGBBcy8wgHecii+1Znw59FY/k0/8WY1/lGk4hMPqMUBLLllrp+ua
 jHpCMBZR+1uQ/fDj6wPoeg+tm8vos0uvrgG6P7SrjfqrAN46DJUjI61XazICPrn/Ji
 rQUAqz4dsf9CR6khhjxu0h09xTncXfGncnKfGR/sonYXGOxTOArp2K75myFxEh7iwF
 PYPnRSAEdWVd5U5KMR6+8a3jgeL6S8WOltON95cKz34gnP9J8qAHTpkXo6wXCiHkhw
 OWOmqOtCK6OCg==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix,
 from userid 48) id 69EBCC43144; Fri, 30 Dec 2022 00:37:15 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 216840] AMDGPU trace message at boot
Date: Fri, 30 Dec 2022 00:37:15 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Video(DRI - non Intel)
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: low
X-Bugzilla-Who: alexdeucher@gmail.com
X-Bugzilla-Status: RESOLVED
X-Bugzilla-Resolution: ANSWERED
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-216840-2300-AUH1fk22hK@https.bugzilla.kernel.org/>
In-Reply-To: <bug-216840-2300@https.bugzilla.kernel.org/>
References: <bug-216840-2300@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D216840

--- Comment #4 from Alex Deucher (alexdeucher@gmail.com) ---
(In reply to Salvador P=C3=A9rez from comment #3)
> Hi, Alex,=20
>=20
> I am afraid that not setting amdgpu.vm_update_mode=3D3 is not an option. =
If I
> try to play Cities Skylines (linux native version), the game goes 1 fps a=
nd
> the system is extremely sluggish. I need to switch to vt1 in order to reg=
ain
> control and be able to reboot.

In that case you likely have larger problems.  You should try and figure out
what's going on there.  As Artem suggested, open a bug at
https://gitlab.freedesktop.org/drm/amd/-/issues so we can figure out why GPU
page table updates are not working correctly.

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
