Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C06E0413562
	for <lists+dri-devel@lfdr.de>; Tue, 21 Sep 2021 16:32:15 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1FBFF6E9AC;
	Tue, 21 Sep 2021 14:32:13 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2F8F86E9AC
 for <dri-devel@lists.freedesktop.org>; Tue, 21 Sep 2021 14:32:12 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPS id 07CCB611EF
 for <dri-devel@lists.freedesktop.org>; Tue, 21 Sep 2021 14:32:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1632234732;
 bh=1xr3AvrXh3flSLX3t6PhayljsWxKy1tVGKQCNMAGTng=;
 h=From:To:Subject:Date:In-Reply-To:References:From;
 b=iAZ+9yTjFZ3W4LJ3r7iMeLQ08v3HwtmC2uAEAmPi2m19WAxWjVNVGsm7yzsJePUj5
 G3ULCL57tYXvk7K8m8uVBfJaA/eae+LUi/pC8nF26FFKY/B/fnGJI1d2aLQLbwg1+p
 Cv9tJzhiFcqGfvET1z2JnnEjXu9MAwvXvDK6g09OxuFeT53HTFo/9WtKJkdJG83ZCq
 U6pX7V01G6L9guHbJD97eY2TA7xoIDeZZ6YIjBLpOfi6FPlOjAW4p+bvQFI784c93L
 yj/YU8QoOW2hqfZ1udYmTuMtc+9YD2yDYwiXG3Ll0CZMjLKvpkBefFGR+lEnoZFLMo
 5gKcH5r6HuzCw==
Received: by pdx-korg-bugzilla-2.web.codeaurora.org (Postfix, from userid 48)
 id 037D860F50; Tue, 21 Sep 2021 14:32:12 +0000 (UTC)
From: bugzilla-daemon@bugzilla.kernel.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 211277] sometimes crash at s2ram-wake (Ryzen 3500U): amdgpu,
 drm, commit_tail, amdgpu_dm_atomic_commit_tail
Date: Tue, 21 Sep 2021 14:32:11 +0000
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
Message-ID: <bug-211277-2300-TdVxIz5Enp@https.bugzilla.kernel.org/>
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

--- Comment #67 from James Zhu (jamesz@amd.com) ---
(In reply to youling257 from comment #66)
> resume failed record video,
> https://drive.google.com/drive/folders/1bWMC4ByGvudC9zBk-9Xgamz-
> shir0pqX?usp=3Dsharing

Can you try apply this patch:=20
https://lore.kernel.org/all/20210920163922.313113287@linuxfoundation.org/?

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
