Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 937B444E558
	for <lists+dri-devel@lfdr.de>; Fri, 12 Nov 2021 12:08:18 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2A1916EABF;
	Fri, 12 Nov 2021 11:08:14 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 737E96EABF
 for <dri-devel@lists.freedesktop.org>; Fri, 12 Nov 2021 11:08:13 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPS id 5383F6103D
 for <dri-devel@lists.freedesktop.org>; Fri, 12 Nov 2021 11:08:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1636715293;
 bh=6pzNNOdrBYYw6Eri8SMw3O3p2KpOHIv0Op3aAak++SA=;
 h=From:To:Subject:Date:In-Reply-To:References:From;
 b=EW+OmeuF7AMODGhVBX52z39/xsPeXzrBkZPfRwxpX5MLSAnzPbbyVZebo+MfLGS7u
 ad7qFMJsngSxXMaOKQ2nuZWmBbGHO5aTUr/RGr2E5zEkG7OmFAOvS+bYzqvr18BoUf
 YX+SSmhu7ImN9XZv6QOkfwc1WJyNofitIIi3Awxi7ZZUv0OANW0j7HR7opnXHK8YTK
 zM3m4yt0aKxNumRY7ozjZ806cgDvt1ymPuw+fdsx0rBHyFDW+KcBw92KfuafQxojh1
 kL0C7wTy2PVo1ngCQKX95Fk1rCyFsuONI8XbnHA34oe8RFJuUY11SF7dZYZp4MMRfa
 Aefam/CjPYH0A==
Received: by pdx-korg-bugzilla-2.web.codeaurora.org (Postfix, from userid 48)
 id 5040660FE7; Fri, 12 Nov 2021 11:08:13 +0000 (UTC)
From: bugzilla-daemon@bugzilla.kernel.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 214621] WARNING: CPU: 3 PID: 521 at
 drivers/gpu/drm/ttm/ttm_bo.c:409 ttm_bo_release+0xb64/0xe40 [ttm]
Date: Fri, 12 Nov 2021 11:08:12 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Video(DRI - non Intel)
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: erhard_f@mailbox.org
X-Bugzilla-Status: RESOLVED
X-Bugzilla-Resolution: DUPLICATE
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-214621-2300-gPVJIKFIlN@https.bugzilla.kernel.org/>
In-Reply-To: <bug-214621-2300@https.bugzilla.kernel.org/>
References: <bug-214621-2300@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D214621

--- Comment #19 from Erhard F. (erhard_f@mailbox.org) ---
(In reply to Lang Yu from comment #18)
> Hi all,
>=20
> I reproduced the issue. Thanks for Erhard F.'s work!
>=20
> The problem is the pinned BO of last call to=20
> amdgpu_display_crtc_page_flip_target() was not unpinned properly.
Thanks for your work on it Lang! I was rather busy and would have been able=
 to
test it out this weekend. But glad you found the cause of the issue anyhow!

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
