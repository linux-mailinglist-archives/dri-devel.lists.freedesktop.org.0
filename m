Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4A9DE3F7B3C
	for <lists+dri-devel@lfdr.de>; Wed, 25 Aug 2021 19:09:42 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0694E6E3E3;
	Wed, 25 Aug 2021 17:09:39 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BB4E06E3E3
 for <dri-devel@lists.freedesktop.org>; Wed, 25 Aug 2021 17:09:37 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPS id 8DB7B6109D
 for <dri-devel@lists.freedesktop.org>; Wed, 25 Aug 2021 17:09:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1629911377;
 bh=eKNhLB1uPWf6iZO+Esqakj3hSrRONIhZnxKlMrSlcO4=;
 h=From:To:Subject:Date:In-Reply-To:References:From;
 b=bDyQg5Y5at/zB9w9u6pkwSEOymvaswAKRdJECJgmuHnthpK8ZrcSEn+9+adw+Xgc3
 03jrHgfaUHJNQ+lgTf8qmYbYmrdgFu+PRM63DPNd8DB3dWqXDKSXtYcgiMhrdOFUe5
 aLwYjMwLc0e8xaaBIxD2CHLZ9VSZ/F8b2L9uwyM1jwHbgKkRLFoEtWjql1q/LMQmYe
 27AadxCGJIOwff6vDQ47OlC017tcYu/RydTVGIKVooapMosUaPk9LQ1lZVftPXTpak
 ljaXSKgGU+KQzTAG8G1kSi2loYxgjLSg4SD+7U7giPfszE09o5myPUXFq6gmHievpK
 eLnr7QWBHlfjg==
Received: by pdx-korg-bugzilla-2.web.codeaurora.org (Postfix, from userid 48)
 id 8AE1B60FF1; Wed, 25 Aug 2021 17:09:37 +0000 (UTC)
From: bugzilla-daemon@bugzilla.kernel.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 211277] sometimes crash at s2ram-wake (Ryzen 3500U): amdgpu,
 drm, commit_tail, amdgpu_dm_atomic_commit_tail
Date: Wed, 25 Aug 2021 17:09:37 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Video(DRI - non Intel)
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: jamesz@amd.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-211277-2300-8y06SgQgE7@https.bugzilla.kernel.org/>
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

--- Comment #40 from James Zhu (jamesz@amd.com) ---
Hi Jerome,
Yes, you are right.Turning off ats will affect iommu. KFD needs iommu enabl=
e.
KFD supports computing engine. It won't affect 3D and video acceleration. A=
fter
I confirm if ats/iommu causes the issue, I will find right person to fix it.
Thanks!
James

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
