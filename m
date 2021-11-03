Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 68C52444448
	for <lists+dri-devel@lfdr.de>; Wed,  3 Nov 2021 16:07:43 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1847A73645;
	Wed,  3 Nov 2021 15:07:39 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F20DE73644
 for <dri-devel@lists.freedesktop.org>; Wed,  3 Nov 2021 15:07:37 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPS id C849460FC4
 for <dri-devel@lists.freedesktop.org>; Wed,  3 Nov 2021 15:07:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1635952057;
 bh=JVTXzm7p5qNy1Boxxi+ZEqm4QEQXFDxrFGljrjQh4L8=;
 h=From:To:Subject:Date:In-Reply-To:References:From;
 b=HNFxW++Fi2Uzy8dBrR+q3TuOfaXmSd7q+YGFgPt5pADipa4DIJ8fn8xWvj1Hki/k7
 l9u8CcaDElhYK89VcBmpHVyOT/fZyyYfBK2cAAnfSqaxAhE7ERFMZ6mjIpaVX+quox
 rJLr7leMZFYs+LdqG1Y2s3OvebLdZMWcC/E+arTPLCWp2vQ7tllKBiSyQhtuZAUMdQ
 F++h6+JNHQIEm2xCiKHmUj76WqqXTvBPWktRQWUJbmMAPlU3HRuDFsC8tzPvNCCoPG
 EeEwVEFR129TEPBgqStBnlmi/nWs39w7MVsInEetB+svuWhagmPQ41nrMOCdT5XZ7E
 pqu4wYPpda5ZQ==
Received: by pdx-korg-bugzilla-2.web.codeaurora.org (Postfix, from userid 48)
 id C562160F46; Wed,  3 Nov 2021 15:07:37 +0000 (UTC)
From: bugzilla-daemon@bugzilla.kernel.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 214029] [bisected] [amdgpu] Several memory leaks in amdgpu and
 ttm
Date: Wed, 03 Nov 2021 15:07:37 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Video(DRI - non Intel)
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: jan.steffens@gmail.com
X-Bugzilla-Status: RESOLVED
X-Bugzilla-Resolution: CODE_FIX
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: cc
Message-ID: <bug-214029-2300-OkQbYEVclE@https.bugzilla.kernel.org/>
In-Reply-To: <bug-214029-2300@https.bugzilla.kernel.org/>
References: <bug-214029-2300@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D214029

Jan Steffens (jan.steffens@gmail.com) changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
                 CC|                            |jan.steffens@gmail.com

--- Comment #24 from Jan Steffens (jan.steffens@gmail.com) ---
Looks like this was mistakenly picked into LTS 5.10, which does not contain
d02117f8efaa5fbc37437df1ae955a147a2a424a.

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
