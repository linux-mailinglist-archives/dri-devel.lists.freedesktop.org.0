Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9AFAB546A14
	for <lists+dri-devel@lfdr.de>; Fri, 10 Jun 2022 18:04:37 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A69E410E079;
	Fri, 10 Jun 2022 16:04:35 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8D3F710E079
 for <dri-devel@lists.freedesktop.org>; Fri, 10 Jun 2022 16:04:34 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id EF505B83630
 for <dri-devel@lists.freedesktop.org>; Fri, 10 Jun 2022 16:04:32 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id A5F18C3411B
 for <dri-devel@lists.freedesktop.org>; Fri, 10 Jun 2022 16:04:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1654877071;
 bh=R0UTm/lt1wO6HEAfK8Y9mG5nQzCFvTjYR+sWLf+MD28=;
 h=From:To:Subject:Date:In-Reply-To:References:From;
 b=ahI1vdsF6UMgICfvpwzJtkcXHDTva1e+f+MbmC3KIa/7YHYImKITuW82tc9bnwWwj
 vRXIG2DJ2d5wLOe0D3rZcJMy7yjR5Uvtdoya+0fU1B090HgC4lMT1J/+/58IRPro/P
 r9PBvYnN8j2kYFwlF+Mw0c6uo2nJmV/YMweDctQ2ilRSn7MSnmb0vhSkAERsAsTKw0
 Njr/gNYFW8gLAry0pcaFeYjbq3dTUJc7IufXMIzxLd8QqlJ9/hRulynnqoHB+0F8C3
 qdwlmudUI8sYWHdeCTvLEIupv51oicFwJERIhywrMf+/ZHwXbysQqCiI6MuLywIo1t
 exv5MlobllZog==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix,
 from userid 48) id 8B9DCC05FD2; Fri, 10 Jun 2022 16:04:31 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 210301] *ERROR* IB test failed on gfx (-110) on Ryzen 4750u
Date: Fri, 10 Jun 2022 16:04:31 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Video(DRI - non Intel)
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: alexdeucher@gmail.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: cc
Message-ID: <bug-210301-2300-QprJP48mze@https.bugzilla.kernel.org/>
In-Reply-To: <bug-210301-2300@https.bugzilla.kernel.org/>
References: <bug-210301-2300@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D210301

Alex Deucher (alexdeucher@gmail.com) changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
                 CC|                            |alexdeucher@gmail.com

--- Comment #2 from Alex Deucher (alexdeucher@gmail.com) ---
Please attach your full dmesg output.  Does iommu=3Dpt help?  Sounds like p=
erhaps
there are sbios bugs around the IOMMU on your platform.  Can you try a newer
sbios?

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
