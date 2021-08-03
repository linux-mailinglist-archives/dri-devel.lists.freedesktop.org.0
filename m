Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E8BB73DF107
	for <lists+dri-devel@lfdr.de>; Tue,  3 Aug 2021 17:03:57 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 118C189C48;
	Tue,  3 Aug 2021 15:03:56 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BA77C89C48
 for <dri-devel@lists.freedesktop.org>; Tue,  3 Aug 2021 15:03:54 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPS id 8F623610FC
 for <dri-devel@lists.freedesktop.org>; Tue,  3 Aug 2021 15:03:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1628003034;
 bh=C+aI8NYJTA4qxGmoOExWnqSDJiOYghyyy7oGAFhQw+o=;
 h=From:To:Subject:Date:In-Reply-To:References:From;
 b=eTYh8r7VwNza6asl8/zWN7kwPoYEM8ATep+IbOB6V7ji4NNv/xIXBbmgQ4bpGW1bB
 wZ2f9gnc6X4UhyHFcWlqFWM0cOYx4FsTG/WYSOUnaAXlhiImPnHU7I7oL4mMuq2cgT
 f3KhaByO8Nz4FufsBxgxdnAT2sUsyI7/+fIus3RUEjDxMmgj7hdn+jJQE6FQAmqWo/
 vsQqnZDvpmb/MpY5oCS8KOL6MRLlq/lkr2TG5kOCnnVp7BkZlj5TB4P+upAhtrrW3L
 tCEuyYnGfDacAWrSILL53tKVDW52Br9eTPCW06mg4qiHAsp9okeE2eqB5KtC0I6lnU
 EQgYFx6CXPFGA==
Received: by pdx-korg-bugzilla-2.web.codeaurora.org (Postfix, from userid 48)
 id 8CA8060EAF; Tue,  3 Aug 2021 15:03:54 +0000 (UTC)
From: bugzilla-daemon@bugzilla.kernel.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 205169] AMDGPU driver with Navi card hangs Xorg in fullscreen
 only.
Date: Tue, 03 Aug 2021 15:03:54 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Video(DRI - non Intel)
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: aladjev.andrew@gmail.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-205169-2300-DYNqhbVcou@https.bugzilla.kernel.org/>
In-Reply-To: <bug-205169-2300@https.bugzilla.kernel.org/>
References: <bug-205169-2300@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D205169

--- Comment #27 from aladjev.andrew@gmail.com (aladjev.andrew@gmail.com) ---
Kernel driver hangs in production using regular usage. Such issues should be
escalated as much as possible: DCN authors and developers meetings, core
developers replacements, driver refactoring/rewrite, tests coverage. But it
works in commercial environment only, open source provides
TIMEOUT_FOR_FLIP_PENDING.

1.5 years passed: TIMEOUT_FOR_FLIP_PENDING is still here and nobody cares, =
and
i am almost sure that nobody will care about it tomorrow.

Thank you.

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
