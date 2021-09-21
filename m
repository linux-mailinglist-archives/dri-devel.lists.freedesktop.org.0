Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 83F4E4138F4
	for <lists+dri-devel@lfdr.de>; Tue, 21 Sep 2021 19:43:47 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 977DC6E9ED;
	Tue, 21 Sep 2021 17:43:44 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B6DC76E9ED
 for <dri-devel@lists.freedesktop.org>; Tue, 21 Sep 2021 17:43:43 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPS id 8EE01610A0
 for <dri-devel@lists.freedesktop.org>; Tue, 21 Sep 2021 17:43:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1632246223;
 bh=OKmBYk2jGF6g/z7v2Ai5+L7L/xx03iwbX6YWnFwiPJ4=;
 h=From:To:Subject:Date:In-Reply-To:References:From;
 b=Ga0iuHbcEBVr/hHyzLoG0D5c8joyJgNAIhaxtGFveCNnZMLB57A8SnhPtdRp0dLhW
 ohNCR9DwKmydd2mDH+fpHgpJm67ZZiJkedPIzSRmgcGQ/x1EKG5jK2RIJmcwtcimho
 S1H78krymogOktK2fshMZ6tm9ND3dyRfJ7RAF24IU+vP53rw5SfjoFPevISUVW37QR
 F6l5uyQSAfVpgS6xOZOWlWhUcm/tby+NHdlUK1SpF4fu7Ne9w8PYIETlJ2Ek/h1JUP
 shRryxp3hmSJ4IuNkx1FOlj+OJpPK3g48LaY1MJxw/9Ov9VdbkAPPM9DumpI7DbPm3
 dxvKtMI9KfcVg==
Received: by pdx-korg-bugzilla-2.web.codeaurora.org (Postfix, from userid 48)
 id 86BCA60F6B; Tue, 21 Sep 2021 17:43:43 +0000 (UTC)
From: bugzilla-daemon@bugzilla.kernel.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 211277] sometimes crash at s2ram-wake (Ryzen 3500U): amdgpu,
 drm, commit_tail, amdgpu_dm_atomic_commit_tail
Date: Tue, 21 Sep 2021 17:43:42 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Video(DRI - non Intel)
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: youling257@gmail.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-211277-2300-dMVB64DWQb@https.bugzilla.kernel.org/>
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

--- Comment #69 from youling257@gmail.com ---
(In reply to James Zhu from comment #67)
> (In reply to youling257 from comment #66)
> > resume failed record video,
> > https://drive.google.com/drive/folders/1bWMC4ByGvudC9zBk-9Xgamz-
> > shir0pqX?usp=3Dsharing
>=20
> Can you try apply this patch:=20
> https://lore.kernel.org/all/20210920163922.313113287@linuxfoundation.org/?

linux kernel 5.15rc1 is good, suspend to disk resume success.
linux kernel 5.15rc2 is bad, suspend to disk failed.
revert "drm/amdgpu: move iommu_resume before ip init/resume" can suspend to
disk resume success.

linux kernel 5.15rc2 has "drm/amdkfd: separate kfd_iommu_resume from
kfd_resume", why you suggest me apply the patch

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
