Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 51D0C38974E
	for <lists+dri-devel@lfdr.de>; Wed, 19 May 2021 22:02:18 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6D9506EE85;
	Wed, 19 May 2021 20:02:16 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B88EF6EE85
 for <dri-devel@lists.freedesktop.org>; Wed, 19 May 2021 20:02:15 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPS id 8B6BB61363
 for <dri-devel@lists.freedesktop.org>; Wed, 19 May 2021 20:02:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1621454535;
 bh=EE0JE7ZrCL0tMSMOgE/CjFkxYivTRBTorya9GlcMdhY=;
 h=From:To:Subject:Date:In-Reply-To:References:From;
 b=XkDPRvFAtImEYEtb3f6fiaU+PItz5p0TNhWG7TKiq9pKc0QMBw43vLWjolEI48PlO
 V1nkNRCtsgU4rBj23eeoktXfG3dlqJvn0eLvWeCKgTRvF7bgx9zpyjSMTRGNjXcLY7
 wXYC6MAv0V/VRiZf4jtk0W9BpNrCYZ0vQYnjy1HAQkN+YeAyqZSjXB7aIMd2CsOipQ
 5kCC+hIVg9oxD9Qziif0QpsZl3qHMuBQK80l1VI2xOLfSYOlv+p3xPPY9R40nhdl8O
 hTdUoBx0tZfK2R/LF034XUyoNLsjXry7RN0oC+1L35VUVTWl2SMdeWkySNbtUsaGKY
 2sXxknh1IYZBA==
Received: by pdx-korg-bugzilla-2.web.codeaurora.org (Postfix, from userid 48)
 id 7ED9161262; Wed, 19 May 2021 20:02:15 +0000 (UTC)
From: bugzilla-daemon@bugzilla.kernel.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 211277] sometimes crash at s2ram-wake (Ryzen 3500U): amdgpu,
 drm, commit_tail, amdgpu_dm_atomic_commit_tail
Date: Wed, 19 May 2021 20:02:15 +0000
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
Message-ID: <bug-211277-2300-28Y3ogcbPH@https.bugzilla.kernel.org/>
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

--- Comment #29 from James Zhu (jamesz@amd.com) ---
Hi Jeromec,I think debug turn-on changes a little bit timing. log without d=
ebug
info can't give me any help. The amdgpu_fence_info looks good for all cases.
this issue is possible device specified.

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
