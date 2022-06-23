Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0154C5577D8
	for <lists+dri-devel@lfdr.de>; Thu, 23 Jun 2022 12:26:29 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C992910EFF2;
	Thu, 23 Jun 2022 10:26:26 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7791D10EFF2
 for <dri-devel@lists.freedesktop.org>; Thu, 23 Jun 2022 10:26:25 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id D408E61E94
 for <dri-devel@lists.freedesktop.org>; Thu, 23 Jun 2022 10:26:24 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id A7106C341CB
 for <dri-devel@lists.freedesktop.org>; Thu, 23 Jun 2022 10:26:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1655979984;
 bh=pMJFIjQ39ubBJSKxN3lYMyzoLkSeFTMbCd8QO1ebf0g=;
 h=From:To:Subject:Date:In-Reply-To:References:From;
 b=mqPXPy6RQSBCSO4XKT5Z6HrPgIrLOAk9vFDN3N0PXEhaK9f7UzY2Ae4LH/PUO1oHF
 4TTqXmdFq3yugZhzAcB1xxUw1+W3jBcdnTPHGPiqrU1sGymkJR2jK976ssrVK6Eupa
 +vQJQCYEcqRgN6Pkn20JbjKkHxrH5X09+MjGLssqcF3bdgqoSCbIbpN3PrBQbaoaAE
 dn51EqrCl7ChI3BST+NjsmCP1HVR++oqCr1D/iAffmV5YcwR5KuD5vgwAcc4gu//+5
 MpO4UpoirdRA+2u0HSlEw3AIlyW0tnEvT4Rg5a1VuC/P2xNcoGhL3oX1POj06FJDI/
 0nX56RZik56zQ==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix,
 from userid 48) id 97A63CAC6E2; Thu, 23 Jun 2022 10:26:24 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 201957] amdgpu: ring gfx timeout
Date: Thu, 23 Jun 2022 10:26:21 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Video(DRI - non Intel)
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: blocking
X-Bugzilla-Who: s48gs.w@gmail.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-201957-2300-qE9OHHUjuz@https.bugzilla.kernel.org/>
In-Reply-To: <bug-201957-2300@https.bugzilla.kernel.org/>
References: <bug-201957-2300@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D201957

--- Comment #76 from Danil (s48gs.w@gmail.com) ---
Wine problem - this happened because (how/why/when)
'/usr/share/vulkan/icd.d/nvidia_icd.json' file was deleted... no idea how a=
nd
why this happened when AMD GPU drops its FPS(obviously this file exists whe=
n I
use just Nvidia GPU with integrated AMD disabled)

so fix for wine gonna be -
"VK_ICD_FILENAMES=3D/usr/share/vulkan/icd.d/radeon_icd.x86_64.json winecfg"=
=20

super weird, so wine problem fixed I think

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
