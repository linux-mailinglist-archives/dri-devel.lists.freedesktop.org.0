Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 2DADA7E8946
	for <lists+dri-devel@lfdr.de>; Sat, 11 Nov 2023 05:55:53 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 631A710E24C;
	Sat, 11 Nov 2023 04:55:51 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7F0DB10E24C
 for <dri-devel@lists.freedesktop.org>; Sat, 11 Nov 2023 04:55:49 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by ams.source.kernel.org (Postfix) with ESMTP id 1BD50B82425
 for <dri-devel@lists.freedesktop.org>; Sat, 11 Nov 2023 04:55:48 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 752CEC433C7
 for <dri-devel@lists.freedesktop.org>; Sat, 11 Nov 2023 04:55:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1699678547;
 bh=RNz8+wLfN7mMovr7bxPFZJKrGzZeqXpfbt3dRv7pSsc=;
 h=From:To:Subject:Date:In-Reply-To:References:From;
 b=hQm+gDmCUEll4qdvCM9LKyNpsD4lRmUQG7AVWVWyzVfmENv6+jVBi4Luiw+Wa7wnE
 NUVkBSBCL+nfwo9h/4nXOuMRRG6FE+pw5t1WpTBikbQKE80cTyMXjDe5Cco3i9mQki
 YVaRQHvDUHNktNKt12/DQGNm65EcUZv7hvwy3cCWcawwiNm00K2eYRnk14L0EbPWPA
 H6dihCH/f6EbpbnRZLSsrP3cLI020gezu72+wvoyndyFQNMdk9T8HAoifaOwwmU+DN
 tvT3/KnBHa/PavxtBp+yzneHM0mHixxliIpIFEHCtszlJONsPDTkpAgrk6Dw79pZvc
 jNXy+kvqS/mtA==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix,
 from userid 48) id 65D98C53BD0; Sat, 11 Nov 2023 04:55:47 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 218133] kernel panic when opening spotify/firefox 6.5.0.10.12
 ubuntu 23.10  vega 64
Date: Sat, 11 Nov 2023 04:55:47 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Video(DRI - non Intel)
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: mpollind@gmail.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P3
X-Bugzilla-Assigned-To: drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: short_desc
Message-ID: <bug-218133-2300-oEIEisP9eC@https.bugzilla.kernel.org/>
In-Reply-To: <bug-218133-2300@https.bugzilla.kernel.org/>
References: <bug-218133-2300@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D218133

Michael Pollind (mpollind@gmail.com) changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
            Summary|kernel panic when opening   |kernel panic when opening
                   |spotify/firefox 6.5.0.10.12 |spotify/firefox 6.5.0.10.12
                   |ubuntu 23.10                |ubuntu 23.10  vega 64

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
