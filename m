Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 66DC57F1772
	for <lists+dri-devel@lfdr.de>; Mon, 20 Nov 2023 16:36:29 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4D7E510E414;
	Mon, 20 Nov 2023 15:36:27 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4CCC910E40D
 for <dri-devel@lists.freedesktop.org>; Mon, 20 Nov 2023 15:36:25 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by ams.source.kernel.org (Postfix) with ESMTP id 3EF76B81974
 for <dri-devel@lists.freedesktop.org>; Mon, 20 Nov 2023 15:36:23 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 9510BC433CB
 for <dri-devel@lists.freedesktop.org>; Mon, 20 Nov 2023 15:36:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1700494582;
 bh=4qqPPETGak07jxJBXSkvuwYGkV+7kAlVA9S5Om/aeqs=;
 h=From:To:Subject:Date:In-Reply-To:References:From;
 b=unVFdXc6EtrGrPcjzgh7bGcccUjhpxwCdRZqrVO5reMfx4m0K4XjurbmTKokAtwCd
 BOSCRzqvULgT+AleNSUEg0K2lSctMD7ysoQuTZBlyT7Q3Vq403o7/EV5jvCR+1GdDd
 4WaLMTW055QTdZSKxQz+2S+ETGo0t+yIL9if1ng2b9oxWc+v5e7zF7k7/bj0kuIOZp
 SMc8wFfi5SvF/OG+P5pXjsOSIKeUPD9e9N6Jzw3yCaGOqd5b2X2DlXiFtzv3RLGbvC
 1vLJLY7yQoQwVSTQLtfaxC725EnP+LMfUen9mh4CFtsl0sF1wZ+3EV85E6p9xmmnmE
 YMCQjt+7jx/pw==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix,
 from userid 48) id 7C11CC53BCD; Mon, 20 Nov 2023 15:36:22 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 218168] amdgpu: kfd_topology.c warning: the frame size of 1408
 bytes is larger than 1024 bytes
Date: Mon, 20 Nov 2023 15:36:22 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Video(DRI - non Intel)
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: hamza.mahfooz@amd.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P3
X-Bugzilla-Assigned-To: drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-218168-2300-PkEsJDf02D@https.bugzilla.kernel.org/>
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

--- Comment #1 from hamza.mahfooz@amd.com ---
+ amd-gfx
+ Felix

On 11/20/23 10:16, bugzilla-daemon@kernel.org wrote:
> https://bugzilla.kernel.org/show_bug.cgi?id=3D218168
>=20
>              Bug ID: 218168
>             Summary: amdgpu: kfd_topology.c warning: the frame size of 14=
08
>                      bytes is larger than 1024 bytes
>             Product: Drivers
>             Version: 2.5
>            Hardware: All
>                  OS: Linux
>              Status: NEW
>            Severity: normal
>            Priority: P3
>           Component: Video(DRI - non Intel)
>            Assignee: drivers_video-dri@kernel-bugs.osdl.org
>            Reporter: bluesun654@gmail.com
>          Regression: No
>=20
> Trying to compile Linux 6.6.2 with GCC 13.2.1 and CONFIG_WERROR=3Dy:
>=20
> [...]
> drivers/gpu/drm/amd/amdgpu/../amdkfd/kfd_topology.c: In function
> 'kfd_topology_add_device':
> drivers/gpu/drm/amd/amdgpu/../amdkfd/kfd_topology.c:2082:1: error: the fr=
ame
> size of 1408 bytes is larger than 1024 bytes [-Werror=3Dframe-larger-than=
=3D]
>   2082 | }
>        | ^
> cc1: all warnings being treated as errors
> [...]
>

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
