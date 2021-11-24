Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3C9BC45B29B
	for <lists+dri-devel@lfdr.de>; Wed, 24 Nov 2021 04:23:06 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6E4C588422;
	Wed, 24 Nov 2021 03:22:58 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 35FBD89247
 for <dri-devel@lists.freedesktop.org>; Wed, 24 Nov 2021 03:22:57 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPS id 040EE60FDC
 for <dri-devel@lists.freedesktop.org>; Wed, 24 Nov 2021 03:22:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1637724177;
 bh=liBBioraE6XRDAE1ac8YcTacD3MLC3G4j++WfusFvZ4=;
 h=From:To:Subject:Date:In-Reply-To:References:From;
 b=NjKr3v8gP2o6+wFG7Slx2a6NrKLymWkEkg0I+MEnuvoepOpv9VKdSmP8TuOLJP1AJ
 OXXIE5WT2sGGQzvY4LAIojMSsD0sQNaTIbZF70uEwLdQr4Viq2bZdot+xHfPmqLfBs
 S7m99+Hwt2G5qVVatoviHwlYaaojslw2VfGmSvjVw/hFPhvRWHsjWKfPRdIhSPRDQa
 6Dy/9z28ngELpQFMEBUN40pBnYp3VOrYqM5owICKDHyZspV+PN8cURD4l30xh1SJA3
 fYb6Gvnq1He8fW7Xr1qwLcoLfoyvPwBdDVPl5tauDemux768DNf56fs21JWroZCy8s
 oaT4UuQDCAQWQ==
Received: by pdx-korg-bugzilla-2.web.codeaurora.org (Postfix, from userid 48)
 id 00ED660F44; Wed, 24 Nov 2021 03:22:57 +0000 (UTC)
From: bugzilla-daemon@bugzilla.kernel.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 211277] sometimes crash at s2ram-wake (Ryzen 3500U): amdgpu,
 drm, commit_tail, amdgpu_dm_atomic_commit_tail
Date: Wed, 24 Nov 2021 03:22:56 +0000
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
X-Bugzilla-Changed-Fields: attachments.created
Message-ID: <bug-211277-2300-5nWOhBZzYy@https.bugzilla.kernel.org/>
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

--- Comment #77 from James Zhu (jamesz@amd.com) ---
Created attachment 299697
  --> https://bugzilla.kernel.org/attachment.cgi?id=3D299697&action=3Dedit
backport patch for 5.10 stable.

Hi @kolAflash, before I send out them to public for review,. could you help
take a test? Thanks so much! James

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
