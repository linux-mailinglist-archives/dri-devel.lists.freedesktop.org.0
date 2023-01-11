Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id F156F666625
	for <lists+dri-devel@lfdr.de>; Wed, 11 Jan 2023 23:23:36 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0127810E2C2;
	Wed, 11 Jan 2023 22:23:35 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from ams.source.kernel.org (ams.source.kernel.org
 [IPv6:2604:1380:4601:e00::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7728010E2C2
 for <dri-devel@lists.freedesktop.org>; Wed, 11 Jan 2023 22:23:33 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 0CBA5B81D7B
 for <dri-devel@lists.freedesktop.org>; Wed, 11 Jan 2023 22:23:32 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id B42F0C433EF
 for <dri-devel@lists.freedesktop.org>; Wed, 11 Jan 2023 22:23:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1673475810;
 bh=Ua/zKvXuiQiNuqcswmfZN4InaW82ewwH4pGgHnoCYEc=;
 h=From:To:Subject:Date:In-Reply-To:References:From;
 b=FhcWW0MGgDqz1Dh6ia2S92O6yCP1psp643PW1+11jXRzBTN1LQSCCT9JFdRh7la7F
 HbmAPZyW0Ei7i9JOP0cxxfblWD2CXbGuXqpvNmHt9Xst1ZHWwOe7h8gkSiG0mf3Cdo
 9kzEHJ7iujiXS3cJLOeE+871gAn5XkaCm+ZR+JAwtWRlUwyj2wJVvwvhBsDYhiLkXQ
 x/QsdX2rAHtrscsqP/j07s9SEXZ1bSAWaOHUOyTKvKf8DGn8lVGgBfDGOmVEt0Ufur
 7NAClhy1JtRW34uaErRbRNwkllD4e3QIlonRkGuHaDmRRaXr7SVBoCqaSgpwDA2zAy
 IYdxbCUGCGPfw==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix,
 from userid 48) id 9DFA7C43142; Wed, 11 Jan 2023 22:23:30 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 216917] hibernation regression since 6.0.18 (Ryzen-5650U incl.
 Radeon GPU)
Date: Wed, 11 Jan 2023 22:23:30 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Video(DRI - non Intel)
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: kolAflash@kolahilft.de
X-Bugzilla-Status: ASSIGNED
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: attachments.created
Message-ID: <bug-216917-2300-LrdHsck1vf@https.bugzilla.kernel.org/>
In-Reply-To: <bug-216917-2300@https.bugzilla.kernel.org/>
References: <bug-216917-2300@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D216917

--- Comment #6 from kolAflash (kolAflash@kolahilft.de) ---
Created attachment 303585
  --> https://bugzilla.kernel.org/attachment.cgi?id=3D303585&action=3Dedit
6.1.4 dmesg after hibernation

(In reply to Mario Limonciello (AMD) from comment #4)
> [...]
> Is it 100% failure rate on 6.0.y?

Yes.


> Since you mentioned that you couldn't effectively use 6.1.y because of the
> MST issue, are you only finding it on 6.0.y when connected to a dock or
> anything else unique?

No.

Happens with dock, with simple USB-C power (no dock) and on battery.


> > Sadly I don't know how to provide helpful logs. After reboot there's
> nothing
> > helpful in /var/log/messages
>=20
> Can you check /var/lib/systemd/pstore?  Perhaps there was a kernel crash
> that got saved into NVRAM and restored by systemd on the next boot.

Sadly that file doesn't exist.
There are some files in /sys/fs/pstore/. But nothing from today.


(In reply to Alex Deucher from comment #5)
> Can you attach your dmesg output?

I don't know how to get logs (including dmesg) when hibernation has failed.
As said, after reboot there's nothing new in /var/log/messages

Instead I attached dmesg after hibernation with v6.1.4. Is that helpful?



Another thing:
Is it important that my SWAP is a file /swap on an ext4 partition inside a =
LUKS
partition?

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
