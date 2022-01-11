Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E2E5448ACD6
	for <lists+dri-devel@lfdr.de>; Tue, 11 Jan 2022 12:42:54 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B2DAC10E41C;
	Tue, 11 Jan 2022 11:42:50 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from ams.source.kernel.org (ams.source.kernel.org
 [IPv6:2604:1380:4601:e00::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A9C6D10E41C
 for <dri-devel@lists.freedesktop.org>; Tue, 11 Jan 2022 11:42:49 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 71541B818B8
 for <dri-devel@lists.freedesktop.org>; Tue, 11 Jan 2022 11:42:48 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 17D1CC36AE3
 for <dri-devel@lists.freedesktop.org>; Tue, 11 Jan 2022 11:42:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1641901367;
 bh=YCZ46moryaR19RyTCGD+qjcvzCqOrj1Jq1n8wQPF3y8=;
 h=From:To:Subject:Date:In-Reply-To:References:From;
 b=ipW8gQxPkq2mnWv5kyDEHW6sWV3whzU95sj0FQ2e3AxybkyaBsQRxnCEK24lezPDd
 03wfJTJxUbTup7XOdsdrIoxzv4uh1HvtvZETNMfhi2fw4kyNS5c4xhs7IL/HOXfccV
 XSHqz1GU/CiZPaZ5Us3cNkvVHM8LQjlFBDk84PFKThvMEKCUfEjqI48XrBe/4dUIsW
 L1/HH4anL3g7swQlF1c1PbhFH4UfRq7/sO+All4XL1wq8fIujLsEBvh3Vba8cOecRJ
 ahYMoDlnM7f040Iu3n3ZJXTAgLJZ/sJ5qQRQhIP6ZNB6VZgDf473pRovIR7oezngbm
 sDV1AtbNz2Hcg==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix,
 from userid 48) id E282EC05FF3; Tue, 11 Jan 2022 11:42:46 +0000 (UTC)
From: bugzilla-daemon@bugzilla.kernel.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 215445] AMDGPU -- UBSAN: invalid-load in amdgpu_dm.c:5882:84 -
 load of value 32 is not a valid value for type '_Bool'
Date: Tue, 11 Jan 2022 11:42:46 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Video(DRI - non Intel)
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: talktome7468@gmail.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: cc
Message-ID: <bug-215445-2300-bCkAD5r6Zj@https.bugzilla.kernel.org/>
In-Reply-To: <bug-215445-2300@https.bugzilla.kernel.org/>
References: <bug-215445-2300@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D215445

talktome7468@gmail.com changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
                 CC|                            |talktome7468@gmail.com

--- Comment #6 from talktome7468@gmail.com ---
UBSAN is enabled for the 5.15 kernels since 5.15.8. It is not enabled for t=
he
5.16 kernels. Check the build log files to confirm that ubsan.o is linked i=
nto
the kernel for 5.15, but not 5.16.


Also check out the discussion in
https://gitlab.freedesktop.org/drm/amd/-/issues/1779.

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
