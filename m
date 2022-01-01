Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E8DE0482678
	for <lists+dri-devel@lfdr.de>; Sat,  1 Jan 2022 05:29:15 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6FC7689D30;
	Sat,  1 Jan 2022 04:29:10 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B6C1D89D30
 for <dri-devel@lists.freedesktop.org>; Sat,  1 Jan 2022 04:29:08 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 206E9612DA
 for <dri-devel@lists.freedesktop.org>; Sat,  1 Jan 2022 04:29:08 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id E6767C36B12
 for <dri-devel@lists.freedesktop.org>; Sat,  1 Jan 2022 04:29:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1641011346;
 bh=kF2UzpZmTYr1pKWkXXogZhaBPhC8Dc/Ap7rWNbHYSbI=;
 h=From:To:Subject:Date:In-Reply-To:References:From;
 b=QFDWm9j9NPwR0kPa5EbJwru90bp+dRRdVfmH3Byox5DDjZw1oDtv/aOQNvyq9VAwd
 s/nQyeM6Hyt7PMTycPvjqqsql2MsSLfHyQhMcGygWEVGCg+5HK9Cc7BfPBQOiHGvH6
 Tb6aQqJaVRFJX7jzsJ3QeylMNY98D2Q3qOXKlLTOD5bnZUYWfJMDsnwuco4uYwXbTW
 M1eCSDbM9yiY47udjZzHKwHTr41dF+w4JDWPMIL9NwUc/7lgeTJOkFJufHkbUC5YI4
 4gmG+b3gtj6uQA6OAaQxfFr+duVxxom8iBJNwKmKG7yj4BkqtswF06OLDPeDX8mM6f
 ttz45rQ+/VWtQ==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix,
 from userid 48) id D80CAC05FF6; Sat,  1 Jan 2022 04:29:06 +0000 (UTC)
From: bugzilla-daemon@bugzilla.kernel.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 201957] amdgpu: ring gfx timeout
Date: Sat, 01 Jan 2022 04:29:05 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Video(DRI - non Intel)
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: blocking
X-Bugzilla-Who: smp@nandre.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: cc
Message-ID: <bug-201957-2300-2Ao7lBxgJQ@https.bugzilla.kernel.org/>
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

Spencer (smp@nandre.com) changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
                 CC|                            |smp@nandre.com

--- Comment #53 from Spencer (smp@nandre.com) ---
(In reply to roman from comment #52)
> I can confirm that=20
> amdgpu.dpm=3D0=20
> removes the issue=20
> on an AMD Radeon PRO FIJI (Dual Fury) kernel: 5.15.10|FW:
> 20211027.1d00989-1|mesa: 21.3.2-1
>=20
> Works perfectly fine in Gnome as long as there is no application accessing
> the 2nd GPU.=20

In sourse games it works fine for me but in many non-source games it'll just
fucking die.
Anyways, now I cant boot withouth dpm, it freezes, meaning that source games
will crash, along with Risk of Rain 2 and others.

> Hopefully @Alex  can do/forward this since this is a P1 blocking issue and
> open for 3 years.

I can only hope it gets fixed one day soon.

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
