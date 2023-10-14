Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 1F1D27C95F6
	for <lists+dri-devel@lfdr.de>; Sat, 14 Oct 2023 20:37:36 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8DF5710E069;
	Sat, 14 Oct 2023 18:37:30 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from ams.source.kernel.org (ams.source.kernel.org
 [IPv6:2604:1380:4601:e00::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 39ADF10E069
 for <dri-devel@lists.freedesktop.org>; Sat, 14 Oct 2023 18:37:29 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by ams.source.kernel.org (Postfix) with ESMTP id 316C7B80B59
 for <dri-devel@lists.freedesktop.org>; Sat, 14 Oct 2023 18:37:27 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 7D37BC433BA
 for <dri-devel@lists.freedesktop.org>; Sat, 14 Oct 2023 18:37:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1697308646;
 bh=GguBG4ylvkhXsoGy+uBviW35uQN/sdG4BVrEGwdN0wU=;
 h=From:To:Subject:Date:In-Reply-To:References:From;
 b=MuVV+yMaJxpeWtfbE+X3oAICcml7FMmappvM3zpRwdFCytoT9/glTHMwwLPShQUHZ
 wiTcY+8//oYLDGtRGDMDdR2M72ijS14506fPeYHtnXB+DK+I+iLNO+jxNe2dBytpP9
 GDJomoES4Hr0TZ3JJ0Aj0bjktgmjocaZw443oumGOKsrIUoGjlAQ+AHlKgzhuH7oU0
 /3ZeI8c3Rfxh3nw2S/AGaOaByNA1kXDyczILD314zkHITRtflU0YgRK/WhvCg6dMWD
 jv43IVVGfhtujcgrCFJnJZRmUOKb6occtNYdt8BTsq72WKxys3/PgRy50DviVcT0iV
 rKF9N0/3BxTCA==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix,
 from userid 48) id 6F9F5C4332E; Sat, 14 Oct 2023 18:37:26 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 205089] amdgpu : drm:amdgpu_cs_ioctl : Failed to initialize
 parser -125
Date: Sat, 14 Oct 2023 18:37:25 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Video(DRI - non Intel)
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: nintyfan19@gmail.com
X-Bugzilla-Status: RESOLVED
X-Bugzilla-Resolution: CODE_FIX
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: cc
Message-ID: <bug-205089-2300-GXSO7K8qwB@https.bugzilla.kernel.org/>
In-Reply-To: <bug-205089-2300@https.bugzilla.kernel.org/>
References: <bug-205089-2300@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D205089

nintyfan19@gmail.com (nintyfan19@gmail.com) changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
                 CC|                            |nintyfan19@gmail.com

--- Comment #59 from nintyfan19@gmail.com (nintyfan19@gmail.com) ---
I downgrade kernel from 6.5 into 6.4 and problem disappear. But... Maybe I =
had
different problem making my GPU reset. I will investigate.

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
