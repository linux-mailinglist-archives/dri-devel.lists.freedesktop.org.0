Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 2D1743773D0
	for <lists+dri-devel@lfdr.de>; Sat,  8 May 2021 21:27:18 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E2D7B89CE0;
	Sat,  8 May 2021 19:27:13 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8D6C389CE0
 for <dri-devel@lists.freedesktop.org>; Sat,  8 May 2021 19:27:12 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPS id 34CF66137D
 for <dri-devel@lists.freedesktop.org>; Sat,  8 May 2021 19:27:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1620502032;
 bh=dRNwrGjecVJOPksAa2FMWwFf0KuZZMuIgDg2cFIALZU=;
 h=From:To:Subject:Date:In-Reply-To:References:From;
 b=D41p85wKjep8Ldd/OS6mt/TewOW04PQxWzXibkf+CE5JZPtvYw16DvB8HgP28dNA2
 uIbn1D5WTnMxl2+n3yK83oqQAXfhA93g5Ww47mUIUjwSZJTckMmW7fQy7QL1cEutYX
 N+74++EJhxvX0xuE5WJ2yIvtYgrZU3bhqoF5Sa/4y6VLj4Y+TMs2wencNELQKKXDvK
 qJDGGB3rm8Y8Ez307H6x9IQKrAEp9OLzIURFUUqj3LGkpLkQ9yFCWbVcmjvMKfJjqV
 yd+XJDx7MpEEltqBh3sfRqQU8+SlnT54sk3Mk07YG8orXmFt8BbT7cLGQVxPEkBQJ+
 tJ5r0/FHqSj1Q==
Received: by pdx-korg-bugzilla-2.web.codeaurora.org (Postfix, from userid 48)
 id 31DCA611BD; Sat,  8 May 2021 19:27:12 +0000 (UTC)
From: bugzilla-daemon@bugzilla.kernel.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 51381] [drm:atom_op_jump] *ERROR* atombios stuck in loop for
 more than 5secs aborting, when disabled via vgaswitcheroo
Date: Sat, 08 May 2021 19:27:11 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Video(DRI - non Intel)
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: luca.trombin@gmail.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-51381-2300-4bO7UB3VmU@https.bugzilla.kernel.org/>
In-Reply-To: <bug-51381-2300@https.bugzilla.kernel.org/>
References: <bug-51381-2300@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D51381

--- Comment #58 from Luca T. (luca.trombin@gmail.com) ---
(In reply to luminoso from comment #57)
> For users still facing this issue, I workaround it with this:
> https://github.com/aelveborn/vgaswitcheroo-systemd
>=20
> Basically before suspending it restores the GPU powerstate and resumes it
> once coming from a suspend state.
>=20
> Never had problems again.

Hi Luminoso,

Thanks a lot, I'll try it out and let you know.

Thanks,

Luca

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
