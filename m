Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 37524662BBB
	for <lists+dri-devel@lfdr.de>; Mon,  9 Jan 2023 17:52:52 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9E8EF10E449;
	Mon,  9 Jan 2023 16:52:47 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C671210E449
 for <dri-devel@lists.freedesktop.org>; Mon,  9 Jan 2023 16:52:45 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 64269B80E80
 for <dri-devel@lists.freedesktop.org>; Mon,  9 Jan 2023 16:52:44 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 1146CC433EF
 for <dri-devel@lists.freedesktop.org>; Mon,  9 Jan 2023 16:52:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1673283163;
 bh=+f4r70/OtclECn4htcOI9KhrJz432/Lx4HqFi9tjikU=;
 h=From:To:Subject:Date:In-Reply-To:References:From;
 b=MenQ6GwkaHwqwx0nuwHnnFb4A+B5qPvAKmlOo3BHUNZ7FDmtSrhp0kda2Dvw+WUTR
 5adk4M422a7E5WUTFmQAFK/+q+/8uG5O2GA3oqlOYcobUv/IcZTdBpCfTQXm1BiE0l
 OKRD2OpAtCKoLebR5mejtMCAcvi3Zj6pFHeU9mTCxsiGZo96i7bUpAExKwQ/Sh0nrG
 OhC9PJoCiCAt+1RDiHauKM/PA/ybTxz3xCLhFZf24G6jLq9q5ZRtq/o/I0zFMjTpJG
 xyPVxxgSiCXoiuBKuJ5v0vupnkDC0GnbOnnpRumgq7yJY/qW+31hS68jybxUDjc1rc
 Fvv8mSq5WeNgA==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix,
 from userid 48) id C7DC8C43141; Mon,  9 Jan 2023 16:52:42 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 211189] vgaarb overrides boot device unexpectedly with Intel
 and discrete AMDGPU
Date: Mon, 09 Jan 2023 16:52:41 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Video(DRI - non Intel)
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: edurayasmedina@outlook.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: cc attachments.created
Message-ID: <bug-211189-2300-GL9njh3rkb@https.bugzilla.kernel.org/>
In-Reply-To: <bug-211189-2300@https.bugzilla.kernel.org/>
References: <bug-211189-2300@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D211189

Eduardo Medina (edurayasmedina@outlook.com) changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
                 CC|                            |edurayasmedina@outlook.com

--- Comment #4 from Eduardo Medina (edurayasmedina@outlook.com) ---
Created attachment 303560
  --> https://bugzilla.kernel.org/attachment.cgi?id=3D303560&action=3Dedit
dmesg from Intel Alder Lake + Radeon RX 580

Hi. Is there any progress? I get this when I run the "switcherooctl list"
command on my Intel Alder Lake system with a RX 580 GPU.

Device: 0
  Name:        Advanced Micro Devices, Inc. [AMD=C2=AE/ATI] Ellesmere [Rade=
on RX
470/480/570/570X/580/580X/590] (Nitro+ Radeon RX 570/580/590)
  Default:     yes
  Environment: DRI_PRIME=3Dpci-0000_01_00_0

Device: 1
  Name:        Intel Corporation AlderLake-S GT1
  Default:     no
  Environment: DRI_PRIME=3Dpci-0000_00_02_0

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
