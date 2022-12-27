Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BF307656D14
	for <lists+dri-devel@lfdr.de>; Tue, 27 Dec 2022 17:45:37 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CF84C10E031;
	Tue, 27 Dec 2022 16:45:32 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2629A10E031
 for <dri-devel@lists.freedesktop.org>; Tue, 27 Dec 2022 16:45:30 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 6AB41B80EC3
 for <dri-devel@lists.freedesktop.org>; Tue, 27 Dec 2022 16:45:24 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 2048FC433EF
 for <dri-devel@lists.freedesktop.org>; Tue, 27 Dec 2022 16:45:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1672159523;
 bh=ldOibO73Mh4WTwBrBVNYpC3Y4qb8gQ+nory2ooCcSrc=;
 h=From:To:Subject:Date:In-Reply-To:References:From;
 b=oQVp0K228VaHvZv9ifSXXch9jEfI3GPfP/pS7M/B1gsEYdYranuy67+G+2yC/LC9d
 FvCv7WnOQcB62e8ok3ws0tMhj92lpqPvpxES/AsymxnSSYE9R1O0YVsvsK+3UY5VgA
 1/ftpUkT3oTUiARRTgsN2Zbz/SWjSp6/6UUFwCctuqhZcSxrAxAmUUj00dm1AXlvNm
 ozyxEq8iE+fRChPVYCoTbho3PSSfa09oq4x1xoW5zk6gsl5dc878Z8jH46jV9zbK5A
 OxQ4t2oMpFVfwHpFYXNq0GDtnwgoSdBgIftR+L5wikggBarAkU2efPspAeL8iUmmXU
 9k+Fgx4fjs9jA==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix,
 from userid 48) id 0C646C43144; Tue, 27 Dec 2022 16:45:23 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 216840] AMDGPU trace message at boot
Date: Tue, 27 Dec 2022 16:45:22 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Video(DRI - non Intel)
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: low
X-Bugzilla-Who: alexdeucher@gmail.com
X-Bugzilla-Status: RESOLVED
X-Bugzilla-Resolution: ANSWERED
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: cc
Message-ID: <bug-216840-2300-6ALqe8TPfE@https.bugzilla.kernel.org/>
In-Reply-To: <bug-216840-2300@https.bugzilla.kernel.org/>
References: <bug-216840-2300@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D216840

Alex Deucher (alexdeucher@gmail.com) changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
                 CC|                            |alexdeucher@gmail.com

--- Comment #2 from Alex Deucher (alexdeucher@gmail.com) ---
The trace is related to this option:
amdgpu.vm_update_mode=3D3
You should remove that.  In fact the following parameters shouldn't be need=
ed:

amdgpu.vm_update_mode=3D3 - this should only be used for debugging GPUVM re=
lated
problems.

amdgpu.dpm=3D1 - this is the default

amdgpu.dc=3D1 - Does removing this fix the display issues with HDMI?

amd_iommu=3Don iommu=3Dpt - IOMMU is enabled by default on most distros IIR=
C.

video=3DDisplayPort-0:edid/1204x800.bin - You shouldn't need this if the di=
splays
are detected correctly.  Does removing amdgpu.dc=3D1 fix this?

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
