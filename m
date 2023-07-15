Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 24CDB75493D
	for <lists+dri-devel@lfdr.de>; Sat, 15 Jul 2023 16:16:50 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8B1CA10E0EC;
	Sat, 15 Jul 2023 14:16:47 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 82F2A10E0EC
 for <dri-devel@lists.freedesktop.org>; Sat, 15 Jul 2023 14:16:45 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id A549C60ADB
 for <dri-devel@lists.freedesktop.org>; Sat, 15 Jul 2023 14:16:43 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 160FCC433C7
 for <dri-devel@lists.freedesktop.org>; Sat, 15 Jul 2023 14:16:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1689430603;
 bh=BEAFOW7g97TT2rXb67yEnh2W94Kh+iNtJ2b9gdcgwps=;
 h=From:To:Subject:Date:In-Reply-To:References:From;
 b=dmYMtRADMYE3AwZx9E9q/k87uExf9H1lN9aXbWxyeu416M7Rm/oQh1/qk8mpBYk6d
 RjdajQEbDWSPjvRS/9C4lvbozm3MJ1yOaw08yEfbmsZn1oNTCp2dG/McPwsFF+JyUD
 p5Uk5O8DiXHiXFHbLMLbshwsx9K2vAtrrlOipQiTdM/ak/6EJfT0mZLtSXQG2G4uLW
 NyCy+H8SO7CbtobD7uG9+WGoPYGvnXCAg2dJujXaGeCpOSBalMJoX27JwaofF+J72/
 k+vOlTjJPrZIvlahqk4QjvA06LSlLHubGM2+GhtFq5nF988aJ7KTsiGyJshUu+eJ7E
 DC5Ww+I8V+clQ==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix,
 from userid 48) id F062EC53BD0; Sat, 15 Jul 2023 14:16:42 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 217664] Laptop doesnt wake up from suspend mode.
Date: Sat, 15 Jul 2023 14:16:42 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Video(DRI - non Intel)
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: penteljapan@o2.pl
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P3
X-Bugzilla-Assigned-To: drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-217664-2300-64tBDqjDzK@https.bugzilla.kernel.org/>
In-Reply-To: <bug-217664-2300@https.bugzilla.kernel.org/>
References: <bug-217664-2300@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D217664

--- Comment #5 from popus_czy_to_ty (penteljapan@o2.pl) ---
https://www.youtube.com/shorts/vuCrMdrtGdU - video of symptom
BOE NV156FHM-N4G -display model
NVIDIA-SMI 525.125.06   Driver Version: 525.125.06   CUDA Version: 12.0

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
