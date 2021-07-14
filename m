Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id DF68A3C8B24
	for <lists+dri-devel@lfdr.de>; Wed, 14 Jul 2021 20:43:48 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 297FE6E483;
	Wed, 14 Jul 2021 18:43:45 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C09276E48B
 for <dri-devel@lists.freedesktop.org>; Wed, 14 Jul 2021 18:43:44 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPS id 95457613D4
 for <dri-devel@lists.freedesktop.org>; Wed, 14 Jul 2021 18:43:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1626288224;
 bh=zftqZMavLA4BdS/hj1Snl+82h3ZFQnAaagFjfzypoDg=;
 h=From:To:Subject:Date:In-Reply-To:References:From;
 b=POh+qg+ZwSeF69zru5FbF9mLRhfchxWGMlmZgSQB+jHeJgulfR/nsBRQdhOGrJV7c
 Lf/bo7fEPqHyVZx+ExCAn2NlKZ3TQ3ZDDRFDw74InsMSY59+sbforNpBuWNuso1KYV
 9exeZCCpLFHcCNsWHNfN/EPS/0QyWZdn2SxTb93w5+toYzdWi+cGSWq3WWE2ykQMwu
 91ZMIhN9WA3up6aYRK+4yew3WfRAugGyVDS+reJDLHwOYPTKGLsHcVrBPn6Hru2xlz
 HNJRLc2wBr754kIvpZQOxX7wpAkRPFoTAagvfoc5rMhTA9lVkef/OtV9RQLTnH2SZj
 Yqr9MuTHqnFYg==
Received: by pdx-korg-bugzilla-2.web.codeaurora.org (Postfix, from userid 48)
 id 91B2E6129C; Wed, 14 Jul 2021 18:43:44 +0000 (UTC)
From: bugzilla-daemon@bugzilla.kernel.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 209457] AMDGPU resume fail with RX 580 GPU
Date: Wed, 14 Jul 2021 18:43:43 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Video(DRI - non Intel)
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: alexdeucher@gmail.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-209457-2300-2CH2pGKeEy@https.bugzilla.kernel.org/>
In-Reply-To: <bug-209457-2300@https.bugzilla.kernel.org/>
References: <bug-209457-2300@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D209457

--- Comment #38 from Alex Deucher (alexdeucher@gmail.com) ---
(In reply to Leandro Jacques from comment #37)
> (In reply to Alex Deucher from comment #32)
> As you asked about the firmware version details, I upgraded my
> linux-firmware package to see if the problem would come back and it came
> back. So, this time, I could attatch the kernel log for the amdgpu driver
> and the amdgpu firmware versions details as of the crash event to narrow
> down the issue. By now, I'll return to the older version to make my system
> stable again.

You have a Picasso system.  The original bug was about an RX 580.  I don't
think this is the same issue.  Sounds like you are seeing this issue:
https://lists.freedesktop.org/archives/amd-gfx/2021-July/066452.html

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
