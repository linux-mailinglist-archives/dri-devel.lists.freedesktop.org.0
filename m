Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8707F3FDD33
	for <lists+dri-devel@lfdr.de>; Wed,  1 Sep 2021 15:34:34 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 54DD66E1D3;
	Wed,  1 Sep 2021 13:34:29 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0A3C56E1D3
 for <dri-devel@lists.freedesktop.org>; Wed,  1 Sep 2021 13:34:28 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPS id B6A5360FC0
 for <dri-devel@lists.freedesktop.org>; Wed,  1 Sep 2021 13:34:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1630503267;
 bh=RIwqmK7BqHwPcAQs14v8z787wlIveFkPS8jLw7ZOA+E=;
 h=From:To:Subject:Date:In-Reply-To:References:From;
 b=VCK9I47xFQPhP+4Usvh5CKvhmQPQknyCIatvTjsmeMKjaBa114faoZ4gGiGa2K2ar
 kFkLdEqzlmkguBfqkyqgxpzTzOMtQ+NAXyK+tUwe8YXCJ2Z686TTrzRvcLpAmMIASo
 YW6yt2JZHRkjXkIPkjMeHAVNgKV932ESfMUcvRnhrOgZT42J844Y93bk9P0TeQ7vcM
 gK+/g0RIpUbPmYfgjLk3KlOccjrmuEG6dLeuE9y7y+rMFky05Am5Xjyqit/nueWcX8
 6obgs8f89qGIEK7QUJSCMn9lXPp6jFtVu1zXxYzd7WzLKsaLLi3ASXuu+osU4fvgRV
 E53CPtmfbP1QA==
Received: by pdx-korg-bugzilla-2.web.codeaurora.org (Postfix, from userid 48)
 id B42DA610CF; Wed,  1 Sep 2021 13:34:27 +0000 (UTC)
From: bugzilla-daemon@bugzilla.kernel.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 211277] sometimes crash at s2ram-wake (Ryzen 3500U): amdgpu,
 drm, commit_tail, amdgpu_dm_atomic_commit_tail
Date: Wed, 01 Sep 2021 13:34:27 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Video(DRI - non Intel)
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: kolAflash@kolahilft.de
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-211277-2300-mq4qg7OTnQ@https.bugzilla.kernel.org/>
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

--- Comment #41 from kolAflash (kolAflash@kolahilft.de) ---
I can confirm Jeromes result.

Bug is gone with pci=3Dnoats.
(Debian-11 kernel 5.10.0-8-amd64)

I ran 50 suspend/standby rounds.
Also I used the notebook for 2 days and suspended it multiple times without
issues.

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
