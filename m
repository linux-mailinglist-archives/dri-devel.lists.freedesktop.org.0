Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 08D4872DB2D
	for <lists+dri-devel@lfdr.de>; Tue, 13 Jun 2023 09:41:08 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 43B8610E346;
	Tue, 13 Jun 2023 07:41:04 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1FCF110E345
 for <dri-devel@lists.freedesktop.org>; Tue, 13 Jun 2023 07:41:02 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 89DBE62B45
 for <dri-devel@lists.freedesktop.org>; Tue, 13 Jun 2023 07:41:01 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id EB69AC4339E
 for <dri-devel@lists.freedesktop.org>; Tue, 13 Jun 2023 07:41:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1686642061;
 bh=0d4D9hU84KSWb8ghSAn8i8i63dBsYReRoSvgSGCyz0k=;
 h=From:To:Subject:Date:In-Reply-To:References:From;
 b=JH12O6zNcYyfKRS1TuKPNkHphyZ8cif2RY1BDqWET8WAUqANouVa4anLR9mq8uH6H
 4D/2STY4JI2PQ+yU2+ZRhBIB2SZq49T93YJGVSMzKIR475G43My5P8OCuHGHw2kpOU
 YsNHA/F7ypSVQQXh+ztEdmYqsVluCVlj5pHzaIQs4XijhwAOzPiyFUUlA6Gwz23qjY
 6oqPmdfsiDqiVo4Ud8ckQ/wk49hYAnFOzQsMDJd9JaquaJLbh45HKgNzqiOAUhhRTZ
 3msIOBt+DnWbQqRtoO/EcWIUEeRTbpP0mnCwatovvOTAIzHM7RWIf7Uyz6s671AEbQ
 Itgyf4FSq3gcQ==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix,
 from userid 48) id D4F09C43165; Tue, 13 Jun 2023 07:41:00 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 217545] Serious regression on amdgpu
 (drm_display_helper/drm_dp_atomic_find_time_slots) with two DisplayPort
 connected via a HP G5 docking station
Date: Tue, 13 Jun 2023 07:41:00 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Video(DRI - non Intel)
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: bugzilla.kernel.bpeb@manchmal.in-ulm.de
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P3
X-Bugzilla-Assigned-To: drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-217545-2300-29jffgyjY9@https.bugzilla.kernel.org/>
In-Reply-To: <bug-217545-2300@https.bugzilla.kernel.org/>
References: <bug-217545-2300@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D217545

--- Comment #4 from Christoph Biedl (bugzilla.kernel.bpeb@manchmal.in-ulm.d=
e) ---
Thanks, seems my search-foo didn't find that one.

FWIW, the mentioned fix
https://github.com/jlindgren90/linux/commit/8cf17c25e2d2644fa6dfc3d7de6b3b3=
5689d4db0.patch
solves the problem for me (on top of 6.1.30).

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
