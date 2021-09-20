Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C1EA44119D0
	for <lists+dri-devel@lfdr.de>; Mon, 20 Sep 2021 18:30:08 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DCD9A6E55C;
	Mon, 20 Sep 2021 16:30:05 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 87CF76E55C
 for <dri-devel@lists.freedesktop.org>; Mon, 20 Sep 2021 16:30:04 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPS id 45817611C2
 for <dri-devel@lists.freedesktop.org>; Mon, 20 Sep 2021 16:30:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1632155404;
 bh=R1jQ+DKbN/BZenm/VN+8KozfeY3EwY2STQq68WufMeM=;
 h=From:To:Subject:Date:In-Reply-To:References:From;
 b=lIPtx6sKZCDo1BZ8Yi/Di9lpH8pB2tD6BZQ0UFW8VedM1DbJ6g5XETQR75JMXqadw
 BmTgLTOYBFWj3D7yCExZRosKIMnzBhI/6jRylvn49qMIHLFnxTO1uHdMDYK03x7shC
 K/jYZLpv1SG5MLnfayE/lGN8Ms9/smBOtRCTnLOD2qtRp083E0V/BpO2K2o4pH8vzX
 p3UPYGXIP1nusE5CRpoWzIcezSa9kk8+8aR0V3gIMS13o2/uIuf20UXWXVP2vdatPI
 wF6Bs5Wy8RBpYL7ORYCk7/IufYsGPBYvxTdzVkR/l8u0XHAf6ltLPdnf6vdtsm5RY1
 LSPgWx95YOBaQ==
Received: by pdx-korg-bugzilla-2.web.codeaurora.org (Postfix, from userid 48)
 id 4229960F42; Mon, 20 Sep 2021 16:30:04 +0000 (UTC)
From: bugzilla-daemon@bugzilla.kernel.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 214029] [NAVI] Several memory leaks in amdgpu and ttm
Date: Mon, 20 Sep 2021 16:30:03 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Video(DRI - non Intel)
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: erhard_f@mailbox.org
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: attachments.isobsolete attachments.created
Message-ID: <bug-214029-2300-cjzGPKC03v@https.bugzilla.kernel.org/>
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

Erhard F. (erhard_f@mailbox.org) changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
 Attachment #298787|0                           |1
        is obsolete|                            |

--- Comment #12 from Erhard F. (erhard_f@mailbox.org) ---
Created attachment 298893
  --> https://bugzilla.kernel.org/attachment.cgi?id=3D298893&action=3Dedit
kernel .config (kernel 5.15-rc2, AMD FX-8370)

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
