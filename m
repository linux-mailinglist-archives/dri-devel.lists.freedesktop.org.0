Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 3401B574A66
	for <lists+dri-devel@lfdr.de>; Thu, 14 Jul 2022 12:17:16 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 12C75A3FFD;
	Thu, 14 Jul 2022 10:17:14 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C1072A4392
 for <dri-devel@lists.freedesktop.org>; Thu, 14 Jul 2022 10:17:12 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 338FA62010
 for <dri-devel@lists.freedesktop.org>; Thu, 14 Jul 2022 10:17:07 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id EB4ABC36AEF
 for <dri-devel@lists.freedesktop.org>; Thu, 14 Jul 2022 10:17:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1657793827;
 bh=87qOys7A8SSOZaxw4Nnl2beVu9FlQzUVyjU+itVoVLc=;
 h=From:To:Subject:Date:In-Reply-To:References:From;
 b=Uohrs3unp0MWfoEFBCqu5Xb4E4Lu9Au29KSdXNEt8sytm7SoI+N2M4fCScO+HeCrr
 sYEiBwbOiCHs9XguJm1tMe+K5JtqoqIMavTe2t61V/cNsroTdxl3PoTa+4imVb2IVQ
 51ESdNtiYEvgjtbWbv493IzoyhBqCRx12/IKtCYpEPHKOKKgPnIKjCrfZF9vZTzwZ3
 qU1CbZHwnA/NaHyVOQMLhJ2AXROOWrZrW/lDeSmTmO6dd83YLfrCfvrCnuj7GPYS2d
 /pTySXS47U5xzLrV1WTZkR3sieh1C4fuJCYBvHSG5nrj+xy6ZOAiWADGdkZreW2nI9
 NXbPyPUOD/iCQ==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix,
 from userid 48) id DB117CC13B9; Thu, 14 Jul 2022 10:17:06 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 201957] amdgpu: ring gfx timeout
Date: Thu, 14 Jul 2022 10:17:04 +0000
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
Message-ID: <bug-201957-2300-Jwf1eUBc4n@https.bugzilla.kernel.org/>
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

--- Comment #81 from Danil (s48gs.w@gmail.com) ---
Nvidia released 515.57 drivers that fix "Nvidia being broken when used as
second GPU in Linux", my bug above.
Nvidia GPU works again when AMD GPU main.

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
