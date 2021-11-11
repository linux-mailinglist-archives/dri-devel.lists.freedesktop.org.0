Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B4CA144DA28
	for <lists+dri-devel@lfdr.de>; Thu, 11 Nov 2021 17:14:49 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C118C6E463;
	Thu, 11 Nov 2021 16:14:44 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 872EE6E0EC
 for <dri-devel@lists.freedesktop.org>; Thu, 11 Nov 2021 16:14:42 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPS id 3F3A661502
 for <dri-devel@lists.freedesktop.org>; Thu, 11 Nov 2021 16:14:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1636647282;
 bh=6mbQypAbDSqH+p8/03p6creDARKlRf1507/b4q9MafQ=;
 h=From:To:Subject:Date:In-Reply-To:References:From;
 b=DmkVdzMtnLteMy5b82oQ0hQbtJ+JO45venQ9abnmMynXG/X4Ncs85Iu8ZZboV9Gub
 bg4QCY78/KFePASi2BZ1Uz/ZOoHGtbi2xYvCUBto8w7APJfRTVrWxYMTHUq35/Lmpd
 s+V56mZ050wYrDwdm89kELpYn+FrRO4Bd7PaFCllq6GMcyR46SaCw+KrEpoHnlff9H
 BwzQDqL9m/5ycaM1ev4xSQCkr9LYIEwkcAsaGmObISc11WhEn6bZ0RdzlcO6IxYouO
 eYMjSzTOcYtSxo6TkUutO7YX+nJOZ00Ttcz7K2S7fYQKgo4I2ykZNVUFWUbrFzwga2
 DUiSg+AnIPhdg==
Received: by pdx-korg-bugzilla-2.web.codeaurora.org (Postfix, from userid 48)
 id 3C82F60FED; Thu, 11 Nov 2021 16:14:42 +0000 (UTC)
From: bugzilla-daemon@bugzilla.kernel.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 205089] amdgpu : drm:amdgpu_cs_ioctl : Failed to initialize
 parser -125
Date: Thu, 11 Nov 2021 16:14:41 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Video(DRI - non Intel)
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: jlouis.espinosa@gmail.com
X-Bugzilla-Status: RESOLVED
X-Bugzilla-Resolution: CODE_FIX
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: cc
Message-ID: <bug-205089-2300-bmnoysDZTY@https.bugzilla.kernel.org/>
In-Reply-To: <bug-205089-2300@https.bugzilla.kernel.org/>
References: <bug-205089-2300@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D205089

Joey Espinosa (jlouis.espinosa@gmail.com) changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
                 CC|                            |jlouis.espinosa@gmail.com

--- Comment #21 from Joey Espinosa (jlouis.espinosa@gmail.com) ---
That didn't fix it for me. I'm having the exact same issue (same behavior,
anyway), and I'm on linux-firmware 20211027-126.fc35 (Fedora 35).

I started experiencing it after an update a few days ago, and I thought may=
be
upgrading the OS from 34 -> 35 would maybe fix it. It didn't.

OS: Fedora 35
CPU: Ryzen 5950X
GPU: RX 6900 XT

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
