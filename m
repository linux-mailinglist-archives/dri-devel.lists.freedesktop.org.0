Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D30F257FF52
	for <lists+dri-devel@lfdr.de>; Mon, 25 Jul 2022 14:52:14 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 95B5EAEA62;
	Mon, 25 Jul 2022 12:52:10 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D5DD0AEA38
 for <dri-devel@lists.freedesktop.org>; Mon, 25 Jul 2022 12:52:08 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 5563661128
 for <dri-devel@lists.freedesktop.org>; Mon, 25 Jul 2022 12:52:08 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id BCF64C341C8
 for <dri-devel@lists.freedesktop.org>; Mon, 25 Jul 2022 12:52:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1658753527;
 bh=cmUgyjpAHOUG8ioYEshi2GiXFqP79nxrSVv7l3Y0Cdw=;
 h=From:To:Subject:Date:In-Reply-To:References:From;
 b=qY/aaZsLaKUgeuTEVmBscBSaUguUD8iO5RYf6n9EoROB6rkpZt+gC5Uo5J3n6Vq/+
 sE9zBopSvvDaEDlGHK782YUNQaO+0KyeZ0bjdTaRPWFI224/ILqz3QKIGTeIKw+Ura
 UZVgGsEnjBJVD9MJ2wGrFb9wEjBM/4VdSoavce++WGofV6GY3cRJDMERI73WpYIwES
 1nN9HStIvn9JdHV541AiK/drHlSowr6f1Ml7C85lRCuhkjJ0fhe6DUIpwJ5dpgeU34
 e/tglHXo0zBx0kx/u+lW8nCSfQ8lmL3DwcWzVfBzwAN+l+4QVzmAG1p8JvRc+5nCvp
 pM2R3nBIeHmKw==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix,
 from userid 48) id A8990C05FD2; Mon, 25 Jul 2022 12:52:07 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 216092] rn_vbios_smu_send_msg_with_param+0xf9/0x100 - amdgpu
Date: Mon, 25 Jul 2022 12:52:07 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Video(DRI - non Intel)
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: arek.rusi@gmail.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: cc
Message-ID: <bug-216092-2300-pn5SBOYyRo@https.bugzilla.kernel.org/>
In-Reply-To: <bug-216092-2300@https.bugzilla.kernel.org/>
References: <bug-216092-2300@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D216092

Arek Ru=C5=9Bniak (arek.rusi@gmail.com) changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
                 CC|                            |arek.rusi@gmail.com

--- Comment #5 from Arek Ru=C5=9Bniak (arek.rusi@gmail.com) ---
Hi,=20
I have Asus ROG Zephyrus G15 with cezzane gpu, and this bug occured me too.

I build 5.19-rc8 with reverted:=20

commit c1b972a18d05d007f0ddff31db2ff50790576e92
Author: Oliver Logush <oliver.logush@amd.com>
Date:   Tue Mar 22 10:26:19 2022 -0400

    drm/amd/display: Insert pulling smu busy status before sending another
request

It fixed issue!
@Alex do you need bisecting still for some reason? If yes, ping me please.

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
