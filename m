Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A5C087877CF
	for <lists+dri-devel@lfdr.de>; Thu, 24 Aug 2023 20:29:50 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2B5C310E5AE;
	Thu, 24 Aug 2023 18:29:46 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6AB8B10E5AE
 for <dri-devel@lists.freedesktop.org>; Thu, 24 Aug 2023 18:29:44 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id B5633674F8
 for <dri-devel@lists.freedesktop.org>; Thu, 24 Aug 2023 18:29:43 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 295E7C433CB
 for <dri-devel@lists.freedesktop.org>; Thu, 24 Aug 2023 18:29:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1692901783;
 bh=sLz2Ph3MdQdtpuC3Pah0q8zw2b7P2oO+76AxEeGGwbA=;
 h=From:To:Subject:Date:In-Reply-To:References:From;
 b=FTr235JuVsC29IFoBPnecbMJH/rTHqkGsKJBm7qYQ+xGKg2bSom09EufvpOdeHAdO
 wFaNux5vrNnv5eAETj4rMbek14+VpkzLqIiw47BJ+BwfW6F2XVaHfidqJ2VKX981UV
 ZIvpi04vid1ySVCBIGYrXx8F+ajSDsfTQX/isPop3IL76VLuLcmbuVuwVLyP4DLxXH
 UEVdj4KvISjYOCn2BBXuKCuTkiFhRGfLPus2CEDJTcGqs/wz+IOyohfkvz+3iJyHxX
 z9sehLf7Huzb8JJsap9gGMaIwkW1JZHZb8vNHU2Y2EyPj/VwUvU0NVCI9zmZN9leLD
 jlTkLpVv0hcyA==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix,
 from userid 48) id 156DDC53BD4; Thu, 24 Aug 2023 18:29:43 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 217664] Laptop doesnt wake up from suspend mode.
Date: Thu, 24 Aug 2023 18:29:42 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Product: ACPI
X-Bugzilla-Component: Power-Sleep-Wake
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: high
X-Bugzilla-Who: mario.limonciello@amd.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P3
X-Bugzilla-Assigned-To: drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-217664-2300-H3EuXycIfg@https.bugzilla.kernel.org/>
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

--- Comment #28 from Mario Limonciello (AMD) (mario.limonciello@amd.com) ---
> https://mega.nz/file/OoBmED6L#6Tw4c1kwsUirYXK_XQ7pw6vtLyghrho8MMyB5rzmYYw=
 -
> ppa install
> https://mega.nz/file/3gRwgDyD#trmYYtnvYSP8z03U4Ggr3BvKFG-KFMOjhJvGnowBjFU=
 -
> kern log
> https://mega.nz/file/X8gjCZJB#go4CsVkVdbtQNAlWcgEhshci8SGSe4bjYqeDyBQESLg=
  -
> journalctrl (be aware huge spam batch)

Please attach your logs directly to kernel Bugzilla.  I can't access this
resource.

> https://www.youtube.com/watch?v=3Dd8z1gjoIoUk  symptom is exactly same as=
 on
> kernel 6.2.xxx, maybe few more complains in console.

This looks "like" what I would expect happens when you don't have
nouveau/nvidia blacklisted to me, but I don't know for sure since I can't
access your logs.

Please also look in /var/lib/systemd/pstore to see if anything was captured.

As this is s2idle not s3, can you reproduce it under the context of this
script?
https://gitlab.freedesktop.org/drm/amd/-/blob/master/scripts/amd_s2idle.py

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
