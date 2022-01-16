Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9983948FEB2
	for <lists+dri-devel@lfdr.de>; Sun, 16 Jan 2022 20:39:59 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6833810E1CD;
	Sun, 16 Jan 2022 19:39:57 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D082B10E1CD
 for <dri-devel@lists.freedesktop.org>; Sun, 16 Jan 2022 19:39:55 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 3987A60F9D
 for <dri-devel@lists.freedesktop.org>; Sun, 16 Jan 2022 19:39:55 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id A0141C36AEC
 for <dri-devel@lists.freedesktop.org>; Sun, 16 Jan 2022 19:39:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1642361994;
 bh=7f9El2IjcNuUGhzDBZ0XkoXkf5kh6dYIW012oHlhHs0=;
 h=From:To:Subject:Date:In-Reply-To:References:From;
 b=BPLNE07GHsFYXU4aayjkRR6NleHn78TB/88qxPUzrnLGmdMHZL8yP40AGCWew6v0O
 gWSHheAtC0OOo9Y819fi22Vd2PfR2RaNY5J6/MY3hTq1wE43YAX8ujMIfuAzrjysA0
 ad8mvs8/poiuzvnPjKbB9kq7Esq5X3uH0yraZzxBEQMNyHoCXxyyHhMtf+Bff2722/
 7veBwUHkMPHx9nuBoqnSMEyqtResjtTnrBhHRbiwH3jws8i2jEolBENV61zbMnfNzv
 NBHB5sMLQ4KN+FZ5vMszxe3chsZRLIW6QP56jb/CRLdvT7mCmT7gaa+QcCMfrLUpnA
 naYo7FwwgRTAw==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix,
 from userid 48) id 8D4C2CC13AF; Sun, 16 Jan 2022 19:39:54 +0000 (UTC)
From: bugzilla-daemon@bugzilla.kernel.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 215499] AMDGPU: Tahiti flagged as "[drm] Unsupported asic. 
 Remove me when IP discovery init is in place."
Date: Sun, 16 Jan 2022 19:39:54 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Video(DRI - non Intel)
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: alexandre.f.demers@gmail.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: cc cf_regression
Message-ID: <bug-215499-2300-MoLoCNvSbV@https.bugzilla.kernel.org/>
In-Reply-To: <bug-215499-2300@https.bugzilla.kernel.org/>
References: <bug-215499-2300@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D215499

Alexandre Demers (alexandre.f.demers@gmail.com) changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
                 CC|                            |alexandre.f.demers@gmail.co
                   |                            |m, alexdeucher@gmail.com
         Regression|No                          |Yes

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
