Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 6EF5B402783
	for <lists+dri-devel@lfdr.de>; Tue,  7 Sep 2021 13:02:19 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C0BA2898A3;
	Tue,  7 Sep 2021 11:02:14 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 66D64898A3
 for <dri-devel@lists.freedesktop.org>; Tue,  7 Sep 2021 11:02:14 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPS id 319DE610FE
 for <dri-devel@lists.freedesktop.org>; Tue,  7 Sep 2021 11:02:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1631012534;
 bh=f5KAAdY0O/N3P0R3JJB+9amK1rw7Wy+9PDpV/OOIeI4=;
 h=From:To:Subject:Date:In-Reply-To:References:From;
 b=ElysICkkjcKgBoRZO/J5vRftQktblp4ac8o8x/BszuKs5FSNK5imbgPTwS9IcsXt3
 vmv55SaPGUKZk0flir47JR/ul7GC1/dCWcQq/Rwt54GrF6WeVCD4xk/QVJ/jxlzybA
 pvySXXajDCvLJSHl2ScQmTHuu2SHnBKlmtRP0PVORSzvy5qz3Ay7tvAZFtwue2iggh
 hSz7ea7wLU1GgpfQbd9hR9jQ4/hCwAlPj9oSriiGGpypB67WDVdf2melDMO/6e02tc
 DPsAh0nkqVCXkPtp4ZIfPtQKM5u9mFfEN3IZVSYBFVwz80iUlLgOjVjFRuwJp6RS+h
 OP+9EEPsx/TAQ==
Received: by pdx-korg-bugzilla-2.web.codeaurora.org (Postfix, from userid 48)
 id 28C9260FC3; Tue,  7 Sep 2021 11:02:14 +0000 (UTC)
From: bugzilla-daemon@bugzilla.kernel.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 211277] sometimes crash at s2ram-wake (Ryzen 3500U): amdgpu,
 drm, commit_tail, amdgpu_dm_atomic_commit_tail
Date: Tue, 07 Sep 2021 11:02:13 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Video(DRI - non Intel)
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: jamesz@amd.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-211277-2300-uDsnbEJIkJ@https.bugzilla.kernel.org/>
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

--- Comment #57 from James Zhu (jamesz@amd.com) ---
(In reply to Anthony Rabbito from comment #53)
> Thanks for chiming in James! Few things I've observed since adding
> 'pci=3Dnoats' the graphic artifacts seem to happen way less. I did observ=
e one
> lockup which required me to hard shut down the computer. This was a wake
> from suspend scenario.=20
>=20
> I used to deal with somwhat similar issues here --
> https://bugs.freedesktop.org/show_bug.cgi?id=3D110674 not sure if that's =
of
> any use. Let me know if a fresh bug is warranted.

Hi Anthony,

The s3 hung issue here always with error: AMD-Vi: Event logged
[IO_PAGE_FAULT...] Bug:110674 don't have gfx ECC error. You case do have lo=
ts
of them.
Can you share the whole dmesg after you added pci=3Dnoats?
Regards!
James

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
