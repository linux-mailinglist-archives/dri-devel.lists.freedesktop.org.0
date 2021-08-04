Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B738F3E01DD
	for <lists+dri-devel@lfdr.de>; Wed,  4 Aug 2021 15:24:43 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DE7356EA78;
	Wed,  4 Aug 2021 13:24:40 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3B7D36EA78
 for <dri-devel@lists.freedesktop.org>; Wed,  4 Aug 2021 13:24:39 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPS id 16A0560FC3
 for <dri-devel@lists.freedesktop.org>; Wed,  4 Aug 2021 13:24:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1628083479;
 bh=dkFVgzENAhIuMDD3EPKvc4IYVCejszu10vnfgpPMdr0=;
 h=From:To:Subject:Date:In-Reply-To:References:From;
 b=sEG4hDOv9qYoud5qJBLpAI1vildTf4WUCf4kjTIty0WFhFQZNoh8J2u/eEC/B6w95
 sk6RI8sixOfq+KX7+o+FX9kg1sPCTSMTKAvqmSznrk3Ysidy5CWWbAkaVP8GAs723V
 6nEeO/DVetuioh294vBD4uaLhxiFVUlJ8Fg4aQkAAF6olXH3sqVEIRNS79nP9wpHy3
 euNJjeB/IARaB8WsfkQ/hPV/dowY/Dm/xelN7kHQ3IDK3RjERXOP7w3U2PPCTKdcnb
 8CJDF67tQWMUnuv1efgHxBrys3Rya5OfsJI+NjAF1nRnFACWn2LUnx0w79t2Ebq8dv
 uDQuDEVERNu2A==
Received: by pdx-korg-bugzilla-2.web.codeaurora.org (Postfix, from userid 48)
 id 14348603BE; Wed,  4 Aug 2021 13:24:39 +0000 (UTC)
From: bugzilla-daemon@bugzilla.kernel.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 211277] sometimes crash at s2ram-wake (Ryzen 3500U): amdgpu,
 drm, commit_tail, amdgpu_dm_atomic_commit_tail
Date: Wed, 04 Aug 2021 13:24:38 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Video(DRI - non Intel)
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: me@jeromec.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-211277-2300-JMxTvYeWcF@https.bugzilla.kernel.org/>
In-Reply-To: <bug-211277-2300@https.bugzilla.kernel.org/>
References: <bug-211277-2300@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D211277

--- Comment #36 from Jerome C (me@jeromec.com) ---
I've been watching linux-next and noticed that this commit=20

https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git/commit/=
drivers/gpu/drm/amd?id=3D65660ad349fd947feb16b45ff9231f2ceaf44318

was posted on linux-next back between 5.10-5.11, I don't remember but it ke=
eps
getting pushed back and not mainlined...

I think this is why the issues are still here and none of AMD are respondin=
g to
this now since comment 29

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
