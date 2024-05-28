Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1C18D8D22EB
	for <lists+dri-devel@lfdr.de>; Tue, 28 May 2024 20:01:51 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A977310EFC9;
	Tue, 28 May 2024 18:01:47 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="ij/Xsbbp";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sin.source.kernel.org (sin.source.kernel.org [145.40.73.55])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4CABF10EFC9
 for <dri-devel@lists.freedesktop.org>; Tue, 28 May 2024 18:01:44 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sin.source.kernel.org (Postfix) with ESMTP id 1AFDECE140D
 for <dri-devel@lists.freedesktop.org>; Tue, 28 May 2024 18:01:41 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 4C625C32789
 for <dri-devel@lists.freedesktop.org>; Tue, 28 May 2024 18:01:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1716919300;
 bh=SYu+uspRR5O+1gbgwIr08bIQKtmoxW8wL+meQNvIISU=;
 h=From:To:Subject:Date:In-Reply-To:References:From;
 b=ij/XsbbpR4SVGU80CqK0tNC92Os9pUC8eoN2qF9l2tNGp6Xs6ltVNONGynLn5S5ML
 IIPV+yaEmRiu/SdgIbWGL+XSM2CmE3scVmUonlre+Cx+B0jeOR/cfh2hukQ2cXgM+8
 LS4JLyc7bSlgbrnTrP3zGcPIFmV++3ApJagFOmlqqvKSSzTgu1hAZq2UbrWOZ+EZQS
 sEi4X+zG/HlmOE/MNnGLZJgcdSE2TaA6QcyMMUrrA2EWzZkVkUYg8eJwJ85S0nexrw
 2dHng1L57dmbxOkwTa+8UlOaTsFyr/uhf3J/RXdfFI7SYBOk4dvZcVaiI710L/kHzf
 rNR4/6eZpnz8Q==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix,
 from userid 48) id 41FD3C53BB8; Tue, 28 May 2024 18:01:40 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 218900] amdgpu: Fatal error during GPU init
Date: Tue, 28 May 2024 18:01:39 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Video(DRI - non Intel)
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: blocking
X-Bugzilla-Who: mario.limonciello@amd.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P3
X-Bugzilla-Assigned-To: drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: cc
Message-ID: <bug-218900-2300-eAADsI5KaC@https.bugzilla.kernel.org/>
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

Mario Limonciello (AMD) (mario.limonciello@amd.com) changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
                 CC|                            |mario.limonciello@amd.com

--- Comment #4 from Mario Limonciello (AMD) (mario.limonciello@amd.com) ---
Possibly the same as this report:

https://lore.kernel.org/all/20240527192159.GEZlTdV7OoOuJrHmI0@fat_crate.loc=
al/

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
