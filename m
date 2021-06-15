Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C19893A8B9B
	for <lists+dri-devel@lfdr.de>; Wed, 16 Jun 2021 00:08:54 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BD2D489932;
	Tue, 15 Jun 2021 22:08:50 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3931E89932
 for <dri-devel@lists.freedesktop.org>; Tue, 15 Jun 2021 22:08:49 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPS id E01CE613BF
 for <dri-devel@lists.freedesktop.org>; Tue, 15 Jun 2021 22:08:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1623794928;
 bh=8ArG+juJ/ySj1mMPLR03bjELdCTs3A7EJFjdiCjBlVY=;
 h=From:To:Subject:Date:In-Reply-To:References:From;
 b=SYHJlhMmY71ub64/CjCrPjhAze05Bfh9iHvzf2kuUTk3szHaggNO5RT+UJDpsYk74
 BADaFemFEFP41doMj3dbNCAFqjyT2rwwPLA/14pmS8U9+vEw8WG51oFcdL6RE+knVR
 FAzJ3sjdYoQJXVOXBbP0ecX2sB/FC0PqlKCZ0pZkgvoaFbD3Hm4IMBsnCYDUZrKFZf
 XxkURoASpzxZJ5cpZ2lZRlxBUvb/X1a9ZRcaagshuSxZWIp0urm2hFiPvAXiCQqr7G
 i4HBFhhZDhJqzN0o8ga79MQfwBs3GZOsdjF0kjYzRsUIZ+W2WThO+H4CHBTd0AZRlG
 Y2yz0KjtN3/9w==
Received: by pdx-korg-bugzilla-2.web.codeaurora.org (Postfix, from userid 48)
 id DC84B61283; Tue, 15 Jun 2021 22:08:48 +0000 (UTC)
From: bugzilla-daemon@bugzilla.kernel.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 209457] AMDGPU resume fail with RX 580 GPU
Date: Tue, 15 Jun 2021 22:08:48 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Video(DRI - non Intel)
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: lsrzj@yahoo.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-209457-2300-lXpynEC3Lw@https.bugzilla.kernel.org/>
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

--- Comment #25 from Leandro Jacques (lsrzj@yahoo.com) ---
I don't have this issue with kernel 5.12.10

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
