Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E267E74970C
	for <lists+dri-devel@lfdr.de>; Thu,  6 Jul 2023 10:04:34 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2A47710E466;
	Thu,  6 Jul 2023 08:04:33 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2B88510E466
 for <dri-devel@lists.freedesktop.org>; Thu,  6 Jul 2023 08:04:31 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 75CEB618B8
 for <dri-devel@lists.freedesktop.org>; Thu,  6 Jul 2023 08:04:30 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id DB7ECC433C7
 for <dri-devel@lists.freedesktop.org>; Thu,  6 Jul 2023 08:04:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1688630669;
 bh=SXGchbtbflqZglrTS8Aopj9uLdItXOKoFWXw2yxBmZo=;
 h=From:To:Subject:Date:In-Reply-To:References:From;
 b=P2CcOrgi/ptAAp8ctjRvW11Vb8VmIPdrttHP9UPT/QijFoumgzZ9quQvnNZ/A08oO
 dz+Wu2pNLvE78ZmYkEWhH0aRTi6nGQ3+GFIe6CYyiXvD2CjenscPwd4c/Szio98VhC
 UUSsUuFGvueWtyNEd3UF6D0JgmveqfhSgoHTGEcdXiFj93B73r+Mlxn8BgSac5bcCJ
 BAaXw82eKyFgEqzdnd2TQn9Aej2Gmbj6L3aEQ4Jq+DWmCU/yKKYoasQS337KpAFhJS
 vDQE4BMf3fl+cAf3cWOSBisqiB/gZQTKDEp4S7eZ0suZD7l8KwjVRu+b7CgYHRbZkp
 9PPe6nCVGrK0g==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix,
 from userid 48) id BED4DC53BD1; Thu,  6 Jul 2023 08:04:29 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 216119] 087451f372bf76d breaks hibernation on amdgpu Radeon R9
 390
Date: Thu, 06 Jul 2023 08:04:29 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Video(DRI - non Intel)
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: h.judt@gmx.at
X-Bugzilla-Status: RESOLVED
X-Bugzilla-Resolution: PATCH_ALREADY_AVAILABLE
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-216119-2300-lReYYjZ7I6@https.bugzilla.kernel.org/>
In-Reply-To: <bug-216119-2300@https.bugzilla.kernel.org/>
References: <bug-216119-2300@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D216119

--- Comment #56 from Harald Judt (h.judt@gmx.at) ---
I think that the issue with VT-switching is not fixed by the commit, but by
another measure, that is switching to a text console before hibernating (the
script I use has an option to do this). This seems to prevent the freezes.

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
