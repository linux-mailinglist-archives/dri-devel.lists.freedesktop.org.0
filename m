Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C3F50440DAE
	for <lists+dri-devel@lfdr.de>; Sun, 31 Oct 2021 10:46:20 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 32CD5898E4;
	Sun, 31 Oct 2021 09:46:15 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 46A36898E4
 for <dri-devel@lists.freedesktop.org>; Sun, 31 Oct 2021 09:46:14 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPS id D5BB060E8F
 for <dri-devel@lists.freedesktop.org>; Sun, 31 Oct 2021 09:46:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1635673573;
 bh=iBaIdRR3zEv1KldkeDHqLrDHIYL8kXKBdyuXRPEOo9w=;
 h=From:To:Subject:Date:In-Reply-To:References:From;
 b=f5MZMeRghEyJzM93+kdVtN/nu6XEIqtDlvDb41/zHEBQM7MbRB5hf6qUmg1SH8u/E
 heZ60u/OAGlDaFYGL6+pU21iJkiHxNQhK5HQKeidLRfc8gVGpB+npKdr17EVYdzjsV
 JO1Yl0O0V6IPgPwplGKC44DO9uTpncGZ7VQDJURqbzPQBf+gVT+CnpNH1TBzfn+SKh
 nEVPupG1jVaGTIvU7nL8KU2+AibfTuk06r0Zy2kXGi7mqoGMNAL6clbZT4iDrlLaYt
 gSciVMcbIy2BCb4mzRmusNnqO6WxrA+6muCrBePzOIzX2MUmN8z2PDG51mHTx3GN/H
 /D3kaNuk++3cQ==
Received: by pdx-korg-bugzilla-2.web.codeaurora.org (Postfix, from userid 48)
 id C901D60F46; Sun, 31 Oct 2021 09:46:13 +0000 (UTC)
From: bugzilla-daemon@bugzilla.kernel.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 214859] drm-amdgpu-init-iommu~fd-device-init.patch introduce bug
Date: Sun, 31 Oct 2021 09:46:13 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Video(DRI - non Intel)
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: sd@sedf.de
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-214859-2300-zzX3c4A12l@https.bugzilla.kernel.org/>
In-Reply-To: <bug-214859-2300@https.bugzilla.kernel.org/>
References: <bug-214859-2300@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D214859

--- Comment #1 from Sebastian Dalfu=C3=9F (sd@sedf.de) ---
I can confirm this for a
"04:00.0 VGA compatible controller: Advanced Micro Devices, Inc. [AMD/ATI]
Picasso (rev c2)".

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
