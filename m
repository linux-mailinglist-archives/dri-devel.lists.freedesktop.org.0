Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8CE8B471EA2
	for <lists+dri-devel@lfdr.de>; Mon, 13 Dec 2021 00:11:42 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B6CE410F7E0;
	Sun, 12 Dec 2021 23:11:39 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0C2E910F7E0
 for <dri-devel@lists.freedesktop.org>; Sun, 12 Dec 2021 23:11:38 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 09934B80D97
 for <dri-devel@lists.freedesktop.org>; Sun, 12 Dec 2021 23:11:35 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 85E6BC341CE
 for <dri-devel@lists.freedesktop.org>; Sun, 12 Dec 2021 23:11:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1639350692;
 bh=4lfa/jYJIbuh79f6rKoK+WnBf0ygC8eD3Kb1CvibW3E=;
 h=From:To:Subject:Date:In-Reply-To:References:From;
 b=JouCEK2W3z/ZOedBSIc+XbfWtrzf2JM5XjKMdqIdhr/AtXZMejnl6upUuUbo5x0i6
 UON5VSdPpyq0GNMDPi/KZRXW74JOVWGEPqyYtO7/rcnH3H3W38IS1dN1Gfq9UPgpur
 qYc02gSmK7jGxZyIjLwZY+UalutTElti25sHdKB875UJKf0IkFyNrTYPhYJdgmb1Sl
 SiK9HnAJIIUCod/FYsAju0HLHN8AygWXA5qKOcpD+I3Iutl5mBhPsxtcojC1B3S56l
 UpToTyZyEchPFrRA3fBX3Cr71onHMN5Ab4SPe17g6n1M9+YM84dkubfZnNiYx3NPJ1
 mbOdiwy7Vls6w==
Received: by pdx-korg-bugzilla-2.web.codeaurora.org (Postfix, from userid 48)
 id 7614960FD9; Sun, 12 Dec 2021 23:11:32 +0000 (UTC)
From: bugzilla-daemon@bugzilla.kernel.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 215315] [REGRESSION BISECTED] amdgpu crashes system suspend -
 NUC8i7HVKVA
Date: Sun, 12 Dec 2021 23:11:32 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Video(DRI - non Intel)
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: lenb@kernel.org
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: christian.koenig@amd.com
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: cc assigned_to cf_regression
Message-ID: <bug-215315-2300-IJgHzg7qhC@https.bugzilla.kernel.org/>
In-Reply-To: <bug-215315-2300@https.bugzilla.kernel.org/>
References: <bug-215315-2300@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D215315

Len Brown (lenb@kernel.org) changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
                 CC|                            |alexdeucher@gmail.com,
                   |                            |andrey.grodzovsky@amd.com
           Assignee|drivers_video-dri@kernel-bu |christian.koenig@amd.com
                   |gs.osdl.org                 |
         Regression|No                          |Yes

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
