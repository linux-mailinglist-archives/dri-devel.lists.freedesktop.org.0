Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2C3C945FEB6
	for <lists+dri-devel@lfdr.de>; Sat, 27 Nov 2021 14:03:24 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 11F656E0DB;
	Sat, 27 Nov 2021 13:03:20 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 2907 seconds by postgrey-1.36 at gabe;
 Sat, 27 Nov 2021 13:03:19 UTC
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A1EC66E0DB
 for <dri-devel@lists.freedesktop.org>; Sat, 27 Nov 2021 13:03:19 +0000 (UTC)
Received: from mail.kernel.org (unknown [198.145.29.99])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id DB34360DD5
 for <dri-devel@lists.freedesktop.org>; Sat, 27 Nov 2021 13:03:18 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPS id 21AD560C41
 for <dri-devel@lists.freedesktop.org>; Sat, 27 Nov 2021 13:03:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1638018198;
 bh=22J6/pEVgg6aPEjRAo+/nNMkVx1MZGhg5ZdCBw6kRVg=;
 h=From:To:Subject:Date:In-Reply-To:References:From;
 b=o5Vce7JPcT/wJfuRHs/E+awUBtqewjVGHYm2hvzCYuXpqCMIhFdKfMctlRu56qfsl
 kEhB4eAZ8JspK/nVm3dI82W9B5fqw9LpAVSSvZ6XL7Xg1YrhoKGoNdtiN6V4ZZvH64
 CB1D0nYed0dNUgNiKN6b2F8lNd2qo/n2/h5TMu+fmtSbs/Aojio0V92f8IA2v+z39F
 okwK4PRTQftXFajbH/2lsFzuBQrFRPxWPqwZOxChGmLeWx9ri2T/QXqrImwZKzv3Yr
 GannyFx2bYiqVMDYe6XWflfIOQggrglS2J3Q3WM+NkUiArXIUluTdna0Su1WdeaRSg
 3mxFlBYriMWQA==
Received: by pdx-korg-bugzilla-2.web.codeaurora.org (Postfix, from userid 48)
 id 1BAC160EE3; Sat, 27 Nov 2021 13:03:18 +0000 (UTC)
From: bugzilla-daemon@bugzilla.kernel.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 211277] sometimes crash at s2ram-wake (Ryzen 3500U): amdgpu,
 drm, commit_tail, amdgpu_dm_atomic_commit_tail
Date: Sat, 27 Nov 2021 13:03:17 +0000
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
Message-ID: <bug-211277-2300-fgiD81u5Eq@https.bugzilla.kernel.org/>
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

--- Comment #84 from kolAflash (kolAflash@kolahilft.de) ---
@James

I was able to compile!

Looks like this was some fault of mine.
(I'm usually building out of source directory and did something wrong...)

Now I'm testing the current v5.10.82 with the provided attachment 299697
patches.

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
