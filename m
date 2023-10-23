Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 88BFC7D3D65
	for <lists+dri-devel@lfdr.de>; Mon, 23 Oct 2023 19:22:14 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0876B10E192;
	Mon, 23 Oct 2023 17:22:10 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8290F10E17D
 for <dri-devel@lists.freedesktop.org>; Mon, 23 Oct 2023 17:22:08 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id A3BB36263B
 for <dri-devel@lists.freedesktop.org>; Mon, 23 Oct 2023 17:22:07 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 698C9C433B6
 for <dri-devel@lists.freedesktop.org>; Mon, 23 Oct 2023 17:22:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1698081727;
 bh=0viYSLvBpfVO5MJpLFKSPTRstra+LsViJYZCq0lbhmA=;
 h=From:To:Subject:Date:In-Reply-To:References:From;
 b=K4ENEGGCSf78eQWB0YG3b/BT94wF8wWX1UicDR05BHVKGsOYoJxVcZ1dlvXXchYcV
 lQRanWL5vjxOcUY91HM5HozJflurq+wGrUdnGYkrHLHRbq14SymWDEnRLdLWAK+n07
 iKts4ikRS535EuLAt+lM4hKHgsC1e/uNzWCpVvd4Zr4H2N2/tKbZtvIEtTHk4wf1UA
 LDvSu8PrjM9/Le6F9nH813tAkm9VUgflpfa6Jeo24a/hbRPnN5wxjsxGfDSbePddji
 eDnoPQtMVXVMpF8U+XeSRRuDJS7PXYCPyAu9Dofib98NPYL5usZKepNJI8KBHu4noC
 DG6duf+SxeQbg==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix,
 from userid 48) id 5A25EC53BCD; Mon, 23 Oct 2023 17:22:07 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 201957] amdgpu: ring gfx timeout
Date: Mon, 23 Oct 2023 17:22:04 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Video(DRI - non Intel)
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: blocking
X-Bugzilla-Who: mario.limonciello@amd.com
X-Bugzilla-Status: RESOLVED
X-Bugzilla-Resolution: ANSWERED
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: cc
Message-ID: <bug-201957-2300-lsvRVEOWpX@https.bugzilla.kernel.org/>
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

Mario Limonciello (AMD) (mario.limonciello@amd.com) changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
                 CC|                            |mario.limonciello@amd.com

--- Comment #99 from Mario Limonciello (AMD) (mario.limonciello@amd.com) ---
#98

The amdgpu.mcbp=3D0  will only help GFX9 products.  For GFX10 this is a dif=
ferent
problem, please open at AMD Gitlab.

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
