Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9334478B759
	for <lists+dri-devel@lfdr.de>; Mon, 28 Aug 2023 20:39:40 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1403910E0BF;
	Mon, 28 Aug 2023 18:39:37 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F085210E0BF
 for <dri-devel@lists.freedesktop.org>; Mon, 28 Aug 2023 18:39:34 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 6642163E38
 for <dri-devel@lists.freedesktop.org>; Mon, 28 Aug 2023 18:39:34 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id CE375C433CA
 for <dri-devel@lists.freedesktop.org>; Mon, 28 Aug 2023 18:39:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1693247973;
 bh=lK4gkNrjcjhlXC5nA7PteBsgYsyJpDmsvuGKV1CIeNM=;
 h=From:To:Subject:Date:In-Reply-To:References:From;
 b=MQy1fGFbv+Xzo0mg3pG7/CeEKJA9O8DX2uS9n1w/ayR8XHF/J6raWt6GPRs8KrPP5
 94x+3tuoYPs9+z2b0wsFNaosbl2HEt8fxkCzRR1hWcxg0xXgUlt8lirz+FeLvJe3Sa
 Yj0Zdxfles8YbbWujSPK9Au8djI28sTpeVLd0FjTy8npdKdjXKGlY+AI2S48lAnRye
 C61O8a2x1gifM5OGVJMJLBS29kKMfgmdhqebLUHn75Ri3zMpfl4vJfHHlzhOr8CHZS
 gCE9ENy3CxGiz3CbEsuQdnMSOkDh7TqMp/ky4xgMuc2yW7BBSho2fBJzoTHogu/JPZ
 TAyF//YCrm7ng==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix,
 from userid 48) id B3F9CC53BCD; Mon, 28 Aug 2023 18:39:33 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 217664] Laptop doesnt wake up from suspend mode.
Date: Mon, 28 Aug 2023 18:39:32 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Product: ACPI
X-Bugzilla-Component: Power-Sleep-Wake
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: high
X-Bugzilla-Who: penteljapan@o2.pl
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P3
X-Bugzilla-Assigned-To: drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-217664-2300-eOkkT8u6Ac@https.bugzilla.kernel.org/>
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

--- Comment #40 from popus_czy_to_ty (penteljapan@o2.pl) ---
1) sorry for very long spam but im not into compiling own kernel too much,
first https://cateee.net/lkddb/web-lkddb/SATA_MOBILE_LPM_POLICY.html i seen
that page what you wrote then i stopped on
https://davidaugustat.com/linux/how-to-compile-linux-kernel-on-ubuntu step =
`$
cp -v /boot/config-$(uname -r) .config` , which it gaves me
CONFIG_SATA_MOBILE_LPM_POLICY=3D3 potentially in both cases (make localmodc=
onfig
) aswell
2) sata is itself kubuntu 23.04, i will try to install that on main nvme (a=
fter
how to learn build from source not from distro

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
