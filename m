Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AAF1F7F2F38
	for <lists+dri-devel@lfdr.de>; Tue, 21 Nov 2023 14:50:21 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4046010E4AE;
	Tue, 21 Nov 2023 13:50:17 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from ams.source.kernel.org (ams.source.kernel.org
 [IPv6:2604:1380:4601:e00::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 568CE10E4AE
 for <dri-devel@lists.freedesktop.org>; Tue, 21 Nov 2023 13:50:15 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by ams.source.kernel.org (Postfix) with ESMTP id ACDF2B82150
 for <dri-devel@lists.freedesktop.org>; Tue, 21 Nov 2023 13:50:13 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 0EB60C433C9
 for <dri-devel@lists.freedesktop.org>; Tue, 21 Nov 2023 13:50:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1700574613;
 bh=+TMsVRWxbQc2/GEmIKn1/4DeBXLDmJaAXItBDUSsPP4=;
 h=From:To:Subject:Date:In-Reply-To:References:From;
 b=HCNodY2WTL9ofY8UtBtxV3SRV5W7jo+aHoItrkR23ZMMhpkw9LPMbc0EYai50C5xZ
 gMPF9TT09l6dZlIsqvoEQGP/uYzgGZBBWYSiI8JVhfYqHNyB2hhiscP0xI6SGFlNHO
 R+EybhcOze92xVEXxdnTGePBjILvdkcRh0K8AHaQAFKNJS4E0h1sLCUzG+XIXOiooL
 gPc3PIZ5iRNdskFkJtIgTF8BnRdwPammJpUxg2di/73FV+gZFfe6y+gRJSAw70gyEN
 fx/xO6oTVPuPaQLetkDPoRW532fNxh1LuxJpLM5JZ/03d+hgzIE5jjv1hPdBpn+60P
 8rn9pWLnkZMHQ==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix,
 from userid 48) id EE63FC53BD1; Tue, 21 Nov 2023 13:50:12 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 218168] amdgpu: kfd_topology.c warning: the frame size of 1408
 bytes is larger than 1024 bytes
Date: Tue, 21 Nov 2023 13:50:12 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Video(DRI - non Intel)
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: aros@gmx.com
X-Bugzilla-Status: RESOLVED
X-Bugzilla-Resolution: ANSWERED
X-Bugzilla-Priority: P3
X-Bugzilla-Assigned-To: drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-218168-2300-KLHYg0DwhT@https.bugzilla.kernel.org/>
In-Reply-To: <bug-218168-2300@https.bugzilla.kernel.org/>
References: <bug-218168-2300@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D218168

--- Comment #4 from Artem S. Tashkinov (aros@gmx.com) ---
Fixed by=20

https://gitlab.freedesktop.org/drm/amd/uploads/26580b07cb9c763a0b840b9d705e=
0338/0001-drm-amdkfd-reduce-stack-size-in-kfd_topology_add_dev.patch

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
