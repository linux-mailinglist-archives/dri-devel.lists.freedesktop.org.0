Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B876E411313
	for <lists+dri-devel@lfdr.de>; Mon, 20 Sep 2021 12:47:20 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 96BED6E49C;
	Mon, 20 Sep 2021 10:47:16 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CE35F6E49C
 for <dri-devel@lists.freedesktop.org>; Mon, 20 Sep 2021 10:47:14 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPS id 945066115C
 for <dri-devel@lists.freedesktop.org>; Mon, 20 Sep 2021 10:47:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1632134834;
 bh=pnf2JYYW2vFh88KbihODdR5j8BXV/p+oFgafldhxYGg=;
 h=From:To:Subject:Date:In-Reply-To:References:From;
 b=R8UXZ28dp+dxpvt51QbyZKUGZpSawUhizHjJEKwlrPQYRXblx49Ews91TOX3FSFHx
 4tnEopMQ8swKD0J/Mb8xvKwm6Z0RNnOlivavokY/WdI8+3D9JU+3saknbNdhtZIGEW
 HAI0gPazKW3l2et/IF10vyBkSJqP1a2d3USsLBi6FmoASjQbXAFYiuw0BsC8D2mQXS
 0WUBqsCczjexSJvigww3WXNF5C3T/zxrcxI9+UZyw+/jUMCdreVoyUOhIFot1U4yyn
 7rUMHuS6RIQJINdxRn+YzvX6if8wDo6Tk5MnGaXk6UUeK4Q2I+xVZ0tgxOPJHDa6cQ
 hXaRuOaqrdGlg==
Received: by pdx-korg-bugzilla-2.web.codeaurora.org (Postfix, from userid 48)
 id 8FF6360F50; Mon, 20 Sep 2021 10:47:14 +0000 (UTC)
From: bugzilla-daemon@bugzilla.kernel.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 211277] sometimes crash at s2ram-wake (Ryzen 3500U): amdgpu,
 drm, commit_tail, amdgpu_dm_atomic_commit_tail
Date: Mon, 20 Sep 2021 10:47:13 +0000
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
X-Bugzilla-Changed-Fields: cc
Message-ID: <bug-211277-2300-u7YRUnvZ4R@https.bugzilla.kernel.org/>
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

youling257@gmail.com changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
                 CC|                            |youling257@gmail.com

--- Comment #58 from youling257@gmail.com ---
drm/amdgpu: move iommu_resume before ip init/resume cause suspend to disk
resume failed on my amdgpu 3400g.

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
