Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id F2245580222
	for <lists+dri-devel@lfdr.de>; Mon, 25 Jul 2022 17:46:34 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 80147C07D0;
	Mon, 25 Jul 2022 15:46:29 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from ams.source.kernel.org (ams.source.kernel.org
 [IPv6:2604:1380:4601:e00::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 87216C07D0
 for <dri-devel@lists.freedesktop.org>; Mon, 25 Jul 2022 15:46:27 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 1CDB7B80F02
 for <dri-devel@lists.freedesktop.org>; Mon, 25 Jul 2022 15:46:26 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id CFFD8C341CE
 for <dri-devel@lists.freedesktop.org>; Mon, 25 Jul 2022 15:46:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1658763984;
 bh=Bmb0mJ+/bknjf4PS1nZZ/LHSTVbUP/4XFwz0jIYXgGs=;
 h=From:To:Subject:Date:In-Reply-To:References:From;
 b=i2zmZuODwVeiU8mYkOhKuQUUkDqZxyFhtKfIgERZVq7deb2JgyiZ2TlV6GJ3EIHGQ
 9mbmvk/B159eLRbcCGSdSgm/pVhN2GydhMZaVWTi3dymCHdkxG/iwEXrdEctZlp3YH
 MUkIDRpKWUgV+xGzvus7QzxCxwDGz3f2PwnbhdPBjd3Dn3bthsmFM6jdpn7hpUZrhY
 LijufpJvkaruoaThjEyM3V17U5x7AC8CRMckHdKIWW+5Ozpqpqj8by/TWQG77cpZhg
 dgNaQw/jOn0MokYhVg3OuVaAFY3eK3K8ZvD8lO8RpTF0h/Fs80t+7yNwRXUF3IZlze
 +pRghGIUn/Wgw==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix,
 from userid 48) id B1AE2CC13B5; Mon, 25 Jul 2022 15:46:24 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 216277] X11 doesn't wait for amdgpu driver to be up
Date: Mon, 25 Jul 2022 15:46:24 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Video(DRI - non Intel)
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: alexdeucher@gmail.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: cc
Message-ID: <bug-216277-2300-PIT1WEnzG5@https.bugzilla.kernel.org/>
In-Reply-To: <bug-216277-2300@https.bugzilla.kernel.org/>
References: <bug-216277-2300@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D216277

Alex Deucher (alexdeucher@gmail.com) changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
                 CC|                            |alexdeucher@gmail.com

--- Comment #3 from Alex Deucher (alexdeucher@gmail.com) ---
Maybe the driver or firmware is not available in your initrd so the driver
can't be loaded during boot?

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
