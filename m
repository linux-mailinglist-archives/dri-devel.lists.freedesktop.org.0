Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 375D33B384A
	for <lists+dri-devel@lfdr.de>; Thu, 24 Jun 2021 23:04:04 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B46E66E071;
	Thu, 24 Jun 2021 21:04:00 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E60366E071
 for <dri-devel@lists.freedesktop.org>; Thu, 24 Jun 2021 21:03:58 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPS id BD79F613C8
 for <dri-devel@lists.freedesktop.org>; Thu, 24 Jun 2021 21:03:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1624568638;
 bh=bEvuKdiA2IZept0vCx0TnWhC8ioM/WTsd6mgM+mJa4o=;
 h=From:To:Subject:Date:In-Reply-To:References:From;
 b=UsjdzKBc1V/ZydjhZe4AG/6yKuYZRAr0bIqSpgg/X+WvomTGAM3Z5BskT2E0yrYfF
 kvbzv6vti8a86knYtgLrHfLTeXTR6XVFnJCVTi/I87k4H06egzD5i2TIIWJYu5cYsy
 XvB1Ed1xuQZ0QCYSQJSBLsd7Ftf5s+5Es8g2A7Il4d3ZESr5VhVCKi5n9Vbnem6o6W
 bs3AB4fYWfQRRav8vNVRLSF5/iqL3Rz2OF9ArJKPOF49KEwaZ/CLX3UQjEEKfmemA7
 BtM1XFZioQ8Y9BwQsgJy3LdgbrsGifuNcI3R9vOx6JOMDcHKjE9z+PkE+K3Y4hEd8y
 VIi9HaADeX85w==
Received: by pdx-korg-bugzilla-2.web.codeaurora.org (Postfix, from userid 48)
 id BAD356112E; Thu, 24 Jun 2021 21:03:58 +0000 (UTC)
From: bugzilla-daemon@bugzilla.kernel.org
To: dri-devel@lists.freedesktop.org
Subject: =?UTF-8?B?W0J1ZyAyMTIxMDddIFRlbXBlcmF0dXJlIGluY3JlYXNlIGJ5IDE1?=
 =?UTF-8?B?wrBDIG9uIHJhZGVvbiBncHU=?=
Date: Thu, 24 Jun 2021 21:03:58 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Video(DRI - non Intel)
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: blocking
X-Bugzilla-Who: mileikasjos@mailbox.org
X-Bugzilla-Status: REOPENED
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: cc
Message-ID: <bug-212107-2300-3tweparLTV@https.bugzilla.kernel.org/>
In-Reply-To: <bug-212107-2300@https.bugzilla.kernel.org/>
References: <bug-212107-2300@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D212107

miloog (mileikasjos@mailbox.org) changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
                 CC|                            |mileikasjos@mailbox.org

--- Comment #11 from miloog (mileikasjos@mailbox.org) ---
I can confirm.

But in a different scenario. I'm using debian bullseye with lts kernel and
latest amdgpu firmware. I don't change any fan control mechanism.

5.10.44 and 5.10.45 works fine but 5.10.46 if i'm only start sway (wayland
window manager) my gpu usage is at 100% without doing anything.

It's a vega 56.

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
