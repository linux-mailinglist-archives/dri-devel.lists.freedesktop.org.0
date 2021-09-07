Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E851B4024AE
	for <lists+dri-devel@lfdr.de>; Tue,  7 Sep 2021 09:47:57 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 62BCC898F3;
	Tue,  7 Sep 2021 07:47:54 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CB2E7898F3
 for <dri-devel@lists.freedesktop.org>; Tue,  7 Sep 2021 07:47:52 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPS id A69FD6112D
 for <dri-devel@lists.freedesktop.org>; Tue,  7 Sep 2021 07:47:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1631000872;
 bh=5fWtCB9Mj6UTx7DDx5mPYnx0a1KZJajcSEiKmT8Typo=;
 h=From:To:Subject:Date:In-Reply-To:References:From;
 b=EliAOvCEd3oWliMiTQ/o8ON1UTqJjfjENVmDFC/Fu3WD6GnE8YhdDxGHGL4Z72miz
 o6UVD3ibM972fB7kiiREFRgB9lOtaqI2uFMdHa79sCFpUw4kacjlwx1la1CdGYnPtp
 73/p/D66mTd6GcOix7n2ejKUwpIku7H50XrNAdGP+gsll6Uv8L3S7y1yFvocwhnhmG
 QGevB1Tw5QVmdzjDOn0/oWO71BqGIF1EaykzNts0Gs3QmwfU9ZAXN3ay9wNnL1Brcl
 vlu0HpgRlDsNgjbnO5CPF1ULozFi/v2g47siJlpHJ5LyYV6PvaWvSbFgnT/YTHMEb1
 E6oyMz/IXsFTQ==
Received: by pdx-korg-bugzilla-2.web.codeaurora.org (Postfix, from userid 48)
 id A391460FC4; Tue,  7 Sep 2021 07:47:52 +0000 (UTC)
From: bugzilla-daemon@bugzilla.kernel.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 211277] sometimes crash at s2ram-wake (Ryzen 3500U): amdgpu,
 drm, commit_tail, amdgpu_dm_atomic_commit_tail
Date: Tue, 07 Sep 2021 07:47:52 +0000
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
Message-ID: <bug-211277-2300-L2gA7hfkWj@https.bugzilla.kernel.org/>
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

--- Comment #56 from Jerome C (me@jeromec.com) ---
damn, sorry for the ugly message layout replies

I didn't realize my e-mail provider was doing that

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
