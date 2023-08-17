Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 2839277F192
	for <lists+dri-devel@lfdr.de>; Thu, 17 Aug 2023 09:58:27 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 894FE10E3FE;
	Thu, 17 Aug 2023 07:58:23 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A09B510E3FE
 for <dri-devel@lists.freedesktop.org>; Thu, 17 Aug 2023 07:58:21 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id A901A638F8
 for <dri-devel@lists.freedesktop.org>; Thu, 17 Aug 2023 07:58:20 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 1A942C433C8
 for <dri-devel@lists.freedesktop.org>; Thu, 17 Aug 2023 07:58:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1692259100;
 bh=tljDCQTgXsz9RgvJnp5TDmZ89DcIiX9H5Kbh//k6SxA=;
 h=From:To:Subject:Date:In-Reply-To:References:From;
 b=rjzPEg+cRbqlozCFShrwzIeWQozSZapvYFdyKCvMEgYqFVeA/hKIJ4WcG6jsB6stj
 4P77P7liaO/ISlKsT1DgPq4z08mqzZN+BGJ+IFpgUqtNk8r9KntEAZyc/PFBeuoaTe
 5WJOuiXsF2dQxS8JqWcdAps1tu7gNIekM1Vw0toIdx4dmz68zGJM3u82Jewla2j78E
 BtYIEi7gbsfEnPWaZp91CJMgyFJm0gsZsLjdS3xl8Laq4fzJQdZhbJhvJrL4UiLxzK
 i/x83gT6WC/0Kd6o5ZkuT/HgkgVyXIEw2AA5itrItI5NIa71rQVrR3UkPWRTj2TfXv
 baUBkEO9J4L1w==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix,
 from userid 48) id EF2ACC53BD3; Thu, 17 Aug 2023 07:58:19 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 217664] Laptop doesnt wake up from suspend mode.
Date: Thu, 17 Aug 2023 07:58:19 +0000
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
Message-ID: <bug-217664-2300-HvbJK3hKW7@https.bugzilla.kernel.org/>
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

--- Comment #14 from popus_czy_to_ty (penteljapan@o2.pl) ---
after resume fan is spinning, tried to reconnect over ssh from client its n=
ot
possible.
tlp is not installed. biggest success it was when i played with drivers i w=
as
able to backlight keyboard. now im on stock kubuntu and it doesnt even
backlight keyboard
i used to control mux in nvidia control panel (performance mode- nvidia) on
demand AMD.
I dont use or have any external monitors, so i cant say, propably not, sinc=
e it
doesnt back up network stack.

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
