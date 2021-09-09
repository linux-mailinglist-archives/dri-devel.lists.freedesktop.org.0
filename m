Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A1045405CEB
	for <lists+dri-devel@lfdr.de>; Thu,  9 Sep 2021 20:42:03 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 494916E8FC;
	Thu,  9 Sep 2021 18:41:59 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 692166E8FC
 for <dri-devel@lists.freedesktop.org>; Thu,  9 Sep 2021 18:41:58 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPS id 332046113A
 for <dri-devel@lists.freedesktop.org>; Thu,  9 Sep 2021 18:41:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1631212918;
 bh=27DZN/awdYMgpxwIhzvBP3EN7iswVA2Pn3/OsZruda0=;
 h=From:To:Subject:Date:In-Reply-To:References:From;
 b=jfri5RNPY/duwmz9iGYdsBpKPFWlA/peFeIviah4Ga9AFF6Lk99w7DRet2kaw66yB
 oOCOu8uPpAzDR9DUqtIypRbsbIpJzVykOv50l01rvHYnOJeK90KycuHz1Rabc6fQb8
 ddVdee51MpsJ/GlCa9InauHPJyQfSTBlhC/i3vcqdkc3GtPqQM2HCwrUP7bDNLxNSQ
 bwiLsUCdKNyoYzVVwOjbsoW0UeRaH7d9d7VeqEjdkGl9sVa+8MIE5ZoNz3agxklJz5
 ArQ8OqxXCj0RnZBodX6VtbkzY/m/qYXvdw6JFuCeqE29IqezFJAOw42eIQpkT9mJ92
 +1TEj/8SW70fw==
Received: by pdx-korg-bugzilla-2.web.codeaurora.org (Postfix, from userid 48)
 id 25C7A610D0; Thu,  9 Sep 2021 18:41:58 +0000 (UTC)
From: bugzilla-daemon@bugzilla.kernel.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 213917] Screen starts flickering when laptop(amdgpu) wakes up
 after suspend.
Date: Thu, 09 Sep 2021 18:41:57 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Video(DRI - non Intel)
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: samuel-kbugs@sieb.net
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-213917-2300-uWUDL3aE98@https.bugzilla.kernel.org/>
In-Reply-To: <bug-213917-2300@https.bugzilla.kernel.org/>
References: <bug-213917-2300@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D213917

--- Comment #2 from Samuel Sieb (samuel-kbugs@sieb.net) ---
I just tried with 5.14.1 and resuming works again.  I still get those messa=
ges
in the log, so apparently they aren't relevant to this issue.

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
