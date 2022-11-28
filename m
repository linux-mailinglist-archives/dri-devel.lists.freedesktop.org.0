Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 3175163A31A
	for <lists+dri-devel@lfdr.de>; Mon, 28 Nov 2022 09:31:48 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8FE4C10E2BD;
	Mon, 28 Nov 2022 08:31:44 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 31FFA10E2B4
 for <dri-devel@lists.freedesktop.org>; Mon, 28 Nov 2022 08:31:40 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id A00EF60F56
 for <dri-devel@lists.freedesktop.org>; Mon, 28 Nov 2022 08:31:39 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 12B94C433D6
 for <dri-devel@lists.freedesktop.org>; Mon, 28 Nov 2022 08:31:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1669624299;
 bh=noA8XcuzjceAvrbDcDlWN2e1AIjwLXFU+o8HbuKIg1U=;
 h=From:To:Subject:Date:In-Reply-To:References:From;
 b=oakKhwTUunsMw8cjQOQrlNkUhy51EiWpobq5FNx7uK9w3XP4PdET1N2QRjbfN+K64
 I6U/YUQhqy5Q6qCDpCYP9pjymFaVV6M3MoO+e0hcCzDOwANKAUd7Pk1Q5V33wtLO3D
 SlB0vGaNdjvNsvNzbVc3Aml8D8rtPxmUDccESk9FOKTtQhdFGbpoaFHjC7nZYpClHp
 IY6YhimGgNOUH0iRCBeAaO82QKJKR+HuPaQDpA6Ftuu2ZzzOyJPmVAnIC+Tq+e0FkQ
 TabVifn7t7B5tXYBTu7IuOH7/YAPicg5lZoUiE5DN/q+A9e+7XGYYlP5BGQBd0VJez
 iE/FzpDY22SZg==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix,
 from userid 48) id 016CAC433E7; Mon, 28 Nov 2022 08:31:38 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 216745] Kernel 6.1 breaks Thinkpad T14 Gen 2 AMD connection to
 USB-C dock Gen 2 with kernel Null pointer
Date: Mon, 28 Nov 2022 08:31:38 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Video(DRI - non Intel)
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: ezou@outlook.com
X-Bugzilla-Status: RESOLVED
X-Bugzilla-Resolution: OBSOLETE
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-216745-2300-Md8dllM790@https.bugzilla.kernel.org/>
In-Reply-To: <bug-216745-2300@https.bugzilla.kernel.org/>
References: <bug-216745-2300@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D216745

--- Comment #6 from Eric Zou (ezou@outlook.com) ---
Hi Thorsten
Thanks for your attention. I will give you an update here:

I tried rc7 asap it was out as tarball. rc7 contains code changes that I
mentioned in https://gitlab.freedesktop.org/drm/amd/-/issues/2171 , and it
contains exactly the patches as they discussed on that thread and predictio=
n of
what will work and not after the push to upstream to catch the release.

And my rc7 running result is a match of the progress so far from them. Allo=
w me
to copy paste my post from yesterday:

-------------------------------------
1. The kernel crashed is gone so at least I don't need to force poweroff wh=
en
plug in the usb c cable to my USB-C dock Gen 2 (40AS)

2. Now my two monitors (FHD, connected to HDMI port on dock and FHD, connec=
ted
to DP port on dock) just don't detect that there is signal incoming.

3. (As a result of kernel crashed is gone) I can just unplug the cable and =
my
laptop just come back normally.
-------------------------------------

And thus the reason I believe I can close this one and follow them instead.

Sincerely
Eric

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
