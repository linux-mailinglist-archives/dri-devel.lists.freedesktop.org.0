Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 00034916EE1
	for <lists+dri-devel@lfdr.de>; Tue, 25 Jun 2024 19:10:15 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0B61210E2FF;
	Tue, 25 Jun 2024 17:10:11 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="mo3Svo18";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sin.source.kernel.org (sin.source.kernel.org [145.40.73.55])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5E5A510E6E0
 for <dri-devel@lists.freedesktop.org>; Tue, 25 Jun 2024 17:10:10 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sin.source.kernel.org (Postfix) with ESMTP id 60AE8CE1C4C
 for <dri-devel@lists.freedesktop.org>; Tue, 25 Jun 2024 17:10:08 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 567C0C4AF0B
 for <dri-devel@lists.freedesktop.org>; Tue, 25 Jun 2024 17:10:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1719335407;
 bh=Gn2GOVzmQc1eF6nLtyd0HAnhaGLhCxCMo9D3RmYr43o=;
 h=From:To:Subject:Date:In-Reply-To:References:From;
 b=mo3Svo18msNuBX1Qq5aFYlPQlwSUsS+Iv4jv3uwHaBFqRZmduTSa6tuUyayi/BD5l
 3A6hGG7CuQFsIElnzzE5SQPjJ4MRGob5Gw7cV3jK2fmRvc04KPCAPWLozhYrQuxCaD
 ntSdNrwEhpWMzAc8LFpwLl/ak588eZwy4hG2G80dTcTg1+bNH/NsrI9H7JDt/amRqM
 rAt2h8qaAFpzK2pKI4M+fhAU3+QiPlXODtxYpLFHtmeNVWR22ylYGmrSXeQMT4jC+b
 3ZUTBEZ9pfwg5d1Zejm0N+QyrfQtQIJ3Y1BCEWAALkuNC+wWBlaX7yQG6dr3J3BkEK
 MKrTj1ob+X59A==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix,
 from userid 48) id 4F434C53BB8; Tue, 25 Jun 2024 17:10:07 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 218900] amdgpu: Fatal error during GPU init
Date: Tue, 25 Jun 2024 17:10:06 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Video(DRI - non Intel)
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: blocking
X-Bugzilla-Who: jd.girard@sysnux.pf
X-Bugzilla-Status: RESOLVED
X-Bugzilla-Resolution: CODE_FIX
X-Bugzilla-Priority: P3
X-Bugzilla-Assigned-To: drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: cc
Message-ID: <bug-218900-2300-JWLmtRUWX2@https.bugzilla.kernel.org/>
In-Reply-To: <bug-218900-2300@https.bugzilla.kernel.org/>
References: <bug-218900-2300@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D218900

Jean-Denis Girard (jd.girard@sysnux.pf) changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
                 CC|                            |jd.girard@sysnux.pf

--- Comment #17 from Jean-Denis Girard (jd.girard@sysnux.pf) ---
I seem to have a similar problem on 6.10-rc5 after suspend. I get a black
screen on resume.

[  269.157149] amdgpu 0000:02:00.0: amdgpu: reserve 0x400000 from 0xf41f800=
000
for PSP TMR
[  269.159956] iommu ivhd0: AMD-Vi: Event logged [ILLEGAL_DEV_TABLE_ENTRY
device=3D0000:02:00.0 pasid=3D0x00000 address=3D0x131400000 flags=3D0x0180]
[  269.159960] AMD-Vi: DTE[0]: 6190000000000003
[  269.159962] AMD-Vi: DTE[1]: 00001001049e000b
[  269.159963] AMD-Vi: DTE[2]: 200000013c610013
[  269.159963] AMD-Vi: DTE[3]: 0000000000000000
[  269.160104] amdgpu 0000:02:00.0: amdgpu: failed to load ucode SDMA0(0x1)=
=20
[  269.160108] amdgpu 0000:02:00.0: amdgpu: psp gfx command LOAD_IP_FW(0x6)
failed and response status is (0xF)

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
